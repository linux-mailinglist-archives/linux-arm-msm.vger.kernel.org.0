Return-Path: <linux-arm-msm+bounces-88468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928BD11187
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C69230DCA94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5910340D84;
	Mon, 12 Jan 2026 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIsdSVsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQE3OROl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177333D6C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205129; cv=none; b=kHYDo/Kk6ip5DWJ4inVZi1pvM6scn3zmiY2z1MZCRwNRCQqW8lkV/9kL3n0V0i94WLjBNJlSxCNGEIvfqyZ5os4iquBk9Lq+napKLOF4Iuj08SB9YLP/ACIR1olqnlU57mpDZ+14y7tjypNEEWWIrwGkHFd4g7EpQEpgmlIPDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205129; c=relaxed/simple;
	bh=0HY3j8VyiOo90CJ0WdpXeVadyvjMnLt5hM1dxLbc518=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRBr6i5kCiZtYbwgvPk6V7MLM2esEVxDH22e3d3MxHLzkz2+T2YbW7BVqOysoI5PU31tGlB4Pu9s8fGyfn8wLddJj31Nc/J4YO2S5jbGff0KbIfS+dU2+mQpsGUlnw/wIvvmcmyb1Unucax+f84A+mXUjiyXbIyXm30vulEa+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIsdSVsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQE3OROl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7OfVs555266
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DByUtmX13xuVhwTkLusrwQkpe9dxbVPzDNA8VUb08M8=; b=fIsdSVsIlki8AfFg
	B1k+pkQwwkmUz02kGwBXKSqaZr/2OxyRFG79d/i4Fb+XfGZPr3csyoNZoF/W+gYW
	8EzUvNZcDQZ4CFQ7qqYFufcknxDdoZxQdYZP1CXDRQm4xd8nnq2CVBrQqJNXG7Zx
	nombwiOuqGhsaaz650OsqZjB2Z52TUgMkXEJy5fN2LwAryz9bnHP16uOsZb76hrd
	9X1d6PBQH8IOsgTHLqkXcsTkthLcjHpkAs4hgvv9Bysdvej0j15kRcvoFTsOc0FY
	+PcUTSzv+obQagNorPhHP68eBbpahIWdbQGM8pT9Xf7qnuqA4Wok4dZ8u6cGVIYe
	MOsngw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw05am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:05:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88233d526baso208113266d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205126; x=1768809926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DByUtmX13xuVhwTkLusrwQkpe9dxbVPzDNA8VUb08M8=;
        b=RQE3OROlfbYToaWAkvtBhn4c+X8alEiVy4Q2mTJfZPOhX9Vv25PHYp3afz4PcsCv26
         /SM1UrFOgXFTgZ6MN0hvTxZZ0KjJ1ToGwdps1JzbqRipXW0kzuSy7klF2KWobQxK2c1U
         PWZHj5I2f89fInA+bCIXjT/BSivAffoMj8yiBfIChryIxa9LYoSYZsTsh9AoDDDwS5b9
         6RSTMx08e8M2vz4NECPIny+zgaJGSwYSrYhJUVMloOCunZn7ei9exeYIX2/2T7Ds91Ap
         v2Os9qspe1ySd9UHHyRmqcpH65mnm1+cpgz9SWM5T5aFi6CxbqcSxAfHQfVio0ANwdb8
         TI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205126; x=1768809926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DByUtmX13xuVhwTkLusrwQkpe9dxbVPzDNA8VUb08M8=;
        b=iclOr71TzSvgMF/nIAN30BAMjTjcMgjlOx9O5gvznNkgTt6mygdMg59uPcCSbTNpiW
         Og64QUDhBdbSeMipnfd4cY4nqqeV0OEHECqNe6icOSO4yEOO6P1AA7DVZGDUD25nMDWg
         PVnqrYweAk9Ayrv0PLzJYzODyAqI1Loq1/qPVsVjvd7MMgBht1NhVMJgS9OI/u0ohLLL
         T0nvaR2OLkprKwESR2jpxMgK9HRPm1Nr3mx3J3jPnQpeQ8ePs2ijktBp4JTU71KuHles
         LaWDl48ppvJpa51Isi25tN33zEQ7JE4cwQZ0xYbm/agc1PmgVnYQZIk3Q/JYqmWLUgi4
         aIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxCVQR5TGZ/sZLDgbJ3zO6YDY1+opRDLEY2aMqGXIMyPuAQz4ZLrNvhRo7sQoKsVOUV4AlC05GAlcwcylL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7mc+LlBfhcGjxO3+HZR4Hw3TiCSzM2SV3e6wPPfdI+kHyYaax
	6p/foMewCIF1QM/lusO0ZI7j6xFoErEma6TbWloXjxXPjFbvqC+4hHv/LhS78ZUS1M0Sy8a5dtg
	lPrCjwic0+aeiSO2P/jDsqrau0+2x/dCEofijypl/QVnVsvh2DsSWfhFLagisGeHhO9ak
