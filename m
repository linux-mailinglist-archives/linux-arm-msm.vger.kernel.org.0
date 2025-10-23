Return-Path: <linux-arm-msm+bounces-78514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCDCC002A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 706374FC2A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E05A2D838A;
	Thu, 23 Oct 2025 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGS8CuAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A472FD1CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210889; cv=none; b=R8mXClzjQIpshY29rVEKK8/3qclh2YoK9B0M+IQRibNqspl9AS1RdyRPxlRZoB7rB3Wx93z2c+r8oQgQkpwNIok8fRv9l9eh1GzmEI0pJ0mLYZFmcIFZxkFm0msKloxHD7NPKqZ9dy/SIZybfnMtTfHSlG1M18FOkdFTAAFBCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210889; c=relaxed/simple;
	bh=p8ySBPeMhhgOjthdspe7wrGny1MNgnBjciz9CWlWZqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdTQI15zEd3jegPr0WcTAXkeUKxPTplIUpAe0/f2GKYaZJ+0Vh69yQGhZU5lPkpabgNOnpZ8jplLlyNeO3/5PJ7Yu3ScSpscZJ1xXm4t6+tHN0iFi4wHpESOCGP2ZF8cUxyAJFgRsNgx3qNLWqy0ROTe+X7d6sWFPeD25Pp7Gf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGS8CuAo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7UBeZ011813
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=; b=hGS8CuAo7fLi9wKK
	SXrMos5CUSsVLapIEvG1Rwe5kH7FNnE48OiBk6lR0gj0qD4ykwpHc5SZm0nPMUOC
	Ce4SxL097iIdKlo7ZpKNT0LswUIfsApTIkru5wc/ChwkqqudISz2WongRXNu8IkZ
	zib+oYjDRH188ysY2S+Okx3WD/qLlQXjtDWeedJOU4/aXxCaJ4btvmtvaPd2+7Zo
	X9M8Z+TZ0Ya/5z3E6XCdqXaGXUnQ9E93NwOPwgvCfKztYroo9LUe75jFtRoJ7Pdi
	8+JKD+x4zMQa4Lhz6zVGlSiMFh/BiVqSIkHOxGqBj7z5rmGZKaoYfmUEpn1Y2QxW
	DXI6HA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5249ydc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:14:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6cff817142so139375a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210886; x=1761815686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=;
        b=r9CI26MJhkGU9DIMPvMTg9AXqCy600TNb3eRUiKA74LpaZ7d6Pd4aSIBUyVu4FJ6ar
         mytbCK8EM/MgKum72eRCK7Wnr+/90AClvMQ8+HwvPiMbGBFvF7XmynvwXiF9aPcMXaTl
         wBHfTUHoXt+DNYyLdlkuxg1Qxyg8PBxCkkRGgQGJTfUQ772+QZ4c6Mm7ZZWpBWk+gK5X
         Rfyb1wcDpqtWPlVDwbeMYJwTV6TlEU/xF3dkX2zsMZXzhQMvPfhFNzXngl8ENJIrcRta
         R0QpQUti6LfcJOZBiib39BmL1/TS1Pr/JCzy8uNQ93aRUaxyrMiSRqGzHi6C3ck2Dnl1
         Ljvw==
X-Forwarded-Encrypted: i=1; AJvYcCXH9wCD4chX40XdY/3xWSKA3SxdYYVE7QRTqv/9PN13HgqNh+DrQdlG8vOxdS6aZwM3h3maghasDqR+vlOh@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHgtLWY8VrdwghWFRDanTZRTPWfmMRvl9cs5IhTC0APyTDK8B
	5umzZR2f7ndXjP0ESk+86iff3+OVmnp5UCVJXMpMu/k/gDmO4VLUTOFXgQdbX18T6EG4MID5Nvk
	j3ACQBfZJmAOXWFZNpsVt0Motr01OO7fKoyUBVMahP5OFWhPHVnZfxFW4Yv9hRRZDz/4y
X-Gm-Gg: ASbGncszWf1qvQ/v2cgwOI5pWHha+7tPIOhlc3OIIMfgVglRJbZydC+F9I8ImAnAk5k
	Heol+nBkRFsooC9ivoeQXaroMIQ38vD/ehDmxA60EPpGyeFfEQmvO4w9IrnTBBEkn+mHYKHsHtu
	PNYh9CBCK7pziN8f9L2r6DLZUkFZuxya7OQp27OhkrHGNceVFqRcJfyRN8ySHW4YhNSRK2Cnb3H
	Q9ydt18mgR/udCZ2cU2Ne1ljtEZrrRQemX9WgyfLAYr9bxRMCbGKWU7ayNfPBhT4hMS9KzP6U76
	9Wo7o/WJdmYBcEKn+MDaiAB72PPBs+mNGWZ6drmtTLM45gJlZAfJ0Mblz9G83pb1cBPRBq9qhCF
	+i+9pEgknXCb/VUsoPaMhtfC4jVHKXS0E6bbcptWV6PC74iCAli3SJA==
X-Received: by 2002:a17:903:2348:b0:290:c0d7:237d with SMTP id d9443c01a7336-2946e0ec1bamr20297225ad.36.1761210886105;
        Thu, 23 Oct 2025 02:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYmSv4dzjKvhhMBl2sFcfxbzFtb5/wLQ0uyVcJuavpj67hpqEsvJuFLylB5+oHXs3MbJxkBw==
X-Received: by 2002:a17:903:2348:b0:290:c0d7:237d with SMTP id d9443c01a7336-2946e0ec1bamr20296985ad.36.1761210885654;
        Thu, 23 Oct 2025 02:14:45 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e318a2sm1490081a12.33.2025.10.23.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:14:45 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:14:35 -0700
Subject: [PATCH v3 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-add-support-for-camss-on-kaanapali-v3-3-02abc9a107bf@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXyPVC134w1wmJ
 N+9+oAGXOEkzDsMknZWSrRPlwvkP5gHSpC97H/tfNXgS3xBAZTLshQ1VGPg2QKpE+ECS0HWQGr8
 R/9ocLwiafaz7KMjsXePlFUguTZV/5DmLQFG1HqYtThE3cP4nukyZ80SwOn4uVYl1Yc4INJIv8/
 E83mUHMWK163LA4px4/lxHsD9pOGvckE8ZOPy448Yiejrh+M9J49PwL9WVWvmZAi8uNoC048Z8g
 1ap1vyIH0/fG9tQwfDnbhIfe9f/eSXJ2a+lJ8GfkZeqIfvMyDZm1y18cD0Z1ZllMtqbyl71QaTn
 417MHT48xTy4ksWNm3E8n5sjk78kbu/51pPoN7CABkSaYxwfPtkeaN34mGNIrR2mWjou/ng8WRh
 emyoG+MVLczh5D13aS6WgM5HjK9n0g==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9f207 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: rBMal9QChjuYLZSPrjpdfjQMzK436P_-
X-Proofpoint-ORIG-GUID: rBMal9QChjuYLZSPrjpdfjQMzK436P_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

Add support for kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..658d9c9183d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 901f84efaf7d..876cd2a64cbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -90,6 +90,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


