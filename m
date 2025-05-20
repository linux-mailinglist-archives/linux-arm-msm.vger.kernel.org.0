Return-Path: <linux-arm-msm+bounces-58659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB8ABD1F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631C04A4679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D4D264A90;
	Tue, 20 May 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX3L8Gvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614E264637;
	Tue, 20 May 2025 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729834; cv=none; b=LR6UvS48Clp/b9DykLezIpG/iatbuzuv2gjbt8QskeoVF1OhWZFanTdkz+an6qBvZlcGqELHUkoI6n2v97VONeriAsNQWir+/lQ3/Ds7b0TLbD5sJ0gyLPgQWgoFFQ/UzBlybsTviHNUQ4Pg7CncLfO1BQ2mQLMFh9orAoHWPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729834; c=relaxed/simple;
	bh=TTfmzlZVvfifJTlZjjrBTsPPuUufHs+nsAPYNFaapNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJxHESRz7Csv28+sT9pc129e7dWDTBLJSeY4o8uUiMmkd1DqIUXVSyG/0oLnkPM1yQdzapLC2XyuAmbIt5e3xcAYCvuC1pto0cfiFm+WydfaiY9SxlzI0ntXVYmWrUOajznOlvveDu0C7zcR8nRptkITX3wyTuIa6LqdHGeQ9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX3L8Gvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70D2C4CEE9;
	Tue, 20 May 2025 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747729833;
	bh=TTfmzlZVvfifJTlZjjrBTsPPuUufHs+nsAPYNFaapNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TX3L8GvkquQpp+gtwcy1w+B4YLAW28PyqQFexAl4Bb0VzPIHR68a5r8xndZpCWVjH
	 eW4olLrWlJasNXlpZVCg2KAgq0cNSmMt73nxEIlKY3C60QKMwYAR48tLHtlG0CrDlF
	 IsWi/s8aPBLmbTIh1uchYbbPy4QUh4a6zoHhj1Rq93YrvnTT8Ot3TBLwl/25tNc6Mw
	 2d/LK3hR0PSRkvGln2qizA3PEHeYyQmeL7JhX12P4++e+HOsyeR71t1ebOtYi071DF
	 yoXsIMXCkFUpZpn0uQNg1k5e8YlE+eLFFK3AIKTZWUVSlWg8MHlehk1454tj50X3KL
	 yjIuqdZpaZKcA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHIMn-0000000020Y-2nQb;
	Tue, 20 May 2025 10:30:29 +0200
Date: Tue, 20 May 2025 10:30:29 +0200
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
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Message-ID: <aCw9pYehCdfXXeiR@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>

Hi Chris,

On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> panels. This patch series adds support for the OLED model which has a
> Samsung ATNA40YK20 panel.
> 
> With this patch series the backlight of the OLED eDP panel does not
> illuminate since the brightness is incorrectly read from the eDP panel
> as (to be clear this is not a regression). This is fixed in [0].
> 
> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

It would be good to get OLED support for the T14s merged. Are you
planning on sending another revision of this series?

> Christopher Obbard (3):
>       arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>       arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller

>       arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

Strictly speaking you could have posted this last patch on it's own as
it doesn't depend on adding the hpd pinctrl.

Johan

