Return-Path: <linux-arm-msm+bounces-101969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDv3Ge3P02n8mQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:23:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF443A4B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BDCE301B4D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAA2386565;
	Mon,  6 Apr 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9DrRGGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F7C2DF717;
	Mon,  6 Apr 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488979; cv=none; b=ORCOgse3YwLFHTG8W6lWkTni2t0/eee7hpTK4zqjnliFw0xQmD6v5UsP05QDW64MT6Ird6ejoZ4SNBNCNTPLWIaPsFDGO6a6JPamRTMkQaLEG/DZXLSIDjGsAuk3uMziMoqaSizfOloUCeFRaSLYOf9qn6Ck/Xa3ZKwW4E0H598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488979; c=relaxed/simple;
	bh=V4ELdVf5d9iHf/NqfvPUF5/Gp6/vCgjLUPBVli8v5Y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tPcorJPzXikSanZS9dBpAeHVwECiiOOiZL0AwPy6hpJS+VtA1bwiyyG5UMwf8TO1WJ7Hh4obe/BG7zgCmcA+NDYL49NOInHFlHcU4ZkpcItFVEqifBtXvZN3XCJAlWbN3uf8py617T+dkwMTH7lQpZgCq9PibjwUwZ6MsW5B+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9DrRGGO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BD0C4CEF7;
	Mon,  6 Apr 2026 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488979;
	bh=V4ELdVf5d9iHf/NqfvPUF5/Gp6/vCgjLUPBVli8v5Y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P9DrRGGOihCVFln9v4UQgmZpfqT//cg/2fP8X39NL1kiwBjH51vngb+iMgBN+hjRw
	 oPmWq5pTibhd9UQ8CpdCqc+VzbQZ3pfvkPloece51kKYsXUBTgX/wSZgkhGd5Pku3u
	 /DHJrU2KKwBbb86YH5qJPMzTaeZtpY4208sM/z6gfoY4MgMJ/QrNwCvQ7NRHVDd8WX
	 4TUAmgF56SX782YktzVOhJTtIikUYHhO2c2vpnvQ/+4JrtR09KbVeRseH2kr1BfL11
	 8b8BPCPNdEb0ejprEj/l8yDdSlhIf/unEVMuV+1N4ttpuC38B0eGN5nk6+xKlmWBVA
	 zY2CpC/PYC9Jg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
 ajay.nandam@oss.qualcomm.com
In-Reply-To: <20260326113531.3144998-1-ravi.hothi@oss.qualcomm.com>
References: <20260326113531.3144998-1-ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: explicitly enable speaker
 protection modules
Message-Id: <177547723276.46304.3835417500406745879.b4-ty@b4>
Date: Mon, 06 Apr 2026 13:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=V4ELdVf5d9iHf/NqfvPUF5/Gp6/vCgjLUPBVli8v5Y0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/QrUcsQyQKmQdAFDy8WUSXFBO7lKfFqJ9Sh
 OnXTPu+U5eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPP0AAKCRAk1otyXVSH
 0FNeB/9S4LLIB8Uxjus5deubV+o3tuKysNHCTli/LPKzJTG7MLP6YD4QhaquM+bXrC7GCPIY5IB
 YFCvdNeFL16t77W8Ee/8FYp5NQIijGTSQKnB1lPZ3oMkibtaoJWg9VSpZjKY4GjU9osSUiu/CzW
 jPCddtrxY8UcqpLQSFl+jPl5aaaxszDisNiXBZTHwCj3MdXtBoSZ59ycsSdukcA86xxFGk7Y9pZ
 dhc30A0ttPQMHMBM+ynOjvkd1XKs1XokTNKDfQP+kogF4JcqWnWp1DQFkE3FG/Moous5xNUWDVB
 TUreXjPM0gcE9fiIX01C+CelHDq5U67jm+mOdn0u0l3li2I0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101969-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFF443A4B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 17:05:31 +0530, Ravi Hothi wrote:
> ASoC: qcom: audioreach: explicitly enable speaker protection modules

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: qcom: audioreach: explicitly enable speaker protection modules
      https://git.kernel.org/broonie/sound/c/b481eabe5a19

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


