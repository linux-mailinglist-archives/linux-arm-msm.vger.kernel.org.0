Return-Path: <linux-arm-msm+bounces-101978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vtCbL/DX02lmnQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:57:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32C3A4FCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BAE1301E6C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A8F335BBB;
	Mon,  6 Apr 2026 15:56:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE32325701;
	Mon,  6 Apr 2026 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490968; cv=none; b=vEpR2ps8yZscU+Gdh6UQrGfoI9iwqVitEcqEj888vVm32ITUrH+NWFUCfaqgT3zWSnpvpISJENcCeVSatjKST6IafovchV3TNMPNWCVq1VHe+FMaZ3WENiuspaIM++i8IdfS7uiU62FMVLVMW66n9x/vh8Zl5PbZklXB1ONNRa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490968; c=relaxed/simple;
	bh=/G6qp68CyMYWgMJp25Zpj5M5dAg24l46LVGosbtcH1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qm+6Y2bc1uYX33p6sTeJ9ai6zPwGPyw749zjKgFRXJzQ4DghqrRVdDHe9Brxa+cTLogzRafpWyGkOh9QqNk5Z0wZV5vZccKpwxBfOTW53aHZRFhAV/zfhrsnuaKqTLX+h4Y2Fb0mPDmw/eCgESQ5HzhFUs9CfzSD3qxcbJvHFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1775490902t7c4ddd20
X-QQ-Originating-IP: u9LdF/MuUBTYhB/eG4aIcw9LJyIudnoCCsBBbNR3WA0=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Apr 2026 23:55:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 190652990989054796
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 06 Apr 2026 23:54:37 +0800
Subject: [PATCH 5/5] clk: qcom: clk-rcg2: fix set_duty_cycle() integer
 overflow in boundary checks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-clk-qcom-gpclk-fixes-v1-5-7a14fe64552d@radxa.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716; i=sophon@radxa.com;
 h=from:subject:message-id; bh=/G6qp68CyMYWgMJp25Zpj5M5dAg24l46LVGosbtcH1Q=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJmXr3vInVurq5DKfrvxnuJkDpObF482zFHjdHF+ksvu2
 33zgkVpRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgIlwxjH899efY9N1Y8vtE+JM
 Rov+R7Tdzec7qp58tHzDqaAYgUNvQxkZLq11FQi7/SxU0/0hZ66zwJmJV4qC1+SdlfpWvCjm+rY
 SJgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NOH1TaCqk/M+slQkMoa7JS71wOtNgBraIBTc1/7ijaxzoXHqkg8NttZg
	W4lR8azkvfuHBWM+B+hfKoeuT+aORDoxQuo1Fl/veh+4kzy1Plq9CBQGaUKCSv8OQj6hGNf
	UbKHxk1ZLWgGdHm7CKJ6JKMXk0Q+GtMmmeiK6PaqAWrtyebDKrcmSVbQJV71bhX/3UtHCGN
	zfkF369C4EnOl+LSOUW6LHskcIR31xCGyTHa/yhtVXY1THrK+b9E3C97jmJbk8ElEbGqSQ6
	icVMkwztS1B9giv4jrTbuui5ToVUg0kUPPFWCQ6QnxSf3JAJTZ2G9FSyZERMMbPYDHBUMa5
	xUg+KsMIHv0wHoDmHrOI8js8GJ9VDt9dR+oGGhUIlAN5g3U+SuAKZtB+mthJiXxQ0CxKPHs
	zYXzb8Ajm97Eo/ExH0vSBfuUPnffi4Ihad1DNkBm4Oss13+x4F1IXXn3k0BjJfuv6+8TvEb
	vn36VZLukQ6QSbJ79rlfTUCvmNKn/dLHzY+VzUha6NmWUwjk4A6dxZIS9M1d8G/MJVJHQID
	uh+hCaJ8OccrHO0OzE5mTibDsPfMPJMJiEE/quUiMEAdSICZfDCb9YdHXpQBsW4ZOfnv5Ge
	Izz1Wcs+1RHrIVUbyoaYBG6th6q49JVjgH12tdoqx+BSvqc8Jh6Uc07tLJM4ooKiApZvOw6
	3cYfpQ+1Nqm35HgO2Wb41j0ODMmSNJ9+CGUQQQaW0Iew/t6EIuA6gmGp1XOS1EHTymsgsuO
	F7h308Jj+u4yVCBS56taleWDnjL6Sf8cTkZMNKwokuQqZ9xuXrTavplLY02VbtaQzExK5Nn
	w/G45UtGqVLAtdF0hs9zQEk8zh48r664hhljO/ks/cD/t1b/CnL2W8F6FZXuHNpTqi6mnMx
	vcO9NqdEjcDPwcVucvfZI/5Bu4DulkT2UvwRIDYknQ+1q5Sgoq8rIwVRJmqxQGs0RnM1y14
	tRf02e6IHbqr3hsm+TIuKYu1WgJG0OPzTza/eDVX/zvQH705Rs4TebJNBCgItg2BVF6dg2G
	gbI5D2Il6zkhlqk/ph
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.777];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D32C3A4FCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The duty cycle boundary checks in clk_rcg2_set_duty_cycle() use
integer division to compare the 2d value against hardware limits:

    if ((d / 2) > (n - m))
        d = (n - m) * 2;
    else if ((d / 2) < (m / 2))
        d = m;

When d is odd, d/2 truncates, allowing values one beyond the hardware
maximum to pass. For example with n=7680, m=1, requesting 99.995%
duty:

    d = 15359  (raw 2d value)
    d / 2 = 7679  (truncated)
    n - m = 7679
    7679 > 7679 → false, check passes

But d=15359 exceeds the hardware limit of 2*(n-m)=15358. Writing this
invalid value causes the RCG to fail its configuration update, the
CMD_UPDATE bit never clears, and the clock output stops entirely.

The initial D value in __clk_rcg2_configure_mnd() correctly uses
direct comparison without division:

    d_val = clamp_t(u32, d_val, f->m, 2 * (f->n - f->m));

Align set_duty_cycle() with the same bounds by comparing directly:

    if (d > (n - m) * 2)
    else if (d < m)

Fixes: 7f891faf596e ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/clk/qcom/clk-rcg2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 732f34629ea2..153d2058c2a9 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -814,9 +814,9 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 	 */
 	d = clamp_val(d, 1, mask);
 
-	if ((d / 2) > (n - m))
+	if (d > (n - m) * 2)
 		d = (n - m) * 2;
-	else if ((d / 2) < (m / 2))
+	else if (d < m)
 		d = m;
 
 	not2d = ~d & mask;

-- 
2.53.0


