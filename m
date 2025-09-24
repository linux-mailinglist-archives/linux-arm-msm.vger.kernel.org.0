Return-Path: <linux-arm-msm+bounces-74650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDEDB9B85C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C9A4C6E6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0B731B828;
	Wed, 24 Sep 2025 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDso2loU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213C31B806
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739093; cv=none; b=s3Ask5VNAMDYe2J5nWPdg1HvoMgvfHXwPBIe8tmtEvDQO8QBqTIQ/qxu/ZYKe3QY4MNWZHAARUYejdSPX9FwZr1Q7KamVTcPv5/kJ/U8g9v5dzwiE3GjomqMblxTYmW6ohFYsK3nmpLvFnzaG24f+9c8G1eY1st5Zg4qxUoU3yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739093; c=relaxed/simple;
	bh=dWgRWKg9c1JS8VUIKBovpHGwX2fAT4eNnMOUTyOCEnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hB2Qhq5JO8l9XfNY5YdNUV8n+97IHgALRM81g7D6QbXoJQ9k6UhQ1W6QGexwQceSLKi9t/Du4fjuLSRCcu8cuMfStKYs4alz8uBkikZlfkDQKtsI0Y3WTnJCDsrmHKb5tVfJrOzEzget/bfFdER9s4DkgP4yKnACCU+JEKek8CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDso2loU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCcTD9027779
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2QgtMUT3ZcJ
	WxmG8dCgxr0VkowdSceCN1072QlAo8co=; b=JDso2loUSBk3hQ6nJsXjz2z2CVY
	mJw0O1Ul9o1SPoHPP4OPKSlJ+b8RHNXzf2NeqYe4F8m8KvP0kG+/r0CbrrZq98UK
	FD1FAPDAWPmoFLDU3H5b229wrZ+a4dLlHKJ0hXplO5UU0YHGq6OYvHNeSC1BU7H+
	s0hI2uicRkz7Y0NeaKc+qkejjYlAY0+WFRC1rHWxdXX+NyeRibmP4VVGdPh13m0R
	ZhL1fiTripmGVbPPMqgNMj5jkA5bqdUVf1dyzQvDfKotlAHrrscIhtpAyK8bd69T
	W6ivgyJrOcQB5xB03+B+Ppy6hWVWmP+4yBq/NEw3L2FpIGvLcey035sqbfw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnws4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24ae30bd2d0so913045ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739088; x=1759343888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QgtMUT3ZcJWxmG8dCgxr0VkowdSceCN1072QlAo8co=;
        b=UT4xQqrfuj3rluH6asVQChnHvzRtoF6zhbs1U+VjX+Pjw5MRquaDYCbV0ooRQkcTf6
         QFjT47IY5Jb2men0ySS75+EKrNF43QEnNe8DZeV2CLUaXokyW2yVW4gKWhnYnIVKi008
         xbZkTzdm/ct9sbyOo72HLok2AuA71wVqL/bVqZGlxOZ5nNOfIcgWgPLT/Y/UGWNnTbAS
         tA7PGD67jZvYDjL1Yiqa+S3jdzgA9q91iA8XUng72sy3xBhdF9ndMaQgdud4uadohMQ2
         UasU/HSblhs/V8kqI9nfEN1LnI17l9Jx67PMmPKxzf5yuF73nO0Kh35w++4yswat6O00
         2LTA==
X-Forwarded-Encrypted: i=1; AJvYcCX+xSY/wxCp4TkwCvrVN9z1h0Y8NFLQ5QDAY5qRniYsvROl4sBp3cJSdleY+s4qSAYTM+FfQD11hqcA35n0@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfjLjo+/3bm4uoQhJVXgh+Y/lE+eYlWlOuokzunvkiNFn8WEJ
	FC3q8Oppw2jXCf9/bAFaSN959CsxZwaWO9rOEp+QSnLwYldSziq+D0BRlfQbsKoZrWIkgTSGkdk
	yP0Ug54aJCsM5u6i2EUGlnx2ZSsk3I2tlslfkq4vvDWntu86iClw5wxlyI6zxc7Y/YSOP
X-Gm-Gg: ASbGncs7w51l5KN6HYLLpPdXCxz8WwHpJtuvZWdOabvNAio1K39E2V/mDTxYL2NEvEf
	Et1USlXMJAyRDJ5ur3CBorFBdKmNK/v7s8c3kRArShgY/rXOKszt5pp7ZTpCr9eAa3q+nn7XL0R
	ONYMkoO9eJWS9t0FsKUjYrs5ZnApmyYQalQ0ARIGVgyfQkLk6QNIGXy58s2FWEzE/skeX2iLqLI
	2cXre9YYQcJtNbrWTiCA9TBiQx92BBiducAvyXaAm0y+dFsFv8TsQslEDwNkNjgyL3bXGfOsy+f
	6TeiEw6e7UeWo4NjuuBYn+LyoUWpilLny4yiNo47WqBi3NULsfMxnps06dCRkwqmmQDhgTPZX9Q
	RVDgNsmqDuNCscZw97QndMn2AUQ5/Y59qV8l0h7CDwArdjpXFtJBa7Zo=
X-Received: by 2002:a17:903:384c:b0:27d:69cc:990 with SMTP id d9443c01a7336-27ed4ad102cmr8561535ad.49.1758739088482;
        Wed, 24 Sep 2025 11:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwx0Y5BNx/AZf0UKl2QB41ev/gZCluSWgmL2NlPqiBpOXayzifxVIa2OG4y7bWAT1hFew8XQ==
X-Received: by 2002:a17:903:384c:b0:27d:69cc:990 with SMTP id d9443c01a7336-27ed4ad102cmr8561265ad.49.1758739088033;
        Wed, 24 Sep 2025 11:38:08 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:07 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur ADSP
Date: Thu, 25 Sep 2025 00:07:25 +0530
Message-Id: <20250924183726.509202-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d43a91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z4uQfrFFlNbWx1whHNsA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 2PA02USGwMnWmQYtamUOOMgsN3UsdJKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXzd58BEGVM6WR
 oPzZxvLfaQBAUwATY+xm8zLye/4b+L37KiRHj9m+kmo/952y44l02oJk1vcDtJLGSwS3TVKzx61
 c2WhdJrZwfYic1MxxS7V0KTBfAZ2HZQXFHCSFdEWAH8GcDUp9Fwrt2qYRrFF1jyUDnBGw1JZhno
 fd2qv5YViDmia80dVZpPQvlpWC1xGBPNIYF2juaWfKgPR63q1lfi+Q91baDRTM/P2yk71AHFiCC
 6HfJ0Gdgc1FmAXKOxrmihHf1yivbDLU9Uzaf+IWVneFVB9So43Klann4SUIG7xjRGnc1RkTwRCv
 zSsgM7JlxHkmS7rj0U4cER1NgHamrKsagV3J06gQFcIOMmXy8eYF/NTn4rSo2mPb+HCXf+aPg3P
 CO59xfv/
X-Proofpoint-GUID: 2PA02USGwMnWmQYtamUOOMgsN3UsdJKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
need to be hypervisor independent, the iommu property is mandatory to
ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Dependencies:
Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
This patch has a dependency on the iommu binding added in ^^ series.

 .../bindings/remoteproc/qcom,sm8550-pas.yaml     | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..cba45ce2865e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,glymur-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:
@@ -185,6 +188,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,sm8750-adsp-pas
@@ -238,6 +242,16 @@ allOf:
             - const: cx
             - const: mxc
             - const: nsp
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 1
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.34.1


