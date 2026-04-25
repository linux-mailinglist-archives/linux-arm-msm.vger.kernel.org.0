Return-Path: <linux-arm-msm+bounces-104501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7kSHCHNn7GkPYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3B465559
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70F8F304929D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 07:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56EA3203A0;
	Sat, 25 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6/Tg3KP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yh5xsecB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295203161A1
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=oIeuM2wt9KVfe9wLcl38oGQxFMTYDEmjZBaVlF//pJwrDiiaZBnBpxdae2K2kO40uHlp5ZNrAZ/vIwtwV0psy0IRe/mS4/p2mrYWaqUF6Ba/oiCjbxjdvsCHjhQiaGca6nm1u/e3VIao/i+mbAE8OQlqjMxH0NRJuEaPfxcnKqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=VhEbUk1qn4YDvonKrVyzLLile8oLTXo5Zt+QFXASqso=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o0ajlzSELDKQdFEA4ybU3UaZFzm5iCuddGg4zAsishMmk+brK6uOZKZdk3++/TC3aenG4ZjlIO2KfbZIEluBIWc0BLoljtFNvM3uZZw6hGrto0EQ1MylLM9q8yOnR3wTV9PwglnnEuVFvtoBJqWdaHzVXv2hXaxNwbpwBsXuP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6/Tg3KP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yh5xsecB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3MiWV946485
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwC5mL1xfh1
	AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=; b=K6/Tg3KPq68RgCj77DQeBvg8LTk
	msfFsI/az+anqAs3FcDle+P9aOX12+UqxonBvoCdZugzhGPxHwNUDr2N1A83+WXB
	INAW7jkJI7zsUzCfArQKZLTkpF4GRSrX2EQA/N3zWL5DU1x0QO1g/d9UcyF63jZx
	MmZtvPE0q3Xa79Oc8s0f5UOAewaZ8TEcsGiyhl4FJp4ioVyjFi+rKfoujkQDATRk
	Asu62rHjwcz6QJILTZBmjneaoJe12azmSxj0icc484Qn09xrbdU1HdYWFOfQ995u
	quzNWi28WH2+NqTBVaZejixG7WUf0YB58z3RtKVVSKz5T58YAjlgBrCGbpQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr0by9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-126e8ee6227so8515416c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100417; x=1777705217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwC5mL1xfh1AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=;
        b=Yh5xsecBHlH8aHjSd6nS1lnFP44usL/5mjHDApJi4nEI//j7NZvAISUY+sSOzMeUlY
         SxErOjx1U0k6ne+5uHKTd3d8RRAFGx5WopUF6EtpSURC+3uONs91aY87RD5bKxj7wnw3
         zV7C7DeScsH1rpGNfyT3icmHFwtRlbbDl0Ps6vYoIV7QGrlc/JT8dLjgyAwso4DLquZp
         981RxHBDCYREA1p6PRhDA6jiNNjMMmyFftIT8EG5X+HT3M1Igk6XxvwUwMv2HgGOkSYm
         t5ooVugzVHSRKhhr5LKLsSlfosgnsywoSW6DGxGOh6DCYs+jUMxJkM3Y6Ba+P+fyQsw0
         Tv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100417; x=1777705217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwC5mL1xfh1AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=;
        b=CA+idOl6s6UoeNyLpE8fYJM/phPxP6Lfbxbeh07B7+2N3JfZc7plDeIF7ZhQfadsDM
         ARJcuq890u6REuZQRm61yXR+4K8cIxivi8u0lPa34Ijpn36EZne6MIgAQkxOJDs8Zi2E
         6S6nUmetqH6VZ/jdcPmZFE1Bj9Px98MIqw+ssgl9gRXkz7i6MKxX2WMHR0OLU9bZT+hV
         26a8F8wIYmvv86YbmPPyRL7TWDSVmj+v7LMrAj/hMnC8LFWedGe++hBKskTvP2tScMds
         EUNGlFjJYsmPCNPHbY5JZx+//tBDYmTnH8/k0CWJ97HpP83DDRnt/lEetR8rm5etynfg
         ou0w==
X-Forwarded-Encrypted: i=1; AFNElJ9I8CzPr5TEswk5UCC01raKn5MTDp6z29BDYWNIdmpQil14F2QwfjfJIgnOwGVDDch81LT/wL1sOoCbTCIz@vger.kernel.org
X-Gm-Message-State: AOJu0YxEzQjOOeualPSrQjiTvtCRjy16kbE3vLfvndnwfWBMSuwcnqXR
	dcb2X0SWMsgokg5Wfki0uUMxct9qYa7/yVHol8O18ie4R5eHntsHgPMlcsSzFapVAyAXSPQMQCl
	fr7R1Xhj0PUEln/KoDh5aAgBJnkv2M89Q2XO/qVRTnEqs7fkK/wVhNTrv+bx7Sy85I92k
X-Gm-Gg: AeBDietcYHVy3cC9jjhK3MKUlw07pIVuCsT3Dt4OvkvmMjTY9vODZqxB2HQxPCK6UFI
	QeOpMP0OSpaSgslikcLOfIgISatgiqOXxWiAKFlGeWXTYyB0l4G3afbiZwzOiVwj+q4h02PNMpH
	uMh6SdbVSlyd+eKq9grW7FDjkedpkhoBiD+GmESf4ISWD5dQRz6bY4D0Q7QxFEndfT02FSwiUqW
	LUrz4TV/t6TD/wohB3gb4uHmXn0pws5w+IC4eS6H+PHLlOFC3NUax2Qx1TA8rCXODjNxhF56IQZ
	E7rRW6a9OZE/U0n83imZxtOgcajaS5+od8U++ErDjrhL5GNDrE5aIWUyKU5qQ6fBGZ6R8eeE8Dh
	e/mpw3xFvuEOgn4xXYjZxOXOpAWg7YqgmwBZ7znTsmennvLWki18UJGCt5xUqPXMrSm9nN4QuJ5
	YI65N0f64qEQ==
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr15319087c88.23.1777100415541;
        Sat, 25 Apr 2026 00:00:15 -0700 (PDT)
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr15319055c88.23.1777100414748;
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Sat, 25 Apr 2026 00:00:01 -0700
Message-Id: <20260425070002.348733-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ec6681 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 8bgTJmeroXkLEoZMHfhyhMFORwIO2zls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX+vLYW+5oixgB
 kwGUwV/gOA6UJafIWTkUKTodDJg+ir8LfaBn4eQbu0Kni94PCpNXLIUeEVks3mtW/PWVvlIdRud
 59bpEmPz6HggDK7z7n6llHwC9mUn1QU+Hqu2RnXm0TSi/BcSguMVsqYYh6uU3CZxrBFp965nWoP
 NbBiuvM79jnL/+o2mgHllcktTOPNfHIMkKxJahF/k7/w0OLZbfdYfynBBPzm2D5SbAFYofOCmdH
 sOV14/Vw6NXjvInDIQUPAE7uXMLMAK3FR2677y7NvwFepl5M12Icfe8yCy9SYX9Bh6Ph2CwdcIZ
 NJNyGgTffBbea9WIGCibgqMOnTRyqnYq1VLq4UbSdDmruBOte7Ss5PadTurCh4WqcybhZ2H69Vx
 a08vMakEhBfQzblge1yph2+7LH9zLleV9jVg060aAEq+yaeso2dQL1JxnH1KxvHLqGo+HoUKnUp
 oJBLuH2V/uuUhC9mU9g==
X-Proofpoint-ORIG-GUID: 8bgTJmeroXkLEoZMHfhyhMFORwIO2zls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: 70D3B465559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104501-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1


