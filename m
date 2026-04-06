Return-Path: <linux-arm-msm+bounces-101980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPcCOq/X02nUnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8103A4F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E724D301A7D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25C3358BF;
	Mon,  6 Apr 2026 15:56:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1A33064A;
	Mon,  6 Apr 2026 15:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490976; cv=none; b=H5gKs8pfm5evLxGrPv/7yu/S7vCa8sJqhPuQ6351AOHGEIHdQ76/LRZ88kDqS2VYgGDjZrdc6lv8Q+TKfTPNKpaPtk6zjVHtH6T3uRYDRh8IH8oGLnrv/p05M6LVLGKYFRs0xoJ1swqWo4zKOElNGPPxt0vaBNPj4qS+67Vx/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490976; c=relaxed/simple;
	bh=j9Ned+udCcWFI6mm9PbQerggwBy7Q0gTNPAb09CLcXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPqeEoerTlyF4aAdYjnCz+OO18BZ95WNT5NfXT+biu2M88s9YuQYF2laTzkKEhITZHxmg2rjl+n5DMI2G3GYvBcuLZ6DIpdUPwmNvtT+2D5rwZ6nW5h/rMNa25T8NQU72+Qkk75qXnkPTl9ObWl4jYol8n/O0v0kn6WQNpM9QJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1775490899ta4844d97
X-QQ-Originating-IP: kz4tg1extCWtRAZh5P45oqkn990iC9RLqZTRzwmI0eU=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Apr 2026 23:54:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13727944797770228139
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 06 Apr 2026 23:54:36 +0800
Subject: [PATCH 4/5] clk: qcom: clk-rcg2: calculate timeout based on clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Xilin Wu <sophon@radxa.com>, Mike Tipton <quic_mdtipton@quicinc.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489; i=sophon@radxa.com;
 h=from:subject:message-id; bh=j9Ned+udCcWFI6mm9PbQerggwBy7Q0gTNPAb09CLcXM=;
 b=kA0DAAoWMsMVZ62eMk4ByyZiAGnT10ijuEeVb5BZ3+PKAVXbslP+PLI0aNu77gDVd2vinthSo
 Yh1BAAWCgAdFiEEIF8AnQd5bdblFnUuMsMVZ62eMk4FAmnT10gACgkQMsMVZ62eMk6baAD/XGgZ
 5idymkv3BJxty79iudaWpoqRLSit5zGUWnHoP/sA/jufIgC6fQ5aNUtHjlrZjPiWjknPbGf8PL5
 3aIPGT9QN
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OfARS1tHiMjeXmwI33LqjtZFpqn/3rhG2Y0tb1NHOEMmX5ahJ3HRrPaG
	CRblgtszAjPRqcEVsIVI+jsyQWAcB60xA8YFhGajrDH5lzMQmMhgustaWy2TVlL3fEhhzG+
	R9iQIFF5nKFQn6O7npXAU0CF+MSL9SWmWZZB+Ort5HQ3gL4HmEWWt5LEWmUgGpy5a765jYe
	Dx4NVGrYQReTLTKa0oraHG2BXGXxR9UK0WkF+HoAkPt4fWVM+ADgGQIwY2ZNqhMtu0sKFWy
	viwK/6Lz02ySmDVpFzubIoyWZkIwZU3USBf0pyP/5vX4cCCD/aSqCM3MTPj0Ct8E42UIswH
	fSSRlOBXTuV3DqjZ7g/B7IZMyjZLyl4LNVZeyplW9aeK8rZPBj3t2CVtMguBzRIMWlJ9xyt
	XTfARU6U+1ChZl1IhVdGs/ip+0y0w6k3rKlNR0vxuARQHfZjEmd38uSK8Bruq/GTzD42POx
	UllA1/qOencLh1zroC+EePhWQslf6OORZmMxA8Z40G1oUvaYMMgNib2jXiVsYQndsyp1Zx4
	iE5fXSTIFZ3oT3MQfU9mab5eUZuk8FNVTW9COqMZN5dujq0ojLOwu6r+pbC86eH1lBxmEoT
	o4SUGLwOrANOWgy+FIe9pGUnzgwCfvTolUaaC1yKkgU4hkhQBgOE1sJMV3vma35kHZ14BaN
	7vrCpHUM9PReyWIesOVaUadUWErVLJ2WuG/yYZ++Et3jUgvi3KjBgpWV/txVKdtORdVA4Ld
	AaW0fE3/d5kHqVkle+cmcjwNXi4o0hb8nL+L4maWvAsTgn+Lv4crYQRJvdJx1jm0KBN62I9
	crXmPsyoQ7x+7Fuig91C991F4ew34uQoO7i9PupoKiuPxzXw7Ey+lWCA0VMcGEYSTB1cA9e
	FTJAkNbT/luTLLFvJ8WfgjSCcPXgllIh/zgf6/B5QWXvoVBX3SXH4/uU7zw1VLUFYWQKw2R
	R9qDYck65n/LXEbozCEeUjLnjzL22F0+6cOC1ay1KKWTjEaS5sf7fB7etBNZQ3V78PB7/xf
	OXe/7ZEHIp458FxD5fGrf5/yWxkgkkGc5TnTG1Wsr8ZET+jIfYWr4eDLQdAanqhgUhZFnIj
	98ZMVmPEsxtZyBLaOYJXV0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101980-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.111];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,radxa.com:email,radxa.com:mid,codelinaro.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD8103A4F8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RCGs with extremely low rates (tens of Hz to low kHz) take much longer
