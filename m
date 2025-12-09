Return-Path: <linux-arm-msm+bounces-84726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296DCAEEF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 06:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B19F0303EBBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 05:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285A72397AA;
	Tue,  9 Dec 2025 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBv4z3C9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvU4kXdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7650A23BD06
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 05:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765257817; cv=none; b=tL8tno2NEhXo2EfgiNgT+EY/3sI/SfbvTPOBWfRxNSgRo3HfhTzy+BxaxLCvuNDeyLe02+LewHXjXCJsttHN8NlmWIIw1/I3QWcDNx6E6meOJ4FcnsseX01faYq31SUnXYXbvGd+93tgUOsXSfHQbcD8PWzTv6chUMYk9mZYVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765257817; c=relaxed/simple;
	bh=dZS6zhd6+GkbbUazMraqft39XgxKGwbsJuLJFD07Ylc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tbqfk4EbgA7DEUB7QbTbvrj182RCjS9URxoMGxviJ6RLEUHhGq1jC9d9XN8SEq1+ZcU6wg56Gy6PDgrb56n3EFB+7QUV4y2xrKKwG62aNxIF1upi/FNrQEksSFcMo+Ct4aK0l6ReTD7ieqaTH7xyENpGdn+b1wGvY4X02qLsO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBv4z3C9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvU4kXdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B91IrsL2442209
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 05:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4K
	FhHzzqao=; b=PBv4z3C9yVF8IR3u+hm60r+T8nbVH/cPuOYfacCauoRDefc9Dsr
	p9BgtAxTHMkQqxrPeR4ZgeSUD/QGdXllS+N15dZYV5xBgkwCq4lvNXnqawoqeUAp
	a1/zq8lmha9EfBHxt/0+on446WBB0J9aKPNRYPdlDLTSFjZQbcPhfwW2DLNi/Tnd
	sOEVG2gC/BswLZinYCZyk509DpmHFbgFJmPlu4UCuwZSbl4xclI4qqYK5lKva/b5
	AFu2oWRWNwV5SaDurG4J/9wFpajMGX2o9VsRYcpAHIaRGFMXhLzd31y0sM73uQOa
	/rTSvwe27o9DUzgCJbgcUsOmIHPBw5/IAuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axa0brkdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 05:23:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343daf0f488so5249642a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 21:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765257813; x=1765862613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4KFhHzzqao=;
        b=gvU4kXdXIO/pPpTMKJ8svp59rW5Eda8wefWnXj/hv0QCPemlQO5IfEOJ9VQ7iKvDW8
         xSKR60Q4DS/fn/Y9h28NG3uUwwiEGqZtxJKgesvF5D5MCLXzvf+zcsGDMOI8RFXx4CY1
         ty3sk0KPEfdAmoxbN4PtuPEWOjr5J4AkKJKUjAWX2grLqL2bBkbTCuXaTOWgzHsjcrdZ
         DLjkRweILyrnRC67AdYZJDQW4NJ1dWeZd6zGJw8b3X74ohyXTie3xL2j5V733zqetFHw
         Ebk9zdLS3p+b6HIDOIGK3FilnnA5xwJ28rWAl1ISwJioON3bB/kgEMNPA7vgPgppfkqt
         DWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765257813; x=1765862613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4KFhHzzqao=;
        b=Ngf1c7iXgfs3Yl7Sbp4F0M1OIpMS70KNbm8EJex/FZVQRCx07VrcgmhJPavuSE26Of
         UDF27Q7p30d8eJQTHYtr92Qv4d021UGza7ZvJSqLHBuzX5srWIOndjMMJt/PKxBUXF+F
         PcBEYtRT0VTZ3eN9Ef5wh7VP0tCh1XpW9L8xHRA/BSmzPBlz4q1iiMZx5mQSo6tnsJHR
         XgRt3ZcsplLm8hCZw1BOUXa+uqEPvy26gThlEDZIPfg0lmxF+wNxlimdMeApIlt5Iapi
         Df5axcuxfJz0KSb5wpZ02v+lT88Dp21RO4EnDgq5kvcq4Xefl7tU2qezs8KVPT8+aVHJ
         s2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUWiX24XWeHtMjKyBOW4X3SoRfgRz5NBPLpP85mvpHARmpjajaVFEzl8lrLiaLARUrbgm3Rzv0U3Fx3clQM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8DEMkN6Z25aos66v6hIvT0tHjfsm98K/2ZhCH2Am99L1/vvUN
	2RzA+nAzSkDYyeWkobAGm+e0mQMcfbopVTMfTIDsQE2nnP4WOWNLODvW/HWCpPEkiTX94chUl4S
	AZRZQsYqamRGL3zJii/X81qToUebVpUF6hnsVd+xW3xrx/PQQDnk30Fj7cr0kvBh0xhnMolODMc
	V6
