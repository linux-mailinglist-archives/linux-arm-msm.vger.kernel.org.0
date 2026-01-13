Return-Path: <linux-arm-msm+bounces-88751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5DD180D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B987E3082AF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D48738BF94;
	Tue, 13 Jan 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTiCQOIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ff20RlVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A533F38BDBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300119; cv=none; b=OdKX7CGrHEFPIx9YgIUrd35bbSg5nYbhEzaDmagbhMUI6gs13UrL7jELyLQVvkqWaksLou5ZJ0EfypfrKKXO0SosX/AZHhqGxhX92ddmGMLdaA4Txgcf8v0xHvYpxNbW/+oL5g8RDSaJ0PXbu+Rw4ilqYKI7o5Fwk7n5R+DioIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300119; c=relaxed/simple;
	bh=LIsn9wAsUR9DXAPysQrnc2VIUa2E1adY86k+iToDgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPV9ByrGVQdF/iUJ4M2nxmpv9L6IAGqo/oaNYlnoDnfrn/abFYDaGabs9ybkrXkxU1oHa43PFjOSK6VHVpvmlZm5I5jQPMqk87AdoewNX4IQwONjyXDO2Kvt+JFLCEH/cClOwNuLkSiLABqfqulESrRz1x7iDiwdsCkZZvy0qD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTiCQOIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ff20RlVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D595Km2835060
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOhwxkO7Vf7CPnCeNuoW1TJzRu1a5VwgL0q/UpJoSrk=; b=CTiCQOIa2VAwnyTS
	i7gkqhCjfL0PoZgByKVQj9jucyxzVLRuxfxNLcHQmUb1/kI+kYSGgME4oKA+oXfd
	CIBLiLIUE1RAc0wF4LvRPt7qJfxMqtf+UeKXVsfHZfHkKd61RpENeQPs/ncYiPYM
	ks34/MAWu0NvXO+ucYTjPHL/mhR5RPZ99mXSeYv9agHnNLIzjFzV2YmShW8HZiu4
	g18ZjzJUBN6XJaLmbL/ie7JZwGWc+79dlWtmYTlWENayGR0Pa5Gt9nnVXF8ijGtq
	XL474Ju6amkMxix/Dbqm/Jf8eY2U51/3IuttoZqF2qwgX7vgCQfCO+aknIFtOBwA
	bjS1qw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9ry6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11dd10b03d9so9560270c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300114; x=1768904914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOhwxkO7Vf7CPnCeNuoW1TJzRu1a5VwgL0q/UpJoSrk=;
        b=Ff20RlVg7WXjyWdMq8El2sZX/BKXGm2Tr4NYUhrI9GWFziVu73u7Q54H4/VSlLZHY0
         XOj/Q5/NfDNFRSoHXK88F/uxyXBcCfIxSc2pQCaDkcmNb2cQ4h0FlHQdG8D2+Ac6ArP/
         E+Saz7fJokQbiV5cAVndOjGZHLdMtyZNXNqdrsE4vrKYwOMIMeptdwrXs0viUeAtLxqb
         0ZfIASfyz01/ttdgMO6g0rccCExBwVvfT55DHx2SVO7RY+dcPiqshznV+uR/X73FeL1O
         ZxvVV6NkYnfxNMD9OgjHagFsHcoWjgEhrQWv6/wdA6bhj2vqsmvdVIj/RETaNGQCKLdZ
         ASxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300114; x=1768904914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOhwxkO7Vf7CPnCeNuoW1TJzRu1a5VwgL0q/UpJoSrk=;
        b=lmJjfb6yDa7KXCXCMZ+uyRSgBwJcI/rZEgerxrdLXAoWrDWNZduRybZ3PWuIiZS3Cp
         WK9zyXZspk4O2ZGq9v+UOLuiQzP7cEvRKAwLEYr5WVuooS3dETDGBH91rhT7fCGFT1C6
         auya1nXaWfJT89wT5bSvdfyabAKWaOXTRkOVA433ebN+Z6EE/e5kVsqt8EKAUxrlrxRv
         SzK4vC9ZxebDUcbNVXZanMziDTZmgU51EcM8Ecoq3RX3j+I0LcvqYc+VYjIeNU2Fa9n9
         jwbL59Jd+IITEg1l6dx/fvDDY6F9XAf1fYIQJOfZ0ChVrp42HonAOwfEhQMyGY/t0mjA
         g6FA==
