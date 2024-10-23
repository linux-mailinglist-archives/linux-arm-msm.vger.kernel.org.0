Return-Path: <linux-arm-msm+bounces-35609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F79ACFBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 18:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D3A1F228B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 16:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0D81CACCA;
	Wed, 23 Oct 2024 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQUSGdFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469FA7D07D;
	Wed, 23 Oct 2024 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729699846; cv=none; b=GzePGfA+BlICb0tpGS8/qPeyjgNH6kNXAKgz2h1lQjTwYQw9ThmvpsSlnJ9YxiUww/2P2OkQ1P2w11uDOS3q1uudJTuRytaIdmTNGjqoBslIskmv+FXf2OWBu5glYw7dNnnYMb53NPcD5E79Wqb/s2Q2itUnBR6ZipzvEHEIteo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729699846; c=relaxed/simple;
	bh=qxn9zzMc9LTHjJoCIJ5wmgWIscOldp9qfo6Yu6dG7vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2Krk8Tbnrs91Yz3FW3ypTBV/M5ikH7PK7GgqHn5a19wIszF1+L+kcf6XY5FX6GiNPsx7JUuI3ZsE3lYFHYTwT0nKfbXg3VVfjHgikoIbZ/arnORfl4qv1DvA3GATE+0UvMwfDXvmuHlMjvYTmJ8hb5xFHfETZ5bIvGEmAlvPy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQUSGdFt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD458C4CEC6;
	Wed, 23 Oct 2024 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729699845;
	bh=qxn9zzMc9LTHjJoCIJ5wmgWIscOldp9qfo6Yu6dG7vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQUSGdFtqZ1RMW2CnRROfvUOOGt3R5YoAhDzqhNqaDeZ66s00e4BVtrVO3e31Xb+J
	 SNmT8uJ6SxKI1FMFssrq6lLl4NnRqWpyhDklSvh5CjOdKNUMFEAU1Fubt/0gyc0kVS
	 OvnfRblqCbHMl92090KtWXVhx93rPGtSrJU0HMOebBsIUe6Cn6Wzx2UMr7cibXrxJh
	 zJ4IobIVdbvebHA34/nNwt7B4p/3tfRzvyvXTsYjamcSYZPe5WqyQPrbMkK31GLnp1
	 TfsfFlhHrCKf95nZKt4oiSi4EB78rwILUf38y51u0b5uAqdPZ+SOeBX3+zSMJJH3fR
	 6UtshLNdFN75A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3dwo-000000005rA-35XM;
	Wed, 23 Oct 2024 18:10:58 +0200
Date: Wed, 23 Oct 2024 18:10:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <ZxkgEjptmmHpQpfB@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
 <Zw5oEyMj6cPGFDEI@hovoldconsulting.com>
 <Zxdp2vHzREJAFkwj@linaro.org>
 <Zxif6vmh8BE_C-_n@hovoldconsulting.com>
 <ZximeTNi7huc95te@linaro.org>
 <ZxirM9HJELXGWVqv@hovoldconsulting.com>
 <ZxiuFRFnZFlcdMPs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxiuFRFnZFlcdMPs@linaro.org>

On Wed, Oct 23, 2024 at 11:04:37AM +0300, Abel Vesa wrote:
> On 24-10-23 09:52:19, Johan Hovold wrote:

> > I'm talking about an I/O pin here, you must generally not drive those
> > high before powering on the IC.
> > 
> > And AFAIU the same applies to clocks even though the risk of damage
> > there is lower.
> 
> As I stated before, enabling (or rather preparing, from kernel's point
> of view) will definitely glitch due to PLL switcing (unless the mux is
> glitchless from design). And there is literally no risk of enabling or
> keeping a clock enabled even if the consumer is powered off.

That's a separate discussion from whether you should supply clocks to an
unpowered IC, and you can get around that by making sure the IC is held
in reset until the clock is stable.

What does the datasheet say about the XTALO_REFCLK_IN pin? What's the
max voltage specified as?

And since the machine we are currently working on do not using a crystal
oscillator here, do you need to configure the device to use a clock
instead somehow?

Is there any mention of the refclk in the power-on sequence?

Johan

