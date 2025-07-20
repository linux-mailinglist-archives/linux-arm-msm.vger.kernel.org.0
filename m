Return-Path: <linux-arm-msm+bounces-65788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73DB0B59F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 13:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F54189B5A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 11:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A131E376C;
	Sun, 20 Jul 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D6GotjCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A512E7F;
	Sun, 20 Jul 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753011622; cv=none; b=fn0qbEKzA1Ja1XWxbvSuNS6NnpbmD/VZVonpLjkAMnY6b7gl7psFA/OTlDqK38YiZY92kJYOzxA/qZG4+qgMeZ4mlapiaDWWqFAjKKWsgOJvC2cavN9XLtys2MDnXOfKJmaQuyvtwlu/qbLS6m2LRgRNRtdqX+obGDo/OgcfUY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753011622; c=relaxed/simple;
	bh=pjDOmPsSd1VdBpRg5iH+lfVFwZTEL+/aUFCOxBbqhlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xcaxn5Yq2vGpjOBIDWS4aJ1zDHhO59JOxZ+F4pXrw3FoG8x75oHYCKNavzlvNIWHHH38W3aTF2RX0niusK6/nypmLoIiGI4sCCI1FIRevgu5XKiLuFkc3i/D6KInaNqDXlj88pDQhTlKbWIXeypqFSbBc63vJ44UzciOYMnEfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D6GotjCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14E3C4CEE7;
	Sun, 20 Jul 2025 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753011622;
	bh=pjDOmPsSd1VdBpRg5iH+lfVFwZTEL+/aUFCOxBbqhlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6GotjClbic3B7RU4bx20XE+wSwsAeu2MatiBFaVGQxLFqXNI9a5/dTD301MgvYIB
	 +8WWVx39xipiXmUzQJnRlk3mNNmBUjhFbdkqoOos8U9VgEXnNfqh0cAR0f7t5U2iHl
	 w29cjdF47ZE3Jo7nH6eLNsF931xixkrMVjCSH5/M=
Date: Sun, 20 Jul 2025 13:40:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: dwc3: qcom: Remove extcon functionality from glue
Message-ID: <2025072021-rounding-oversized-5b4b@gregkh>
References: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>

On Fri, Jul 18, 2025 at 11:08:56AM +0530, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver.

It's not "deprecate", it is "delete".  "deprecate" means that you don't
want future users of this, you are flat out deleting it entirely.

> Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings.

When is this happening?

> While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon. None of the existing in-kernel extcon users
> have moved to using new bindings yet, so this change doesn't affect
> any existing users.

I don't understand, who does this affect?

> On upstream, summary of targets/platforms using extcon is as follows:

What is "upstream" here?  In-tree?  We only have one development place :)

> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role switching.

"most" do, but not all.

> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI's Type-C Port controller chip to provide extcon. If
> usb on this platform is being flattened, then effort should be put in to
> define a usb-c-connector device in DT and make use of role switch in
> TUSB320L driver.

I really still do not understand what is happening here.

Does this break existing in-tree users?  If yes, we can't do that.  If
no, they this is just unused code?  That's all that we should be
concerned about here.

> ---
> Changes in v4:
> Updated commit text to reflect the patch doesn't affect in-kernel users.
> Removed RB tags from v3 since commit text is changed.
> 
> Link to v3:
> https://lore.kernel.org/all/20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com/

What changed in v3?  v2?  v1?

Please properly document this.

thanks,

greg k-h

