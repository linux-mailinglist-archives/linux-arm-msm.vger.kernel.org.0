Return-Path: <linux-arm-msm+bounces-112697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5RClBQ+KKmoUsAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:12:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D5670BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:12:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VNnGPWqS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JRg5RxPy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112697-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112697-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F0C32FDEBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73D03C98BA;
	Thu, 11 Jun 2026 10:10:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A03CAA31
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172629; cv=none; b=FB7ry7I93/bZ21YMCyq3KB0oSPplnhpKbPYJ6jKVzMla7kF9QAEG9Qu/bY3KddET1eeMfz2AaEKMgnnUG6CBt5xw61KdhX4b7bvPP68XBw0UX2LBPoGvAnRMKNf84cp83j4/uM8wY4b5tvi3hVX7dVY8pMJ7Aon06KoJy2HhFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172629; c=relaxed/simple;
	bh=O4cVCaQ46n8Ms5D3Bco+aQwbzl8/UIR3ClZEnBlY0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXWkg6ECq1W03JOF+4NHEZ/IUUUihfdGeKYX/cZMYe5PB3xvMkS6DV/n+tW9Ztgf4DZUR9EfDZ9NjHnHvzAjPfbdBrCzOKboWCbpZeH0qLhmybn11UuUyU5O3IbF1zoHE/wbgh1cxL3i1T/F+Kq1REJn3T9ZBR6H6VcMQtR0dFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNnGPWqS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRg5RxPy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0pXT303964
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=; b=VNnGPWqSy2JqD61F
	nL9FmVZiSw8cnXvlt5+f/tGowXcrNXRrXzS8QrqV+kxFvcoWwhZDq2Dy0OREh5Th
	6MasMh3ZE5vU7yunP91NhVwMKfwbDxRYDDlv/KwF93OeUHSLfrJ+VwOco8vEd7DD
	ASeg1yWhEkWv2re48LbtJpd2R5qA9dJBcWioD1fIr41aPx6wnI/+UuBHOErAGCYm
	DE6KwoMv1E5KRfObXatGvrLDkDaXjSau8jhSfIAtQl5JQJ90d7tAlzHirSq8qIFv
	5MKEJO8AOE/1M9v+D4PGP5KXF2g/fOnx7w4FtWaxrG51J2FnvdMaRUnNMfcOen4v
	K4rYrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5g62n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a298cd62so5198393a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172626; x=1781777426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=;
        b=JRg5RxPylTJFkbPCkxWgzobhfo9Da9H5YvGG8yLlcEJfH+otXzL9EPLAYVSvNZYVJ7
         65hog6Ggatb34G/RTZzLTNsVxOMQeF6Kkm50LVGZbM4S0xoU7OT2igp7U4gX6CXM4Sb1
         kcflSie7Nc+MFYu10hLZM3lYHDXVgarahfLxgp/JOaVDgwtaX5v8Y7Hcp+fy96Xu8nry
         s5EFJ7kiZ8WSEvDZbkrWyx/EJl7PYFpKz4GA04eV7jJJXnDgZnkRbogE/tFA6H3tKQel
         R47150qhsTX24s2zP3pGwhvV+qUftNq/W48XYKNS4mqcGNh4AwpLq/MC3mP6xw3NHQZI
         asZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172626; x=1781777426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzoIeP/9RJB+tfcp0der6+uQoAklbzCN/nK9ht7zzAc=;
        b=pQpISSKC/p5cmSIrKd0HkTjK1au6RCt7nfNyqvDhvjhgYyAPD/MsT4JiywkXor3rUK
         vzEPYBm9BCTS8XRZIbUtzmOUHWNWdCOKklJBLdbRv8RExo6kcqygxci93ypJLBHOssjL
         NvxtDNXsnDUibLC4CMcq38zJNrgFlVNFCbQfLjxiP3FTBmD/reFo5rGqOl2wPmhB9NCT
         5EfMMTsOD4kTrInZ3QhYJPHCCvytY6bcfoxapfTAU2DZmifcdqco85XSYJPGrXBGdgCg
         u6/p45gyusRgofASiLYnzT1w429clSHfYk5cy2UU7e/NQlnQx0bDEB4WsQBwfkS49ku8
         /OqQ==
