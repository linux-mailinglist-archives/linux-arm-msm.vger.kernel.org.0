Return-Path: <linux-arm-msm+bounces-34917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF19A3A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E9931C2267B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DDC200BB4;
	Fri, 18 Oct 2024 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhLGb7YU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41A1E4929;
	Fri, 18 Oct 2024 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729244661; cv=none; b=Gwv4uzmVL+psj2cVS55iCAlJ4FNzR7BrHj8TsTcHiKEPhGMYhu0bqOZX+vdNaokMa4vkaBiq+RsSiI8IZnQTCEftwAqeaYmYgJlzoDXfVpiqXLhR9antyb/DMNUCaRpUpyBToNDk2LoE+5/6/pMLouAcKhATPlL3KdcxuG8dOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729244661; c=relaxed/simple;
	bh=OIuap2G5dUjlTi5DX/OoUzdj15MJ/l7OyUv/tmNk7z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpTr/SCykz7wS2XVZuWnHsvtAcsGe9u5AGbgh4yFjx3UFm3jzsMcCdM1Hn4qVJVaLqdbrBUzKJoRFdkbfIiYPJFuPYhLtb4r2X+WiUlMII0Ygacw8gAGb2ZJv3LfG4z3x+bM9iEZCtNgsUHiEB1JAkfr6WEPMNulPyR4y/6OsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhLGb7YU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8875C4CEC3;
	Fri, 18 Oct 2024 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729244661;
	bh=OIuap2G5dUjlTi5DX/OoUzdj15MJ/l7OyUv/tmNk7z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhLGb7YUQrCHSlV2vphM/b+PJfPxdlUqMwoMz4uUSNjNGXYOccK3TZI7UEXUJCvQI
	 Y/yv7y2gcsQOrThkXvYNubQpk0pXAC72RRnCBLtKtmUDgsySSfZtn7zo1yFKUsQzpT
	 jCumGwS8f/mlUdnrCSr6Qzu/gSbPYka4/QRlbEDMBEcCjSTEGXpvmDEHe8mszpTxqf
	 BUiyQZLeqVsfw3+ZGBChYxyVdTpUU4KbqgmVNC8HZMp/GRxMx4uThIH2SHj4cG7vrw
	 BAx4DkuGLVdYkq488df61YX1z1hrUBqHOlEKB1rbrZ6X8HgJrhKVEKXlLyIqgs6SiP
	 cKiiM8JlD62ow==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t1jX4-000000002Wf-2T6x;
	Fri, 18 Oct 2024 11:44:30 +0200
Date: Fri, 18 Oct 2024 11:44:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: x1e80100-crd: add rtc offset to
 set rtc time
Message-ID: <ZxIt_oct24WuIssO@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-5-jonathan@marek.ca>
 <Zw9ijUy04cC4Qzio@hovoldconsulting.com>
 <663cf3f6-3254-e490-d557-a12aa41a1628@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <663cf3f6-3254-e490-d557-a12aa41a1628@marek.ca>

On Wed, Oct 16, 2024 at 09:31:00AM -0400, Jonathan Marek wrote:
> On 10/16/24 2:51 AM, Johan Hovold wrote:
> > On Mon, Oct 14, 2024 at 08:47:29PM -0400, Jonathan Marek wrote:

> >> Note: the 0xbc offset is arbitrary, it just needs to not be already in use.
> > 
> > How did you verify that nothing is using this offset on this platform? I
> > assume we need someone with access to the docs to make sure it's not in
> > use as we did for sc8280xp.
>
> AFAIK qcom allocate things from the start of the SDAM, so allocating 
> from the end of the SDAM should be safe. And AFAIK this is supposed to 
> be a general purpose HLOS (linux/windows) SDAM block, so should be 
> mostly free to use.

From what I understand these registers are also used for things like
programmable LEDs (e.g. see 24e2d05d1b68 ("leds: Add driver for Qualcomm
LPG")). And who knows what else.

It would be good if someone from Qualcomm could confirm that these bytes
are free for use before merging. I've started asking around.

Johan

