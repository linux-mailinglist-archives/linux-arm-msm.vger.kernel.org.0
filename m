Return-Path: <linux-arm-msm+bounces-99851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA6OD87Jw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:41:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D563F3240D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59D3A304D3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A5F3CF042;
	Wed, 25 Mar 2026 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4PUmbW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBfKWOrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA43CEBA7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438795; cv=none; b=J/ojdRls58E6cQlceH1+phnzJrIPJ4xwKuNi7yjCrYa2ajMBUEfkJBEbn0l1Mk01DAKG3ijEMQMdrXF4XT+PVVul6mufMNCvQny0V6Wo6Mq4nNTkiWZLt77HYBYHSfHCXyAeTJkwn4iSWRykxwawwhskF1mzr+LkPbjZLrCDUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438795; c=relaxed/simple;
	bh=SzBwb/XOkJe3ULmXS+nQcxJoz+wqwvo8fVhUguqWMQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IhvorHv0W2IcYRY9eT2OgcrBwioN8DUXhuadQj++hVNXHWqjOCYgxQqSk4Zs1W2Fu80vKU8mfuBA9rtObUiEIOOm5qk9a+82Eed5DGy4CQBCV4E6js3N1Sr01ionJrYpRmxM9MWavon/Xlrq4eXIGIFy80tnA0sU+mYmC8hh0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4PUmbW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBfKWOrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBFwii720346
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Ifxe0PB95QnPU2t7nurvf
	5RJy7B8ceDIhZ9cv3GfDg=; b=d4PUmbW5oIRn+3vKwIsQYBU4CW5nuUGKcYQDei
	GEYwUE/jAFmw2pKJVFls2eEljvXfkzpQFKbVCoM0QBeuW2S5fWAkt1+n2HYQe/Hy
	f7JRMVzyfYX3jE79OmpY1Im65oliJ6Jq4DLadaXwm+pmOr/lBycFRK8SFn2YGpdI
	Fk7RuWUu17CQ8bpgnTFTfjQF9xHIxfj42lDW7nsV8/UzWmK9mv8OY4C7GpEuARSC
	D0FeOdlCD7K+cZiduicRuzSk0tH+yzqIek6fcvxN+/Dm0TZp/Xzxpmxhn49WTPWr
	y4iD5H5w1bTkp2utJ/++rolgZlTeJOT57Eg4cJWf2u5hTGMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rb37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:39:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06c242a34so396775255ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438793; x=1775043593; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ifxe0PB95QnPU2t7nurvf5RJy7B8ceDIhZ9cv3GfDg=;
        b=dBfKWOrKeCmoZV7iv22huA8C8FQsO2EjR2hnIQfK7nZRYZ6MqMf3EzzUGg1NX3xRIf
         0Lx3heUFV68m5AhiRz9H/ILE5+7PwkYF9O6DyNDq6SNSX/dhaOLApcf0kvDezELAZRat
         mAN7RP0AwdxwE+5qkApNVihqLu2MjAZRHbNVzOhhBUKpY/e6XUB19oIRfm5HyXWepYrS
         Tj3V/NfFFxzjJP6QHCnddbv4XYLXkHHCiXtlFial/aV+omYcLuZlsNtBy4wbgILKalSC
         JcBPcAFVS2egpf5g/7ghbWDYyMkZ8H9nIy9iyQM37H7OgjQisOKUtwcLCkyFDaamsP7+
         ICnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438793; x=1775043593;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ifxe0PB95QnPU2t7nurvf5RJy7B8ceDIhZ9cv3GfDg=;
        b=KEOhIre4uzAO60awkv0Ac+sGfUDBT9Gg866GOiu1SYmCEtRh0YKxJFtZreW669g31F
         wZHxj69/ucjQi/PqxldbH/GjPheMV+lhHdZi5ZY2n9Xym2OkR9qqgQSUFGgFis+X1Sq5
         4q1sLHARp0vTSggjopzzXcMTMedWav7EZdsKSlnw5jtUZiDDjUzju7WjPgZBzLWsqjTo
         Kjr+eBcKmLiuRYwK1uj5/a5Ai2Tbn5kWPYZ9rPKb7V5fsjQzld0zwHLcACSDyRh0n4dJ
         eqw90GWGSjcYKpPrBhVvqjqWcmFOTK2IFhi0TWmBxxmBme2QtW9mIPene4Cngokua0FP
         6PhA==
