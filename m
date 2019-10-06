Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF06CCD94
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2019 03:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfJFBBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 21:01:12 -0400
Received: from onstation.org ([52.200.56.107]:55388 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbfJFBBM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 21:01:12 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 7315B3E914;
        Sun,  6 Oct 2019 01:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570323671;
        bh=KxTHzhHN/s8lLwxnhweVAc//HzBq5AJHQfq/SjOa9p0=;
        h=From:To:Cc:Subject:Date:From;
        b=qdwSrEigktdWIq2zAqwlkMI7cYO0z/n/qiIU7xCv72tBppNH7AjMFU1SwwXx4iT0j
         wHvRsZMlarwN9GY3vSHlDjL7devsDNyOkh8gsguBjbNpSrziKK/mJG5befo1uQMDGy
         zvYyE9rRZMI0fMy/2JMhhfqvp5SgWlK/YmFK9V6E=
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        jonathan@marek.ca
Subject: [PATCH] clk: qcom: mmcc8974: add frequency table for gfx3d
Date:   Sat,  5 Oct 2019 21:01:00 -0400
Message-Id: <20191006010100.32053-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add frequency table for the gfx3d clock that's needed in order to
support the GPU upstream on msm8974-based systems.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index bcb0a397ef91..e70abfe2a792 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -452,10 +452,17 @@ static struct clk_rcg2 mdp_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_gfx3d_clk_src[] = {
+	F(37500000, P_GPLL0, 16, 0, 0),
+	F(533000000, P_MMPLL0, 1.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gfx3d_clk_src = {
 	.cmd_rcgr = 0x4000,
 	.hid_width = 5,
 	.parent_map = mmcc_xo_mmpll0_1_2_gpll0_map,
+	.freq_tbl = ftbl_gfx3d_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
-- 
2.21.0

