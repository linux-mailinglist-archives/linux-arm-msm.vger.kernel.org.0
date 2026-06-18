Return-Path: <linux-arm-msm+bounces-113730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lbUhNzrLM2qTGQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:40:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED4C69F6EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HJ+4DRF7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AZk6QBfX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113730-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113730-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CF083049FCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FA23EB100;
	Thu, 18 Jun 2026 10:40:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1351138B14C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779226; cv=none; b=tPjOjPdA8VBfEtBe6XOjXfdjvvVniogfy3p19hpbcb1MPBkgy1nkSjeKFdFpZmA3I+cy2wplCKq/hcJ6T4FyN1A6jlzMaHv3l8Is/dsb7OpM12kxlASp7kKf81PJc3YO5lINTMxxRO1l24t8EY1UGb217NITFZ7Oh1MSW3Fc5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779226; c=relaxed/simple;
	bh=bUy2LNyPtggJTXgZrJZnbOEw5uKNlX/uSieHncJQdUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RU91kPxPAXypJqvTRvxTwM1SjbKZe4SQs5L3fwG2GJSweQRPRy7MPNcypD01CbwulTRWflGU3V5nOA+mij2iJHGf9namiBd5isBlD4dHbdGoQ2KUVnJO0vIfRjZaRgxNI6NIX1oxzimW0vxWD+AocItI4Lu2zYL0Qzg6F4kUP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ+4DRF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZk6QBfX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DkUK667671
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=; b=HJ+4DRF7091BVOy8
	iFNicLNQGvhI5d0d+lUyPnPE690o3NV0f10k63z7xtWYMmInnVKnNoBNxs8fXMVN
	7PsyO/ONSRXbF8TMYQdLmhkjeH+OXUzXfWGL2h38nbOudWGIIUScW84Sk07Xc27Q
	j1sRMMbXcmzl6StTd+vPEl2jwCgSw2gmdv8pUwv91MwXdZt/7Xt0HOohQwaLsDOz
	cWxDKs+TSv3sBNQGwZPXJOoHD3kHxBrFPlVex7RkpkjJEm2HLvdoMfOHGq8OU6bp
	uTbaMLJqNwOWlC9wPswIGSsfsNeKeDgzLNZgOfGREv/MKxKcJcQgEdqd+b0/gORP
	EAJTmg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm31ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84245e2bb00so777260b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779224; x=1782384024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=;
        b=AZk6QBfXDIqVjo3B20HdxcvQ4786vpiJeGZtrvJKeyPqoG9XRzt8tLTjqvIZ2G7a5s
         UnoICkz8ZhPjZ1CDd30kZB2c5MpRQfPIuTqvY0gpbAG3TISm2T2zeN51EPdOlor1x2ux
         zCVBRkgAKeBedu/BN+U/DjjIKmZFqh08jeLA9+YGNVwIZk7N2NHjJcS0tRgMwdun6fdj
         zAESAQGpl5b9Vfs26HuW3gySw3Q+pbVIblBBRyrZi0Tem04G+W4BwzY8okJ2/F9LkBcN
         WWz3sHjQEcX3qzxl3MBDZdvioyc51rajy8ppdMvk2WROZmqTAPAmPfnaYgLLq5sPQErR
         1Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779224; x=1782384024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=;
        b=EYFXICLvYatdPnVIO812eClY83FBGT1RxOuqZ4OcH3oYGXAgiu18iwlOiuk3b1Mqym
         lbgMZx4Rl6tq4DVCg4Gu0kRS4PQFJVHfLFjbPnlxV/F7qnK5blW65u7tXk0t3BJsRnrZ
         UKrNH/LC+m4WlSBzPAjfFZMTq7VZotvYgvJ++gIbs6YbftnSTnOyfpdPlSL4lIV4Lobf
         76AjastiWZRFCYA9tNTcjXqDRQ/elJH/1cScbnc1n2ZuEbzyqdbnTRYptHUBRPTFj5wf
         YU3AmtE59YebHsJHG6QBzidQv/232S+nqWGsS22fJIRyled6dkdRlyBtUCG4B/vN8X/4
         NqnA==
