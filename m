Return-Path: <linux-arm-msm+bounces-77664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C68BE6307
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 516F24E72C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 03:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3285925228C;
	Fri, 17 Oct 2025 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j83/gA4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6648256C9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760670709; cv=none; b=A+mMiO13OUrLBlGVmApu+eGY/MHvencAwX9nAzIPHdPMc3IhWBScw7WlsDP3VGB99lhVOfR7h7e4tg5BcXVFFswbNO4g2odzq916GEuBnch3TID4Qh0TCLmvOt9QqfNqXqldkse7p0zuixMo4JbyALxWw/WrIrls3MUdAFEynoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760670709; c=relaxed/simple;
	bh=4KT+HCPasP7Yf4g29iQeYBGKKol5HroEI3cmviv7VE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwnHONTUGyp9t2KucksDipu+UFacd+aVFac4BY524wfWyf1cX2B/Rx0ld8xPxBJKc76liqouJlCIoMozB6IXj3917jK99G1pAPZvrdmaW5UD9NHoc0OvNqWAkEhXvqoDjlSsv0a1FCSvjJG0XYjw7p+HDTulW1m8K+aDLKRr1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j83/gA4j; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3628a233510so1431891fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760670705; x=1761275505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz74iabOLiuzY+MGhnIj9bkx7BQ1ztXS6gJtYlkIUCY=;
        b=j83/gA4jM9PXCy6r0JBbUhEEQXY3Omi5jEzG/zFykVxnR9UZKprEEeKNfGn54ugilZ
         qJ/PbK8z8twIPRt3Q4bAC8gMBFi9uz3qnJVLgIzXK+SbJ4vy24zzw2piK/DsdJpP+RT4
         fN58uKOjiCcln/75SWzK48AB/fzR1ANlCdH5FYoKpYJlUoC3m2FStpOPA2Jc8teFBI/z
         Yjk9ASeivEq48+zyoQnBbFlVfrR5uj2qDU6XoGSCX5mJOu7mLOD02LUfgjjBo0KmlwjD
         MmTVpnPZiDvBWJBnShZaXQMi/1g9ZXb/aDgJsJGDeyURiFn0Vo9pt96k7U8aBaW2mpfl
         JWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760670705; x=1761275505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kz74iabOLiuzY+MGhnIj9bkx7BQ1ztXS6gJtYlkIUCY=;
        b=xBRKy584+m0otAl+ocLQnD+xCc9q+8GjuyNFNlbXNyJgf4r4MDnkD/4aTwzSeM1M2G
         +P/S4u7pnfxN+cQB2A7Yga+Iq1aA2wCQgaFK2s4C/yFxLSTJCgp4UJt8zsp7aEsDhbzQ
         UyOL7MKGCLPv+ELX1WJSHoMoTumtw8AksmpOxC/EoKQ/STLXx9kltu5MFi8MMCEyJEY/
         k1rVjdclT9J1Iny0LeQOib7i+Bnbp/tNhsxVHz0sHv4OcVGsNNUtX3lel/V5UU+FAHI9
         4+WZwFRS/yLzpwkoSGwLiSWpjZSr7I4KnADAFWF4us4JOBheZQShn9UPF+5shoTF/820
         mBsw==
X-Forwarded-Encrypted: i=1; AJvYcCWVP+zlXmGwbj5PUf9OeT4w5zmNuiEfhN2K6yczKiOJ/DVQRP997vPeKwdjH1+9UujbukrqhudXTzLx1q3n@vger.kernel.org
X-Gm-Message-State: AOJu0YzudyOMgGoyFAXcaf2rU+ZCGb3LY8c+aRknXx4wrSx1dGIHGKhm
	sWJOOICcCstNLpy0enR4lk84o94QSEgLvP9MNm/XZ78YtGNippHs2Z4CsVRZ+AO+dI0=
X-Gm-Gg: ASbGncutunH3w2Dlm1Jqg3PTVsjBz2Wa1GEWcB1n5zlYi94Y1/UKel1hETzFZII3D83
	QU8/XK04eBnUp1u2QF7oHdsk9Of/oOcboilYnnRu22JFg2XJSUfiuFVcanlV0mz8r3pSIwcpMZT
	IeSp/cZMv1lxg9Fr+9JGPtEu7Uwkwz4RICdpbu3rFshiiBzltPCMEADG+QeZZUyE+5K6VRM9HCJ
	SjJRFmCc/9W/kbuZ7q1XG6GW/yzqjbX912UgN6bnbbO1t40OZW7DCE+wEAl+B/z4eZfr10hQBFY
	JYVmJJLE3dqW3jwabi6GFzWWNzVi8NfI6QqEC3XfbqSB7055Iv+3ugQkZ1QXlxbwiYcYO7ugArJ
	Rj3KvxA4q9zZxFyyywtyyuUqG7oJSVAAkcRKGqZWIY/eTQubgTV4bLtMMYBf8p8hFVLg+0HRYOO
	KvsViiIPivCJXaN+MHEg0cthPlR9w+HLyAqLOIyQkVIkpAmN4RdVyBdQ==