to update than the fixed 500 us timeout allows. A 1 kHz clock needs at
least 3 ms (3 cycles) for the configuration handshake.

Instead of increasing the timeout to a huge fixed value for all clocks,
dynamically compute the required timeout based on both the old and new
clock rates, accounting for 3 cycles at each rate.

Based on a downstream patch by Mike Tipton:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901

Fixes: bcd61c0f535a ("clk: qcom: Add support for root clock generators (RCGs)")
Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/clk/qcom/clk-rcg.h  |  2 ++
 drivers/clk/qcom/clk-rcg2.c | 27 +++++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 4fbdf4880d03..12c1ce0f774c 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -159,6 +159,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @clkr: regmap clock handle
  * @cfg_off: defines the cfg register offset from the CMD_RCGR + CFG_REG
  * @parked_cfg: cached value of the CFG register for parked RCGs
+ * @configured_freq: last configured frequency, used for timeout calculation
  * @hw_clk_ctrl: whether to enable hardware clock control
  */
 struct clk_rcg2 {
@@ -174,6 +175,7 @@ struct clk_rcg2 {
 	struct clk_regmap	clkr;
 	u8			cfg_off;
 	u32			parked_cfg;
+	unsigned long		configured_freq;
 	bool			hw_clk_ctrl;
 };
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 0e8f0473897e..732f34629ea2 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -111,9 +111,27 @@ static u8 clk_rcg2_get_parent(struct clk_hw *hw)
 	return __clk_rcg2_get_parent(hw, cfg);
 }
 
+static int get_update_timeout(const struct clk_rcg2 *rcg)
+{
+	int timeout = 0;
+	unsigned long current_freq;
+
+	/*
+	 * The time it takes an RCG to update is roughly 3 clock cycles of the
+	 * old and new clock rates.
+	 */
+	current_freq = clk_hw_get_rate(&rcg->clkr.hw);
+	if (current_freq)
+		timeout += 3 * (USEC_PER_SEC / current_freq);
+	if (rcg->configured_freq)
+		timeout += 3 * (USEC_PER_SEC / rcg->configured_freq);
+
+	return max(timeout, 500);
+}
+
 static int update_config(struct clk_rcg2 *rcg)
 {
-	int count, ret;
+	int timeout, count, ret;
 	u32 cmd;
 	struct clk_hw *hw = &rcg->clkr.hw;
 	const char *name = clk_hw_get_name(hw);
@@ -123,8 +141,10 @@ static int update_config(struct clk_rcg2 *rcg)
 	if (ret)
 		return ret;
 
+	timeout = get_update_timeout(rcg);
+
 	/* Wait for update to take effect */
-	for (count = 500; count > 0; count--) {
+	for (count = timeout; count > 0; count--) {
 		ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &cmd);
 		if (ret)
 			return ret;
@@ -602,6 +622,8 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	if (ret)
 		return ret;
 
+	rcg->configured_freq = f->freq;
+
 	return update_config(rcg);
 }
 
@@ -689,6 +711,7 @@ static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
 
 	clk_rcg2_calc_mnd(parent_rate, rate, f, mnd_max, hid_max / 2);
 	convert_to_reg_val(f);
+	rcg->configured_freq = rate;
 	ret = clk_rcg2_configure_gp(rcg, f);
 
 	return ret;

-- 
2.53.0


