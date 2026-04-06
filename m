Return-Path: <linux-arm-msm+bounces-101981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJTfGbXX02nUnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB43A4F99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 478F8301C10F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBFD33554B;
	Mon,  6 Apr 2026 15:56:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74183274FDC;
	Mon,  6 Apr 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490977; cv=none; b=T1HzcMUTTsmTVwiVBe6mXSS4dWS3it6Nih7Ai7nUJQ0mePBCqSIpKPUbAZbBv3ZudUhajSmO5zaw1zwWoYYqyjqbuo9/2+a0gDYgGbH5TSw/r37BzDGKNzhTCA+BRpUvFV4IHkFThkC8JW3Ng4UYh9daulN8woY3bO2jixU/xzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490977; c=relaxed/simple;
	bh=Ys/9Xu/u9YLBD9mjOngQ23gaLl1IclquxZy1h3X8jGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MITz0mtKZIObg2yepxKrar2KCsQiUcLh5G9xAaN1JqANJNo5UlY1OwVe6RIbcR/0ZBhurCIHI3f1UIJOVByPhPjQ41zIdA8Sczmp3fCSF+wD74PDts//7z74mevfhyrEpYdiX8xSkZRW8TBz+ukhTvSAMrWCCL3y1A31jWRmQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1775490889t7b1de528
X-QQ-Originating-IP: 1Lsp/Ay1O240QkDd9GWAToVnEq6K27VPyQk9XwoXzdk=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Apr 2026 23:54:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7832132453133119468
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 0/5] clk: qcom: Fix RCG/branch MND divider and timeout
 issues
Date: Mon, 06 Apr 2026 23:54:32 +0800
Message-Id: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSwqDQBAFryK9TkM7iIRcJbgwM0/T+fiZVhHEu
 zsmu1c8qjYyRIXRLdsoYlHTvkuQXzLyz7prwRoSkxNXSiEl+8+bR99/uR3O2egK4yagwDWvRYK
 jpA4RvyOZ9+rPNj9e8NPZon0/AAsYNBJ4AAAA
X-Change-ID: 20260406-clk-qcom-gpclk-fixes-fde4e81a00d2
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Xilin Wu <sophon@radxa.com>, Mike Tipton <quic_mdtipton@quicinc.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Ys/9Xu/u9YLBD9mjOngQ23gaLl1IclquxZy1h3X8jGM=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJmXr7u/2fBo6THFBvYJx0IkWop19yr/8HrkZCU6U9Y6S
 f1QxyzzjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABPxvMTIMO1RgTtHt7NEmJ3b
 ysAK5z/r1/FfLeWc7NISml14Y/vKTQz/FIqf9G4xyM+e9tH4oaHr9RemT3k4zpfMb/K+PD9k2pf
 /7AA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OfARS1tHiMjeXmwI33LqjtaWAbDPjFx9DxqjA2gbLdFYGHQFCz6MiRfs
	DIcArfarfLLrjDvKED3IcCLuZagTW+jKdJRraLXJ/r36+dttfd+E6E+QvrMIq3fRm6o0u37
	gq+sVgZ6uT+5BHbFEv0GpCJqydcmwLxNBhRr7wu3Hi6OcDSHvWuHqPfDIv94trvuSwPaT/8
	9HqCW98AWliXJM9NLW4Q+07GfLl8CSi14pHdLe7tSQ8t6Cjbc0t7vKZZ2C431mN0xzre9CA
	ysNZrkLGJY9Ew0MBgjmjQ2IjmASpZdzB84dke2lLzs48C8eBee2CHnLM1usAx1HNkq/m8Ax
	btlsvxmpxOIEtjAFfY8+X8YNWGeWfZ8kFM+sZIsWJ++ToDojO8M0L3BxYzFqG9Z05Vf3hsQ
	VXJOpvCcfnMc/Ls9QS/HZlIJNxmFnC5NzrqKdoSeha/9sq2ri++fVhRalXRLACgZV+Po5oc
	tvm3e+FtAtZzxOpV0xLnZDFy1Uusggl/sy9mbXp+sUMwf7Eti9uRnOERILjm92IAlWO3s4k
	QUvDw82FjQmeZbIQiyMiD1vDnmUHidPq+tAbtNr4k2NOd8c4gmdOrJzdoFen/i4S0qrmyi5
	96THGQi9vOV4F9xLu1Ul0mEBLV06hXQmzqjYPzuxYBouQfobqowEbrFurSlTgAtkxLol/Qy
	6Y0teMkna8h8dmYMhDCajfCvF208T1IfhfWScfGEN9QUI1tLzvitYHOfJCtpSu8OFGeDSMF
	AmpzupdNvK9LwgHaZeWEiTMX9MRHFAhIovUDgyXQEGX2JJUd4g7mlktASUQQeiJTZV9hcE8
	xfuf6gswjoruDRbZqDudNmp4OPtSRnWuZU9AEVSALk19Aqwe+xZ1mIQwBZ6BwN+f+T/TtKt
	jUa8+glDR5TTrkRWAc87/6L7Uszckc073IyAydzsVz4LRg9sc8cCeTYJGD9uGzJBKzUylTn
	keVK+eyA2YRSnPhJUyX4p76omLEllIsO9Vm9h6CbLu+YxTFsHhKczz3fkrdOdmlGqMChqI+
	7in5s2NhuODTokbq+5hS0v9lp/SztFASMTGdGmM64EHw67FTmRUs/fl9EKQkY=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
	TAGGED_FROM(0.00)[bounces-101981-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.822];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DFB43A4F99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes several bugs in the Qualcomm clock RCG and branch