X-Gm-Gg: AY/fxX4S1/S+H54xSfIo7zxLe+MAnxEvFlHy63H7nFOhcT64iK+FgsKYt+TZh7MX5J2
	KDqq1/py+tFb64b60UTUaPOGPCqp2jjoyHT4F/LfhRtoSjsoKec2KvmOyEvw9+YhC4AkoKvtAg4
	6I/jVtKQzLdXDPk1AtNRKG5w94rxs4coE+VyeONHYrISDoup4iX8vtT1LpnIPjfrHka2xkSrcq7
	v3FOZL90kkY8tWejQiUDBK6cA+gATDdzqUeBkaM80Xu7Fc1YQCt+1aCmeQ7TMxAVJlQ8LX9cWxd
	TQRDonuQiiki/k6f9e13HDJoj6zHnpK9YYQcqXGXj7nROJHD/8kH2HCibI7Zhe0iYvU0sfS8aEP
	hmcd0PQ2A3hlXKB4mbrMGjgtkxomKA8NKJiAI2LL80oBMqgI85sP6pK8FmO10QFtSKreBgTU8v1
	nc
X-Received: by 2002:a05:6214:5f0f:b0:882:3b63:f7f5 with SMTP id 6a1803df08f44-8908424f0d2mr244023656d6.41.1768205125722;
        Mon, 12 Jan 2026 00:05:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEH/7G0TiYOAwA3UZK0b7exOkdx44wKlumcJYNJf3cEKtzChYeCEb+Czl2sgfOlL7+w6lawIw==
X-Received: by 2002:a05:6214:5f0f:b0:882:3b63:f7f5 with SMTP id 6a1803df08f44-8908424f0d2mr244023406d6.41.1768205125311;
        Mon, 12 Jan 2026 00:05:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm123116201cf.6.2026.01.12.00.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:05:24 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:04:53 +0800