X-Gm-Message-State: AOJu0YykfjoXP+PKbc2gHjtQUu9trBmx5JfbsVNy9wZTsoQXtpim8XJn
	96X8vLBdYwjyO3341/akEAMkdGg5ZAf+Sge/WuyFwEJq9Ck/rbjATiz2kAcdR+/v8LLf1TY+L0m
	OtajOxkArslA9wmKBjPMwdSKXsWoaznvTgjDrE3V9iW1nQMGhOwLbruX6QuLcq64hkglm
X-Gm-Gg: AY/fxX7UERtda4JVAbPDQ0FsV9p0fI5XVIF4kMFE2jnYbOA1G/6bI5InX3zfVE+8WXc
	qDaOlzDj9KY0e0UZiJ8WC7YoL364HdTePnxW24w/EV10EFV8PWvsfd1GE96kd8cFZtfMxG7u8ct
	9unMY1xyjf1oNJOvfFmRDPty6HbC8S/GT7gCA7T3y5GjR69NLVySk8eLP6jMAptwVupyKneCSVU
	k5a73KWDPechwtFTAr4uMRHbee1djTIW7JP0atOJlooJ7e1IQsjth/oLdZ1zkapOK+5ErfphmMY
	fDhpDGRC9t+/HXRbdVNhuhB4xDHhjAV5A8lXsNpb6oeHtuw8XCmCpSlghFNtS7GfT/O9ByC7gF1
	SglINcS3KNkLdmk05tlJ40EEBNmotCRSwgGw8ZTE5nx8PU1sMa+ikritxg7TgcsPh
X-Received: by 2002:a05:7022:786:b0:119:e56b:989b with SMTP id a92af1059eb24-121f8af8169mr20021478c88.2.1768300113861;
        Tue, 13 Jan 2026 02:28:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEShs0zhCLm/kgqMsw9xCUfX3GmYXqVOEA5jmVr85gGlImSdXSl0GindBcyX4iMCxB6olINw==
X-Received: by 2002:a05:7022:786:b0:119:e56b:989b with SMTP id a92af1059eb24-121f8af8169mr20021446c88.2.1768300113321;
        Tue, 13 Jan 2026 02:28:33 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 02:28:29 -0800
Subject: [PATCH v2 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-sm8750-camss-v2-3-e5487b98eada@oss.qualcomm.com>
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
X-Proofpoint-GUID: O8JpwrhGL7MGmh16a8nuNNglK3wQvBxx
X-Proofpoint-ORIG-GUID: O8JpwrhGL7MGmh16a8nuNNglK3wQvBxx
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=69661e52 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX3/F7YcTS2Mz/
 3DNvu49wXNXMRfTFL3mhd4xAD28MUXPkP5zxEi2UiPheeODySHSnkpkr9EidMHCq/6GKH/MBOs2
 i6i5kpCTNPbWpxqTVcO8+2kX0y028e9YA4iwmP0ImqwV4LbDA4+rbUblJPOcOK2sSCrIydbZsIL
 JiWAWGkf+nh7LiXV4RCIkkW3XM3F9v5OTX2UtPnoPU+Ginb4BKpJGzXGHmr40V14pfLPku/feui
 GvQWOr8JBGerrXNJc6FAjXEJ+6ea62N+wrt9ismarJlZ15sIPCxSJ6TZWPKa+H3iGUBBfAhLWWs
 QCdH+tc5wd+xD+KWtZk/4sbygRhyie5Ud1gEN9x9SImld0ye5nagFGG+y2J/w9r2atDTgVucums
 KHkgOCyVrcgHDKn39pSK2ZRkXZOl2aHyZuw/UMg2ZO0m1N4tLTtNT670JD0MfvAQf4DyeVXjsaG
 9fFfrxPKC9tuF0CbdEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index bea8c927a2e3..1c95102a72da 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -684,7 +684,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1134,6 +1134,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1250,7 +1251,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
 		regs->lane_regs = &lane_regs_2_4_0[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 56f20daeca3e..1f9a91178002 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4066,6 +4066,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
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
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
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
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "cam_ahb",
@@ -5504,7 +5627,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


