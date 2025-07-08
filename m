Return-Path: <linux-arm-msm+bounces-63979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78068AFC4EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53EE418920F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA87829A9FE;
	Tue,  8 Jul 2025 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wst4Hy1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C91910A1F;
	Tue,  8 Jul 2025 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961689; cv=none; b=NQ7mgraxZFR8L/QJMigQ4+j6M12ncUlTENedA6rx9ohdIMwannj+zXMln2cVpu8YjkrrcdhVAuobg0KnSCb5XS66AO9E+jSL2A2AzFzvN8Cy7XRwtQVy3iAMFk5W1/3JV77Uchq0MJSy/WrzqN/jyjT6QJS8QpJe1sfcO1UpHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961689; c=relaxed/simple;
	bh=1IcQdHGZAxNprOzffGTwM8MUgD1tKayzq0CNL3/5vEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpp+c+Lc2rmgLcZwDSA9wKroK7mwNT9BYdo9DxO0g7iAY1GMsv1KXwzLpn4BdTyf6EXT6hpkqSZ23XZHX9oYWT7BAn3Dk/WP7HgOh+pL6FR8U2uDbevc6UyYeIItca/PUchVM88W+UWWWs+V62k7W5HEvv+Wk14ti6pqvioykUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wst4Hy1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C70C4CEED;
	Tue,  8 Jul 2025 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751961689;
	bh=1IcQdHGZAxNprOzffGTwM8MUgD1tKayzq0CNL3/5vEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wst4Hy1/iqao1N+kkvodH0dHZDkEjAOZhUL27lcYPvSBApGWx8jNcIpjtA9BfS5/M
	 Fpn2eoP1RtKxUEGM989UxLBOv53epAVSRSrCAOFg38bNSfQa2V7OdjqGfH86wfEV7m
	 rt1n69DDZOpjm6A5f+wb8tRVFbL3vS+bJxKdB1Zk=
Date: Tue, 8 Jul 2025 10:01:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025070843-strangely-unplanted-3ef5@gregkh>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
 <2025062812-passive-untracked-1231@gregkh>
 <CAPHGfUOUR=m2rq-rFbUbWjF93qwY5ikHc+M0_KuHOut86z+Mqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPHGfUOUR=m2rq-rFbUbWjF93qwY5ikHc+M0_KuHOut86z+Mqg@mail.gmail.com>

On Tue, Jul 08, 2025 at 11:23:56AM +0530, Komal Bajaj wrote:
> On Sat, Jun 28, 2025 at 8:06 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
> > > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > > as read-only for HLOS, enforcing access restrictions that prohibit
> > > direct memory-mapped writes via writel().
> > >
> > > Attempts to write to this region from HLOS can result in silent failures
> > > or memory access violations, particularly when toggling EUD (Embedded
> > > USB Debugger) state. To ensure secure register access, modify the driver
> > > to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> > > Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> > > protected memory regions, enabling reliable control over EUD state.
> > >
> > > SC7280, the only user of EUD is also affected, indicating that this could
> > > never have worked on a properly fused device.
> > >
> > > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > * Drop separate compatible to be added for secure eud
> > > * Use secure call to access EUD mode manager register
> > > * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> > >
> > >  drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
> > >  1 file changed, 14 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> > > index 83079c414b4f..30c999c49eb0 100644
> > > --- a/drivers/usb/misc/qcom_eud.c
> > > +++ b/drivers/usb/misc/qcom_eud.c
> > > @@ -16,6 +16,8 @@
> > >  #include <linux/sysfs.h>
> > >  #include <linux/usb/role.h>
> > >
> > > +#include <linux/firmware/qcom/qcom_scm.h>
> >
> > Why the blank line before this #include line?
> 
> The qcom_scm.h header has been placed in a distinct paragraph to clearly
> differentiate it from generic subsystem headers, with a blank line included
> for visual distinction

No need for this, it's pretty obvious this is the case when all in one
long list.

thanks,

greg k-h

