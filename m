Return-Path: <linux-arm-msm+bounces-79360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345DC18E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F37191A62B1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7670F313E39;
	Wed, 29 Oct 2025 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIt7Z1Ti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb3HzMhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE533128C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725152; cv=none; b=uaePg2oK1pdiNveEe8Di8JcPeSyRbiTtdGKbsxzKsERsO8r/slEK5DNU+BY+Awuhz8379iumI5TaJry1XQ/VFg6F/4foTsnxdaKByMMxjx/E44BHKZFTCLP8ZCavxN+hJtB3CQ4qGPtafYyqS8WGtDR+PdIGiqPaqTZQj1lrYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725152; c=relaxed/simple;
	bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/RIBV7QXUC+Mvrstg+KExgoq7ep9CnZz980FXzxbdWwkOR4muGU4vPgvb6IcoVJAGtuJRvPBwo7FAjGv06mq8GDoru+A+O9BDwimPIV6QwWobnxuLDbBVwC+QXq4EPpS2fYlOMidc2QvT5THUvIYbFXswiN27Piiw4M6MC2lNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIt7Z1Ti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb3HzMhx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vJvX3664468
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=; b=gIt7Z1TioWnETg7l
	XthjNZfQUl3fSx1hbaKyQrRDBRIFwkQnTIFLpz8xfJxCTKjEXS7doe+VdLlMMznI
	K2KDH3M6HT/YjRFjGq9g+BKYiQ1mWbaK+D0i0VizHqXzwTmohdtl8q8ApJ7rYxpW
	JcSe465z85YZyhrS56OyUcXOv4YZKkoMppB0qWH/DVXL2WJ2olORgQDZuH7nQYZo
	eGMbSo93Cz4G0vmBaEZmFa8ZFc1LujmAADfadZsVXSFw2CQOndasBL2gtp0PwN7m
	H7CeW+KR5Azo7oH7xrDkvrJIuw/MhRICuykhEIQ6WIaNUgRi0Prlj9W7spZNeDdl
	kPf6Jg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1spv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2930e6e2c03so73523815ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725149; x=1762329949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=Wb3HzMhxa3WA5XzdlDGdJV0uGBMV9D+ppvdGNDFXjZ2QDYd3TYtMK6fRs5nPZX4ano
         MXebFrZgEFliytDpOxvt+Ke1DGQ2Q+BHEsoJ2ACoREioZmGaHQAq/1WqLzr9r2k2qyYa
         89u4JnqVEI+4WNyzYLLjd41v65ZYMtmd+Bgu95iGu7K/JzLycaN792d/DBebKirNwNwp
         MgZP9escdTfW4w88Bf4B6NlUbCUaebyq4XSbpSA4X5B4xGMwdBS18HYbrdyyY8i+JWFA
         UOi2Xpt90LhPtMEcBLVrD6NBiTDoeZ7kCIDv++qojVsVBvABRebAnp7qI1YTYSzPUdKd
         kytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725149; x=1762329949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=IO4uPLaOVLchpmN1+vOaORnBBtlx7dgOpGzoDqVG3yxlyjuFcHzVNak+t6EBb8LYXS
         gJtiE11sL057neb2wR+NI4Yg+y9gOT/H+7zGYGS5birZs5ME71K69LDKpBZSXk6tCP28
         ipjGh9NtirYpmUtv5vtOhUgCEhSuTbxg9XnhEv8yBFhyRCadLOgbPxKivTD1l8LRLVNd
         Fdu5ZXYyvLPsFi/rKsTw8Ggsn/vwElz9SbSPgSjUEyOP366BzufDXVzRbgcrJX5etF6y
         OmcEWfZXqQJVD+zzshmvx/HrbQ63/rZnY6m0lgGudxqQ4Cmsi1uVSQdlbI8Fk2I3/OI3
         3dBw==