X-Gm-Message-State: AOJu0Ywa9Xqt6MZa4wOiu7wnlrgVUmw6hjdv/Xjb1xcFCgXSjiWegwJ2
	ZLsVNjr8iRixGb0Vgl7x/lp85YxYW/kjniDT56Qcv+R2jQFr6Ba8uDqg7c/T76TUEdF65VoU6A8
	CCOMauJ9yx0YV0b5PqM6XXcF39e0gNxQBfev0xLS+DrOQgrbbdAbB/3kLWAuFMrwQhBfO
X-Gm-Gg: AfdE7cnekD+P6Zydh90LXp8DVrIhoLwfAFyxu3QBwqIsjLjFBUxDgKaN57UYZTTZRUY
	8g3nfbylVodqO3UoMrebU98CHFhgisnaw6SYq4iDAUGmuOLOItO8DVJBoLhBPkNZZ8sMejX/FaK
	pZWeMBgsQGAenDeLWr2LVG2ekHh9uBh1l5YqUN6Ts/FQJx+slHLIltg0XzKz4zHcdHb0HqkCp1K
	hyrbhO6Pm4oXoXrvFVSLMTX0uWSa8/l0ou5Lks/+Dt6DBQrGa1Y0+nmXhR2Q8ZbjGvmKgmR4dHb
	3tVhno490M+8GJbzDgPqXRVkX1HMI01Rx1/grCIYoPGDAB8D3duPEiuwngpCocDXwgeIJ8nj1hR
	jbKMsbF+T5JGHVdqE0ndYftu5X1y2+Eo7UoPzY+EzLcso6A==
X-Received: by 2002:a05:6a00:2d2a:b0:842:4bb9:5fe8 with SMTP id d2e1a72fcca58-84524446057mr8571642b3a.3.1781779223541;
        Thu, 18 Jun 2026 03:40:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d2a:b0:842:4bb9:5fe8 with SMTP id d2e1a72fcca58-84524446057mr8571591b3a.3.1781779223049;
        Thu, 18 Jun 2026 03:40:23 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:22 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:54 +0530
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=2455;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bUy2LNyPtggJTXgZrJZnbOEw5uKNlX/uSieHncJQdUo=;
 b=sv6Ieb0XJWOnYjVnw4sWdEXQ9lBfXwufQpPcGGqHphiE9eRQfz2p8FHcUwCWaMOHM447JzkxH
 +JXJJVlYNE3AdHbBl+oglwugDOyXqx0Y0JWvz/wOZtNZESi+G0QnTW8
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX3dBNVEswTe/w
 3V1CHtj5abSLK5OijtYfmatnCEgb1bDYNSHYXflghIPtb/BCZdeZGSuqxy65LA5vWnK8uLCZUxd
 Zh6YleooQPJVehZZOYG562mhq5osRQkRLEr/lDjBlXaZ6czPR2BkfA10BmY+zHCOsk4fzp3d9pK
 TXdqXtDcLatw0H1qHLDqB2TT3RXmhJV5qr61+89zaZGt5hvlc6pDgcKg7M9Jm+b9503mzHDv/d8
 /z8EECBi51syjuYFojsocKG4Rum1wcxvNYnYqnGS0HMLIcKCAcAXthahO22Dt60kFHn+r/9gefB
 xRvtjXSmwjBLpJ+BRK9nT/C9gmGLE2tTsShnFm+Mq6odW2M+WGEfpwhYcn5QrSDo+vnMAo1Xn4M
 E1dExgTXBbR1qsJb8jBPEBuDpIO0JmhEcTP3D0e9vV9xHWZnJhyPCBZTiQA9JriX70hU/RxcZD1
 IS3uY00B09lq9m5bs8g==
X-Proofpoint-ORIG-GUID: weoMSIPQjYzD5JUEelG9LAP7MghRn-YC
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a33cb18 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: weoMSIPQjYzD5JUEelG9LAP7MghRn-YC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfXyaNNvSLSYmGQ
 oMsiJTxuFg0fzWpBdKNcBsf7Yu7zFO4ojLD37pVnHPeAl9MLJMC0kWyW5WEyFbNfrrHbT2XJ0QV
 8cbIMEZkjebSmwliwHQACc6WqhhPJZg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113730-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ED4C69F6EC

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-venus
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-venus
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


