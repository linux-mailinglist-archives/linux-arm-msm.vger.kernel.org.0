Return-Path: <linux-arm-msm+bounces-89760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B8D3BF84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A0C94F9601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 06:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D513644CD;
	Tue, 20 Jan 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfZyAO43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfbAbJdQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468B500955
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891397; cv=none; b=a/rV4e0JlVTPYwHO4pYJIIyOeCaQ9b/HBI+NDI9njfhdpcw+KdI78PlqF6Cty4q5m529McmwkrNa9FtnTtVBRWMCHTxtsM0v7sdwTAPnQu1VkotkpuUcjq4nyqSeJxKFt14lBXvAicZHLyjkv2XlT8pp/AR/rKf3+3AIGp149bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891397; c=relaxed/simple;
	bh=jsOwb+B7K7FZCCxlNQxrJlUg3vB/VV4uHdzNfSRGhWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7Iqdxv2PWYAyCK8KHCKdW0Q74nE6L+QY36G2pomhrj3RyGMK2tjK6BPgtwYBRSs8LLHQpllHkv4zmsgsJD0ht2gkWE7rxSvLqZQHOJtpNo1ZT254bv0zO9S0X/8AkhNiMXJRYZqjB4kIt8cFvuCmUDCYwjr99gt7C4luGBF+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfZyAO43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfbAbJdQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3sZcE3252696
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRNqRld3lGsF4aYevT7/zEHLhoj3+AVXmXvtLLinTAc=; b=DfZyAO43gl2nPnTq
	SBwP2sjHNLbq9WmPeJZtnVLk+oUqrJMEke4pqyBTUW6aujvWy1KyxsPjx1+k7hAs
	yIwbmQtimzEYjcb0nGVrfRIwCV+pDHW+wAF1jiSMY3/fKwY1c34N7cp6eBoGLP7b
	pXnN1tfwKC6mAPotNukIizLFqhhkZsuJ76Ffyiat/xQEUR0X79TKU4c6zsFr/7iz
	BBuqnYYoiNTOoxzXQAo+I3e8gjT51/9VVBlNYQvW5nLlAMQCZraD/JKg/ikOW1Xo
	iSgbt2BwZ12kxKPNTvs+9Y1QO3qXI5ThGMe1hsfw8qX0AWDSNbjQeyAUKDSSn3JM
	soO0LQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27agdv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1219f27037fso1871436c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 22:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891383; x=1769496183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRNqRld3lGsF4aYevT7/zEHLhoj3+AVXmXvtLLinTAc=;
        b=TfbAbJdQr9s3pywrf5dlCtgq30HA4xohEZtqsm+0YnO9dXD2AthEYer/5rvnIoJ1gy
         XMJyhTrtjb1gm1j5HWHVZVV+ah+YP95YMYlGJOfI1WwF7dYWnxbXqPfh3ER6+NktrNPY
         Pv88NrXlzu+MrrbOhacKiw8VhlG1UAhrEB/9LGHjDWguNhvZ2NMbYq9KaTToNiZQhS44
         y96WhCZLhXkXxjJxp/t52EJg/i9tfqMHk+RhwS6hSNa7FRrVfMGoGnfFZN2CBnuz/5Wl
         BugEzpm6loPyyNt3DKpUXI9wKjOT/j68iYMdaieK4+qhZ9u6EAvGD7qQimHR4SPVqVRN
         pl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891383; x=1769496183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRNqRld3lGsF4aYevT7/zEHLhoj3+AVXmXvtLLinTAc=;
        b=uM3RN8I3VenAjq6NtC+m23cQHpFbSKRUWsdTlTTR9zyPm3DEHWK3Y8v4gYB8ChNRER
         v7c0WaZBvGej20W5lW3AIRyhQqGSozk4jGnrQ0eUcZT//uJEwH0wXM06R0vBMGs1tBOQ
         mC28y3hb8BCYraTOiFqxwPmD/gO9DyxMPkjqww0I8oje5KCQcpRdFjXDDpQrZb7/pSn1
         /GFJC/znFuqN/9qDe/qNcTQ/QCPliLOjl0nzCvr0CCTocUANV18ZyQArBGNozvLHsp96
         3z0D3fvcAG0b6zR7WIwHk0qODXp80s24VVhaj7BxXnKGVPXdQDb71a/60B1W3pnAjZqW
         YIsg==
