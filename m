Return-Path: <linux-arm-msm+bounces-37192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 480DF9BFD8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 06:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED68B1F2241A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 05:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6040A188CC9;
	Thu,  7 Nov 2024 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PCayK5iV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22A7F9;
	Thu,  7 Nov 2024 05:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730956748; cv=none; b=LBiPOiJXW3wWDwRB9cQHTtRh02pbU4sP8RCiNOdblm7v5s+NIoNtDwc3ftZQFnr9K7+WXIeUN+yxa5UdvTpuo4UYgEZorUiw4V1iMteXknAB9flcRXujtLs6E8UhmEiZ0+GOnI6LZ4ThPgT7B3nADSG42fwCFrD3rKTSSBVd4ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730956748; c=relaxed/simple;
	bh=imaBdG6VPv5Zinm38WuwPFasjLk9Ck4xpfL0gsFjycI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5hioSt4wCDm4CDhX6BVulG5PE4GKCapFtnjUnQGIWDbbW9YdaFFz33/OSXosxZKzmPkF/e/fkFydwU+glVoAPbRcTda22HpI6K/PcdVJ05D0p//qwfvt9BampJdZtGont9kvmSmm+SLN0BznFgVtE1hJNEjYYdXl/7UlhTQR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PCayK5iV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDEBC4CECC;
	Thu,  7 Nov 2024 05:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730956747;
	bh=imaBdG6VPv5Zinm38WuwPFasjLk9Ck4xpfL0gsFjycI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCayK5iVcR07s7EVKc5u/yAZ/StiG+QSN7hw5QBH8DvbXt5P7FaD+g8yLNA16Vjf4
	 BXlw84wybU5expUNtJBRlbBYDP4chC9J9ldiPpMLR9V1ABS/VCJVmCW5Cgg8wTyYRs
	 VgWu/ZKdm5nuBgb5r81EL6AM+NN6eMiVtFED1/HQ=
Date: Thu, 7 Nov 2024 06:18:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
Message-ID: <2024110729-trunks-hangup-01b5@gregkh>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>

On Wed, Nov 06, 2024 at 05:45:55PM +0200, Dmitry Baryshkov wrote:
> Instead of checking if any of the USB-C ports have orientation GPIO and
> thus is orientation-aware, check for the GPIO for the port being
> registered.

What is the visible affect of this change?

Does it fix an existing bug?

thanks,

greg k-h

