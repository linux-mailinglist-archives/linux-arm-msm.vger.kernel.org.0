Return-Path: <linux-arm-msm+bounces-82802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCDCC788BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD1E54E9C89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E49A345740;
	Fri, 21 Nov 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4V2CI6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwoC9oj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D920345732
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763721396; cv=none; b=AUsa/FPilSyQwy23u6QMiXm+iRg572UDzZ9ScP4VXjemHM+mCQ0HlOcxCD9eGBJUK+2gFctRvjSTv1NrZYN3+1uMnNJ+duipsgBruTgrO9GEa5lCNTAdvX4YuvOKqh088q0U2Q/EJrzvNSdd0yfT+EiS2F9ULCVdt3AQERL6pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763721396; c=relaxed/simple;
	bh=42Oia7LlBi+H523Rmn2IIOy7T1zt6E32yOR956DWeLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yq0wkpYQ+RUUtHOaWr3UAC1WjizataGVY/txIChcmMrJR3JGgNNlVIH8n+O44IrrIKF8vfqkjBRWVswHb5UflelK9QpP0cfshAxbUtej+P25ZpR83AKc3mrB/j1pSgPsv3EZnVue7RBUcFCSkt5eNSBuG/MZ/d67NS9QUoIK6FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4V2CI6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwoC9oj1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9SZaH3541521
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAqEF9ipkGXaLh8o6lQtStQbpT65DW2PvBWxy9J0Ebs=; b=I4V2CI6tH46zktrr
	AMctmO70+V+tncBeTPb2fYgTUGa9SDDjafYAW15/DncqXiuxaWDnY+Bev2a6t1a5
	Ug/lX2b8L8xdRskXKq0pE8Xy0AXl+hsUJfaPSLqVqAjeTRPEBlgsrZQYtpPZX2mf
	FS9axJ3tTuBdNfhAEpKQvCksSTOAt8SM0k7knAL/1i+F5/3Gm57FT06hiV+VLTYS
	Eo6iHFei9NueZtgl3oPcSvvmWI81zb6PoHOGZYOhDUJ2UW8YPwIRDzvjwXkFu+nP
	5i/CNIQYm8OLrxM1Wg567DVTpLcPyTYkPipXMEOflRIvXgxLnTLQGLpx9MZkp0MN
	tQc/og==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng007d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299d221b749so54482865ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 02:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763721392; x=1764326192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAqEF9ipkGXaLh8o6lQtStQbpT65DW2PvBWxy9J0Ebs=;
        b=KwoC9oj1WK3O+Q8Ei3N987P8iw5Jhxodjsdd/XbWWCp8EswgPy+wC7zltCz5l4ZMPg
         q36pWEZmaNw0aZkGEBCuseX2K9kqIh3tPU1vRItr7IMJ0EAuR+6uvqwtga3hLPj+H0eq
         FQ7v8oEHW/UQKAh2RdKBbsYTjgqNqJLSxTfhDcb9E24RnjMjK9eNleCIXZBK3hucnxZ5
         /2AbdQHcNOriijwliPV3JEmn7ME9n81+aklJSHQRZQ8mKuLY63MgJfvwDIhDlsBOqw5d
         2XECAhFDPcjZ6Om9x8QqCZt0jWSA7QlZnySKNg3/s5jnHwt6N0i4GTuiUAWSAFoHDUZS
         kNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763721392; x=1764326192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAqEF9ipkGXaLh8o6lQtStQbpT65DW2PvBWxy9J0Ebs=;
        b=gfHd14Z3VYzCCelPB0XxxG63qekIeMFKDrp7uHUbfXGVYrThzDmeTPpDijhbwKYg4u
         5LO/ExZ28YJDxqBAPuVUCwKCWsbEUcm1qY2taCs0NQAttnqZDU1z7f5rgV9HPah29XUN
         KI+eKvi1FgclB/DeSDEtE0jgkt7mnxsAHwR5qVaCeRUjWXHfRgXWiUlt6Ls7NPBXe35I
         LK9TXwx6tvb3w2Vz+imzoe8TDNUxo5fkekhLvq4ws3Lwj0u4DmLY4ODylX4mzIgwUL1x
         BkTpRClRoyMkvD0M3TAVBUFwru76cjpNZTna9bmUfYlNpinXONOAc9bxJu+YAU4s9Cc3
         vq6Q==
