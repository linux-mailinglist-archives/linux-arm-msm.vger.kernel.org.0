Return-Path: <linux-arm-msm+bounces-65072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49035B06559
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C131742E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 17:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E29E2868A1;
	Tue, 15 Jul 2025 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UY7Qt3kI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A72853EA;
	Tue, 15 Jul 2025 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752601643; cv=none; b=lYfR32RAMhmNyhMszhOTplzTJJJhCVyYaCwJ03pqR6lVyhQ3Ptbw2bwQIw+NEunF9AhBtWY7I5IULiTW6ac8Wpigndb15urtC+wyUkDX1JzXbmkmfI/yIHoGMKauGlVWDWXyYZ+aEPocEkadQy6RHkl3f60KI6J2JLcaAwKBpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752601643; c=relaxed/simple;
	bh=kAJgQF34BtJ6tPCZqAQZOjMTEIhkC9dl78nIaz2RI9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gam1c2zlqKW/o0fxvFc3Qsy7DgJUdO5ZQStRtMoAnuP3ymoq960mN2nmdxVke56oWv9rQ7oXvJ8JOt4VjMfthumAIFAlvu4uIPWxhxyxqt37GJioUjWMMGRIZPmTRjuXMTE2OCfO2CQl/R25+d5e35MrQIrK8tCWFdEcNM6sat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UY7Qt3kI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A460C4CEE3;
	Tue, 15 Jul 2025 17:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752601642;
	bh=kAJgQF34BtJ6tPCZqAQZOjMTEIhkC9dl78nIaz2RI9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UY7Qt3kIH7IHvezPVXF2p4wTXmxEJ1WDZZnjnOu+Sv6Sb7GZdR6Pu6oFnkP4G6Ktq
	 C4VNtKg4ivPH+LUi8gftVaBDO19Ytt20M/3pWKTY9LI64v8xZDDa8/ZhwlNHciOijV
	 vq5S9NueVzLfkDgffbIK7rKiH7Ao0J7vXvx23cFc=
Date: Tue, 15 Jul 2025 19:47:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
Message-ID: <2025071518-aware-tipping-4e27@gregkh>
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>

On Mon, Jul 14, 2025 at 10:17:02AM +0530, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.

"Deprecate"?  Looks like you are just deleting all of this code, what is
going to break when this is removed?  Are there any in-kernel users of
it?

> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.

Ok, so those are fine, but:

> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.

When is that going to happen?  Where are those patches?

> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.

Again, when is that going to be changed?  We can't break in-kernel users
:(

thanks,

greg k-h

