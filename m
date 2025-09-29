Return-Path: <linux-arm-msm+bounces-75511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDFBBA9842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 16:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 257A018918BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 14:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433CF309DAF;
	Mon, 29 Sep 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLf8mBFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D023090E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155439; cv=none; b=BvrO+gVKb6jUdBx+7dHqubbybLKmZ3eXyR7lrFDPtMX8BKfOXc7ohhlTa2xTZzVggKqPcuobPFX3z6kfYO2WcvejrjXGZe3xeMxK9P/jcOGo8oPOilVdw/klMeeOzU+vRFwoNg8pZt3RDG24SvV23gS1978R/nFDzGzhp47rqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155439; c=relaxed/simple;
	bh=nDAvEkupJ9bhe7WPyGWNAPQAf2miQ9l15dB2ZtaC4IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvGdg6knnJWmsponZRdkdG8L1r3exvr/32O66/BIFLJIljpAe3cg+plcA/O8jgt/QsvMhkntnBhMRSuG6fguIv3RfX9XGDbw22hOQQN0mxjNIDqwSzkzeRaQXg0y3ZzCWJOJ1sH/pN3QRXz/H9tATD+8mMTqmCYt8l+PkY3io5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLf8mBFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9wDgt032708
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVvhGi2V7VUGp+oGwlVJiXHd1W+lx+hrZa5L93ZEpkA=; b=HLf8mBFnWVYEQYrE
	LXB2hdsBsB4a5XQLEg399K/JkAPbDkaw7JowGkNWyerSVtABxUrIsJa/lZuTCDwC
	5DBPzZf5B5mgiiB77riX6V/BUloim9wSv+6cwGYGSQctiyKseT/JRTsxys28b+ub
	CGHZgD+Ln/VwFUcmkLHQ4vjXNbMh7clW22mZzfcVzDznWuLgYWA9hTsr3zZLJ+Ji
	MRG83s1w7ONA5bZxxIVYOTEbE0A6uT/OQo8ecV0oPs3VHM7lcWV1gWQfpuS0svb8
	5EOU7AAGaVribPAt3rGXr+JKAJbo+zjiuwx7nZoV3SzKVcTaVnyKzEiV4E8IDqCp
	fLcWYw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hdamy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781171fe1c5so2597566b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155436; x=1759760236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVvhGi2V7VUGp+oGwlVJiXHd1W+lx+hrZa5L93ZEpkA=;
        b=WC8z2BMPT9Gm0K/sk3tzVvapSpGSMiNow1oZ5p4JT75nkIxC+Uel3nt62cOBGhJ8Xw
         UnB1R4RHVf70BM03+iZ5mBWs1UkHIkVLJN9xsqCsm4unANalCrupF2q6grrCqGbxpLNl
         V8ECIo+FaVeZ/HZARuKiUvLonSYTXX+sAnkSOc9/bDRYpAJmKp4PK4YuBij8pVuqT1qM
         +K1E1Wo+gtMtIGuSmNaJCpP6eF8BTbb8vL01MLzC8ona/k4muelwJ9gL4qurdzNVQMRi
         1jn6RJH53ycxK9Io7dFAUBhCHLahRSAxJ7djRnPO2u8F6uZAccfj/TeuDmtCR4o2LUYV
         11NQ==
X-Gm-Message-State: AOJu0YwPXK+xquNY6iwoC/h/Kyn8xccLqaI8AzQoqZdK3SoEI81rlMJr
	YC/k3O7T8A6Rp+diokNhSkRn35u1lOBYZtI1gh+s8lf3QQI2T4g89MkEXds104C0pdQG1MTLhE7
	CY01Q9pjd1N0ktxjInR3Fs9XujOY5sBSJAmjvEAdJJwb1pyO5YCR7p7mfZS8pCEGktugNPYBPnp
	ob
