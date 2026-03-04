Return-Path: <linux-arm-msm+bounces-95333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FY3Bvs5qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7311E200CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54B031412AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CE33A1D01;
	Wed,  4 Mar 2026 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfUqqGv8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F617B50F;
	Wed,  4 Mar 2026 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632169; cv=none; b=Sy0re27Xt6myVT117eZzhpOvDok1kkKVfmnxiUJ9Z3tw2N5BVd5FyCkNFk+4GlK8ECqIOU6vzPneyRXMVPwiG7sEHqFI8pcE6ae0A13rxNbvWWadz/AYQkZwqD4aeMMYLXQyRfsMurNmjl1lcv2mFEAkN5yw5V13+iohQ1e/luU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632169; c=relaxed/simple;
	bh=tXwAaUpiFy+aG+PKAec0mM+sb+k0tJWs9XuvpcWNvfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEfW5vhY+fKI2LY4VQCAmW45EH0yZtejet+DKEmU4CpzpccD5YZ+FlXg0Yla2EkjCX5x1/JyiXRl7Wv61epAhVeCWJng6U7wjBXI3f4zYjEPCFav9bJFpqYCGf8+wcE7R8fT8O3ktmvArL6rgq2vFlC7tXKQy7gCu7dEgWpBkec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfUqqGv8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2FBC19423;
	Wed,  4 Mar 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772632169;
	bh=tXwAaUpiFy+aG+PKAec0mM+sb+k0tJWs9XuvpcWNvfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lfUqqGv8c8bDUBcuydVKxN3NK74r6X+tdTEdr6ZmZkWb2OHD68taoga9Y/KRy2X96
	 MaHlr348yHx6ewXSjC2pKT9tugJq9XoxNc0iDK24gqd/oUEx3+C13XU2Tzd2EsMejC
	 ZmFkm603kJ+ibhzBtgTwayo6ONLdSiza6MTn5f+wn/D9fuxISKm720MvAkZbOdmnwJ
	 +AxvjS4H/a07xq4FFChG/RWI1VuPpUHYbl3BIxPPdedpW4W1tTUQZMsU2Mq2ZH63IA
	 vvYCA4AP6my/edXOLP5TFkejzA9SbQcUMPwPvIV+QBrB2qr75IMO0tAys4ymKaoQOa
	 bLKRTXDvacvuQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 04 Mar 2026 14:48:30 +0100
Subject: [PATCH 4/5] clk: qcom: dispcc-sm4450: Fix DSI byte clock rate
 setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772632145; l=1248;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IxpK8d4RGXEmZFXhHwoyNDlr2/yhORAj+x+P56/8HxA=;
 b=va9MXHuCX2ae9W74QtJ2JLtqpFs91IDwASe8+S7jPFZmdDD1MK3SZt+c3V9MhnyP/Usrl1M85
 Fg8R8GCekYKD4L/ZBL1vISBdFIMrPWaQK9mRHhpkr+j50tiR+Jq1OGm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 7311E200CD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95333-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The clock tree for byte_clk_src is as follows:

   ┌──────byte0_clk_src─────┐
   │                        │
byte0_clk            byte0_div_clk_src
                            │
                     byte0_intf_clk

If both of its direct children have CLK_SET_RATE_PARENT with different
requests, byte0_clk_src (and its parent) will be reconfigured. In this
case, byte0_intf should strictly follow the rate of byte0_clk (with
some adjustments based on PHY mode).

Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.

Fixes: 76f05f1ec766 ("clk: qcom: Add DISPCC driver support for SM4450")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm4450.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index e8752d01c8e6..2fdacc26df69 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -335,7 +335,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.53.0