Subject: [PATCH v4 2/3] media: qcom: camss: add support for SM6150 camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-sm6150-camss-v4-2-0cd576d627f7@oss.qualcomm.com>
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
In-Reply-To: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768205107; l=9099;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=0HY3j8VyiOo90CJ0WdpXeVadyvjMnLt5hM1dxLbc518=;
 b=8sDWWelcYsl/hyoyw1SAQwLfP2EXW+vA96QlS0MuIiC6ZbVcuzZ/gPQNDEV26cdd3zyrkrVcs
 dcylF1gF2pWCZdITtaQvrgHANIcm16I48sdQTpfwwTFkFGXlYNko76l
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MiBTYWx0ZWRfXyd9Dc4AA+90C
 YrGub6SZiuvkz7Rttthvk4nR31Dt+To56+4SG5WYQ5k82QMYC73ZBt4COhSN5y1RhURf1d48jA6
 +Rjbl1lxXQ9BiQuSeRGGkOy57Tr/Y0iikfuF3q4VhTHW7uJB0h+EQNFl1utnN4p0UohNX5QSWsN
 sConFlP34BUjNja5TAZ3VEMxc69mgneldHlI/p+2J3dKE0rLuaJLhezCUlGPxP1et9H7PUuis9f
 SRWC3SS6eaYNVLe9wRG7Kpa7nJ/66mjqOvqcX6DfSpYbBWIfyozfHMmULflPZR6BEpI8yqd/PkQ
 pORoX48GQfu4NH09h7kXArc+yhFS6Qu8GgHsCY8pZdb8kreTPoUiX4dK4dG876OJ3V3H1smZLh/
 S/P+rdRiARJvm20KRQGVRem10OCFDCNogTmaWIoPbSRqmq7y/yrf515Pe7LfzWaUFOMFiJWZPqT
 kGYaBqPoHSKpegSY9Ow==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964ab46 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OCzWwVoLxjedvhaVoqAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SMK3e6t7oaF_67cXLXS0CvB5ldCC5j6l
X-Proofpoint-ORIG-GUID: SMK3e6t7oaF_67cXLXS0CvB5ldCC5j6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120062

The camera subsystem for SM6150 which is based on Spectra 230.

For SM6150:
- VFE and CSID version: 170 (vfe170, csid170)
- CSIPHY version: csiphy-v2.0.1 (14nm)

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 198 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 203 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 619abbf6078130bb6f036eac3ab369cdf4841054..0bd9e1f0cd82347dc6b9d11b2d3179e4c95aa287 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1004,6 +1004,7 @@ static bool csiphy_is_gen2(u32 version)
 
 	switch (version) {
 	case CAMSS_2290:
+	case CAMSS_6150:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1093,6 +1094,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
 	case CAMSS_2290:
+	case CAMSS_6150:
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9c7ad8aa405888ccea283ffd5cb038fc5bc4ee79..5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		break;
 	case CAMSS_660:
 	case CAMSS_2290:
+	case CAMSS_6150:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -2001,6 +2002,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_6150:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6cfb71fcd861c7930f0f4cb952a017e30aa3e396..e15d3b7cbdb40ca2dd8e7421bc4f3bb9f05b802d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1519,6 +1519,190 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_sm6150[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 269333333 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 269333333 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 269333333 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_sm6150[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_cphy_rx", "vfe0_csid" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 320000000, 540000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_cphy_rx", "vfe1_csid" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 320000000, 540000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_cphy_rx", "vfe_lite_csid" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 320000000, 540000000 } },
+		.reg = { "csid_lite" },
+		.interrupt = { "csid_lite" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_sm6150[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
+			   "vfe0", "vfe0_axi"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 37500000, 40000000 },
+				{ 360000000, 432000000, 540000000, 600000000 },
+				{ 265000000, 426000000 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
+			   "vfe1", "vfe1_axi"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 37500000, 40000000 },
+				{ 360000000, 432000000, 540000000, 600000000 },
+				{ 265000000, 426000000 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
+			   "vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 37500000, 40000000 },
+				{ 360000000, 432000000, 540000000, 600000000 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm6150[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -5050,6 +5234,19 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
+static const struct camss_resources sm6150_resources = {
+	.version = CAMSS_6150,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_sm6150,
+	.csid_res = csid_res_sm6150,
+	.vfe_res = vfe_res_sm6150,
+	.icc_res = icc_res_sm6150,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm6150),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sm6150),
+	.csid_num = ARRAY_SIZE(csid_res_sm6150),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm6150),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -5145,6 +5342,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index e34f06b4e1536129e6d1cd5b719d2c7df8e39a23..6d048414c919e963d6eb0cba2a287015cb25416f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -80,6 +80,7 @@ enum pm_domain {
 enum camss_version {
 	CAMSS_660,
 	CAMSS_2290,
+	CAMSS_6150,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x39,

-- 
2.34.1