X-Google-Smtp-Source: AGHT+IEWsVHLfBuS7aIDAsk2ynK61020tJ+J7mbX3iB7YbxNKr32T0jvBOAIX/F1DUZSUtQFC4ZsOg==
X-Received: by 2002:a05:6512:4013:b0:55f:3917:1df3 with SMTP id 2adb3069b0e04-591d846be1dmr479795e87.0.1760670705011;
        Thu, 16 Oct 2025 20:11:45 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563844sm7496077e87.69.2025.10.16.20.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 20:11:43 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] media: qcom: camss: Add Qualcomm SM8650 CAMSS support
Date: Fri, 17 Oct 2025 06:11:29 +0300
Message-ID: <20251017031131.2232687-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the basic support of CAMSS IP on Qualcomm SM8650 SoC powered boards.

SM8650 CAMSS provides:
- 6 x CSIPHY,
- 3 x CSID, 2 x CSID Lite,
- 3 x VFE, 2 x VFE Lite.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 326 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 329 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index dff8d0a1e8c2..f76bcf69159a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -348,6 +348,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
@@ -1995,6 +1996,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		ret = 16;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..06a184fb9ae3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2617,6 +2617,317 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_sm8650[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = {	{ 400000000 },
+				{ 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
+		.clock = { "csiphy5", "csiphy5_timer" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845,
+		},
+	},
+};
+
+static const struct camss_subdev_resources csid_res_sm8650[] = {
+	/* CSID0 */
+	{
+		.regulators = { },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = { },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = { },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID3 lite */
+	{
+		.regulators = { },
+		.clock = { "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID4 lite */
+	{
+		.regulators = { },
+		.clock = { "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2,
+		},
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_sm8650[] = {
+	/* VFE0 */
+	{
+		.regulators = { },
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "camnoc_axi", "vfe0_fast_ahb", "vfe0", "cpas_vfe0",
+			   "qdss_debug_xo",
+		},
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 466000000, 594000000, 675000000, 785000000 },
+				{ 0 },
+				{ 0 },
+		},
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* VFE1 */
+	{
+		.regulators = { },
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "camnoc_axi", "vfe1_fast_ahb", "vfe1", "cpas_vfe1",
+			   "qdss_debug_xo",
+		},
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 466000000, 594000000, 675000000, 785000000 },
+				{ 0 },
+				{ 0 },
+		},
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* VFE2 */
+	{
+		.regulators = { },
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "camnoc_axi", "vfe2_fast_ahb", "vfe2", "cpas_vfe2",
+			   "qdss_debug_xo",
+		},
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 466000000, 594000000, 675000000, 785000000 },
+				{ 0 },
+				{ 0 },
+		},
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* VFE3 lite */
+	{
+		.regulators = { },
+		.clock = { "gcc_axi_hf", "cpas_ahb", "camnoc_axi",
+			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
+			   "qdss_debug_xo",
+		},
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+		},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* VFE4 lite */
+	{
+		.regulators = { },
+		.clock = { "gcc_axi_hf", "cpas_ahb", "camnoc_axi",
+			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
+			   "qdss_debug_xo",
+		},
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+		},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_sm8650[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8300[] = {
 	/* CSIPHY0 */
 	{
@@ -4452,6 +4763,20 @@ static const struct camss_resources sm8550_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 };
 
+static const struct camss_resources sm8650_resources = {
+	.version = CAMSS_8650,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_sm8650,
+	.csid_res = csid_res_sm8650,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.vfe_res = vfe_res_sm8650,
+	.icc_res = icc_res_sm8650,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
+	.csid_num = ARRAY_SIZE(csid_res_sm8650),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -4480,6 +4805,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
+	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..1875f145995b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -88,6 +88,7 @@ enum camss_version {
 	CAMSS_8300,
 	CAMSS_845,
 	CAMSS_8550,
+	CAMSS_8650,
 	CAMSS_8775P,
 	CAMSS_X1E80100,
 };
-- 
2.49.0


