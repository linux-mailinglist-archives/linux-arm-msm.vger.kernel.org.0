Return-Path: <linux-arm-msm+bounces-69928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FDAB2D8BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B058E4E3ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075782DC35F;
	Wed, 20 Aug 2025 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXgMSf3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE542E172E
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682567; cv=none; b=TekA8cro/A3NKWLuEtf+Zl8+YoM83aRhw5pAvhzfKuVuaJTSY/gTd6xA9IRPCu5OLa3dKVgU9sc9MMpzGDbAqaLCkmt6CMUOEumh5oTfnD2D3utYxuy1AZajaAt6v8J2NUaigYsTfOc9CEVq5IDjRO/EKCnitMrXl7CpbTJFvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682567; c=relaxed/simple;
	bh=L77RPub4GUYm5+EpcE6zsdJ8e7TcjMW6KL61o2Mo0ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcItcPocJwSS03ii0NhMhKb6+D3sLvS+eJ6F8xi5jWMLtNng1bVkEuaR12rJuWXPZc6jnBFgJO4uNpYJ2xeXTKaI7qtbGuweOvsrlpNbwf4ltMs21Shk0jmf2j7NL1WgNSwKEAGrZ8IGv9OeCqF8vg5ILeWiwV0LALOnC5MT/wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXgMSf3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oi1F028174
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWgj+1YIpaMRY/yWhK0hs1P4y4VfFaoAvgfjBAJlkCg=; b=cXgMSf3fnD8zorX8
	JopNHWRQEAlnni3NWHN+ivR8Ct+zyyPUQ03LPJBqJZdjbLLkyUnX+F7knHd5WmYe
	GAYyIuu96X5M/MBcsZaoCNmsksAic8cf15FxNNpmMvy8aJGY7E6IWFoYwu13I2ym
	BJ8eBQ8PemGMtbAVxM3SAHSgtkxYKxkcAILQS3PDdiV3EApxYMWFeGaIWJdYlxV/
	vYWE7jvdhJ6+pdvq0BKm+SGoZupaEC0Bs1ofiEimBUOzhc5/tEztdVB0uDTVOYSB
	Es6p+iBbaLK8Ae2fGBZsH8qRP2Rs/2RqB9Oo8Gw91JKYDZKvdQxmyTnMw0B/Nolg
	7VCySw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52as6d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e4dd1237so101903a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682564; x=1756287364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWgj+1YIpaMRY/yWhK0hs1P4y4VfFaoAvgfjBAJlkCg=;
        b=bJehPWO2nzGuBKzwzo+dKP3GwWdquLYI2WDTZCspilIxa5NU/yXA8ko393937QQ/NW
         vBNE+0c8Tc0fsODhHNbCm+Qu8r1hMmqIGhMXZQr9YvLvYKEfh1GWOzu0FqjiOi3JyqXu
         1ZOgT3GwT6gW53dsQMZ6TK0pAE/dyCu4RDpjtbKeIMVQvzlxWqymNBWmYQ7m75rwqnsL
         IbCBHdOm4YrXioqAqWSJWbArnOgLTNNEv8XNFjOJr5LUHZ+/OMmt5VP2iqefhjoo4kuf
         9ztaQZIbPQ0fYIyzh6JuqKPojdLKOfkE2G17KIEzPzL1xWchNYSfGk1hC6vyrCfHzSGI
         DvEA==
X-Gm-Message-State: AOJu0Yz7AjBqX0pHWMJ1Ca0WpWtSDgfl+9YpRM/8LpWV8UsToJhthHxS
	koQiUzp146QRkoLYf09qtG1jiSAftUV4tHSt1gdFk3k6SF76somiswi4jFJAMkKtFl77YotpkMM
	lxp2ov5wUUJf2vsDtJ/5EmWbMlrWSb0jMX78MIsZnq+BH4YRjnLvY6xE9kBrbFIPTuUoV
