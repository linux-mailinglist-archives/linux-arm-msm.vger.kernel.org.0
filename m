Return-Path: <linux-arm-msm+bounces-23182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423190E3B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32EB41C214BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B1C4C98;
	Wed, 19 Jun 2024 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kWtjTl3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505528EC;
	Wed, 19 Jun 2024 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718779595; cv=none; b=HpM+8oOGcU5VFZ0gnJhYtksnJXhHAV1MN/Gv/u/yZxveww+rH+9ldUai9P/Bcg49BvkU3nILpV/3hEnxhEz80sQ9FEKgSyDWIsXL3eP2YKfyoOzQJPQIwAjq0C72z1Q/4bc7kNujkXQHSxkpd+WB8c9OF0+XHFm5ON0RX0xyVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718779595; c=relaxed/simple;
	bh=E9h5i7a/Nda7xk6rlhVkEEvh2+X53mJFzwmYnwIC/K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkMvDfuxoKJoCo1uoj4cAoTFsbRs4N2CUUm50hZoDa8BIbpUtygoN9NW9COfD10Ysse7878MbBFeCcSz7C/5+ZrQGMTTtsModaiZK7E5dPUH+SIK394edCZKtkjDVZXwjQBzSysnZ/qnsBMZwnlHDPWBAMczov7FjLAyThUQDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kWtjTl3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A832AC2BBFC;
	Wed, 19 Jun 2024 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718779595;
	bh=E9h5i7a/Nda7xk6rlhVkEEvh2+X53mJFzwmYnwIC/K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWtjTl3uCuNUCDVdB3RCY10JRxLw0KUOAs2etyf2d+x3v76raryHnifbrGkct2U2N
	 kvJYwWzFWwhaRGjT2jiduAsX3cZbsZIIJFBpmgQNl8VyAKSiXybZOAZSrqGk219QAF
	 HB3/fGhiTHDuRBEL7DtWJctxK3fwX7pAaQouxYzA=
Date: Wed, 19 Jun 2024 08:46:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <2024061910-lily-overlying-53c6@gregkh>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>

On Wed, Jun 19, 2024 at 12:15:03PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/12/2024 11:58 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> >> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> >> to be added for PD notifications and other missing features. Adding
> >> and maintaining new files from within fastrpc directory would be easy.
> >>
> >> Example of feature that is being planned to be introduced in a new C
> >> file:
> >> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  MAINTAINERS                          |  2 +-
> >>  drivers/misc/Kconfig                 | 13 +------------
> >>  drivers/misc/Makefile                |  2 +-
> >>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> >>  drivers/misc/fastrpc/Makefile        |  2 ++
> >>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> >>  6 files changed, 21 insertions(+), 14 deletions(-)
> >>  create mode 100644 drivers/misc/fastrpc/Kconfig
> >>  create mode 100644 drivers/misc/fastrpc/Makefile
> >>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > Please consider whether it makes sense to move to drivers/accel instead
> > (and possibly writing a better Kconfig entry, specifying that the driver
> > is to be used to offload execution to the DSP).
> Planning to keep the driver to misc/ only as part of this patch. Moving to accel/ might
> introduce some conventions to be followed which might require significant changes
> in driver.

Which is a good thing, please don't avoid this :)

thanks,

greg k-h

