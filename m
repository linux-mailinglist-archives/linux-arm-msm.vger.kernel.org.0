Return-Path: <linux-arm-msm+bounces-62096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8DAE4798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885A04A0DC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4054526B2D2;
	Mon, 23 Jun 2025 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SugFFh8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120FD25E465;
	Mon, 23 Jun 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690333; cv=none; b=q2JdX0b4FvOoHnwr/WnEvj2nDkcP7JUDzQs5t5qprDwtujcxbyWrw0eLS4/QQbceBHRiMh+2j+SB6RBtmyTmXZtByhvUOXavcn6bMAa+4ANERmapUt75IGQy8B78RJ0I/k6hc0Q87e1dWnxfKSVO5vFqz/Q9tpU0tjeSIErn+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690333; c=relaxed/simple;
	bh=7OzP27f3ynCg7M2TNSr7lVm1d/gvSqNqstwXKlqp/do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUiUYaAcUDCLetDFTs/w778pInj/d55J9CpJMxO9CCXTFsqA6frddjTniBmPoLgyxLFHHsPLiQi8HZXBVrFaN3UYCZ5dj/TtaltZUfsaICFlbn/7bXUc/3ahmoElvhWCyoWPr8V/2Fy7jlpTrwi8V4qgY404y8dtmPwouWuYD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SugFFh8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA6AC4CEEA;
	Mon, 23 Jun 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750690332;
	bh=7OzP27f3ynCg7M2TNSr7lVm1d/gvSqNqstwXKlqp/do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SugFFh8bjj0lYRsgy6/RCEi2dp9CI8y/l5HI1IX9w4fOoRL9i8sUimVgSb8li98yw
	 GQRLoQLAQ11TbvxtTXJzY8VPzvplM+ToQmIp3t6en7s+/FGAv0LRtqcmFEVgPxh9aM
	 hoOwRTxjJJpR/AaWE7JF0f500Pa9GDprxt3H4qv9bcUA24GIsUIQ6pJhBJMXIZciuE
	 1qi8A+nWsEuIbpfbiNojDuCnNwEolr2lua4OUr2UVj7KGyA6p9NuLUT12uGpDpul/E
	 H2H3CtEG3+Bh87nKpVaZqEqRSUiNQFQLlMK78m47xfNJ0Fidhs72ExVyX+t5HGbFIS
	 txeslhwhDEycg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTiWm-000000006YU-0FMr;
	Mon, 23 Jun 2025 16:52:08 +0200
Date: Mon, 23 Jun 2025 16:52:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aFlqGMWwx8ID_SaN@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <2a37d3f0-a3f4-444d-8166-f85888a27308@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a37d3f0-a3f4-444d-8166-f85888a27308@oss.qualcomm.com>

On Mon, Jun 23, 2025 at 04:49:22PM +0200, Konrad Dybcio wrote:
> On 6/23/25 4:45 PM, Johan Hovold wrote:

> > It looks like the efivars implementation does not support read-only
> > efivars and this will lead to NULL pointer dereferences whenever you try
> > to write a variable.
> 
> There's efivar_supports_writes() that is used to set the EFIVAR_OPS_RDONLY
> flag which then sets SB_RDONLY on all efivarfs superblocks

Yep, but it doesn't help when attempting to store the RTC offset from
the kernel (since that does not use efivarfs).

Johan

