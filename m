Return-Path: <linux-arm-msm+bounces-60127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E3EACC3F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613C43A2A2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639E81CAA96;
	Tue,  3 Jun 2025 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cki1LqXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9281B0F2C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945180; cv=none; b=VHKn7vP8teBfY7RvWV3epcGqYKfIxXT90XLndJ9g2NSG5LdzDpvUxHXCG4hLtMh//SESZMwFnmG8hubpd88lFQgHQhk62zu929QUvokE1UkJFuT7v8Mm8tRwovNLaP0gZF9jStIXuG8bS+gW223cfr7SVFtW3z/HU/f8mLfjrxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945180; c=relaxed/simple;
	bh=gi3oft0WXr5q3unDMkBIoaq0APtn0DLl7D3nsEpEc84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwybECPkBPVfLcbTD2QCdWgqGdzSMIrgVHjIbw7p24lvTAbUIYmOVYjys6q7c9p5f7aVo4nQz6qLdTXKijxuUI27gYqMtzfRks/ZvtrW+UHgMFX4IATJyBwLBvCAlNFKp6GWi8VROKiMYu89Dvzj2JqdCE/MYnu8j+q7Ov9iQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cki1LqXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0064C4CEED;
	Tue,  3 Jun 2025 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748945179;
	bh=gi3oft0WXr5q3unDMkBIoaq0APtn0DLl7D3nsEpEc84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cki1LqXLNSaVM17Fheel8BhlA2LKQfwpzuEihn19HWH5/oI3cAjk/TyxkHG2xLtk5
	 T86Hr0V+OGRmjOKIPOFe+/LCfFafydPPZttwDg4Gu+8LBdiQhWVkNUaQqLFRQRtq0F
	 DSNJlOvstEBfy+f9Nfbnsv1UXmD/uG2QGiBv9/CxM1E9NeSZIrAWdulWi61uNpZuBC
	 Zs+yn1d7DoTcfl0Akt8zRAv7Yc+pFNN+2h1qLMqw6rsz8svATxk0XrWuC1aBnYd6Dl
	 DVdVILU0WCYwte8lrFswLQ/Zr3HQ6VoW2wZpd/MYUn9Woi8bSdtoidIJyzVO4M8aBm
	 eWhSC9lmGjdkQ==
Date: Tue, 3 Jun 2025 11:06:15 +0100
From: Lee Jones <lee@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>, arm@kernel.org, soc@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.16
Message-ID: <20250603100615.GF7758@google.com>
References: <20250520024916.39712-1-andersson@kernel.org>
 <20250603084615.GA1728274@google.com>
 <DS7PR19MB8883BFF2E80F50F4F6CCC5E09D6DA@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR19MB8883BFF2E80F50F4F6CCC5E09D6DA@DS7PR19MB8883.namprd19.prod.outlook.com>

On Tue, 03 Jun 2025, George Moussalem wrote:

> Hi Lee, please see inline.
> 
> On 6/3/25 12:46, Lee Jones wrote:
> > On Mon, 19 May 2025, Bjorn Andersson wrote:
> > 
> > > 
> > > The following changes since commit 2c04e58e30ce858cc2be531298312c67c7d55fc3:
> > > 
> > >    soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16-2
> > > 
> > > for you to fetch changes up to 936badf282388be78094e55bd5e2c96f86635e48:
> > > 
> > >    docs: firmware: qcom_scm: Fix kernel-doc warning (2025-05-19 18:04:28 -0500)
> > > 
> > > ----------------------------------------------------------------
> > > More Qualcomm driver updates for v6.16
> > > 
> > > Allow HP EliteBook Ultra G1q to use QSSECOM for UEFI variable acecss.
> > > Add missing compatible for IPQ5018 TCSR block. Fix a kernel-doc warning
> > > in SCM driver.
> > > 
> > > ----------------------------------------------------------------
> > > George Moussalem (1):
> > >        dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018
> > 
> > Why is this commit in here?
> > 
> > Where and when did you pick this up?  I don't see anything in LORE.
> 
> https://lore.kernel.org/all/20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com/

This is the thread confirming that I had accepted this into the mfd tree.

I'm asking how / why this was applied to arm-soc via the qcom tree.

-- 
Lee Jones [李琼斯]