X-Gm-Message-State: AOJu0YwBptkuNzAtjMSqUjuAieqBr78brz9Pm1pjz0DRjnrbYN8WFeBd
	sXCfKMvMbGDM87zB/YTOAcDR7HHyWMcVn9spD8xmM1b+V5ZVOPIzQ1QzM2G5923B+tmP4aeYTrD
	nUEr18oGon/w+sZH+/URxcRjwXwW/71fIxQuk3B5aMlDUi56f220Vd4Xs8cM9imhCcRyf
X-Gm-Gg: AY/fxX714Mv71sG/1qi9HM9p7fJhwngoNRXNQ6L9jDmmltdeE+igEVcRIRzm5Ssv+8P
	OG0gLs9Qy2/Ecy2ThuhMyp79T5Rovftv3/plhhkhoXnxGKZ5Inc7vEXKcFMq7YmlL+Q99GlVD6w
	oSg4RE+L3lYgojHq2HEvjKkgFTnMFgIUckGyhFmbc6tXssCz3+Wj8rfdWbUtkMZit+xxizwCUfv
	2R+IAVkP0DvUhKLdLy5pmgsn56n/kRvujLaPDtckqmYVOQscNNHZyoefjCUrkYkNXIaolGfuKrB
	5D4uM7uPKLcpMFtbyJWxqSV3ShFfR+mlC61V/lWwwWB2p3IRFOZ3qH+TQDSgVX8IjdgyeQKXK3j
	yWyRrSx9d+Uko+CXdT0PdyGbe2vkJHEMuC9HMuIy4Zm+SqZgl4I2TiursKOx9i1p1
X-Received: by 2002:a05:7022:458c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-1246aa8951emr690877c88.19.1768891383418;
        Mon, 19 Jan 2026 22:43:03 -0800 (PST)
X-Received: by 2002:a05:7022:458c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-1246aa8951emr690856c88.19.1768891382922;
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:42:53 -0800
Subject: [PATCH RESEND v2 3/5] media: qcom: camss: csiphy: Add support for
 v2.3.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-3-3e06583a0a81@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DLOPKgyvsZ5KcMSsXjxm46VrWUIRj2hZ
X-Proofpoint-GUID: DLOPKgyvsZ5KcMSsXjxm46VrWUIRj2hZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfX4CFfKP0kN3Ih
 p2ktXJaq+u6Bcg9m9wJ5Tymmh+ngdzbVgzjQvDFPfGDrJLz4UsjKEay2yFdhedzWdjS1JOZtE0b
 X5MH18xOpT4FnpQZPBba6LFDsxc8yEBjbukDue74FLkFuR4Xc1WVs+FOD6dZxLqIGE1/y6jqaId
 mL1zJgp+6HMYe+Ts3STwkVMxkBQS/FJ8nyCwium4DfwlP+6BoWbZtgXssTkYzlr72NeGxVp9sy0
 cedAKm/nGq7mifVqHF9HLV3OIY1flXZ1HwIWDDzoxxrj0WjV8Dy9QJEr19OvEqIP8P3bTetserE
 o+WOoysR2poHoJ9T1CuWKwG/jZ16eBrBWIWVL/+Ry5jzyYEbeKGug+w6KuH2QdsdD8uHNCjHj+n
 VrITKSadJKchPASXmwW9Gyii5Bj6kow7cgV/p7poV0rO7c6WPXUO+tuN+/wJhJCB/hzixs3Rfcq
 wf+XjgYkIAN2S4fwdGw==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f23f8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

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
index c51ffcd93ce1..5b633786314a 100644
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
@@ -1135,6 +1135,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1252,7 +1253,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
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
index 0b524b615a94..e27e12c08443 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4248,6 +4248,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -5687,7 +5810,9 @@ static const struct camss_resources sm8650_resources = {
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