X-Gm-Message-State: AOJu0YxWFj+WSWyPKJBD6h5YRwfNC2jKG2zUm2a2PiDXSqTyQAlSAVxQ
	g29Q6lINqugRscOOEWTzvD5lwuwDOwD4x1PcFiEktsL4ZHB1HuECruCOTzewhrgOMdi3enj5i3B
	v+GXW8mJidprZl1Y/s3MWh3WFOIMS7eLU5bB6Zx7dXSf5VPhx2Rnqkhdxf2lja5E2zrR4
X-Gm-Gg: ASbGnctvEf/EKRaZzrD1/qZ6n6xOJlBUuY+Qya3mLnupybaIB41KMugPRWDsCaKr/xV
	Q019pobKTTvnSbpR6ALomDYIlnN8tHkr3xRSc2riM02iSfneTNgQHxQFRU87a0VQ2DqbHBQyo8x
	YownfKuOMxm0RGDh5sH7MYUcX1+IG5sEmytlcNz/+/BS0tF3hbBtrTMtjETkngGPIZZV0jHpBO/
	bHxbZR3pOes3a7LtWJXODk1/nSPUyBv3e+CI58ZvF2FblbcmiU3NOhUNqdcqXmUGlD/9hcBSjT4
	Ah/yDe8rrAZpa5O7hOlnfxccoMtCtmEK9H6Xg6lRq2A6ZRk5SP0MJNBFDuMAqbNwtdE8zhG5W/S
	ahz5h4tOh5QVIntnL+vERZQB2teE18nYfPwc7xmiS1X3Cj1o=
X-Received: by 2002:a17:903:17c3:b0:295:275d:21d8 with SMTP id d9443c01a7336-29b6c0b7a66mr27378885ad.0.1763721392274;
        Fri, 21 Nov 2025 02:36:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzI2I3tYOltXt6IQ+cQ7O0lEpR29UhlkbO4Q4v1RIxYR2odAeCBqzRY1eNhIS9gX6eXHxi9A==
X-Received: by 2002:a17:903:17c3:b0:295:275d:21d8 with SMTP id d9443c01a7336-29b6c0b7a66mr27378655ad.0.1763721391829;
        Fri, 21 Nov 2025 02:36:31 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727be2fa7sm5122890a91.6.2025.11.21.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 02:36:31 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:06:05 +0530
Subject: [PATCH v2 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-enable-ufs-ice-clock-scaling-v2-2-66cb72998041@oss.qualcomm.com>
References: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
In-Reply-To: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: zBEktXC1q6X6XKdqVW7r1r79qRUb8Pol
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=692040b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lzHOrk3F_0XHYG_XrgYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: zBEktXC1q6X6XKdqVW7r1r79qRUb8Pol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4MSBTYWx0ZWRfXww5VihYmHCt/
 9g7kqFkEyeIC6Ct6JXr09u957Z03F4IJckA6CmhQWRyrxS3bncqLVdPLB2GOzNq1vV6RwuvnlEd
 xRh5Un9ekFi07DgM3rW1lpF9/llK+jV09+cca2AJ5xjlDEgMfcWIzuhLnWipj5HQkM2HFrJ/UCt
 Lr314ncf4tLg0iCTt8FhomuTRHKsvekIvYtJgXBkk4ODAlkOg5u59Bre1qT/ABklEYi8LprXsP5
 NNUAqEMWo1tCojR4rKLbAJEer9YEfK7yTrx8af0sJztv2J60NF5TTulu70+HWSQGeWCZCsjnyDn
 GQ5VDgzWBnhFZELj/v3y7lin9BxO5lbCINB5g4XzTHYedxlVMC8gV6/V7Jq8HmbrNGXUyF5HvIx
 zGpbiyRAFFiXWbfj/pChTWOY+kimAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210081

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cbdaa3297d2beabced0962a1a847d5..a60b60eb777a674fb4345fd393bde0eab3571a23 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,14 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, scale_up);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +347,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1646,6 +1659,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, scale_up);
 
 		if (err) {
 			ufshcd_uic_hibern8_exit(hba);

-- 
2.34.1


