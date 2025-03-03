Return-Path: <linux-arm-msm+bounces-49966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A1A4B816
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 08:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF94F16D593
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 07:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463131E573B;
	Mon,  3 Mar 2025 07:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAyuPAfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088321D6DDC;
	Mon,  3 Mar 2025 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740985631; cv=none; b=FA3Ib/5b5m+pDhvtfXyAYX/YO0uGGVG/tYn3n5VPvYusogSxUBKxAg7euGQ7bBJZHOyhYlq72mOxv2eQBZ4xIhAgI2hFpCbf9IjS9bcOo+vAC1LgbWxa3cbyQijAUJ/SRK0QO75muQKEhrW44dxexuUr/6ezWxEWly4UYLfOJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740985631; c=relaxed/simple;
	bh=MaU/9J4rYZguLJRFREIL4lOXQ5ryYtil1v54eokO2nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uI1k15hN3RBjiF56mv2SxNlbDA4D3jRPN21ac9gYycFLiTyFwTJ4QrOrOUXapfvrPWscC5ZOdm3P2WBK7Y9or2x1Kaa5cEVONX3wQSYtE1r6KXxguW8faLOUeH2w8Rg1qXFXRszSAo/lo4UMMSx5J6RPVoBRKgVyAI8Wa4mArug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAyuPAfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B851C4CED6;
	Mon,  3 Mar 2025 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740985630;
	bh=MaU/9J4rYZguLJRFREIL4lOXQ5ryYtil1v54eokO2nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tAyuPAfkzxDlkoVT6p1/oh+xXrJGTYE6EdI0DU87OVwF//74VuTdBJCTbe0T4vda9
	 x5K1Hzui0kzCcm1V/zY6j6+0LIlJmjBTeEm61+9qmkJqf9dqHVS8i2m9aqcAXsuTm5
	 QDlt5BclX1ItesBeefNrRS2PBWsTTGCIJ9eGU0bOYP59WrMyVWSex+QAcrW7dYKnjq
	 hPZgSyXb6WBBjgkcDCUTSexa192ADNFORVm3c2prOTHcW6dLghZ0+cM2zZe2OeLI0i
	 R5OSLYBFpdWaLSGlR2ClHpZDIY3JdVwRWnDlG6lnU8DrzGgEvi0aMdU0q8grfSH0js
	 HSkYnSyNWulNw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1toztI-0000000055w-2SHu;
	Mon, 03 Mar 2025 08:07:04 +0100
Date: Mon, 3 Mar 2025 08:07:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: ps883x: fix missing accessibility check
Message-ID: <Z8VVGBDh2VnxyHw0@hovoldconsulting.com>
References: <20250218152933.22992-1-johan+linaro@kernel.org>
 <20250218152933.22992-3-johan+linaro@kernel.org>
 <8c6f9c8c-3d03-45d3-b601-989e6c441501@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c6f9c8c-3d03-45d3-b601-989e6c441501@oldschoolsolutions.biz>

Hi Jens,

On Sun, Mar 02, 2025 at 02:34:41PM +0100, Jens Glathe wrote:
> On 2/18/25 16:29, Johan Hovold wrote:
> > Make sure that the retimer is accessible before registering to avoid
> > having later consumer calls fail to configure it, something which, for
> > example, can lead to a hotplugged display not being recognised:
> >
> > 	[drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110
> >
> > Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> unfortunately, this one goes south on the HP Omnibook X14, and also on
> the Elitebook G1Q. After excluding a lot of other causes, like inverted
> resets and wrong i2c channels, I did a bisect and landed at this commit.

According to the X14 ACPI tables there is no ps8830 on &i2c7i (I2C8),
which means that the devicetree is broken.

> Looking at it, I speculatively increased the firmware initialization
> delay to 200ms. To no effect. Reverting this patch "resolves" the issue.

This patch (series) only makes sure that there actually is a retimer at
the described address so it appears to work as intended.

You may unknowingly have been relying on firmware configuration or reset
values. Does orientation switching (SuperSpeed in both orientations) and
DP altmode work at all on the second USB-C port with this patch
reverted?

Johan

