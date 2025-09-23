Return-Path: <linux-arm-msm+bounces-74502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A683B94C80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 09:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A57F482B28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 07:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4B93161B7;
	Tue, 23 Sep 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNAeZyWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B999531618F;
	Tue, 23 Sep 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758612445; cv=none; b=C/He4rS5b9qtoTX1DsHMK1jmX7TfDZMpVV+JqzV9C9E2btc9S+xTn/W9R3tmNSfAW65NpiD0TMc3Vn3IPW+vy9K3J9K6XKqni6+L4C2VjT62Ykh/OQ8uIbRqhuJ1jR0bruLrtty7ibZb5hDk7GXSk+Ox6UXPJQcAYZSLyS5Sg3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758612445; c=relaxed/simple;
	bh=KeDKwQHVQdiXPUQ8+Nb80zJOIZ1+DrcUy6TSKrXqibM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdbPhDRJ535bFE347Ly40nQSffgfIyaIOg7UX/nVsnedCddwNhDxDj/iu9oyk9GZDZAteoD0TNLvqNzmN7mx5u7xGnD7991ZImnz2CXJIH5mn/e+SK2W341KgAuQIQtg/9Uo206u3C0YCvGkLTXMtJ3v4KJJaSsyf12TC1qXwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNAeZyWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520DCC4CEF5;
	Tue, 23 Sep 2025 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758612445;
	bh=KeDKwQHVQdiXPUQ8+Nb80zJOIZ1+DrcUy6TSKrXqibM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNAeZyWj9z+KyZz5eb7jbYDIlZ0amPo6gA4Q5lS/TB0nBA5styzuTLBS7qS8pfipd
	 DsWrYKKauedaMBuTZSiiiXgEa80mNYLTgoXJ9QQz+sXnwCSLg1+CHHAuaxyIvabIJb
	 FkkKsQAkjKOr++6OzJ1l51mNgogh3btwXmUUlkrsyp4KjgHWOUcRnZ9CIJX+3jZM8e
	 3Gznieq8XUCpXFzjzAl8ZbYlf8ZEynQHtdPXdHu3b/S0lV9rml+JPwCnEqs3faYbfe
	 I/esSuYz602PXf2i/y957GNYvN5dk26kTQp4iMXsfIx6tBy2kA4AdGnSfX89qToP/G
	 +zOx1t9Fby+BQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0xQj-000000001HA-41EB;
	Tue, 23 Sep 2025 09:27:18 +0200
Date: Tue, 23 Sep 2025 09:27:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
	vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Message-ID: <aNJL1YEXx6IabTos@hovoldconsulting.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
 <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>

On Mon, Sep 22, 2025 at 06:00:04PM -0700, Wesley Cheng wrote:
> 
> 
> On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
> >> The Glymur USB subsystem contains a multiport controller, which utilizes
>
>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> >> @@ -16,6 +16,7 @@ description:
> >>   properties:
> >>     compatible:
> >>       enum:
> >> +      - qcom,glymur-qmp-usb3-uni-phy

Odd indentation?

> >>         - qcom,ipq5424-qmp-usb3-phy
> >>         - qcom,ipq6018-qmp-usb3-phy
> >>         - qcom,ipq8074-qmp-usb3-phy
> >> @@ -62,6 +63,8 @@ properties:
> >>   
> >>     vdda-pll-supply: true
> >>   
> >> +  refgen-supply: true
> > 
> > You've added it, but it's not referenced as required. Why is it so?

> The refgen clock isn't always required on each and every platform unlike 
> the .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only 
> really depends on how the refclk/CXO network is built for that 
> particular chipset.  The refgen ensures that we're properly voting for 
> the supply that is powering our CXO buffer.

I thought we discussed this before and concluded that this is not an
accurate description of the hardware (even if you now call this supply
refgen instead of qref):

	https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/

Given your description above this still looks wrong (at least after a
quick look).

Johan

