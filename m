Return-Path: <linux-arm-msm+bounces-48519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD83A3C0C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB76D189C2B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 13:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335F41EB5CF;
	Wed, 19 Feb 2025 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myysLyLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032A01E47D6;
	Wed, 19 Feb 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973151; cv=none; b=Dj5AtzbDVrs5hPGKAj8uR+r/FlKqkJt13NPN8ThsadSz1Hvp3R74AsDUCvpyHtNo1cRWINcdw11GetP6Zpf0Sv62RNDR+QW7S6QdcfaOxhMn7OqIN/vHLU7y7ltRyF1ySqJIb9AtFlZGLmZF8KKRvnWCPdgr+E44pxi9arbtnNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973151; c=relaxed/simple;
	bh=kr5/iZkjd7ntlCerK+ncHbCvVFFwEVzZpVFBtYCh/vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYxbJsBOhwBmBVqWigBAI57AG2cuSSaBD/s0CQd6WU2rmBKNOlGDDFcUryyYkc4V0+JgKg0v7LgjlguUyxQ+LN16gh/RGt1ctiGfQRoPSGannodsRYiVCU1x9zbFcZsVuT9lSX14m76wO1Km30bdps0wDm5TEuDkNpURASmA/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myysLyLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F004C4CED1;
	Wed, 19 Feb 2025 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739973150;
	bh=kr5/iZkjd7ntlCerK+ncHbCvVFFwEVzZpVFBtYCh/vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myysLyLp4Cg4uvwCydiXZktTnu1bf5xY9vE0LJGSZxv0Hd1KJY8LyUtmaF1wC93pG
	 3ZGZJwfb9a9tb1/Quwxu+zbN6RXsWZ0C7Zv1E/R0ImBr7OXItsztbkJf2uP4SJoxVK
	 5RbguUcylQoqIP7cCpvKuJ7HPtuO8sO9jIrG8IkW1rM3YYdcS9KX/64Z3GKlAC/eY1
	 IVj23dE/wSgxETbFoDEvibgbuukH2qqu8b2ZMR7fmqAnR3BvuLzRDcYfaPgKOBfaou
	 EIRsEgV18Wpfp0X/3sXSQ3iCi1+UA6tCLdGjNHDQGBeJ5c0IEKp9xITsI2w55J63M0
	 qLhYIZdLt1sCQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkkVE-000000008GZ-0q6R;
	Wed, 19 Feb 2025 14:52:40 +0100
Date: Wed, 19 Feb 2025 14:52:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: host: pci_generic: Use
 pci_try_reset_function() to avoid deadlock
Message-ID: <Z7XiKBD63EE7ZzNr@hovoldconsulting.com>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
 <Z5EKrbXMTK9WBsbq@hovoldconsulting.com>
 <20250219131324.ohfrkuj32fifkmkt@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219131324.ohfrkuj32fifkmkt@thinkpad>

On Wed, Feb 19, 2025 at 06:43:24PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jan 22, 2025 at 04:11:41PM +0100, Johan Hovold wrote:

> > I can confirm that this patch (alone) fixes the deadlock on shutdown
> > and suspend as expected, but it does leave the system state that blocks
> > further suspend (this is with patches that tear down the PCI link).

> > > Cc: stable@vger.kernel.org # 5.12
> > > Reported-by: Johan Hovold <johan@kernel.org>
> > > Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com

> > > Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> Makes sense. Added the errno to the log and applied to patch to mhi/next with
> your tags. Thanks a lot!

Since this fixes a severe issue that hangs the machine on suspend and
shutdown, please try to get this fixed already in 6.14-rc.

Johan

