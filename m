Return-Path: <linux-arm-msm+bounces-50255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E49A4ECD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 20:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B4E8E1D50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DFA21147F;
	Tue,  4 Mar 2025 17:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAyuPAfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43849278105
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741111001; cv=pass; b=jo1n9LsVXBqRo9O10UTWg2TVYJSmhZp+pdhwuQkO+55oRhCcjEOmHpx6St5VxNdyOjph+phStR2lxVScaxeQRwH2+nQx+wO1TYPXqJjvI+O5IdPwkNU95bhyZiGY1ge0NkIbXjaiuYzSbD81+It1uWgz58ieq357LMZyW2P9sok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741111001; c=relaxed/simple;
	bh=MaU/9J4rYZguLJRFREIL4lOXQ5ryYtil1v54eokO2nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYtSTDM5E5UN9/RCnHwEo+1HidYucv1kDD4wdfTkQIHls9qrWu3erRoTSZzC0h2xqhZ9jeJbnVJGjn5aUFmvDHygaJizhOV9UNufy47Wk5yQJpeHU3ayVc65EvRfsD4vrKOOOOC2cSZk5ou2CRcswk5iHQR2J6Sd5jnWB3v70IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAyuPAfk; arc=none smtp.client-ip=10.30.226.201; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 694EF40D0B8F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 20:56:38 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAyuPAfk
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6g965VtLzG1Yp
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:49:30 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 979E34274A; Tue,  4 Mar 2025 18:49:22 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAyuPAfk
X-Envelope-From: <linux-kernel+bounces-541073-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAyuPAfk
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 96A5E41F7E
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:07:32 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by fgw2.itu.edu.tr (Postfix) with SMTP id E2BCA2DCDE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:07:31 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A10647A27D8
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7B21E9B3A;
	Mon,  3 Mar 2025 07:07:13 +0000 (UTC)
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
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c6f9c8c-3d03-45d3-b601-989e6c441501@oldschoolsolutions.biz>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6g965VtLzG1Yp
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715672.62534@dU1qPNopf6dAv1CjKyo2/Q
X-ITU-MailScanner-SpamCheck: not spam

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


