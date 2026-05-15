Return-Path: <linux-arm-msm+bounces-107758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHYJF/rqBmqCowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:44:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DC54CA9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50DB830C3DCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5184E42EEDE;
	Fri, 15 May 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCBYwC+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axE9S7mR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1073E34166B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837083; cv=none; b=rV/QUYr+OlkGOEMbOWuzDseNRU0B4J2lqfPVwLST7vEGD9HtmfI0EPWc35wEqwaXb46jW9c4mUwhblYk8t6G4RoFoU726roga13nRgGjnlBSmwl5zQt6cJ96QF653RpefcXnT+EX6bquXtLWu96QxqEvciE81BXXGDdy0aH/aAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837083; c=relaxed/simple;
	bh=QuBewEBT+HmHQnFo2832RUFL+S4uDT+H5Ey06DivlXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U7jgCwihPusxTAO9+w8U7VmNFdpakO9J1vjrzWuWfCWpbxtPWAgMf+M/kT2yYpaBFv+srVqsIiWklvPNsiIRR2DervDMKevFqnz2CIR090Wods/qzqIEMPb6uzTyxFJ/OerM5oTNajM6UmdaKzrDOF8xdcYi/kLHp/szExS8ngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCBYwC+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axE9S7mR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4r0Bt3200106
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8r0+urtJr+9UFTEOHTjm7X
	R37blGPy2oYcB3ySkXoKg=; b=XCBYwC+RwEfqbDNdRpCX8poJ0v6YJl8ZnqKodq
	mFxGtSYz9Vmoshic4nWMjpUEFDEL4SLqaw27WzD+suqy6EaFdP8Xp3tcpzoeiKLT
	hn9Qg/+ILjhfD6L/OhOgt2DIo2IP6hZVdnD5Iz05KC3u1+vqySSuDO+BjSJOln/1
	GGZkh6Hf/QSKxFzvzIdLndp2AoVJZVpvVU33YXJFVzOgh0XwPVjbxPtDh80A4rss
	/nghUOwp9An/iaTa9a579gGXCVLwJyfItOgZniucoIJ7Z1NGcewx/LezeUtQ1TqH
	oebdKJc8II8WBbpVYjlFQpno47LcqCF0SVtySW4xnZcky/0g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtjvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:24:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so5095291a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837081; x=1779441881; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8r0+urtJr+9UFTEOHTjm7XR37blGPy2oYcB3ySkXoKg=;
        b=axE9S7mRPrB1iouq6M0x71Z9KHSNS8jJay7xtT9V972WGtRy4+Mox/S9BRdRlvad7i
         OAWix+I4b8mTzZIk2WaV8ak7XWT9hlp5OKxHuOt0oH5aYT2G93Q3Wd+PfQ5PDn0P1jxZ
         V4xAxSBdzB7NWf9cM2HQnHDx8rgeWghQsVS1q52HCx/k8lvzgo+dzoIZNPXuGVdjSLr0
         ySWEHFgl7qKLLfGlwJKE9CliuO8503xRibwT4IuRsOZW6Nj3Des3WL8/fUeHY/E2jcFo
         Y38sFy30qYEywhlnnJRj7EehGAoHq0eurJL6eO/adfl1F3WXtaOFWCE/LyD6uIi1EcOH
         QKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837081; x=1779441881;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r0+urtJr+9UFTEOHTjm7XR37blGPy2oYcB3ySkXoKg=;
        b=Fs/4PT1vtbaiIlj0z/Lb303ah2D5IMkH/E8twH/ItknFsvTbjhPWpddNEsFhceFP58
         UBa5X1+n3bKZsWQ3uV2Ms8Ah4F1BBrKp2IdiD87LdivFEd7D1SJ4AxRsqB1ubEK1zEdo
         DRPmCNwsJrdHSzW6NoBaR7xxn73EWt3l2TfHIWqPvFOGdhvtn/kGY1qIJN9e+KfQNYxX
         v+1MpWzSupwhv+rCNBuJANhy160Mak+VfvwV+l+2oAb0KIaOvGIH2JbTOxUE7m0BTnUn
         ywpOM8Nqio3WKAyYuoAQR4iAHrdBc7kOgiGoOp5xl6RRo2kHhgVxMF2fKHvPVK/vE6IR
         04MA==
