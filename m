Return-Path: <linux-arm-msm+bounces-26170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94B931456
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5AC1F2239F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F1718C190;
	Mon, 15 Jul 2024 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQO/vgss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727D18C18D;
	Mon, 15 Jul 2024 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046841; cv=none; b=qVJZyY5LNVPV4YTGKd/oMzONCEGezlLtlbhw15cnnc5zrXoQgZmRtlhN/gVFZ12bqwVFdnw3tx30L6N18xOdh6zi98PLppftDWtPd05GFpSoo9nIp40Ar0KFutAFUJ6oeb2iqQ5bfA65H3pidFY0v3qju4H1XgiPoniOQ+SyyRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046841; c=relaxed/simple;
	bh=kyfiwzoOkf5rEaYCmxUuypkvZ9dgsE17Q+IbBZDwcG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4NTVg71ydV/GcY+vJ90gKW0v8Cpj4ucJIvsCNgdQCDQnfC3Gr4l2Uwcw09iHsvw3/yhEK4Y8pgNXs+I28ntsdYtGdW8D2VamZw0r7GctJ3YKfSZttrSjHAGHh06b3EWTN8qLwgXsXeHwt/HF+RX7f74AOnKEvYFBWQDDnYOTRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQO/vgss; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754F1C32782;
	Mon, 15 Jul 2024 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721046840;
	bh=kyfiwzoOkf5rEaYCmxUuypkvZ9dgsE17Q+IbBZDwcG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQO/vgsseRuBpH9eZBnORw/lW+hVW0n5669ElLZfyhsu5uiNWZ2+cB/0+vbnw61A+
	 wcPzqSSuPJ68fWKdLcfbpxa58laQ4P6zeTyyzNFBE7QeB0RhCQqfIdgf5py9VgRtzo
	 zPHkZ5/vz4DiGnhqzMR6VHfQy/Ku+ym3tx8tMEV12PgDz1/0vPBMS3lfZ9Cb5Ksims
	 qz1jMCmpbgLsJOXthBtjPjTKDzO5xzRhjkY65YyQuwvhkJRsIO2z6W60lBUIRiD4TU
	 G8CR5/B7zdfFmbdVsbpnpNP0GJUuCJjOBeIHTvx55axOyRlSsVqlNBgtbpUDoSWoh3
	 GhGfkI0kTFb4A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTKty-000000000OY-2J5a;
	Mon, 15 Jul 2024 14:33:58 +0200
Date: Mon, 15 Jul 2024 14:33:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-crd: Fix backlight
Message-ID: <ZpUXNmrs2nfViUeP@hovoldconsulting.com>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-3-31b7f2f658a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-3-31b7f2f658a3@linaro.org>

On Mon, Jul 15, 2024 at 02:15:39PM +0200, Stephan Gerhold wrote:
> The backlight does not work correctly with the current display panel
> configuration: It works after boot, but once the display gets disabled it
> is not possible to get it back on. It turns out that the ATNA45AF01 panel
> needs exactly the same non-standard power sequence as implemented by the
> panel-samsung-atna33xc20 driver for sc7180-trogdor-homestar.
> 
> Switch the panel in the DT to the new compatible and make two more changes
> to make it work correctly:
> 
>  1. Add the missing GPIO for the panel EL_ON3 line (EDP_BL_EN on CRD and
>     enable-gpios in the DT).
>  2. Drop the regulator-always-on for the panel regulator. The panel does
>     not seem to power off properly if the regulator stays on.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> This can be applied as fix for 6.11 since the driver works as-is with the
> fallback compatible. If so, the defconfig patch should ideally also go
> there to ensure people actually have the driver enabled.

Verified that I can change the brightness setting and that the backlight
comes on again after being turned off (e.g. at suspend):

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

