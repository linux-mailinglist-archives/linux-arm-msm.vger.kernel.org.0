Return-Path: <linux-arm-msm+bounces-20773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C8F8D1D5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80371C22703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9148716DEC7;
	Tue, 28 May 2024 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV2JvCao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6523C1DFEB;
	Tue, 28 May 2024 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904116; cv=none; b=gFW5Ow7o9BV3BUnS/tIeBZ+k/HNKfxKs9jXjOoCyvPPvLJGRiSDmM0WrwgfSzHbBW0h7fdz9Ydeuj8uXjkEqaW/OKEsc6pwb8kAOUatyLOdF4sBRDFu8jyoXYLtMDsZilxMveSOXbqe4Vs05k57asoPOJZATHn97oiZvDqyf7oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904116; c=relaxed/simple;
	bh=DoTWcxfPd6ZXM5trbPl344BcOXMoZdGGkPQSwjH/RWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=St7NU+NECVdKw4MSRH5L2ZVFXkbTA8UQvv7J/L9GMSESvuDRW66xh3v38Dlgwn5WhAcuW9smUvxHBZZGChI7hz0vyvdoG5rr56LHMtl6qbLtOLEEVEGMfiB/kGHgyEQ2W2oe2FnBxOCFLYm6MOU8/kUJKXgXoG6N96SR2x5wyi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qV2JvCao; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E332FC3277B;
	Tue, 28 May 2024 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716904115;
	bh=DoTWcxfPd6ZXM5trbPl344BcOXMoZdGGkPQSwjH/RWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV2JvCaoWDpXgFGwXQMX/wBqV7LbRdk8dAwfrWp8Alhoo43rJMx/Q3Hp0rS1P9Kao
	 ZTgbPEMUu4ivrI9JU3zpLxcZo/NnyfuEPXRM2BK+IqRQtrVXpP/20Mi+QU2CHNhnVJ
	 Wh4moUeV6b3EDAh05vasMik0jRZraX6s5NwqrSoO8hUjr6sBpJyeAXIbDqnWe7bp+2
	 heQR990QJszNbZngqv5b+OeakkEjNGBQW+62ztLRkVmfqmLp/oS7EGDlanDc0O5P0a
	 J46zpE7fh1fpLxMcVSMob1z1xpT/F/ptPkiZ5ml0IhAzvinmUpiLtGDNHYReiT+dmc
	 PB1wqi/C/iYqg==
Date: Tue, 28 May 2024 08:48:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Message-ID: <wipu6tdqjbjlrv2sbljgzvoxvpjvkoaz6ic3keq24n3v4tap4j@entxhnd42rml>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>

On Mon, May 27, 2024 at 10:42:32AM GMT, Neil Armstrong wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> The patchset also includes bindings changes and DT changes.
> 
> This has been successfully tested on an SM8550 board, but the
> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> as expected.
> 
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name = msm_dp
> 	drm_dp_link
> 		rate = 540000
> 		num_lanes = 4

Has the issue with the USB controller dying on us been resolved?

Regards,
Bjorn

