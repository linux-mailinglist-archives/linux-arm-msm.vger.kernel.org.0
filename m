Return-Path: <linux-arm-msm+bounces-92722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKiEExP6jWnz9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:04:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663C12F357
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36FE53008D24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444982836F;
	Thu, 12 Feb 2026 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzX4ko7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F410785;
	Thu, 12 Feb 2026 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912269; cv=none; b=iX/DqFWNYJ4K1jOF7FatnNfo3/noukFjdh4aO65ifBnRnxHboV0WiAV6u4rZ/YXO55HdWOZMnFKHuidykl/jHX190TkjJW7HG5+ntLozf4tSwK6koPCKehk/ZmNS7Xz7eZe/Mr1cCsoY2JmlrV4LKy6KBWklTtrDL6kcHqN2oW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912269; c=relaxed/simple;
	bh=zG3vhlFvghW4sRch3agdk4HtFi1WWculo4Dbsv90v5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f1aCj7kcH1KthfT7hqaB1S0phFfU330NAc/IWxoLuaSjQ6RKhI/rPEEgQG3t6nMqcxwfKhcu2duBDJbySdJ6iv90H7M+V5uy4D/Fd9MxqGgCt5Y+QLHan59ZrZou6K7Org143otqw6wYUTAunle/iC4miMenw/vf36Gx4MKeKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzX4ko7E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE077C4CEF7;
	Thu, 12 Feb 2026 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770912268;
	bh=zG3vhlFvghW4sRch3agdk4HtFi1WWculo4Dbsv90v5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hzX4ko7EYspEGRcixMcpwQKsSIMd4NUvi4X3QihYo8U+U8HMTnT2UlpaqFAg7mwSF
	 keulSKTk3S6wmDcGhhXgJ6OzIRLjSsJxMX7dHG2pBYX7kvctTBhFDiS0ycU2JVD6zy
	 E3bNr0fVa56Y5LYXVQyOZtxzXOOKU1BRX2gz/GqpCeVoVctIK0nFvuyNvyXJ4jHgTj
	 M345Sk40aBF5qc42aTiojYBpgTg6Ixjlxpf4dje/UTqqBLgJXIunrV0kMuOIP4d6Z0
	 qNKJRN0K10vwZ7NgAmbiXiSAeOMco9uucd3D255pp2qGPh4Hk/vc2Dd1fyc4Lnbhiy
	 SheZmDTQI1Zbw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260211-regulator-supply-name-length-v1-1-3875541c1576@oss.qualcomm.com>
References: <20260211-regulator-supply-name-length-v1-1-3875541c1576@oss.qualcomm.com>
Subject: Re: [PATCH] regulator: core: Remove regulator supply_name length
 limit
Message-Id: <177091226767.237262.6699917364293122804.b4-ty@kernel.org>
Date: Thu, 12 Feb 2026 16:04:27 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92722-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0663C12F357
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 21:37:14 -0600, Bjorn Andersson wrote:
> When creating the regulator object, associated with a consumer device,
> the supply_name is string formatted into a statically sized buffer on
> the stack, then strdup()'ed onto the heap.
> 
> Not only is the dance on the stack unnecessary, but when the device's
> name is long we might not fit the constructed supply_name in the fixed
> 64 byte buffer on the stack.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Remove regulator supply_name length limit
      commit: e243cdd87b911ce9968b62e4ab2b680dfadc4341

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