X-Gm-Gg: ASbGncuKyOAtvq2cfsmmvKBgXLbsEnkIdSroZL+dDJq4LkCjUFgyfZSJIEt7gcelkh5
	wg+VcGyLrboiXX5RGX+wHpqxErYcmnaxqwXuI3zY4Bi5N49sQwNFnzpTPdt0cVUSbBXHdJEhUcm
	ClT5rYvYXRsoXOV653Zy2N83I6//LwVEYZNtOMM0XI6cdi7uJmR+QCKL3nMlFWB+Yv1E3mKTmc0
	a8cN/Z9yvIzseo03/9rs2awvA65BZUTvyOyiFgYeIQcjSivT2xOFHVlQGLnNXywo61g/DhYj2qg
	e3mUFTdDo8fPGRJ6PkvIMDjiHgwc+Dy2CAtLYtOzd64NuepFpGCpBqc02iWqoGry+vf7OSLuvsJ
	/rBefi5CnAD9BWEW7TV5VVPqGJBnr+WWnV4gaBn5j
X-Received: by 2002:a05:6a21:338f:b0:33e:84f7:94f9 with SMTP id adf61e73a8af0-36617e36987mr8467036637.9.1765257812927;
        Mon, 08 Dec 2025 21:23:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG12qBZJHj72pTnfDyARxsCCIVd1WYnNqLKhxyYwxqdUyBBqLzkbHg8OuzNL/sOcMsTqbi/eQ==
X-Received: by 2002:a05:6a21:338f:b0:33e:84f7:94f9 with SMTP id adf61e73a8af0-36617e36987mr8467023637.9.1765257812372;
        Mon, 08 Dec 2025 21:23:32 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a29sm13689924a12.3.2025.12.08.21.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:23:32 -0800 (PST)
From: bibek.patro@oss.qualcomm.com
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on Qualcomm platforms
Date: Tue,  9 Dec 2025 10:53:23 +0530
Message-Id: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAzOSBTYWx0ZWRfX5nBn/+YQWiTP
 sAY/4vLEsTaIlIJzH9QhqrghJgNhX+WumYjsW8cliqy9YrkofuU1r7e+Wvj9iV09c2wn4AcaBbg
 WxVAeK6Win6QGufvxhpdUv8LzR5wCpb26h6pSDzLRx89doUyA+f+1Xt1w56g2cCBtqWU+RLedqK
 TVTAoSfTtPv/sJG0tjC3eRazMiDOO54SEGNV8MeymEdbtSqlTlg95ynZgMDiEoSh10XTVm2uj/S
 AFK4CF80yKwTbtJJk0erSR9fQLoGtQNQSBi8HrY5R3997lZaeu4h+o/WnCTOp0mcGXA4dUFAAU7
 ZqfhJTY3nAQGYDaStsowAaiDt2FeFB00k1kxtqrflewjggkXyjwqWnVLWxWuk6ng1zgsf2k6Mhl
 5MgH7AA4NWFGypgrA3dkZPwXVsdkUA==
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=6937b256 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nhz1Ti08P7End7UVPfYA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NYcZUkhE0eC-98CbryNycQiFuoZ05Kg6
X-Proofpoint-ORIG-GUID: NYcZUkhE0eC-98CbryNycQiFuoZ05Kg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090039

From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Add ACTLR settings for missing MDSS devices on Qualcomm platforms.

These are QoS settings and are specific to per SoC thus different
settings, eg: some have shallow prefetch while others have no
prefetch.

Aswell, this prefetch feature is not implemented for all the
platforms, capturing to those are implemented to the best of my
knowledge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Changes from V4:
 1) Change subject prefix to "iommu/arm-smmu-qcom:"
 based on the changes. -- Bjorn
https://lore.kernel.org/all/20251202125447.2102658-1-charan.kalla@oss.qualcomm.com/

Changes from V3:
 1) Add actlr setting for missing sc8180x & sm6115.
 2) Improved commit message.
https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/

Changes from V2:
 1) Add actlr settings for all the mdss devices on Qualcomm platforms.
 2) Improved the commit message that explain why different ACTLR
    settings
https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t

Changes from V1:
  1) Added actlr setting only for MDSS and dropped for fastrpc. --
konrad
  2) ACTLR table is updated per alphanumeric order -- konrad 
  https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 57c097e87613..c6645df97bbc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,qcm2290-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8180x-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8280xp-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6115-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6125-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8150-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8250-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8450-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sm8550-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8650-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8750-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,x1e80100-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ }
 };
 
-- 
2.34.1


