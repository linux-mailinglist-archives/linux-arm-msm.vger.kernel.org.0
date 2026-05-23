Return-Path: <linux-arm-msm+bounces-109454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDLEOPkPEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB55BCA4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4647B3028333
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7577F3750AC;
	Sat, 23 May 2026 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLw6CYUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C3374758;
	Sat, 23 May 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502832; cv=none; b=A1Zyt5dS0NrmkFYXTnFQDWYTIiLD8pRG2nlgvnuq8ethoOGddncTng3471M74lKlgkcAOn3Bufv9cgH8l69z5G91Wo+bv2/8+VP8n3Q+o95BW6q0ptx4Beql+Oo59JmIn+gOye4F7joRKD5vhlWHzEzpOaqkrsKVXl9Qk2MII+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502832; c=relaxed/simple;
	bh=xgYCi3qkmOgaHMRhI/J6YKjD1P2TI+xIB9KtSqVT+hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTdzbx4sn5tjI9KjpBoeqbblVAk36hrRZRwTvAQ54f3Vn4gBwCLBBz928LB+GV+6WK1k9UyYy6/GcIlQS5h4/H76YPNXDvKx33Y9tpXNQHhARJsSW6N5L+PHiclHQgO1WiQWgiTROeX5KY8l9sn76aMDndTcjH1LSXmlwWe+c9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLw6CYUy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A677B1F00A3C;
	Sat, 23 May 2026 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502831;
	bh=YVIG0fnPQdUeV+IDA4F9T9rSBwFSrDOyYgCZw1WBV08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LLw6CYUyse/+jw4+E6VhkDBZfEJ37vnkAi7zEjkV3Smk7P2FH3QI+QccaTHZJ2hoy
	 sjlU8D6MFSA5Gim0aPiMeqWHqtfq9sTxGWPlyDPPttGDVkuy/GinaNaDZ9snek/ztB
	 SiQXscJYubYlm4cD0rM+Agv2oRccdvyGWYVQSc+d52VV/LgPL9axPf4AT9nrcaZq2o
	 gusYMKVPsa2uxhg8+yI+cMfNIQOr7S+VSXv4QHZqWMPMD5SEh1cN+Asd25oyVHWCos
	 npGm3lLdWhTyCbh1AYRSOilv2oplQ6TADwu+HCNkahbT4yTeD7movfogeoQuJOuPRE
	 LSvcp/xvUKc2w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
Date: Fri, 22 May 2026 21:19:58 -0500
Message-ID: <177950280368.1097700.1835328994684545490.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303150152.90685-1-mitltlatltl@gmail.com>
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109454-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 4BEB55BCA4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 03 Mar 2026 23:01:51 +0800, Pengyu Luo wrote:
> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> Gaokun3, the image will stuck at grey for seconds until msm takes
> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
      commit: 5285b046757844435d1db96c1b5c3a6621b2979a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