drivers that surface when clocks are used at low frequencies or with
the MND duty cycle control path (clk_rcg2_gp_ops).

Patches 1-2 fix the GP clock MND divider computation
(clk_rcg2_calc_mnd) and the duty cycle setting path
(clk_rcg2_set_duty_cycle). The calc_mnd function has u16 overflow
issues and incorrect n_max/pre_div calculations that produce wrong
frequencies. The set_duty_cycle function has a u32 overflow that
produces wrong duty cycles when n is large.

Patches 3-4 replace the fixed polling timeouts in clk_branch_wait()
and update_config() with dynamically computed values based on the
configured clock rate. The existing fixed timeouts (200 us / 500 us)
are too short for clocks running at low rates (tens of Hz to low kHz),
causing spurious timeout warnings and clock configuration failures.

Patch 5 fixes an integer truncation bug in the duty cycle boundary
checks that allows out-of-range values to be written to the D
register, causing RCG configuration update failures.

These bugs do not affect clocks using the standard clk_rcg2_ops with
pre-defined frequency tables, but they are triggered when GP clocks
are used with clk_rcg2_gp_ops for PWM-style output at arbitrary
frequencies and duty cycles.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (5):
      clk: qcom: clk-rcg2: fix clk_rcg2_calc_mnd() producing wrong M/N/pre_div
      clk: qcom: clk-rcg2: use 64-bit arithmetic in set_duty_cycle()
      clk: qcom: clk-branch: calculate timeout based on clock frequency
      clk: qcom: clk-rcg2: calculate timeout based on clock frequency
      clk: qcom: clk-rcg2: fix set_duty_cycle() integer overflow in boundary checks

 drivers/clk/qcom/clk-branch.c | 22 ++++++++++++++++--
 drivers/clk/qcom/clk-rcg.h    |  2 ++
 drivers/clk/qcom/clk-rcg2.c   | 53 ++++++++++++++++++++++++++++++++++---------
 3 files changed, 64 insertions(+), 13 deletions(-)
---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260406-clk-qcom-gpclk-fixes-fde4e81a00d2

Best regards,
--  
Xilin Wu <sophon@radxa.com>


