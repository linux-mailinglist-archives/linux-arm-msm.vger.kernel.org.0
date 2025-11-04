Return-Path: <linux-arm-msm+bounces-80307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B0C3125D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 14:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D1374F57A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 13:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918C52F4A0E;
	Tue,  4 Nov 2025 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asFRzB4l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BM/v5PAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447012F83AC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261770; cv=none; b=knXvZEyBOeCdgELHx/R8ROfI9mJWPF78FxXYIJk76NFXqzw+jfaOt5nc7W3G1Mkec5jHB6xQLvt3/wTUIZxjFoyuvwsVaT2pPNSg7GLBNhPU+s3LVEoYbsu2hwR7v7Pswf/nFC1+E2hxXhMLHtyEE/gjeGqSsBJicKfTyFM6zwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261770; c=relaxed/simple;
	bh=hBXdul3tZxW+UflTZF7a9/uEf7GXrBBqnjbNYy4v6ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k20oL6RZ7svhlP9+WQn4XbgPwmAApoo5tATbIRc1MTZFfGQjLKzuQ1nn6WEe15Lz8DAjrTJuo7/Hf4EIHpv3Psrg3sqv55f8DZIrQ+0zm+C+n41TofFnihqO90STGLRR2sxBDeWimuVCmMp5jTFc0XkUmPbhT5JkOvz40eq2CJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asFRzB4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BM/v5PAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Cft441912085
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 13:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kS50UD6Sue9
	tYO27zvEv2Eatvnw8kndPVKBjjqjKB6A=; b=asFRzB4lqBCczjjerNma5etna4p
	nT/jwVcPqjWcASQ5+qEU/PF4tkVh1m7yNcovCsqUzcozbfULAWhgXR3Eu+w/oFs8
	VwzS3pVyphSv1vVkC8vDwfphV4jQM/EnbmBtt29PP7L3bXenOLGCtgdHpsLh1K7A
	1fD1gF2W0P88Yofxet0mtgeWL4pAfzttPtDUuUbV1CqpfD+CAxw+/8QQo+Vjylag
	ropRyyPqHMn+BJ24RwwQF6nzW5y8NhuyniPv69bDDw/GFIqHN8P3xgd95YGtKPkY
	4R4bDsjM2Ehcl5ux+mniYMoKZLkklsw+I0jG0ybhxe/FXQBLdEB+eY38qwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exjymu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 13:09:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29598910dd2so54695765ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762261767; x=1762866567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS50UD6Sue9tYO27zvEv2Eatvnw8kndPVKBjjqjKB6A=;
        b=BM/v5PAn6YZ672THEDh8olg2KcthycJGpfrd7nj7nf/dFMAQOvT4ihGN//UIQEEwwn
         UJDZ6NKkYBLCcgS1Tvui5MH2XBRmVFs9pekRYgbuWRDLZZ8uoNxSSiD/J6sS1EaKE/mJ
         J15WPZFcQ4yHXL8hGkD4wYMQyivYnGe9B7LEpXQ+cAPfSaAQHJAiMAr53Ci7IiqK8s04
         tiDiA2gHLBGOFCXp8dmahtlqT0srIrRofih757aD3/koR426s5IVQMrvCvOCydK5cJGK
         l6kYwvUCXyY21EFaISjDFttSHQO94QyecKmboen9fTppMzU5M9WHwZ9e3y097XUkFT8c
         R4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261767; x=1762866567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS50UD6Sue9tYO27zvEv2Eatvnw8kndPVKBjjqjKB6A=;
        b=AYrbL61Ai5XNekL8hkYQDJLEWuJvC3TH57ns1cCM39bjo++k6scGjLBGXEdxjRtygY
         0g8YTtO02Ykt+E300nSIZoDLB31kshv2eoT2JoYxBKTYIqk13qyh73lvnUMv5N5VOl04
         P9s26WrWEjG7G2uhQwCfiVnNYXTeh+LcxTFRNgmaL3aXVi19Os2o1diTYzVxb91KDzAh
         W0acNKM7QjuAxHdQgS1swv+6J+W3cqfyAFU6mVE9SqsQrxDcqeWaWChGBynG05yxqD9v
         3TkLIe2Mv9trLVsQMjHRjEybdgryC3X2z9nkLM9860uN3k9EdwhmQCPWiLxCwjOThC38
         Keng==
X-Gm-Message-State: AOJu0YxbS237miV7SVef6emNK3o540SmIQFfpyQero3QgrwuZcgN9eLw
	9BIncnrroXx0QTCcPJ9bZn+FbCMbKL0TNDOxf1rc8/Br4ScCnVmHYisWkpXntHKYRvjEbuAdXc4
	Ju/Wj2D3p7D0J1nMbuV3jlZj9pYQ6udCzCUd9IxfQ6JkhuHUT60mbQQQYsqwl7Jzw/IAJ
