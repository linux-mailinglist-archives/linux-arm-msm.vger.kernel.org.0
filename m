Return-Path: <linux-arm-msm+bounces-42940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC29F8E86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35919160639
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB8B1AAA10;
	Fri, 20 Dec 2024 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Gi6PNfsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E811A83F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685429; cv=none; b=P3zUnDCQGmkHvvsuM7GzMkzryyun7lH/ULDMtP1IwIeG9ZRl6pdhXYhGZOTYlZDizAvgHaVBImZa1x/X81EuXTdNEMispIf2iXmsf7kYtPDKw8MgWMVaKGzI0T4963CI4EYnRxx4DavA7DqnvG7HEpWjvgoxx4PyiniZu/h6CJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685429; c=relaxed/simple;
	bh=rUGZF8yKmy+p1+ThFeCkZ6lSsu656MxTdFk1QCg9Tts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fS/me3VxLbVCxqYYm2mXwmdMutecekjTfPYdHNIP+sCZPa6AwM4nddtntEZBcUmALRD4trO6CiqXSPbPypON1TCafTq9exdq7XCyhHXfA+XCuwPWEn4znhqqmr6/IZWc1sJFJXFsecy9khNsE+swRe8mRgjBaJ+tkd7OwOMsEi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Gi6PNfsb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43624b2d453so17473435e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685426; x=1735290226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq1bmVOour8kC/0ODYFkalnMVivKoV+qKdeFNxm3Yvc=;
        b=Gi6PNfsbXt7l5F8zvhLxhSTEC633XvQzbCbOogMNRT5Ny3VsT+DkfjWo3mS9fB5KV4
         mTsQJtYpqizT+mJQUDFucLHFuIY7zonLfwY/2488VezyMzMbXpcIIQ89eroDhRmvPHpg
         O+IzqpYEhFjz3laTe6OyWrBYzIlR8e5NoYwCvQhNdJacHt7JJvfhls1hCTfBj5nPVFsG
         uxFeNrClGYMGrEygfEgExALVwtmKTm6yClH/j6+Ro+f9Xmwj6VpT0U6kcme3b5hslHPC
         ohiFJfP0fgojMWNd8ISvKPQq+u5sS7AaePBrhTN5kXFBVhKReMeEb93Uus8z08dfsElG
         yFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685426; x=1735290226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq1bmVOour8kC/0ODYFkalnMVivKoV+qKdeFNxm3Yvc=;
        b=mHoyIzrOS/hvaWJzR+tSYqjM5pKzY6Q74fT6PZFqutrbpSXpPAGXbfZYaPX15X/Xyn
         hZj/swYDlaE6PDdfwcUE15FWAt+Ot44/BlFhepEXVTFPPhNtE1vSj4IdpudA1ubk7b9B
         QFSCP0TVU2R1+4FN8LgOtS9/Y1zvp7Z9AwoW9bV4xYl45YUaehH5fFHnu1ye8uy4PamX
         cwA2IMsxBoUts8cqubEQYABxVwggKEK7GGNoT1S+IwLvfWz10aavczTKeOKE9ovpHmvF
         jU01EozHnX+fvgZhKFPa2W90UpK+GO+2hNu9/POqRMds7njTiW0HaDtYZXFwlOUfTkuz
         JGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuiH/xh5/5zzpX35A2xVJylcpGTAf/BVgUtgW6Dn/btpElQd8q7BgWFaVHwhwyip60ttJ0LTIBMRq6V9ID@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3CIqrW/KZ+P8yVF0I6x/L5P6vhfYZskCFAQBg1Ek5yGNmg8j
	39/SmIaZd/+/DC4bYecMPyKIdAa/ROuO71hnZm9gyxjFPEHXpBa1GaCfEvJxdD8=
X-Gm-Gg: ASbGnctJR+V9kUchKgavA3kWhvRT5Gprt349I2GWwi6mxGtm9UZtLFSDQlXqMuibhKp
	DSMpAS7doTEuSn+NL2IXGycU+nX9yu4hw2dxxbbwLthj69sXtT2PkKoSeQwd5rOMlcb4EQGNo7x
	1f1yUR9Ql4y/ewuRcvA6MCqmLlQMZ33KrWhkMDx6ECNZR06yy3WcbQxciLe1Jy+2VDXEmwCPIt5
	vQ4Rhdkp3B2k0sVOy95640lx2BUo6BLliWJ5XhvFTSrbfWu+tRXHCu9ZWz6VjcKzjENJyFQm5OA
	UJtVnLQh67j+r0e1gkiG84MUcI5jnQ==
X-Google-Smtp-Source: AGHT+IHgsh5xJuAMq4qoVNA6TBwXpF2ZHhv/viApIXc0e7PnnUdfQR1REEbtj0sPbgIGdKOKXJ+NIQ==
X-Received: by 2002:a05:600c:154b:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-43668644104mr17730505e9.16.1734685425998;
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm40610375e9.7.2024.12.20.01.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 10:03:30 +0100
Subject: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for two
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If a clk_rcg2 has a parent, it should also have parent_map defined,
otherwise we'll get a NULL pointer dereference when calling clk_set_rate
like the following:

  [    3.388105] Call trace:
  [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
  [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
  [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
  [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
  [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
  [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
  [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
  [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
  [    3.455886]  clk_set_rate+0x38/0x14c

Add the parent_map property for two clocks where it's missing and also
un-inline the parent_data as well to keep the matching parent_map and
parent_data together.

Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a811fad2aa2785fffbdee0d4bd3cd1133e4d0906..74346dc026068a224e173fdc0472fbaf878052c4 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -182,6 +182,14 @@ static const struct clk_parent_data gcc_parent_data_2_ao[] = {
 	{ .hw = &gpll0_out_odd.clkr.hw },
 };
 
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+};
+
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
@@ -701,13 +709,12 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.cmd_rcgr = 0x3a0b0,
 	.mnd_width = 0,
 	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
 	.freq_tbl = ftbl_gcc_ufs_phy_phy_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "bi_tcxo",
-		},
-		.num_parents = 1,
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -764,13 +771,12 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.cmd_rcgr = 0x1a034,
 	.mnd_width = 0,
 	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
 	.freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "bi_tcxo",
-		},
-		.num_parents = 1,
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };

-- 
2.47.1


