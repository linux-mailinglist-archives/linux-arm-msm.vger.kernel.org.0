Return-Path: <linux-arm-msm+bounces-72385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB738B46753
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 01:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECA256555F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 23:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB91E2797AE;
	Fri,  5 Sep 2025 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIj6edrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339A259CB3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 23:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757116413; cv=none; b=LYZA1/YJ95zaDjnVvrjZ3uBEBFwBQlSFe+ROfmZXLpMs7ygrVa9jUJbTXvSwT+Hc2/Yu2PNZvRgY80vWAFkEPv6oq2AMIJJBJ/CExu1Hdh5d3mBxfcC0yNXgz7MPeDBeTv0IWubmusE+MiqM8UqwPjrCdtE7xTRmjsFbhxYlgmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757116413; c=relaxed/simple;
	bh=QqdQLIajWoiM08KJ43uCFk6GXl5SlPD6hgGGW00Hh34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u0/kPuwvE1JddFbXOwJUX6XyZSitC7enGvfn4Qvux4pRrh9UDZYOti3wqsjmsYUJ2eKlIqA4tbdekrTQAz1qk/dBLePQAFafPBKOgTTbsl296e7hcbc0PDn3phmmLUZAG+MZh6nLnHvtllsxLUyzn1k+vzFl866S+sjzLk4rWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIj6edrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GJqDS008288
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 23:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9ntjK0000JxML8T0CJ9N/J
	2iPUwrgd3ulvER+ZPDg9A=; b=MIj6edrGuFKiPnFwSdcROUHqHFrXNBnPyFZcUJ
	YYU8zEaaT1PVFQn3YfwtAo5v7y9NVv1QbW2Ug68vl/Fdqz055Fj+P+NVX8F1wK9f
	uJyDhcOMEfuDuac7D/6hMWcr7Mfs6awxT/GdlwNat91fQ/D2DMpWhY7FV+zlkSOX
	0rzujJmoHH7pNwbIhBqfEE7QaqdEu8CLC1c92XUrQvrjrknTrrWm/u7Cnhd894tT
	yZetz38p8dQ6479snc9BBIBmthyXfg7lya/IIQWzxeeMMqFP1IeDfgdu53pZrOBe
	KmNiKcuMU9cfBB8GiBM5CHGzM0cB+U0pxwZ/lkIybRl2IVqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjvrkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 23:53:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ca417fb41so32442895ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757116409; x=1757721209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ntjK0000JxML8T0CJ9N/J2iPUwrgd3ulvER+ZPDg9A=;
        b=sRcO8m0C/zgol5yIFTqqQRi2+K9VMRHzTVEo8QYpBV/nxsOuVH/QgvHSwcEJdiC6mR
         uQ2G5hwL1elIhZTms7aE2kFZ4IC7+Oxm84bVQRd08BqOqc1lV+lvHCNoKDlC4GtCjLj0
         CARws3h4NC8Q3/2BvVL0jl+TPlEpdhfxLEWCE4oHRirqiLwgICY1n5iAZgACAwHyErF2
         G5mJksI5RQKAkjG311QybWFNmwHcJ3Jiq3durdJ8/99oIBJGyoaeDah+K+hXTK+s5tqe
         SBXSIVlkOmL1X3GNWmVi7HCioxtq8s8XnQT2Fw2qn6zHV/MjTQtgKHr+7BPxgG6IGp6z
         py8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIN5BvDsAEPrHKNvc6m++0uR9/TKkqDDWLPFGCSmNIy1+AdAKHQrvp+BECqxfBsjOn/u4BO2EJQoSTXy8U@vger.kernel.org
X-Gm-Message-State: AOJu0YwbYj21TAQhtNTLl6U4s/opsSF72FHcwxdCK1wEmoGukLFUKp9h
	EHpQY0CPwHFfkifoRzDLuilY3wKM+FXSzKqUl+CYev5YB/VmG+Hqxhjo98L5BXztQwMjiSkz/KZ
	vE21vOAXzVyj/TiBABX6viCbYBWkruT07Nv4HlY7v/lFiqftzhHOgNQCEMCITKfCd3au6
