Return-Path: <linux-arm-msm+bounces-53001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C89A78985
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEFF3B13C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A057234989;
	Wed,  2 Apr 2025 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS+A6ZvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E821A5BB0;
	Wed,  2 Apr 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581301; cv=none; b=Eu7Bx49H29VWNwzG5rrj08q4bKOq0MODv1jcnHO89wmUSloEY+jyBTJ7FHYCt9cWAAsLkorRIWzy9lEag/Ruhzf2h19KyIj1CiAbngJNksZyXouzkhxBTw3x0ue7cobRyC0nPpB2Rrmj1XWZBUl5ZOPlNMgWNkgcrFqfRxO4WhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581301; c=relaxed/simple;
	bh=nQ8eWQza1l5fbBknm+mZ7l8pSnfmdy+4bKPnqLs/4zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDRsuppcLZuC9kW2yadl8Q0uT+Fr4GV5l868J8m/naSbcz4MV+aBfMOSKhoKouAZqF0LYwR5SPFHjP3nx5jTcgzVtxbI9NrjJ3nbz8GqylNAqH5DM0iRt+8Tp8h3WUdQaTY4cCtH3Yk/fg77HvqO0+JrmVA8LkWRAEUzuW+ZcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS+A6ZvZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F42C4CEDD;
	Wed,  2 Apr 2025 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743581300;
	bh=nQ8eWQza1l5fbBknm+mZ7l8pSnfmdy+4bKPnqLs/4zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oS+A6ZvZT17QfC6R4zzA2erSvWkOV6oWxB8wF/crdwXJxmyHfdGojwmL5JAKVs18O
	 zLmnqBKCs72QDQHwGeExq2xsrILJqrdZGVBurNvAjbIA2X/2znndYOmJgww8OH7XYb
	 hLnkN7Q81AzDNlUKxpR12DL+VUP3ACAnfaRKsM5R4OyUA1QGpoWOphiEishTd+NgV2
	 eUUEWELMoatcURknp9Nm06ErqEeeYdqgdFaMCS78ir4o0HN+n46d4j/VAReoP9hApL
	 CeZDYcDDyhz41VO5mCP6h11soc2YW37z1KzS6UL2sP5/zH6LOMwu3fGUDQg3ki0zqj
	 BP6MsXWmMnChw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzt96-000000002Yb-2QXV;
	Wed, 02 Apr 2025 10:08:24 +0200
Date: Wed, 2 Apr 2025 10:08:24 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio
 headset support
Message-ID: <Z-zweM9llVE-bzYc@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-7-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-7-srinivas.kandagatla@linaro.org>

On Thu, Mar 27, 2025 at 10:06:33AM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
> support CTIA and OMTP headsets. This switch is used to minimise pop and
> click during headset type switching.
> 
> Enable the mux controls required to power this switch along with wiring up
> gpio that control the headset switching.
> 
> Without this, headset audio will be very noisy and might see headset
> detection errors.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

Looks good and both playback and recording works fine:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