X-Gm-Gg: ASbGncuZXShzdmbr5n1LvA+SMIL/VcSMgp5Rq0A0qOd4STxdotjH9yRoj3Eg5Zdr2eR
	oH4iSnGkw/pP074HZZuSPW7p5sUtxwjylQeYhltdAqcp0ZAXKtoGJzfoB+7Bo0ahcXBhqykxnF4
	xxzrBaeEWF54fQkaEE8/ccx1pigUWjfpMxe1Izf+QMnKbRtpmxQZly+RESTeMbzK3agAB0ct/8q
	8s22pRSxI1L+6TUemNifZnbS4gAsOe/EUhq4v3nP6cF5eKHRRiC7D29QJ7EmBswERPm5wWd5EJP
	/1uOWgcdOPfrlFDAU10vVpwlC6jkHSrKt6RX/+lyJ4AbV+vyERJNdjEA8pjNZUqcMTMIE0yXNsG
	PGDllZXAGACa2eF9iWa3d3wuVuxm7Mcb01T/nODEdhe5QSiuZi4nInmoW
X-Received: by 2002:a17:902:f68e:b0:245:f771:4241 with SMTP id d9443c01a7336-245f771442amr2583595ad.7.1755682563892;
        Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9IDMLLuCizqDn1Eie9iwbgkWU+1zGOnXJZGc8mc4IQjEGtB2REIhr9sTL5kOXEZ1CIGViEw==
X-Received: by 2002:a17:902:f68e:b0:245:f771:4241 with SMTP id d9443c01a7336-245f771442amr2583365ad.7.1755682563442;
        Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:46 +0800
Subject: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=2215;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=L77RPub4GUYm5+EpcE6zsdJ8e7TcjMW6KL61o2Mo0ZI=;
 b=DQ0gW20v1QwVf9ZNCC8n6LW3iHDlR0KstZhA7x5Lbvq9mjFrBMw+JkSg2jH/jW3XPqEVnFNMs
 VC00FmcL4nJCkp/c5mYGZ58jPMhHMU8LWEPS3yPwz4BZVLeNkt6MXYj
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2U0Lyj4CbgJa
 gA7vRYsqKEZR763VXwMpuD5ZWvJ+4zlfcmtJ6yD6OLD+Q5TOtFICn+97BHT1+EArURxe75LaSM6
 dCgpamAuopLlZjn/6IN7VloVuECYcsy/7Ena6dIDwNvON3vQV945x3SyyxfOvopiJCkGq7KDQZ/
 JeqwbmyZiFA0vFfc38XiP1z+h2YJ9wA44Q3ek3N8jqmxzy5AjdXDBQKqOsJv9eL3paIOZQIGX22
 R1Q15VK2CwWaO0AozkpDPYmUlnskr2w0pSZ8wIv8rnW/Ft8ibBIChI1KSLT5S/4zGOl07qFYezE
 cH4hOxiyPlbcvTJYFca3Zww1F6VcbpZFxaVBvhIbIkIDr2gH0GK8WtjHCA0z77lo5sarLKB8JYe
 iFXdYnCUboSjAYeNgBq5gn8hHqa1UQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a59705 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FzSNxF14YNJ6EpJegcUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rlUIYmB8xv6XG24FlK3uVvGNrPl2e5xg
X-Proofpoint-GUID: rlUIYmB8xv6XG24FlK3uVvGNrPl2e5xg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
differentiate between USB-only PHYs and USB/DP switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+enum qmp_phy_usbc_type {
+	QMP_PHY_USBC_USB3_ONLY,
+	QMP_PHY_USBC_USB3_DP,
+};
+
 struct qmp_usbc_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -298,6 +303,7 @@ struct qmp_usbc_offsets {
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
+	const enum qmp_phy_usbc_type type;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
@@ -408,6 +414,7 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
 	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
@@ -424,6 +431,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
@@ -440,6 +448,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 
 static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),

-- 
2.34.1


