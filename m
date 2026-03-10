Return-Path: <linux-arm-msm+bounces-96450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC3pNZ2Gr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FFB244656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02E3C302E574
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87163AEF57;
	Tue, 10 Mar 2026 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecvzii/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B63A4522;
	Tue, 10 Mar 2026 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110856; cv=none; b=b6JaIYo1St/5w5pknx9IWbCmDhUOBbufbdZj95oWZoyq4S6p1PIIYogpqp7alhpsZwiITnymRKj71VD5rHbRm4CqhTWgZRwphKmATjehU5ElDODfre5NP9MLQJ+7N3pcxZPC/c3Lzpu/yHZpQyyYgtV4laf18lQ0j94er0XA/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110856; c=relaxed/simple;
	bh=B0/1bU5zID8Qrgp1bqvLKiKsWfx3028CighHJzAxGP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzkiJ8/tsWqEJe0zpsAETaTe+an18x6lRG/8pXYRr0hM8FKsbOilEGTbYh6X9UzqQ7/Dgl0H2N5wr9Ral3Dn5D0EYHky96qoVmpRA6HbgIFepChqi6EuzGjk8qdVKjcgFzaUBqEBN4SygTpISCsOhSWa4vIHQUuEbWR5oVkRVKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecvzii/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47397C2BCB0;
	Tue, 10 Mar 2026 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110856;
	bh=B0/1bU5zID8Qrgp1bqvLKiKsWfx3028CighHJzAxGP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ecvzii/zMVo+sD9owtpcOdbfWg9XKgCf1AEkAMYGQUvPALOCc1zujd2STk9Ffx5mw
	 tgIKYBVCq71DEnmKBn2i8N07BQDjevs5Xs/gsPQ7qw5iw+PIdDASiLd8VFcCxZ8mml
	 ZmUJHQtv6OLBxYXNzC7pJ26XqFLMq7Zym7t8XjncsrqjbiWjzXQ1up/VmYehvMHWOm
	 xDPyoaTxEvwY3gqNRf/0uxFCKiuLCdENzEti3lDVhG9+UFk5v1tk7YO6if/htVGGyx
	 Gp8Dwq4LvWpnsWnpQU4URrYhLBcQaj9z+JJG1Lg9LwRwS6cRMwY4XxRKmQIT1AxIvZ
	 0a7WeIbGeNcGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
Date: Mon,  9 Mar 2026 21:45:39 -0500
Message-ID: <177311073293.23763.5142459029233496147.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303115550.9279-1-mitltlatltl@gmail.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7FFB244656
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96450-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Tue, 03 Mar 2026 19:55:50 +0800, Pengyu Luo wrote:
> The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> byte_intf_clk, the rate-change propagates through the divider up to the
> parent PLL (byte_clk_src), halving the byte clock rate.
> 
> A simiar issue had been also encountered on SM8750.
> b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
      commit: 0b151a6307205eb867250985a910a88787cbf12e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