X-Gm-Gg: ASbGncuBOGdgEFG3PrJE2w9DN7f+PfQ8j9Z9mqZ7hkPiBaorQ92lxpR9uaBmHf7Qs5N
	doXV8P98B3wwnXqtajyv0E/WfBZxwEfQbhETwOpQxCE8VPLA/VKTDPANMy2qrlt0jLfpRNQfZ1L
	4Sa+yvfbkxM09UmOMzJtA+jS8Cp6M09eYZn2wK87pPiOGUiA9bBJjYk/hTPLkid74aN6kXx8JLH
	SHk6a08ieuPSpIGb/T9Sj7ao2QSIzsJuBUtkN8wrbI6q2MmvtkEfP3IxWb2pPHW9P5rID1eP/CA
	YKt9ThZ9AlBmr7fN0QQoaoOkwTtgagSEn8oUPHqK9vzZ52NcUsODItCWslSF0owbpjLyIMR8Yk8
	Bn4b1PAxbcn4WoPv4WwTYHmn/uQ==
X-Received: by 2002:a17:902:ce01:b0:295:6c9d:1905 with SMTP id d9443c01a7336-2956c9d1b4dmr136218785ad.18.1762261767302;
        Tue, 04 Nov 2025 05:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExhsgU9nC+Hq4bQOucw237rkyN7rqKgYdPY0GVx/nL6Ylr2tteGOJuuk8u74ulHg02MbKKzQ==
X-Received: by 2002:a17:902:ce01:b0:295:6c9d:1905 with SMTP id d9443c01a7336-2956c9d1b4dmr136218165ad.18.1762261766473;
        Tue, 04 Nov 2025 05:09:26 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998c3esm27105855ad.41.2025.11.04.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:26 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 2/2] soc: qcom: socinfo: Add reserve field to support future extension
Date: Tue,  4 Nov 2025 18:39:06 +0530
Message-ID: <20251104130906.167666-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251104130906.167666-1-mukesh.ojha@oss.qualcomm.com>
References: <20251104130906.167666-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=6909fb08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-2KMb3mI12hdAPWKM-cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: q3crsoqK9YFGU83mGiszdeWzionSNwFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwOSBTYWx0ZWRfX8lthRZah/sff
 yKc83UoIyQUMKFBOr7tdiS7U0odYc8ykc5prDXeWVw+qrIBFNyZJNhqPbDlqhWbKOe4ShOHzTYA
 FJXGfFbqFpclHhiFORKmWvGaU1q9m1hhVsbMXw0kc+VGhXrYuWtOfnv9mYPTfMWvUJ2PUvARpM7
 MfBR7VHPJ7L0j78TSG9PSOU/cN34lmrFydAsUPCMsS1gWOGyVNp4OTkbjA2ZcEnYSXK/hRHFjl4
 mGJfCkFcrW95wESyB+z3aiIIVgPKNMz0a2PCjQSFpMUlOLvQy7B90MDbwVk6Xx8yTzCJ8Z6pNN7
 0KvhSFfuU77cxrBadogYNijZRoJhpBcP7Kz7dXJ7QDFAZftCMQxCGCn17JOByr6/JxjzB/iTRV6
 3hIZsh8V637t8G7guKOOqbIHT3E9aQ==
X-Proofpoint-ORIG-GUID: q3crsoqK9YFGU83mGiszdeWzionSNwFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040109

Some of the new field added to socinfo structure with version 21, 22
and 23 which is only used by boot firmware and it is of no use for
Linux.Add reserve field in socinfo so that the structure remain
updated and prepared if we get any new field in future which could
be used by Linux. While at it, also updates switch case for backward
compatibility if the SoC runs with boot firmware which has these
new version added.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v4:
- This is new change combining multiple soc-info field
  update with reserve field introduction.


 drivers/soc/qcom/socinfo.c       | 3 +++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 77d0b8062208..c5352e1fead2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -657,6 +657,9 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 23):
+	case SOCINFO_VERSION(0, 22):
+	case SOCINFO_VERSION(0, 21):
 	case SOCINFO_VERSION(0, 20):
 		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
 		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index c4dae173cc30..ba823a0013c5 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -84,6 +84,8 @@ struct socinfo {
 	__le32 boot_core;
 	/* Version 20 */
 	__le32 raw_package_type;
+	/* Version 21, 22, 23 */
+	__le32 reserve1[4];
 };
 
 /* Internal feature codes */
-- 
2.50.1