X-Gm-Gg: ASbGncvZOb1+PsOWUIqDqexLtsmyeeDbXcGG3C74aWLzPQmpdySv8wDuwApOk5bU+tI
	VTvHvHvFWWO51zB7sLW/LCjkKa2gW8g6jYCLPlEhHKuN6zzVcSlwTQHJXwk9S3vuy1vtflUmrR5
	gV22D9wIlvkW6bUe58iWldMDn8uG4l6aaeLMuUhlgcfDY75cHDAG2jrcnJA3YVHtDjGZnyA8Z/z
	hIXtwsCkPicVZ6POD5Yy3275uh+MUr5tUnCfHCau/sn2HlGL/A3nQmCd+0SWN5arIPeUMU0T4RF
	EfayYUdiHz2o85+acKCD0Q2mOdZOOUKj8ZqOmwQukyIqKDNDMkf7Vr0iJgccCvh+qnqlPG2EC2A
	XlurFo5rGX0OE8k+E2rB906oFlA5oiciMarcHfHg10GenJy5dRBs22UjNDduf9gMpblOGukst4h
	Q=
X-Received: by 2002:a05:6a00:2ea5:b0:77f:45fc:9619 with SMTP id d2e1a72fcca58-780fcdc5b29mr17958650b3a.2.1759155435857;
        Mon, 29 Sep 2025 07:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVbOhmzy2QsW0ypadRZL+5DliNpTl3m9p6nAWN3HxERYOJ5AjYVoOKocKIh9OEN44p2YJ5gA==
X-Received: by 2002:a05:6a00:2ea5:b0:77f:45fc:9619 with SMTP id d2e1a72fcca58-780fcdc5b29mr17958606b3a.2.1759155435258;
        Mon, 29 Sep 2025 07:17:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23a48sm11536334b3a.59.2025.09.29.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:17:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 19:47:07 +0530
Subject: [PATCH 1/2] soc: qcom: socinfo: arrange the socinfo_image_names
 array in alphabetical order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-image_crm-v1-1-e06530c42357@oss.qualcomm.com>
References: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
In-Reply-To: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759155430; l=1670;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=nDAvEkupJ9bhe7WPyGWNAPQAf2miQ9l15dB2ZtaC4IE=;
 b=5YQiugFCj+xYScXxl/Pt9aoE6vrH9V48DYDxnusptdmGxKQNNPh5XaGyeAlCJMdFxBZnPBV6p
 CTBAtpYrRosDLAEuFOUj9mJAFpMVnYmjzD7LdiET+XSOjRp9iW0S2GQ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX2KjQHAVbqrMf
 abjdsB3VyMfeVNskl+qiZjVmg+rpP94htzUPWVSDkoAecm2/neJDxaN43+ziJMpIydNeV69vBUy
 rBKoGK9CpWC4ltgcphUuGnjU4ZtUv8VCR1Ao7cIii0LGpuTRrfyg+FbqGAVJ0a/FFZqADoHTErV
 MPw8UXcuzJWO9wBAnkjCfkEN97Nm8hkHuN5Pmpif1L26qk9c6bFsOK+PbjDDI5bLyKwf++LOgzS
 tqL+wcHChVUqJxKB0nP2XODAPrCej5M6tBvK2ih2qroWkzIl1R7ahtFVSecQl2TU0eFfFtPutb8
 qiNAsXCb1LzD8OiRC1jH6W/ssI+0VCzfkfHe9DZQhBG6eDTH/tE4iWxfGDpmV7ilWTGCMhLbo4N
 dP8ooSFc5tl3BCpf8hhTHAVcPXuctw==
X-Proofpoint-GUID: Lfstgqh1-6_lS8t-Zruz1umdhTyumfuN
X-Proofpoint-ORIG-GUID: Lfstgqh1-6_lS8t-Zruz1umdhTyumfuN
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da94ec cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rtek9ym-L9QbfiO9y5QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

The socinfo_image_names array is currently neither arranged alphabetically
nor by image index values, making it harder to maintain. Reorder the array
alphabetically to improve readability and simplify the addition of new
entries.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 963772f45489d4d0e15d4893ac40d64502fe90bd..8d25da4c7018452f463c6ff1e7ce605d5d0c6aab 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -60,17 +60,17 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
 	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
 	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
+	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
+	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
 	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
+	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
+	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
+	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
 	[SMEM_IMAGE_TABLE_MPSS_INDEX] = "mpss",
 	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
+	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
 	[SMEM_IMAGE_TABLE_TZ_INDEX] = "tz",
 	[SMEM_IMAGE_TABLE_VIDEO_INDEX] = "video",
-	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
-	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
-	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
-	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
-	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
-	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
 };
 
 static const char *const pmic_models[] = {

-- 
2.34.1


