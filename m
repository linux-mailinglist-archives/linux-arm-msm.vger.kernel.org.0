Return-Path: <linux-arm-msm+bounces-87928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48956CFF09A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 18:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E9D630019EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 17:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5FE34C154;
	Wed,  7 Jan 2026 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvB+4JhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6B3346A9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796795; cv=none; b=WHBsSoEHz+xy3rTxeWehhrCmEKXmXsgLt8+iiu7CY9AbIGO/c2+BgtY6Xw0MeSk+R5RtLcrauTAJVfCuwJg8c9SspN/XC6HMhoMr8rEQqQl9LpKeMFsMS966yGchzhFP/ilOZ6qdNr/Ma5khgTkY0WZHpzUsQDhdDfAKGFB3ATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796795; c=relaxed/simple;
	bh=Q75PUVfRtuY8QWTxv6BMBpiw7g7hOg3wxodzSzfH9tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKaPct7Goan7iMGSne/oXDAKQ4oCy2KnbH7aFAaIQ3HktMVjFEw/O6PeaLCDg5zB2SQZb/zem2pAD26wdmpRPFoXt6As2jbRQYZv5ILqzAVMcbH+Is0z/LDz8C08zw/EcrB8825tuypY1T0YLcSawjrF3beCu1g/WjigFfpDqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvB+4JhK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77913C4CEF7;
	Wed,  7 Jan 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767796795;
	bh=Q75PUVfRtuY8QWTxv6BMBpiw7g7hOg3wxodzSzfH9tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvB+4JhKbda4mmj0X3qM85nhPeACCBo00ZgxyMhayuSlC0L0OS7D9mSimB8nX5BeX
	 8WuokuV9MKk1J4NrOnxQcRJWsH5d8aGN2b+fXmBuva8SsAjAtsbCFJWNLzLlK8NJAw
	 fiIy5fa9X3gXTqmXtgarkOrjpugV3CeNN6QoWaC196EHcQtyBmeAHXgLMPiDU7GFcE
	 oHXjrt+iyi1LwU0dT5bd+Rx2oOvaN8sLMkyeKfuyzdIHLtRoUgrfOg8ZHe3k0IoqV1
	 m5bCtTgZk3Y1WRXqeu5YyFdWdXo7L7kf5U4kjSbl8lh5b2BEEiB7WqZtoFAKnS4Bjk
	 bYnvf1urtFHZw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vdUhM-000000000ym-15Vg;
	Wed, 07 Jan 2026 15:39:44 +0100
Date: Wed, 7 Jan 2026 15:39:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Simone Flavio Paris <simone.flavio.paris@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [BUG REPORT] arm64: dts: qcom: x1e80100: Audio routing issues on
 ThinkPad T14s Gen 6
Message-ID: <aV5wMKBZMIESIMbC@hovoldconsulting.com>
References: <CAG=QoF1cr3cFzgjRicLSr7KbwygQaHju1WKE_LK_U9Qmsgv13g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG=QoF1cr3cFzgjRicLSr7KbwygQaHju1WKE_LK_U9Qmsgv13g@mail.gmail.com>

On Wed, Jan 07, 2026 at 03:09:10PM +0100, Simone Flavio Paris wrote:

> I am testing the latest experimental kernels on the Lenovo ThinkPad
> T14s Gen 6 (Snapdragon X Elite).
> 
> I have encountered a specific issue with the audio subsystem: while
> the DSP and ALSA stack appear fully functional (firmware loads,
> streams are processed without errors), there is no analog output on
> speakers or headphones.
> 
> I have performed extensive diagnostics and manual mixer path
> configurations to rule out userspace/UCM issues. Below is a detailed
> technical report of the current status, routing attempts, and logs.
> 
> I hope this information helps in refining the machine driver or
> topology profiles for this specific device. I am available to test
> patches if needed.
> 
> [Technical Report]
> 
> Target Hardware: Lenovo ThinkPad T14s Gen 6 (21N1) - Snapdragon X
> Elite (X1E80100)
> OS: Ubuntu 25.10 (Debian-based)
> Kernel: 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC aarch64

You need to report this to your distro as this is not a mainline issue.

IIUC, Ubuntu disables audio by default until you pass a kernel parameter
due to the lack of speaker protection.

Johan

