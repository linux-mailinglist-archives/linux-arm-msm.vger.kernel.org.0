Return-Path: <linux-arm-msm+bounces-68178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF41B1F36D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D671F7B6B85
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0412E222585;
	Sat,  9 Aug 2025 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK8mAb7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A3A209F43
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754728619; cv=none; b=msUD8+mEBmeBGQWAN+jA2070MtpQwe/wmVq+FKKjv4Hyo1+g14H++wBGbXi6O90iCaHZEH/snPDqDlFaSidahdL8aoQMmVGEzsHizSi5mZrmosyynZbMaWiz1ymbvfHffU4VWE+xnIw+okiscy71IbvkCVVU682ofFBc52a5BAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754728619; c=relaxed/simple;
	bh=KmUlDlykqRmfS/c3OkAxh7AJ+0CRPOU7eFP0ludcvrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E+kOkhwM0jx+6wCMd50N3rEGdzb6xNT2BsfZm76Gk36sMz6nWjpbbPznv3a3T2HgV6KnlypTftVQ/18zN3Gi5RYDUjefTGDU0bteMPdLeB6DrUQ78F9EAXonwvnjSswz4cDTl9t9fJrMLQ2ykDfAoRFz5P6UH/PkkOv+rCDCBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK8mAb7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UrDL009634
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vbhk6QCT3EVReeZaEWJCjX
	Dtjty/QxM/QqF3JsKZ/bQ=; b=aK8mAb7wHR5CDudbNk+2qoh4ORGcuSpp7chNfB
	6++T8nTbtFwp61xD+vH4dam9eveMkdL/wdrfiu4W5YiQHRFYEpKGs4UoM+yLMSvL
	EC+Hpbiz43YJ+AqR4FJPLA5uRTECXQZsAjwPJbF0SikwJ3jXa31WqoOsZ5UztfeM
	T70FEGLOcgEOgWfh7eRTDHv/tuyq2NHiKScvNzd85nOGWNIi47eFHzUORm3qtysE
	JFyEgxqX+wXktzaKCD10gWUrzhu3CdS5MldCCYNjdak24e4JzU3/V+m/7g9vUx01
	l07HrL5srnGtmENYNAPKTJD1Vc5QHcPcboGk8jKHA17Od8qA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmgj4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:36:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06228c36aso38590551cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728617; x=1755333417;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vbhk6QCT3EVReeZaEWJCjXDtjty/QxM/QqF3JsKZ/bQ=;
        b=AuXXYonfnvPH/av8Nw4ghCOGxmIo62wyA6bigjwA1Wpm9ZLRess7lC7tU3Fzp8ev78
         zAN73z/6iHGoKXl+g3UkW5saZBvPmzapGEtzakHtIAzbn4mTRYdXr7+GZ+0p02bBwTtf
         UcLOr7WW919SogoYpTfRZyMriSn1UdPecNdgMk1PIpCFtZOxmic39ebIngT+ZQZISdd2
         4kWRESMelERJUPDmR7YsGzbsI3U34+q5s56O6I4SgeYblk9c1krEJv54onpOXPMQ3Jxv
         SXCRUL5tFXu1dMcbLf7AVMhOb0whq3da+COhteoACyKE0qjYm/QSxHcc9eBPoF8TEPgb
         cCTg==
X-Gm-Message-State: AOJu0Yz8mVcQcHlKOgnyKR5DmAmceosRctuBjq0yGfKUaE3JzCVZzBFE
	sP60mAX3sdUpGplfhA8t1EdHVkXSqezWA+YBKm8DffkpS1bJbI7HCyvfnIuYH7zlvegKJnmoVAT
	KJuGXG5zxKHTUllzXILDh8SStj9BGul4ijKXv0xOjAMxU5RQLp+hI0BjLad6SdZfijTLm
