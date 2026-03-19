Return-Path: <linux-arm-msm+bounces-98590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMr0MD9uu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:32:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619D2C5842
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35C33146FB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263152D2495;
	Thu, 19 Mar 2026 03:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbBKns0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034992D0C9C;
	Thu, 19 Mar 2026 03:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891091; cv=none; b=t25tnU23/k+LlvhmxCGCCC+60+WuQtGR68Ew6Qf3UgCYreWUp2ag59EkU2A/uewWlSOZTIEZIh8TnZ5X+xelaowrvRPZVz33TuGEtynBTgHIBpNg2onEG20qtIrkmUiLbggcbJHH9n9cDG15/kaq5EHgl0Tl5pbEclvktmTnVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891091; c=relaxed/simple;
	bh=g57457p8RBrYZO0BjZHXrF630xJBxLfW+k3vvpzx9Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaiENlSAfKrDMWcioySC9/HT4DNJeQhZ0j2q6Fr/h5hBo91zfS9XlNw+zJzdsiZQ9dw6bKh/b0MG/TrfpTSnCNEieyrPBZfmSfBaVqRHu6a6/yblcPGgI5GZK9tLIpKik7brEEGbL0Op7cyIGBBRR3VxyMeV7wg5M/uT03IHJWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbBKns0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BD7C19421;
	Thu, 19 Mar 2026 03:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891090;
	bh=g57457p8RBrYZO0BjZHXrF630xJBxLfW+k3vvpzx9Z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbBKns0HNE+tfJBF3PPspt5pHd78ZuOWo7ws1Fr/+johImEREiyncdbzuwsM5j2Hg
	 kqpJ2uTQRZDoxHLlas8k/yfkdMtiZL5SuB8qacpohq6UqYqk/srcCl+WYFEKQpSEf7
	 FksiQerEc/UOEthbZCv+xrAbWmGPEUnk74PM5ojP98JyDbrY6Mh3lWskZ2EvyLo9jy
	 RIp/g45b+XteKbDUqrLks3C9VS8oqOrP/2j1p4Yz+7HBbP0dY6dDIdXQor3nht+AiH
	 ZvX4j1SmR+vCriw60onAqIrb+r71eSyt1+9xNhFPC+plgoEmP8DB6uG2xt7EuMP7aA
	 kVvCI037Cn98Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: John Crispin <john@phrozen.org>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
Date: Wed, 18 Mar 2026 22:31:13 -0500
Message-ID: <177389107879.16612.7058004408525763532.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311182147.30266-1-ansuelsmth@gmail.com>
References: <20260311182147.30266-1-ansuelsmth@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98590-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4619D2C5842
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 19:21:42 +0100, Christian Marangi wrote:
> The XO clock source is always-on in hardware and cannot be gated.
> Without CLK_IS_CRITICAL, runtime PM of downstream consumers (such as
> the CMN PLL driver) cascades a disable up to gcc_xo_clk_src, causing
> a branch status timeout warning.
> 
> The IPQ8074 GCC driver already marks this clock as CLK_IS_CRITICAL.
> Apply the same fix to IPQ6018.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
      commit: 27c7ec7ad7dbc7baeede6ca7429f294bc33cae13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

