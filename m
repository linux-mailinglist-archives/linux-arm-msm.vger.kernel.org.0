Return-Path: <linux-arm-msm+bounces-31456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F650974BB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6131F25263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53DE13B7BC;
	Wed, 11 Sep 2024 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iwYCyZRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F5D13AD06;
	Wed, 11 Sep 2024 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040760; cv=none; b=hD90Uh47KRp23G/k0FqcXk5KhCitFcV8++FV34JTRoIle2GFxiJxXyjEQtsSMKDsJ+LYz2njpnOaqwuf7cL4dL5Ei0fUFO95nvhAA8jF6ihjy7hAHTWbueSdllQEK7956sRnNXSXFer4sOf/KmscJ4W2IFzAA2OIG5JRzjTzNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040760; c=relaxed/simple;
	bh=E2t7Y8fUs8iygI4qmp0zAEqA/uoNNumg4kKQJC2Ab7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDXmzTpQD2VCXkGoDL9cfKqc0nSueP74xF4HaX3nXBE8NcLx+VQKR0EL8fwIyBcuoqVH/PUKz/XNOZdKWHdIcZD7sfRKd8n1pC9sY1RTthbOTeuusmrOJpC4qvQiAG5YS8tna6PHAnBLAkTTSPiytp4XUK4vD5RsGf2Eo0Or/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iwYCyZRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761C2C4CEC5;
	Wed, 11 Sep 2024 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726040760;
	bh=E2t7Y8fUs8iygI4qmp0zAEqA/uoNNumg4kKQJC2Ab7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwYCyZRwilrza2g+V5FcYcrKPo3jN/mf/4RilI8HiRPIBD/3KFpvrXt6ogwTOr7Xm
	 s0ESu6W2YHkVJ4ip9y2a0cVswjspdsSK72iIXD/FDhCakAdZr4z3Yq2RiiqxB+W61+
	 m/oHGaoX7rS6gLStZKWNPktLSYmgBm/+RSjoyyn8=
Date: Wed, 11 Sep 2024 09:45:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] serial: qcom-geni: fix console corruption
Message-ID: <2024091129-mayday-credible-c891@gregkh>
References: <20240906131336.23625-1-johan+linaro@kernel.org>
 <ZuE2WkMMkdRDzRFQ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuE2WkMMkdRDzRFQ@hovoldconsulting.com>

On Wed, Sep 11, 2024 at 08:19:06AM +0200, Johan Hovold wrote:
> On Fri, Sep 06, 2024 at 03:13:28PM +0200, Johan Hovold wrote:
> > This series is a follow-on series to the lockup fixes [1] that addresses
> > a number of issues in the Qualcomm GENI console code, including corrupt
> > console output during boot, which is a problem for automated CI testing.
> 
> > [1] https://lore.kernel.org/lkml/20240704101805.30612-1-johan+linaro@kernel.org/
> > 
> > Changes in v2
> >  - determine poll timeout in set_termios() and avoid hard coding fifo
> >    size in calculation
> >  - move fifo drain helper under console ifdef to avoid an unused function
> >    warning as reported by the kernel test robot
> >  - drop a redundant active check from fifo drain helper
> > 
> > 
> > Douglas Anderson (3):
> >   soc: qcom: geni-se: add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
> >   serial: qcom-geni: fix arg types for qcom_geni_serial_poll_bit()
> >   serial: qcom-geni: introduce qcom_geni_serial_poll_bitfield()
> > 
> > Johan Hovold (5):
> >   serial: qcom-geni: fix fifo polling timeout
> >   serial: qcom-geni: fix false console tx restart
> >   serial: qcom-geni: fix console corruption
> >   serial: qcom-geni: disable interrupts during console writes
> >   serial: qcom-geni: fix polled console corruption
> 
> Any chance we could these fixes into 6.12-rc1? 

Yes, let me catch up on patches today and tomorrow, have been traveling
for conferences and have a few days reprieve before the next rounds...

thanks,

greg k-h