X-Gm-Gg: ASbGncuVoSEyHV13fUROa8j6sLs+mBeJEi2DGi1e6Y0+/IY+m0vKfY/pDTH1GGlRiCj
	0l/coWkVRmJJUHFX7IJPZQJe4OepAZ64TJMgjL/ModU9siGFnQ/LZFufujb52QNxsuXDM4bxbMD
	iOp2+JxCsQhuTUMLpl/Q0XvzlZ7YP3VwLPZyUpxqXjQs4IkgBmJU8Ejnu1F8v9rnMFOcKyK4uzG
	wg1pxbshOz3I3fTiinnT+pSdQ1bFm705ZHTxwfI+rwH+7dtYKeBxFiV8uieGtwMR2qw0u+D9CI7
	KRRiB5ObIE8NcSVkwr8Ilwl0acsSnU9pMKL8xbX5zFR0oAV/mAxCiVNtu31X8LVGkdyI9+cA2ku
	em2FKjgwX5k4ouvHMD6+7wDECDrU=
X-Received: by 2002:a17:903:22c7:b0:24e:47ea:951e with SMTP id d9443c01a7336-2516fdc9797mr5866935ad.19.1757116409273;
        Fri, 05 Sep 2025 16:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8QUpGniq1OUMLLIgaeWGxmpKOQZNOr5ydhxok8F8J8LWqbW8BLwCURfP79S7LrHEK9DsS9w==
X-Received: by 2002:a17:903:22c7:b0:24e:47ea:951e with SMTP id d9443c01a7336-2516fdc9797mr5866655ad.19.1757116408785;
        Fri, 05 Sep 2025 16:53:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b2570cfc8sm102015245ad.76.2025.09.05.16.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 16:53:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Sat, 06 Sep 2025 07:53:04 +0800
Subject: [PATCH v2] coresight: tpda: fix the logic to setup the element
 size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-fix_element_size_issue-v2-1-dbb0ac2541a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOB3u2gC/x2MXQqDMBAGryL7bGAN/tReRSSIfupCTUtWRRTv3
 uDjwMxcpAgCpXdyUcAuKl8fwaYJ9XPnJxgZIpNlW3DNpRnlcPhggV+dygknqhsMqpz5Vdo6Gzu
 K8S8gms+4ae/7D0GOwF9oAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757116405; l=1920;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=QqdQLIajWoiM08KJ43uCFk6GXl5SlPD6hgGGW00Hh34=;
 b=5Ad5QfoQp2FDsdLvjG/YA5o8B8oW2b70yf175ycH3GNbzdR5c/Gmgz442CiNcw0KfK6Mlhg5a
 amBabxrvU3BBE1OG5yVI9LqInzQUDK3CXL8qPxh5aQK0/LSwcdBACJq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb77fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=eYArMgjR2MFx1z2CNlUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: y-0eLx4cZoCA9ImgN_qhFmsF3kdAzlJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1l5QAS2sC8gF
 HJFcGiy7zLtCSU5KtDQ72S3cf6yKF3XoAh7MuchYYVghF9aiVsd7Uxxj79K/IPjVb4811JRHs0C
 wrnodW2oyyIrFDv3FoZ48zIcVSQe29xO1BryuFaxb7xImWUHcb2N3ahwUoEgAdce5P85ke8CCAX
 5S+G5SJAJKJJpQMBihXWGbEeitjc9EGmzuhbu9Rnya2GfSFnLwntJyZD7T/xh4gOHHeSLT75tVE
 VDd1FYYL88ivR4RwVN2pHN9bbgJdn/So89oHQHP5ZTPOcneuZec7wPiz1iL7UJhqjVncUw2MKVG
 owCBrpbIyjWziZB/aZB7Z4s3HTYHyyZF2RlpiutDYTIAwM12AvItg8fTFmcNivK73e3e5W8UzGn
 ZNAGzK+z
X-Proofpoint-ORIG-GUID: y-0eLx4cZoCA9ImgN_qhFmsF3kdAzlJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Some TPDM devices support both CMB and DSB datasets, requiring
the system to enable the port with both corresponding element sizes.

Currently, the logic treats tpdm_read_element_size as successful if
the CMB element size is retrieved correctly, regardless of whether
the DSB element size is obtained. This behavior causes issues
when parsing data from TPDM devices that depend on both element sizes.

To address this, the function should explicitly fail if the DSB
element size cannot be read correctly.

Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in V2:
1. rebased the patch.
2. Add James's reviewed-by tag.
Link to V1 - https://lore.kernel.org/all/20250806080931.14322-1-jie.gan@oss.qualcomm.com/
---
 drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 0633f04beb24..333b3cb23685 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
+		if (rc)
+			goto out;
 	}
 
 	if (tpdm_data->cmb) {
@@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
 
+out:
 	if (rc)
 		dev_warn_once(&csdev->dev,
 			"Failed to read TPDM Element size: %d\n", rc);

---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250906-fix_element_size_issue-e740086291fa

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


