Return-Path: <linux-arm-msm+bounces-98003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLzdHU5EuGmLbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:56:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC429EA0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FD20302086D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4440533F5B9;
	Mon, 16 Mar 2026 17:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6U8wUd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203DE3264ED;
	Mon, 16 Mar 2026 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683582; cv=none; b=AP5LDpua9cZb3TLDxnDMWrgV7CkAo/Fj5VGpUjxhPYP72tmxz07ZCfZ1O1bR5tlLBxaz6sp2iznbxHakqs47zOeZqZ8pQAlidKzAhS3ZfNRDSoDN5FpHgdeyiCe5xOmu+n0puhUhNSoXODqU3ePfu1aV3rnhvZ3qppR2nGfv9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683582; c=relaxed/simple;
	bh=u6U72LK80q94E6wcmoifhQSRmxvgkHJMXXRBRH+wuGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XUqXMgrzibKZrhW9SB3NBUNbYunjrh8gKTFnqU0PaI7okznePpu2McklDfzJnNmJExb8CVQnzlNtIeblxd/yMaMvA/0UuFDUpEj5yYkJTVtyQOZijj92czQKCEAl/wgSUbq1WeNA9TNjV1pNFS1Yphx78MhiOZdIZpBVXs6JmPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6U8wUd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E73C19425;
	Mon, 16 Mar 2026 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683581;
	bh=u6U72LK80q94E6wcmoifhQSRmxvgkHJMXXRBRH+wuGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F6U8wUd8LZZxah+4N4b+GMuY3FMkSeHxFCAXlvkIyFtI3Tuf3YQf5w3tn16iMMJ5W
	 0Eh7TuNWMLTTqRSc51lBN4dtRaD0S0yUSaLhzWN1tngFzeF8tmEKax7NKgzLxgyiKn
	 dwyPJWnhG3GRY2Eh0LQ13IGJKctpzKDAc4+oKHSIoZGUpaeOO1HC398dxD6tuE9gP8
	 ub2jUO2ob6jci308BG0tUgo6V6p9Rx0Ao7SE+u4Wj9nRTZXlhM+lKJXe6EtJ/sArgX
	 BRqmeyg1lzvOJUoUJAUtfCU7TCOXB+ggLj/hiJ1ksXBaBmEinP/ORrAVvO+7gQfK/t
	 BepXUR8nxH1lg==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>, konrad.dybcio@oss.qualcomm.com, 
 Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 bjorande@quicinc.com, mukesh.savaliya@oss.qualcomm.com, 
 praveen.talari@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
In-Reply-To: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
References: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
Subject: Re: [PATCH v1] spi: geni-qcom: Fix CPHA and CPOL mode change
 detection
Message-Id: <177368357914.147197.2736857067753744270.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98003-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAFC429EA0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 18:53:31 +0530, Maramaina Naresh wrote:
> setup_fifo_params computes mode_changed from spi->mode flags but tests
> it against SE_SPI_CPHA and SE_SPI_CPOL, which are register offsets,
> not SPI mode bits. This causes CPHA and CPOL updates to be skipped
> on mode switches, leaving the controller with stale clock phase
> and polarity settings.
> 
> Fix this by using SPI_CPHA and SPI_CPOL to detect mode changes before
> updating the corresponding registers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: geni-qcom: Fix CPHA and CPOL mode change detection
      https://git.kernel.org/broonie/misc/c/ba3402f6c85b

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


