Return-Path: <linux-arm-msm+bounces-98579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGXRLhBku2lujQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2D2C51FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03262308AF4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222E2383C64;
	Thu, 19 Mar 2026 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSHTjflB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26252D7DD5;
	Thu, 19 Mar 2026 02:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888425; cv=none; b=kVk8/jiyixA8x6d7+KboJksDJqsVCAHcGElXoJRoRSIpwDO/cmo+oj2UzxaifHzrLiP+/cmB1mFYIvO5wD/ZGdlWLnH5WSVoYJ5pCaLT7maljn2pOjJ47QI9dJWkkskIKGC5noQPfSaeTF/I4rlecmNcXn1X4essJ8FFWdwgtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888425; c=relaxed/simple;
	bh=PLO9nS2n75vnUimWf1VeLbh8JTmsqbT3pzO7PHZj77o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzxFKJwE7Adbo1koLljNsxm8hVnzp9SHX9ZC7kDGfWvZ/8rfmYPDymqF7607XWaR3IndhjKaby3qDricu6sxWxrypxteXpFzfZ/chqAMn3QNzsacnDYues2c/uNIWfMe81sVf8BlqD8zrT0AqdVacYPW4JWslWeMaT+wXkI+t4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSHTjflB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C08C2BC9E;
	Thu, 19 Mar 2026 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888424;
	bh=PLO9nS2n75vnUimWf1VeLbh8JTmsqbT3pzO7PHZj77o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSHTjflBGUr3JUog/3GkFrvKecwTvrKBmORc8jHsc0CHBH9eI1nCSxdwy4OYIR+XJ
	 I25JMXSf2XezOo/bMDdckZ6jYuCFClbhRwL+wAJehm3bHRUNc9isv0cuuJoW/7nK47
	 arGJOOAgBZWhpgMB67RLrP44p28DkJqKfNKW9FihUVq0/FnmP6YjRGv9W+qe6YzOri
	 Ii8GOK679fiiVeil3FKY6pBbTzS18irZUDlJAylgHOyOuJeH1+uzf3lWE3tt1jUrGv
	 4NSsBFHu9swkvDrtTHlxGpmEiOMP/CmVYU8pO9CZAUvBSZpPLd9wgqNcBQNe3MuJmf
	 bBx1/XLCkg5Dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Date: Wed, 18 Mar 2026 21:46:45 -0500
Message-ID: <177388840382.11529.699263730640590840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,foss.st.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-98579-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 51C2D2C51FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 12:08:39 +0100, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/5] clk: qcom: kaanapali: Cleanup redundant header includes
      commit: 7b70ccfd5df61504a28a8dd316e44fcd2c8970e3
[2/5] clk: qcom: glymur: Cleanup redundant header includes
      commit: 320d45700c131740cb534f1fd2d7aae04d5f16a7
[3/5] clk: qcom: sm8750: Cleanup redundant header includes
      commit: 82e7613f5d23e9698004453c9cb1d6955373a5b5
[4/5] clk: qcom: milos: Cleanup redundant header includes
      commit: 84b21053fe18af080c6486cea2d68a40ce08a294
[5/5] clk: qcom: eliza: Cleanup redundant header includes
      commit: 04088a68258c3585767c9bae35d70812c69a5341

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

