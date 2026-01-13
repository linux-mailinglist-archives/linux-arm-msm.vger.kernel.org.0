Return-Path: <linux-arm-msm+bounces-88748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3DD18053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D51B3013D52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108EB38BDC2;
	Tue, 13 Jan 2026 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eR8FhjAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsWWT0sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C838B9B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300116; cv=none; b=J0TPr71y1u+6m9HUw96iSfmHSCB4AeHHZHC1lUqxOgMC4TLHPuCJOp+Y68kBlmTjbR9VJEvL76Zf2G/tpmMC8cqieKTOUmacQs7hVVFGJvDn6r8Jzx8ey0KXO9B6PyfHQYOxuBAj/SGkJqrqek/xSFwUfCx0XnsszMmIT3KhOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300116; c=relaxed/simple;
	bh=wvW9hw/aHeeOiWoGi2yJoeb6xxjCzaCUPzx8qYpTgL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnBnJ3S6PWDfdjxnx2QOax2P1LWyvAYJ5NYISCkPOKNsIIaV9tl9/QVLDYM+n5OwLnfWDFG6J17aOQoWWQxhnEMMwFGQVaYoTNTzXfUK+sM6Opnm+SqS/X8iwtCKSQhrdGANB5H+QHK/Qr/q3+a6FDfO8kZyk8Ise8nkWVoBsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eR8FhjAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsWWT0sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7mYgK3300068
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djk/VNd2QSyawjye+VcPas7C71Gc44XxqkCzjL+Ykt4=; b=eR8FhjAM/IcM9VwQ
	3OEWbPVDmdTQQTUCJCSvoLXVSckJCNQJZwwo4MN+WS+C8yUgD0FDe0l+C8Ic23D1
	+o2JVvZOCpAwfyfVpCrup3CdiL30nZ8JVXo3pZYaVo8RSm2dpCmLvgQ7bHheIZG1
	Z+r+jSlD6RGT8G5frkEUg+KUMRW8eXcGsLYzItK/nJUGcIH0g7XKTWjejpWxq3QC
	ov48TH17MAwsncnpHQu2aPPUC+XwMGBLPrY3Fb8NPVjrM+VwkAUSI6RDj2V24+XI
	3GT5QEjzIoSDX84RV+/KTG1RJdg63GB9Bb6eEAAhLhHBawOidSGU3auSP7VeOVdw
	9y8gvQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmacy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11f3d181ef2so41793082c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300112; x=1768904912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djk/VNd2QSyawjye+VcPas7C71Gc44XxqkCzjL+Ykt4=;
        b=NsWWT0smbfMrqWEf7jRC/bXr85xpp4q5E42iCibia/drqHJyog649klRRZX/l+rQo1
         ecygXSyORtMh2vf5gEB7jCWaZVQsk0Z7qkC1WdLY4yCA+3xmi/TiGAM407fPC9udF7io
         v/aXptUB1IEeR4roK0dyh0B+4OAkhEOXi81ujc/dWEU0qOtVICCMCBusYvfz4DIztX/x
         vcfz3yTXeSatORKTNlBtXnOv6juuqelJTvk7Z68zihLoF/ZbCG6yaV0lRqd9ugyBBKAx
         MbDtDoeyJh9zbyf9Qq58It9L0+heLVMaEsZlDTkRy6E3E+xILfWi9JvBliuk40crou6r
         Y2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300112; x=1768904912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djk/VNd2QSyawjye+VcPas7C71Gc44XxqkCzjL+Ykt4=;
        b=G9ctny59Gm/xF9LJ1cLz40kG2P5o4nB83+Hn6StpVQ1un9QmktkjRegV4nuVEJ5iWX
         277hkfllpOl3Z4GpdUg1kmZWdXhbF83CIrb/KbC1ltvNcJL6+toiaWry+cFxcY4th0JN
         kIw4tc4nYUhafq+fHUGXkTmoo/quR0Ar1xVBVY78HBfCPjx/Xl4NSa36nINsY6LHS4fN
         RNj2Q8DNui9kfnK/WF/KsCQmd8waFx2DavjFu/1A0UOHsRZTE5wS8OAkqlm7itT/JXrv
         4Lr6BYROG1MVGsGNHxXJa09BR+WND1Bb0j6eyr4xgw/Qj3r2wdf/dJxbxTCS6k9UKVvb
         twyA==
