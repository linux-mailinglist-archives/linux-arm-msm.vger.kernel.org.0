Return-Path: <linux-arm-msm+bounces-44332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68756A055C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 09:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658A416017E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 08:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8D91E32D9;
	Wed,  8 Jan 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZGclVKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29E1D47A2;
	Wed,  8 Jan 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326188; cv=none; b=CSCnUd9tUSA5Dj13RfGHE80jRJHjeXMlJfRlL44C1+qFetOFnqu7EIwxgzV+G6FqgpcZvZ9hrN7esfxsEWlXcX/ai2TtWhftY4yV/eXKmM8YaIxkh1S6WLhvT6AXC6SSBAiWLXeN59xDP0vR8Wg47ImP7WZO57JxiS41rIaAjRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326188; c=relaxed/simple;
	bh=FUHPavGu95mLpcSekpkxTvz7Ly+iwpz/CtUjQCubp4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BawVbYtgtUzGgjrf/WV2l8wxDHFnGoMMd1vYx+DH9n3aUwQQTnXJcX6pkZ7OmS7zY4i4Au4RtklBmFQpcrGolH9WRVGIlgYu/fIajfdudbtjoCtbxok//UVOSmcPKKiidrjmzaUJqmxFSQBLarA1N3oqBqUmdYV6u434pcjHVW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZGclVKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E5DC4CEE0;
	Wed,  8 Jan 2025 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736326188;
	bh=FUHPavGu95mLpcSekpkxTvz7Ly+iwpz/CtUjQCubp4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZGclVKP7jCDMezQjkPxYICqx0VviLKsXV1BYCdBfmKbNx/ZzpoKtuguS5SDKHN/3
	 ExT3e49SKSuXAFeAawAUgR+/Y8NH4JHiSF79R/SLv/SjqcjZcGnXBijTU0GslZvvNV
	 N927tOLkgRrAuIki8x3kZphgAGd8/JjsYKK1m58Y+/e3s3uZX/NIMD+95GAVhRXJSa
	 PaRA0B+AMtvRGip3KYpbZvkpvskArd9BqqYNqUWAd53yDThZb1JuKHmT7+wBSN9tWN
	 P3lAxIgs7n2zUAXEikp46pORsinJDPQbCXReR1I+AOsN7js2o5qu/cEBU2ZHIpMmiG
	 B7+hTwTICgaJg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVRl5-000000004JK-2M0p;
	Wed, 08 Jan 2025 09:49:47 +0100
Date: Wed, 8 Jan 2025 09:49:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
	gty0622@gmail.com, johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
Message-ID: <Z348Kzp0L1Howamt@hovoldconsulting.com>
References: <Z2WZbX2NajDFAgBk@hovoldconsulting.com>
 <20241221052626.451989-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241221052626.451989-1-mitltlatltl@gmail.com>

On Sat, Dec 21, 2024 at 01:26:25PM +0800, Pengyu Luo wrote:
> On Sat, Dec 21, 2024 at 12:20 AM Johan Hovold <johan@kernel.org> wrote:
> 
> > On Sat, Dec 14, 2024 at 03:39:27PM +0200, Dmitry Baryshkov wrote:
> > > On Sat, Dec 14, 2024 at 08:23:00PM +0800, Pengyu Luo wrote:
> > 
> > > > >> +
> > > > >> +                /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> > > > >> +                 * there is no calibrate data for huawei,
> > > > >> +                 * but they have the same subsystem-device id
> > > > >> +                 */
> > > > >> +                qcom,ath11k-calibration-variant = "LE_X13S";
> > 
> > > > Finally, I found something, after I enabled ath11k boot dbg, I got my
> > > > id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`
> > > >
> > > > With qca-swiss-army-knife (see [1])
> > > >
> > > > $ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
> > > > bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048
> > > >
> > > > It have already been here. So that means I don't need to extract from
> > > > Windows. I just extract it from linux-firmware then give it a variant
> > > > name and send patches to ath11k, right?
> > >
> > > No. Usually 255 is an ID that is used by a variety of boards. So,
> > > basically, you have to extract board data from Windows, add a proper
> > > calibration variant that is specific to your board and then send the
> > > resulting data to the ath11k mailing list.
> > 
> > The board files used by Windows are not compatible with the Linux
> > firmware, so the calibration data needs to come from Qualcomm.
> > 
> 
> Then I don't understand why those bdwlan.* files would be in the
> firmware tree.

Those (Windows) files are supposedly used by the Windows driver
firmware. The Linux firmware cannot consume those directly and Qualcomm
had to provide us a corresponding file for the X13s (which they then
included in board-2.bin and pushed to linux-firmware).

Johan