X-Gm-Gg: ASbGncs2y0W7z4rR37pwmcAFeN04BbmG/z/cup8S2oPnz2nDSw48Yq7yEdN2Ixq8YXx
	XQ22xN+s7zAlmyHauUhiXvMy0xN0zfrZOVgzgQIu+3KY5Ok2vpaWP4Cl+cuFaQQjvfE1MtUu7uI
	YGFbYA92VLRCas4MdRdADdpptMSlXUTTRfg8v7ay+z3JWhqJJ8GfIngWhY58TU+I5ni/cHkIBZh
	AcWuDJNIAXuVpWt8mMhn6OMxlsJgIv54S9CZcdeZ7raMsJbRICI4uoIZOi/4FJp3ioFQ6EZdnIG
	Q3ia5S1gUAgmV/2+AAepdWDD7MWnFD9hhNeUb413w8gPhJbGlwjilaJVZ1ypB9FgbiMfA4xeyAS
	TalcqT26Hh/OIWMZPW/J/KN8yTWL3BE5uMDmHq9S/W1hbBREOFdhP
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id d75a77b69052e-4b0aed0bff1mr90397771cf.9.1754728616701;
        Sat, 09 Aug 2025 01:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH37kRnw8/1Yvy8Ct0TseBki1Zc9SOjiU5tdXrLe87OhkeI9dMLexzVEv+ZZeRaP96/LWT6Gw==
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id d75a77b69052e-4b0aed0bff1mr90397511cf.9.1754728616224;
        Sat, 09 Aug 2025 01:36:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88db2214sm3239974e87.177.2025.08.09.01.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:36:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:36:54 +0300
Subject: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKUIl2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNL3dziXAtLczPdvHzdnNISXZMkU0MDg6TktCRjUyWgpoKi1LTMCrC
 B0bG1tQBoHPxKYAAAAA==
X-Change-ID: 20250809-msm8976-no-lut-4b5100bcfb35
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KmUlDlykqRmfS/c3OkAxh7AJ+0CRPOU7eFP0ludcvrM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z0jmVKKiy51Y/+3+p5PqP0fs3XmjAmj0vMF8rL7+qbz
 9pwz+dNJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwt7I/lc0OcDbbM3ekOis
 iwVbqiwWv17z0pxlS2uU0aXM3CsaynEnRPmeb52nF5CvlMBhGOc+92HM1YO1LOrxojddP8zyZRP
 5zHk2sFz3352j1zasC+o/syEq5We3aOYH9cKSCU+5LnV0ae26m/r1Gp/4Djul+zKnijef6Xt56U
 BCzOwJJuueexW0nir2Csl1MQuQFDc93Nt8nmch890Sh4OmlWwWQi1Mu9cw/jBfKjb7y7H57yfPU
 sqwC7/WWmZYwnjp8IHpC+c92KXH2Tox8bggZ5zCYpZnis0HXAqSLhYf+8J2KyHWfnnvXYu/b1s6
 ZO/0Gr+xMvVSfXdl4dTAhx+mz1JO/wa0sWVamsGVsr2yAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689708a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-Y5st2MN6ViVPFRs--AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hqRRQlyIGoTTtgfqBl71z3SgAWlEoYad
X-Proofpoint-ORIG-GUID: hqRRQlyIGoTTtgfqBl71z3SgAWlEoYad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXxqMszDXL2GXr
 0uKHn5rt5yPsyM1r54wAIbcIsUlKK3mALEeSoFideYOlzsjT22j1DDQaxoJkT94HpAf967gqfXS
 xim5W2UonaYACHVNO8WiF+cFurgCAqRfXrvE2SjbHl5uhtWe8DWQ4g9leGN62A55S3krYyPk1dT
 iQdS61KnzsbNdsFi06JUS55Jj2QLrx0b/YQ41e7/wEXsOfR5dwkKWKhlmTJXf4o7m124VcvUFLH
 TpFYBkefUEEwms9Id1I5fhx5xgFlBOTzDDMCat02JpW3hXGZ2S8i+B0oBC3L7xlts5wBRckBDd7
 FwNhy+kH+6kMdD/epTFltSW292npUhb6fgy1AG2ZAY/5ImQwm0jValqpQSQnBTYmF4kGklXki7f
 KA2wNT+g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

None of MDP5 platforms have a LUT clock on the display-controller, it
was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
MSM8956 platforms. Technically it's an ABI break, but no other platforms
are affected.

Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -60,7 +60,6 @@ properties:
           - const: bus
           - const: core
           - const: vsync
-          - const: lut
           - const: tbu
           - const: tbu_rt
         # MSM8996 has additional iommu clock

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250809-msm8976-no-lut-4b5100bcfb35

Best regards,
-- 
With best wishes
Dmitry