X-Gm-Message-State: AOJu0YyTLTrI8iv9KqhjN5ra63pUnQdEhzTKluJ7XYGzSegCcZf4XiKM
	VbsRrk3DTN0HtzChDLHI+lnVfkqb5+HegxqBVWFvSc9QisWg+ikQHoO6GZ/eWbwC26Nv0T7sfY/
	p9PdIv7J8aTSc3tZjeRoQHcpsuKAG3Gnjb5p7t45nYpE0f/MtXCFxVI/f8ClqcLRhlAGw
X-Gm-Gg: AY/fxX67Tr1Ve8+ElF6gO3hDiCr53de9jEGXDDDDp2N/UOvh6k8Fkb9aMGBT/PwZ+5E
	eW+OOStO3f+hbgvJt5S/bquZBIAoWZL8N7lh25VOJWIEzmh764d2PqHFsOBGEPNnGaNUddc28b5
	bflCxWClA5296HIyyVWTDqUPmmsjbd5eePkUm/GNOfCmMWCqm4UySTDPrr6QarEHxhg2zV2Gv3x
	ucnF8KWpVcYcxT/TDJ5t2e3uJo9eS9nlA44w1nt5FwEf7T7yH8IKY8E/kX+YM2AQxObUyA1pcOR
	0B6HlYiwi7H9eBPpvmtL1MeRjzDTyV3d9r2CGDchv+LOKRWJxU0FNIYvm36YyiM8Fam6vg1otxW
	aAWdlUp2ZCzz0zJvstPqsGbfgv2KkY7yqojIWxts76hmA67CotjPecbEj+ioz/0VR
X-Received: by 2002:a05:7022:23a8:b0:119:e569:f258 with SMTP id a92af1059eb24-121f8abb2c3mr21786585c88.1.1768300112172;
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL5DuQsGhc6OFtFJIsMVvV9xMJhRqjudlKRzvjjERuNRlLaKuDKYzPrQ8XWrzZuOarZWNQwA==
X-Received: by 2002:a05:7022:23a8:b0:119:e569:f258 with SMTP id a92af1059eb24-121f8abb2c3mr21786539c88.1.1768300111621;
        Tue, 13 Jan 2026 02:28:31 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:31 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 02:28:28 -0800
Subject: [PATCH v2 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
In-Reply-To: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ClXZ3gDkAyArj3qeXEm6P3ZmBBFzioAw
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69661e51 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: ClXZ3gDkAyArj3qeXEm6P3ZmBBFzioAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX7PBFTFQubYVj
 H5Zw0YufhCaTVwOM7EJYW59PBDmpvSUYgmiLEnq93YSbzneCrPWLH4Zj73FrQoU7XFR0LJIju6I
 9h+PK6WITO73ivEqui7XE7DXstPFQnhBAm+YWWDJ1AyQgWm2+IhcU0XqtTWQ0MJzcWLb2S6hBE/
 /UAMcfv9aY+s6Z3K6VMJuwsAyhBtZElR8PHgEdDQOFJ3P/gTkIN8OuWGOCPw4576onT7YAh3E03
 O++lK/wxlBHe0NLNmm9vMiabx8ySj1GyeF7u7cnPCycdMFnRR0YV8J8B46WnXUCWvQusONVYuhb
 xWhEemQSTFXcFaBR6cPJA0DDRodIteM2sB2Lf6daXkAzrJ/ca0S0d59g0s6CMEfF3Gbs8Rzw7vi
 o7DrgOznSk7E9E3SIUgEINENzIkDT006XkAXie8qPkkIefGpw5Pno9opKizw9qfVT9GmyhPnpTD
 mdRYVjsCs/UmUgWNtag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36ff645d9c1e..56f20daeca3e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4066,6 +4066,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "cam_hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5487,6 +5501,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5518,6 +5539,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 616ed7bbb732..2a53524dec93 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -91,6 +91,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