X-Forwarded-Encrypted: i=1; AJvYcCWGt6kOZq5u0f1A2sGM8K92lGvdI2aJuGJUFk7yRG7AdRdWM8pWau5AAr/Z5cVgqoAscAMlaMib0H22eiDE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FSPN+OpyT+FlHZoq1P7tBBLT9TAYzYlYvrGdoDnbs1HAMR1w
	2KQH05y6OKzieC7UazXmYn1TrLh8p0PfWOaMNdkqPBJQQNmLVazbEC2swQiRzRen1f5x3wfrkc8
	nCxmqfZuITvSuASVMNsrHj4kxyqc4G0fSsQDCm9AYx0F+7DiKv3lSfOuCgcRGO2nsLkGb
X-Gm-Gg: ASbGnctLP5vc2KvA7DZLNr9XPA27egKwZqXuVqGSiIVP3g4Bo46+jJ4rcwdxfG8cJGa
	Y7C04nvc1o0CIT4iGdPDiTgn35WeT9ipjdEgvMYDVHUaZkGscy61iYVe6U7Fvu0xb+1GrXSvcCV
	jqX63nBs4xshfWM5RfSX3x7Jod5Aw5pg+qjoKNDYyTNqUgh7dr8HtfQC+6r08cMA6RYo3peefQt
	6xvop5R3DRDDQNRBf3VFOX6H4vHDFHpDkb0alWeyqiRa475JxjG9CVyFf/SZluZb30ZZzpvk3m+
	ui7w2H5bBqiEIKppoulR1PNXXHRUEAiZMz4m1cDLPtbgIlxVP7/cRRc3A4bcTaZCJntwQwQgMZj
	E08lHBWdQwGu9YCQ3hqOa/21nHrGK9YLP4CaUIbzP6zV8fZYdCg==
X-Received: by 2002:a17:902:e94d:b0:294:66ad:113e with SMTP id d9443c01a7336-294deed6989mr28798615ad.47.1761725148357;
        Wed, 29 Oct 2025 01:05:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/eNJvA64JnnnSsz7eBeEKbDI+r5Fc0Hs1GYj7WxkUZW45UFFUeGDw6W8iX17wmr/4G/0oQw==
X-Received: by 2002:a17:902:e94d:b0:294:66ad:113e with SMTP id d9443c01a7336-294deed6989mr28798015ad.47.1761725147719;
        Wed, 29 Oct 2025 01:05:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:40 -0700
Subject: [PATCH v2 2/7] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-2-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1361;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
 b=9ijeTFo6Hk5cJ9gmJvkjVY8Iso7IC7uBXoKqasWgrL4s2m2WP8/0Pxu2xQtxdlRZGN6gKaGi3
 PgwybymLq3JB8zfyPpqYlZXjm8lOFXeNEyp/sDLZkfJj/om+APx6Hax
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: ZNnAdv9VS_Gy8wviG-LFuZAL8VHMCBf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX42LjWMcAF5jM
 wqyVxeR0IK/Gb63B6rh2vYo7aQpM7TMm1w8SgnjDa1eef0d8lT1wTGn75dBkrUsOTWopuEclgVB
 OhlLZgS6AEp1Rh4Lp4i36Tzscf0sTNnibeQHRzOfu9d45e2x10wj430NsbERxnsh0TGNQjcH3J+
 W9f3W3OGQK+fLnQnc+XHX/HBEx/g5+KzApuuLP8Q3UQ3spC8WaCfcZBqbY1I51kx6by+x682P9c
 I7LF0Knhgn9lVV3D5yNvIG7G5WyFEkfNf9w3s/EXERU+vguzr5UEu37kJgEhc5HgCmZirOMucwh
 BYJZ/ktAXwhnDcNIpX018uL6BalJNhUK+TWZMXWrEHIyw0NzrkQOrU/9NNLkqzT4lAizM+Y7J1C
 +AzIrARCQRIVze5yz2rKMXpUSNHPCg==
X-Proofpoint-ORIG-GUID: ZNnAdv9VS_Gy8wviG-LFuZAL8VHMCBf0
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901cadd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JO5o7z23AXsBd-kSPjkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt. It is not compatible with SM8650 because one memory region
"global_sync_mem" is not managed by kernel on Kaanapali so it is removed
in the remoteproc cdsp node.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 31dffd02125a..3b66bd106737 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,10 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -98,6 +102,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-adsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1