X-Gm-Message-State: AOJu0YwycfSm+7SVinQaGXCaAEz0G1j/T/UI3ZNzGvuks04fFRV8r2cI
	OlVOM2OKCk3oJqXcKdfW11WXc5nViN7fxMN/vxGQoVTSlo09YzoAiGG3Kmi07t3hHYktYXaHTeg
	FWwAVcY7a3TqOiJGiJU16ToWdfY61fejHSrN9HP9ZxnUMFxxE4L9o/BLyYwm0Mch9hjMJMW8Ckd
	EJ
X-Gm-Gg: ATEYQzxpcNKzv9+apkLJyUwTveI81iwdqIVm4OFkwHr7Cw+yIjR8HjCbCGNRgTCBX8V
	PSwDVEtY03GabffLj0BJjfi8DZ+deexACIY7QIrFPMEr0cPemv6NLgQ03c8INty5mclMJpq0fP8
	T0NlvaKvmRHhfzVHxafYfio3sDYIx75vMTomFumuDm7zzps3Pa5/27LytNeNpbVqAIEVqKnFW37
	FM4ZUXS5EaDvzgMZ+wrFXAVei9iZgCZsm11zf/nppl8zj9FnoAY2pfF6SDn6clmjltkaR68mCUX
	EcgDpI4JSnRFpPHbxJ/2nkAF9Ub6ozMJJ05enmHXxg/sSrJkW+GPGeNLIW0pOANteDbifVvGmK8
	jXbxqqFiQwGwc31Bxj4FaYM1dzrSTVxknGirmlbIOrv+2yd6wxZcwXZKGZjeQBziEWWpYfo3rx7
	YpCbFeMM9+8CUbKQLMXjXv0SK/6gmaQ6cYuuclYYFPc/d0b0uoshH549uG
X-Received: by 2002:a17:903:2cf:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b0b0b5b1f1mr36736835ad.51.1774438793100;
        Wed, 25 Mar 2026 04:39:53 -0700 (PDT)
X-Received: by 2002:a17:903:2cf:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b0b0b5b1f1mr36736555ad.51.1774438792650;
        Wed, 25 Mar 2026 04:39:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm246409585ad.42.2026.03.25.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:39:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:43 +0530
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH7Jw2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3cyCQkszU4P44uRcXXPLRAOTlCRzSwMTCyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCsb/csbwAAAA==
X-Change-ID: 20260325-ipq9650_scm-79a04db79048
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438789; l=982;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SzBwb/XOkJe3ULmXS+nQcxJoz+wqwvo8fVhUguqWMQI=;
 b=6YbrueWvoRk3iZz5q1SM9qnCuBi78MRzESc0/kHRInrWBlBKVzcujqC+3PYXXMMVmO83m+T1n
 LXlgchyFPlgDORBN014kxy4cNeVSg5B3bZSUaGcZH6v+sqzfLHjyFny
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX2TwVB2IX3OMi
 f6obVvLghcWA0tgY4MZc7M0d81QYhEKtbew2j3LNuSS0LefldsEgJvsT0HHmYQUc8jzjsti6v5j
 2FIDdpUOTMZZ1R+0wWh7keCf5m0VNVUilxxVKOojSO3QQYxr3AZ+MKdbufPagvmAt3nD4yrihT/
 s1hUkTOt7T3UkW2AAb0ptMhw/qSfowvvltdMBn2w4veIrIcyNz/agh85CY+WLUCUY5JT0Me1V+t
 CFLo4CbJA7VnORimEwo2nM78N4IFJ7mYQECcaQeHwukAS1zTMJmAgOtHde+0IoMzXn0n+qyeDeR
 cg/DIjGOlxdruQ6Ru5QsnG3jeXDUxp0rvf2ZMN1fAlyPdbCxBp0+HJ8aahYLKeJL8eXEmYsqZUS
 k+KInTznvn0zsloYJ4zkdDlMmGdswgkuaaX+KLXge2ohNk2slEfJJrJ8PdBr25XlLlOVbuBd5jM
 g2vM9PfNIfx1XjJGM8Q==
X-Proofpoint-GUID: xyMS4Nv253wHU4IYy0SlKePrQ_ZLRstE
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3c98a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cBlyCk9Y9sVT8Dj296cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xyMS4Nv253wHU4IYy0SlKePrQ_ZLRstE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-99851-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D563F3240D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the scm compatible for ipq9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index f628b1d70fa1..7918d31f58b4 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,scm-ipq806x
           - qcom,scm-ipq8074
           - qcom,scm-ipq9574
+          - qcom,scm-ipq9650
           - qcom,scm-kaanapali
           - qcom,scm-mdm9607
           - qcom,scm-milos

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-ipq9650_scm-79a04db79048

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


