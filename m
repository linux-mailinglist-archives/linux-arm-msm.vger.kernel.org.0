Return-Path: <linux-arm-msm+bounces-67687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D493BB1A2EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B6316B847
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660F925E479;
	Mon,  4 Aug 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALoa95xa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C1253F3A;
	Mon,  4 Aug 2025 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313223; cv=none; b=g42ZpO+Nm3rmcOtXZ/7uZgIVnv+4NzeCZy9D90eFkRT5DwOWhOn1HmdfMCxEYz1Mf0GbHQzcRQESEfN3DRxmatgs2/hFle6TXq8mOr6xDiQBvbuXcWK+wd8JWACEG6ilsV1Vrwn3G13e3jhu374mxMP2wG3maeez/EV2izMBIho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313223; c=relaxed/simple;
	bh=7Itrb6NEFY8xjNQ5bH8OXupD/fdEaQZR/qQ3r+WdZfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BddbD0JHcJsJ94jNtIKhRgXW006LtvTG+MfmZIFai8JqOUEwGPUsxy7PS1/aFgP5dtVMGnLHwcZjHNDHbJLvhjdLpTft48WPiLohczJSZ7ltN5jM0HOkqDMli8sUSpfBrX2GWyv4dOkq3uk4wYpDcx57uRS0HVsIJLVPnVxUEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALoa95xa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D07C4CEE7;
	Mon,  4 Aug 2025 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754313222;
	bh=7Itrb6NEFY8xjNQ5bH8OXupD/fdEaQZR/qQ3r+WdZfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALoa95xauUk/mee8ff2RmYMAVYexzy6G8PZnfqDpANL/9DlaCdUiCmP0gBdySDRjX
	 mvT8TnxES3p+C0TokDGLGw3E3SF3ZqntFjv3JpmeBw5Vy51FqMBq12MGqBl2bH9Ezs
	 PPNeVnJ4JVLEEyVGged5Y/3nzG/6MAnnUTGuWpXniW6cjfNhuFFj3Ets1z3zt6m6Dk
	 GfKAbOBw9NhCxk6yS8edxjrZZH8cDr7zH8i6LhIEKL9gUlRXD+e7av0P7rRrvPkPij
	 cM/fUPQPElSSz5zmt7JHzC29QdDbVdoH3Ts6badRb+4l8xn+BMSzmcXDXIikeeohiR
	 P7Kc9hZU0P43w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uiv0X-000000000nL-1h82;
	Mon, 04 Aug 2025 15:13:42 +0200
Date: Mon, 4 Aug 2025 15:13:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>

On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> The eDP controller has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO is used in both the
> OLED and LCD models which inherit this device tree.

> @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 239>;
>  			wakeup-parent = <&pdc>;
>  
> +			edp_hpd_active: edp-hpd-active-state {

The node name and label needs an index as this SoC has two edp hpd pins
as I already pointed out.

> +				pins = "gpio119";
> +				function = "edp0_hot";

And you also need to configure the bias somewhere as you should not rely
on the firmware having configured things for you (as I also pointed out
before).

On my T14s the internal pull-up has been disabled.

> +			};

Johan

