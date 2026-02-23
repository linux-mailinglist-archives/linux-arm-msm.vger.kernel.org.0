Return-Path: <linux-arm-msm+bounces-93796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F7WJc2xnGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:00:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991C17CA25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B24A314028D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2CC376472;
	Mon, 23 Feb 2026 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaWd93xs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8E374759;
	Mon, 23 Feb 2026 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876587; cv=none; b=lDFYc8Uss7e7L1lLYupSxllNIVr8Ixv+VoW+149BgVm9nUg/FndSH9avgEaYJTxORqbsuGZMLKxCKLhvxFsjPu8ry+G0rtf/FUmC7F3pqXIqGgdLH0D5sEB/+paZFkPOWHTL6KyPdlQN5QRCNqwgzy2AjR8fO+PHqLuGAZ40x8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876587; c=relaxed/simple;
	bh=Ecfr8DMv4Q99AjnPWao+FKVqCDsgNI+DK3ImgjrLbN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uXZK2vnx3k8IP+koJuY/3QUdvvz4TJtZg6Q07Pr/DTzhQelUTAmVsFWGPcoBcdYeG3Xjm11u09LDCv6X5oPhCek/4SUA7L8ipI1jm6JyPz/AubM6iFYGmvKummDUtH1DBcpM2pmicYEqIhL4ZjnF3tigCBURR1PtF0WAYvAzpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaWd93xs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26343C19423;
	Mon, 23 Feb 2026 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876586;
	bh=Ecfr8DMv4Q99AjnPWao+FKVqCDsgNI+DK3ImgjrLbN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MaWd93xs/xChaybh6tiC11pS9QgMaH5AJIencz4tyFDk/3GAsCCAT6QR3Ij1liN37
	 ThxNMj0dFY2dgSqLEP7aAwXkUkbzuhU7t4U8rf+S4bd055pDCZ3evEdcnDCOYDAFWQ
	 YSA0wWoprE+2Jl/HMm89yDBgLTz9l1U5arBsxWvFQg4vRvaniyYjnK9VyjybK4uI8N
	 yh7sAXM52kun7mIW3B+/X1jAnZdLf+qyhGdYFYHECSMIfuwNxNJBivSm03o65U4AM5
	 /wIHn4k9iWzxyyyQPf31cvyEEA3eZa87OmroRTO2H25GH1OrTYy9BQyCWw41tvSmUi
	 EVu+S5G3E2ewA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: dispcc: fix clock ops used for DPTX AUX clocks
Date: Mon, 23 Feb 2026 13:56:08 -0600
Message-ID: <177187657322.166046.12831842737223752799.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1991C17CA25
X-Rspamd-Action: no action


On Mon, 12 Jan 2026 04:12:21 +0200, Dmitry Baryshkov wrote:
> Correct clock ops used for DPTX1 AUX clock on Glymur and SM8450
> platforms.
> 
> 

Applied, thanks!

[1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX clock source
      commit: e7c8eb1646db5d967d77ee67793dd95a2c5ff451
[2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source
      commit: 141af1be817c42c7f1e1605348d4b1983d319bea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

