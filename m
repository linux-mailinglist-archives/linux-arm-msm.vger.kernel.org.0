Return-Path: <linux-arm-msm+bounces-101982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HNZKODY02nUnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:01:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8C3A5091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B33A83002D51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 16:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25F6387375;
	Mon,  6 Apr 2026 16:01:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7084E344025;
	Mon,  6 Apr 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491293; cv=none; b=UIerd3JWNn6f2DmxPcEOltA5zWH4MMoh06uvbdRWWRFexewmqjOu34U/aM3fXec7IedXx0BdHt0Z1MJebHb3sRON6eHaFCQbKorTBhTPAue8oTEIIK1XOOmUAxT8dz06jlzY7krJOFT2lqHk6c0VYnxpGbGbpDZ1WsUm9QTkuNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491293; c=relaxed/simple;
	bh=QyOERKD54DGtJuGHMgNron63KBsG0a26exTFK/mdpLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tm/7H1GeblrMOmQZM7sVbv6xMvjicPk7zAcDrPOqWlEEsGH5krNd8L21ewau62Cze8eodkHS3UtW58CaHM7HP8m1MpdNP+2uzZJhV30Mqm1YIxkCzSvhKV4UAbF3O57/5niJkTsSV0xlRN4cfhJwCJtTwb28fkURCEljrXy370M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz5t1775491264t6c9cbbc1
X-QQ-Originating-IP: DS5B0/3h/WhaagrWox+iG/E+AQ5tDYNWxa3EmdARaCw=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 00:01:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15980131768172091507
EX-QQ-RecipientCnt: 7
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 00:00:59 +0800
Subject: [PATCH RFC] clk: qcom: gcc-sc7280: switch GP clocks to
 clk_rcg2_gp_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gcc-gpclk-sc7280-v1-1-2445c2f7a539@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMz3fTkZN30guScbN3iZHMjCwNdoyQTQyMjI/Nk07REJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUAe95Du3kAAAA=
X-Change-ID: 20260406-gcc-gpclk-sc7280-2b412227c5fa
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=sophon@radxa.com;
 h=from:subject:message-id; bh=QyOERKD54DGtJuGHMgNron63KBsG0a26exTFK/mdpLg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJmXb+w78Petou3aYvnN4R0bWrdX8VQoOGWL+52vW2ZW3
 DexvvJZRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgIn8sGb4Hxuo8m7m7YfMs/kX
 Szw0DbGY/LuvsfzS5cMVvbOUJEQEVBkZ3vww5zP75HssakPUg84gg+Qnkq+FnTbUrSmMz7vh7xb
 CAgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NE8iuDeseKq8Twmv7D2K1f87c5KdqF9xRLVmn6aUbcGICAwYzFziyF4C
	fYcf+AMJTOiuxUalntoSUv3amLn9zvJLPRlQZVvnYz+cyT+ps7SzO923xRbqBZMA0v+OcB+
	U5YTMU+YzJnGFhfWfiGvD1V6MZyL7B5zwKo6RTdC+G1hzzXDwsdJlBrcrg8jVbj90XOZkL9
	ci1s9imZLDdTT9rTO8jXaqR5c+ePJHTI7AQZCGyy+pY1YJfan+Bmnl/9B8kLxuU/Axg4UAK
	LS2kPRwyi7AsFcO65Z1KFMOYDNQGS8MSj6SmrfXXOMmCUDLPOxXsPXycSqF6Fb4SQr+z4vP
	1P4MW7Fi/FENlPGSVkM4KIOuRMKba7wZtVqv+DtjYyIZilDCdyYxoneB5dXIPXeDgUx1R+r
	Xaqs2xbAA6nsJ/qt5iyknwGRAX8tXQdsItvCuxNwt80/8smqsf90DujZ+5DFPQwsamIAR1l
	skAY3QISG08zgnHfSaNYJ9+3wzcwqsc3VZxvW1r+GQ36C1Nm2k2JF1PjTz6bX2mBKF6IlvC
	Q/ep9+H4stvrIlEfwv+a33XNEXpHmSHQipREwmJVAXq00hH9aTUnD/S5cXbfwunwU2EvIYD
	UD8vnnQ+AQcTuei1XpjziB0q/NNhBKyLxiRn3+IPmbRhod8yP+wi3WXLxKsC1ptJfFzLqgQ
	GVI0i0jeVukGqOZpxI/7q2u+RxTX0YrE28O1d/dKM5jHpnsQ0+Ke+fIbtWRNocIL3R2hp0O
	EAMWzXFmHzoJSs9TAJvOQ3IyVRn7ixAx7TS64XJOs/GSz5TGWWKNtMYu4KfJS0Ucg/dpJw7
	laxpqTnBE/0ys6hR+ccrExtRN+CAuuuiHsp+q0Uye2PaVHmlYVxotjbVfqihk+kUb4nfF/w
	UNvEV8E0LqxzHI7PYALUmqeKSaPYV1QPLqij/R9IcnkBhMw3ERekNoQn8wiuOuefIJszxou
	pkyHrZH75ENnv2ZAkE35rbcthcLxUA7n1j5vuCv6XWveJj446HhOhw1L6/27XfDENMLRhxS
	QiKoSy6g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-101982-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EFC8C3A5091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The GP1/GP2/GP3 clock sources are general-purpose timer/PWM clocks
that require runtime-computed MND divider values and duty cycle
control. They are currently using clk_rcg2_ops with a frequency table
containing only a few fixed entries (50/100/200 MHz), which:

- Cannot produce arbitrary frequencies needed for PWM periods
- Bypasses the MND divider (m=0, n=0), making duty cycle control
  impossible (MND is in bypass mode, set_duty_cycle returns -EINVAL)

Switch to clk_rcg2_gp_ops which uses clk_rcg2_calc_mnd() to
dynamically compute optimal M/N/pre_div values from any requested
frequency, and empty the frequency table since it is not used by the
GP ops path.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Sending this as RFC, because I'm not sure if all other gcc drivers require
the same change.
---
 drivers/clk/qcom/gcc-sc7280.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..e7748c468721 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -457,9 +457,6 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
-	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
-	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
-	F(200000000, P_GCC_GPLL0_OUT_ODD, 1, 0, 0),
 	{ }
 };
 
@@ -473,7 +470,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -487,7 +484,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -501,7 +498,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 

---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260406-gcc-gpclk-sc7280-2b412227c5fa

Best regards,
--  
Xilin Wu <sophon@radxa.com>


