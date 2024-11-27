Return-Path: <linux-arm-msm+bounces-39267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5269DA397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC7A1667B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505AD17B402;
	Wed, 27 Nov 2024 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBuKCeac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DB178395;
	Wed, 27 Nov 2024 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694984; cv=none; b=uwReJLTA2yurofxhp9qcgfiWn1UnHq9HnRWLKDckpQ9aJS29fwvPQ38MaVM9wBY1rPJ5dPK2ditXSblyh6slFrZNshLoGCepE45wrCzwK+nKIzBaM/l5SQ1Cp84RIKwn1lrGY7Ws9qQ4chima8IJ8H3as4VGA0ipLbVYuoQgV/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694984; c=relaxed/simple;
	bh=FiLFgWhS7qHFTVJeYc1GPLjCNhxBLSaMnTEsiqhbqc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzbL9kx/sVL3h3nlENx+ZUgE04GvgJvT9VgqArIUTzKIbw1NfWjQfg9FWThcMkjeD4Q7r0oXB89nHUUb5NUEDLFo0H9qtEPwYUi2EdPxKYeD/vnZ8hick5bPDcZjbGGVl3K+zNoywOVzjbutys1XxxlNEdK21vXnXTtLroutrBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBuKCeac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F240C4CECC;
	Wed, 27 Nov 2024 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732694983;
	bh=FiLFgWhS7qHFTVJeYc1GPLjCNhxBLSaMnTEsiqhbqc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBuKCeacZqAo1xyN0QdNdcSjLajcHo0omCcnEywlleAMR9r3+LUwiRSgctJOrBxvt
	 e9y1D8bsncGqLkoG73fDKHvfh7gAmZUIb+Uz3UBmDrvTIZfDgs7b2lgzFzUePAYHIC
	 MKrGcri6OQvBTtO3DcwWC0HulAT3GWQ5aYKJJT7YI++0Q2htyaTO074FEaYRtff8/R
	 ew+YRZNhkehSS1inhk9eXbjBVgnFR+WbB8iJw7ALd8uBD87q7lInP5q+HKhw6PAf3W
	 4pjhy5u7g3wRqJmWHlTDORTziG17uYZOd3TYzyy/iY331jsRJ/oHtdDTQmptwwigGz
	 n4uOiLi+9W/vQ==
Date: Wed, 27 Nov 2024 09:09:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Sanyog Kale <sanyog.r.kale@intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH v3 3/5] ASoC: codecs: wcd937x: Add static channel mapping
 support in wcd937x-sdw
Message-ID: <y2dllg7ie475xvowbqtmh7rgdmcyqr6tinik2o66rru3ccuvqv@7d6v7l64lnh7>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
 <20241126164300.3305903-4-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126164300.3305903-4-quic_mohs@quicinc.com>

On Tue, Nov 26, 2024 at 10:12:58PM +0530, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave ports in
> wcd937x-sdw driver.
> 
> Currently, the channel mask for each soundwire port is hardcoded in the
> wcd937x-sdw driver, and the same channel mask value is configured in the
> soundwire master.
> 
> The Qualcomm boards like the QCM6490-IDP require different channel mask
> settings for the soundwire master and slave ports.
> 
> Implemented logic to read TX/RX channel mappings from device tree
> properties (qcom,tx-channel-mapping and qcom,rx-channel-mapping).
> 
> Modified the wcd937x_connect_port to handle master channel masks during
> port enable/disable operations.
> 
> Added wcd937x_get_channel_map api to retrieve the current master
> channel map for TX and RX paths.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  sound/soc/codecs/wcd937x-sdw.c | 38 +++++++++++++++++++++---
>  sound/soc/codecs/wcd937x.c     | 53 ++++++++++++++++++++++++++++++++--
>  sound/soc/codecs/wcd937x.h     |  6 +++-
>  3 files changed, 90 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
> index 0c33f7f3dc25..3263bdf25d86 100644
> --- a/sound/soc/codecs/wcd937x-sdw.c
> +++ b/sound/soc/codecs/wcd937x-sdw.c
> @@ -19,7 +19,7 @@
>  #include <sound/soc.h>
>  #include "wcd937x.h"
>  

I don't see the bindings header being used here, so this is a proof for
you that these are not bindings constants.

Best regards,
Krzysztof


