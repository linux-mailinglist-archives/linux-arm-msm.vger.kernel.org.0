Return-Path: <linux-arm-msm+bounces-98260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmUE82auWn5KwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:17:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AF2B0CBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36A993056E3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164D037F8C3;
	Tue, 17 Mar 2026 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDCqJ8iD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E750637F014;
	Tue, 17 Mar 2026 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771052; cv=none; b=W89fcN8JTtG0qSOt22vhh+w2kZ51aPaVmBKCLMbH0/zG59idudFgGKUwlW1YrkOl7HTd6cXJHhA2Mte9g09d4EWBRVXEpEnFk/J2H6V1s1WPVn2DFlspnjfopml2HeAQu17fSnxJUab9Sz0jhyXStIVnuYdh3Jz5RxkDDHQrjLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771052; c=relaxed/simple;
	bh=RZvn1dic6EIVlx7N2+rM18xb8N8/qb8v0jUhv5SSeF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sbg2OaWyl/f70j/Rxfyl3gpPN5e0gwvoqRDA0zd1XwW2Zbk/OuKUXL+t0pFwp0jHBFz5HueCVz4t3l+yMCNo1lJvKYetUs3YshqkbylgCIoky3cpLMJjzK5H1gQVbOIkp0s3Wx2huff2uBbxu8gsJb1WZLwzxsnds8CG3LMi5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDCqJ8iD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F95DC4CEF7;
	Tue, 17 Mar 2026 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773771051;
	bh=RZvn1dic6EIVlx7N2+rM18xb8N8/qb8v0jUhv5SSeF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gDCqJ8iDiOVqxQgLn7uBkZSx/AWRK6sCSAo8+44HT75A7fvdv93HM8zUsTeXc9bDZ
	 9j3rEu7nkeheE8fq1XVbL+M/6/zfuGIunuV/YQreyJcBYqP86eJ9vjCkIT12psg348
	 yBTNMSjSy/d3i4taf2g21Y9sud7DFak73aYx+e/kvU3Fdzw3ys/nzLg5UPx7gvpfqN
	 aEnZ+B2PZXthpOfTjOSTbpxBUJZo103B1NXAgKc8Sj4lhgkXxmfzX8dHHKJmn+2loz
	 Cyu1u6fo6GV0fQ7q1zrUw5F/ofo8+0/6bEHy1JEwnY3vGnoHJYoLVm57eXSyVLjbmm
	 ya/fMcfPDFfWA==
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
 konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
 jyothi.seerapu@oss.qualcomm.com
In-Reply-To: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
References: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
Subject: Re: [PATCH v1] spi: geni-qcom: Check DMA interrupts early in ISR
Message-Id: <177377104979.579754.15377826467433145988.b4-ty@b4>
Date: Tue, 17 Mar 2026 18:10:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98260-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E08AF2B0CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 21:49:01 +0530, Praveen Talari wrote:
> The current interrupt handler only checks the GENI main IRQ status
> (m_irq) before deciding to return IRQ_NONE. This can lead to spurious
> IRQ_NONE returns when DMA interrupts are pending but m_irq is zero.
> 
> Move the DMA TX/RX status register reads to the beginning of the ISR,
> right after reading m_irq. Update the early return condition to check
> all three status registers (m_irq, dma_tx_status, dma_rx_status) before
> returning IRQ_NONE.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: geni-qcom: Check DMA interrupts early in ISR
      https://git.kernel.org/broonie/misc/c/8c89a077ca79

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