X-Gm-Message-State: AOJu0Yzlscq3BEsomNTw0dWStB/NjRK9GbnMy3WWwdxUyeizkHKv8DIu
	TZrt3Cflvem7dkRqBK+c1ld5jKJomMBsKMnEfI6+RIPLCFZaOngZXI10kCHccK9xbH3cc7Y6JPz
	AZwTt7GkUY8giVDZN7aq7+AwSCNa8/GU1OI9biPtUDOAPknIplW/HR5tCBrGgnWMZXn/w
X-Gm-Gg: Acq92OGw4IzN2ZK1wviBzdOZCbgV+6WSrlQB2tyklvurVMcaKRhN6+gmmwK26QJ2drH
	TGsjpB9BLr5ZryYX9sFtUfSAGSgMhaH9vXn9BC8UlqpkJ+wziChOaldoj/d4wZr1nkIy0rjNaD+
	wp+1l0D7979IO/J14ThlHXYx2ouzYjymNBOWWitJeNqV2POyFn5ntTC7FpeHgxF7klgk9ata/6B
	jFIUw552IQEMOZmnrgGpxbyAI6gLlnc7ERAft2UcCCIS1oPmmuG9JN8kqjH98IjhDrejPxulQOj
	XTtaOLiX61qC4yVw2QHuW6iKPFJDi19GYd8HM+wgRH9KCIvzLFk719Z49soa39lo/fdpfQkqdjL
	Xxq9CKJIoBuhZLaVC7jmyyBIzufDic9K0gyMA9kIKXQv0N+NQib9nGldZJusr6vM5siGf6ge5I3
	uy5FRvV9HzuiMyBF/8s1WmxO9xu67fWAHjRqPaaQjwML3z/M111ko=
X-Received: by 2002:a05:6a20:2594:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3b22eeded7dmr3678985637.47.1778837080543;
        Fri, 15 May 2026 02:24:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:2594:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3b22eeded7dmr3678939637.47.1778837080039;
        Fri, 15 May 2026 02:24:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm5308697b3a.45.2026.05.15.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:24:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:54:34 +0530
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFHmBmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3ZLi1LxiXQsDo9TUNPNEo+Q0MyWg2oKi1LTMCrA50bG1tQBqzxB
 cVwAAAA==
X-Change-ID: 20260515-tsens-802eef7a2cf6
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06e659 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=E3ZHFlwXONBU5DQtPr0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 55xKtFUzmVxp3a6P9awZr88TJ4n5baXY
X-Proofpoint-ORIG-GUID: 55xKtFUzmVxp3a6P9awZr88TJ4n5baXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NCBTYWx0ZWRfXz+B1za0f/sY3
 ZOVFBlN0iBOn5nRtw/XLRXZdhsdygh/1ha5wJnzuutqA4RkcSAVH17H5fYxcPiDK3zmbl3jgrkW
 MxQWcEc/2iHGTS6Srnf8p9wZ9BqR4a4nNW2eTmh2CGbaBfsq23wI5cqcHIDkDvKQG1aQQJ+u1q5
 msz5a8cEcHS9aEwlQWzbRt0xYRivQtP0Prwu2HhIjXILRm2A8gguc3FtYvkXw98xvLdaLz2MiwW
 V1BT/omM53cFso/ZBkcrlkb9tWGSXIxwILGvE1YmulmZL7BGk5K3CQ4+F5d/Xxj+4sVc8o+ecKS
 RBosSNUho5Sps3VjmEiqXhYu7JxTsKtdAboPJYZLC13INQ8HKzOzr83G+XwVbowm06zPilAXI+n
 5mhSFjYSc/29uGPY36MKAdKJZZdKSKWwPHHwLCcHChUw60UnfmOTKpet5XfB5RdQW1sUiZ/50ok
 meCnfEMOe5mdkHxDDmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150094
X-Rspamd-Queue-Id: 452DC54CA9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107758-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..eb49ba609083 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -20,12 +20,14 @@ properties:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
           - qcom,ipq5018-qfprom
+          - qcom,ipq5210-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
           - qcom,ipq6018-qfprom
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,ipq9650-qfprom
           - qcom,kaanapali-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-tsens-802eef7a2cf6

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