X-Gm-Message-State: AOJu0Yw/non3gNmbamYNgYkMVW3gWsSAfIaTerbvQZVcF0pInu415Xm7
	tvv55F0zsscCjLAdDasj3wiN0zNKFSExxN2jtHWo2f7SrDSLPMNXJyKq7SA+9yxjV9X7UTyXXyY
	IJuUrWQYz+LZt1aq+VyzlAw3Zhzq5wH2UtJ4jii0BQAFsB0svYAFKM9mhuMu0mV2MGC/J
X-Gm-Gg: Acq92OG1+QhO1VM3lapPo4UxRHaFqZOF33SGwqvq8JA2AuXpQ5pGfa5h63WTjoJF+Yc
	bh7vN05kdDmyX3dnyk961YgwWrMsapxTirocYbKS0GOHc07zs6Rw3Hk5BicixLP5h5lsAx76dVf
	8LAQkk45fy1RqrrBNxqCQv+0QVOWyUL7XEDwPc4IxC5NoX5DduFtG6ngvvMII90yN60YDRuB0JT
	xQk2ldHIeH4Std8lqn0XfAeRxOh+gizMgAZVWlAYYktApLDtBd8K7H8DFiTstR9mp7/ULtHXTxu
	yZAHEmw1aQdg2GsMI3Fti2aDcixOSJhJyEBJa1145JhuNisUbxNfzq7+MdHUBPnFyv/QNoLheQc
	bSQknynvYps7ps0fZrtvyT0XDxXWSyzrl1OGmvYYycAyaozs=
X-Received: by 2002:a05:6a20:7488:b0:3b4:85db:1bd0 with SMTP id adf61e73a8af0-3b5e31ec58fmr2473851637.12.1781172626244;
        Thu, 11 Jun 2026 03:10:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3b4:85db:1bd0 with SMTP id adf61e73a8af0-3b5e31ec58fmr2473810637.12.1781172625795;
        Thu, 11 Jun 2026 03:10:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:25 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:40:08 +0530
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-shikra-dt-v5-1-103ed26a8529@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
In-Reply-To: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=1745;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=O4cVCaQ46n8Ms5D3Bco+aQwbzl8/UIR3ClZEnBlY0Qg=;
 b=wMdHmwjR+KCtwb/q9yjz1Y+EYFPfFw5vp82h6JtumrrfVeOIJGfb/Ulu9woGwL7HiLYyLVMjR
 7WnMQ1xz5mnAXq7G4Y9gpRi2oJa9p4rPEMrfIw4IWuzabkk7ublBhUc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX5zAo7rmZ3KjQ
 iuYT6idx4HlXrV+unEY3VwHAtFj/LiJIiU1T00LhZoddk5c1Sx+L5+36lQEyLGUpq71l2bpEKp/
 Y5slBkJbm3ySTyFZfaeofOXs06Y+YeE+1uWbNDlc9eHUrGTC7e+onkAR6dhNHfbZzjUV4WocHFJ
 iXGAuacbDsZMZDZLXxPSLITll8bQqvwUB30enXrRjrE5ZQjXYz4rZBXw+9CAQqocxTets/KnOKF
 ODJI67fMkVbmm0iLrpTqz0JsG0ixxVvcE/aPxHFY5OBsX8pO+jjjTgGMHWRR8srQ4q8I068qRPL
 ACsj7WXpwnqQQb2xicqua5QsdzYWHq+vr1y0XkrmwRSqMl/5uqF8fIP+Fzn0mPAaYyxkwANQwOf
 K/VxDnyYnT4Tt5o1EdHEB/jnHAR3P1yDYflgx0PuUPnghPRpff6Z90V4UHdqXCsLzCt1EvqqWsd
 NQCd6MMvElQDDwx7daA==
X-Proofpoint-ORIG-GUID: A5X48quaGWt21oO-Ou83984uxGYAa_81
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX3QEAvO47uG1O
 lCgo+LXc17rNUINnkJKIexz2Aza/hLz2NQ+tsnrt8XQZqhPfQdIg/J6pLq21d9bBvS3jVqjNPRB
 jN5cbFZRxhWJIbAB2AGbh45KW/h7K3s=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a8993 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: A5X48quaGWt21oO-Ou83984uxGYAa_81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A37D5670BD2

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..cf7d241f8107 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -989,6 +989,24 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1


