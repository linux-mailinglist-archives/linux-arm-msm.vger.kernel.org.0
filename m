Return-Path: <linux-arm-msm+bounces-74007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBBB829B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A276D588B0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FEB221F34;
	Thu, 18 Sep 2025 02:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7/tkiPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD254673;
	Thu, 18 Sep 2025 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160953; cv=none; b=mQb0Jbma1mL3z2WGzR1zhrq0tUClusGLyJtG7UtUwCqEInS4lUkbJwDVHn6h+6iIxZ4xWgbsIe+im0KUDzOxqUgq6CBF5OLq8D15S+77dXBA5BlTw1K+Kr7jek2oJiXIwtyDVMblzMryTbYRIoiCyzqY5XK50BgP6oRd6nzN5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160953; c=relaxed/simple;
	bh=XGvr5MSEOtKXXBBogrm+JQ3ORMiIMVE5XCY/8nz6vwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWYQgg8cg8R/3h72VFsWDsJ6yaynZb9E4vD0C1n/MJ6r38iORadPF/scE9I+n2xDt6yOJzQzNczwMqY5kST+koIyhDMv2wP1BbX4SWr18oKIg59em6HXDSvSomhJbht5bV6hi0y3E6N+3xa4LfiOwBZJTNxns+syIRUcKbme9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7/tkiPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1B3C4CEFA;
	Thu, 18 Sep 2025 02:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758160952;
	bh=XGvr5MSEOtKXXBBogrm+JQ3ORMiIMVE5XCY/8nz6vwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7/tkiPW/xZ5mtAr7q7bPjyP+tL/mgq+N8XRCEA/b40N/2es+itDr/mV0dE+hcFo2
	 I7yIWgGrEioyxRpAZwoKTJRMUkZE6E2hBY3zHfkTWwbIPGkskQFBvepIWcFgOur2SH
	 M2lES+6yrsPgWjtMkDeuLxAnvE+rJZfN9zV9uBXzmdufuB4sjnq7liGYDlfeeZJltT
	 8NMmO7I/Pz328/rUzlMLLm0AaK7moNTTpB/g1HHPtp/fzkg3KAOu/ehVLK5tt9Gtbb
	 pkJU6YAztWzsEtXvG/xJqLSzQ10kaMstBUfhbIZrHBkFqXeGj+ksTjTfHlH8DSW4eY
	 H567RkRIXgCxQ==
Date: Thu, 18 Sep 2025 11:02:30 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v4 0/4] Add PM4125 audio codec driver
Message-ID: <20250918-heretic-spectral-lion-86fdfb@kuoka>
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>

On Mon, Sep 15, 2025 at 05:27:47PM +0100, Alexey Klimov wrote:
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    6 +
>  .../bindings/sound/qcom,pm4125-codec.yaml          |  134 ++
>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   79 +
>  MAINTAINERS                                        |    2 +
>  sound/soc/codecs/Kconfig                           |   18 +
>  sound/soc/codecs/Makefile                          |    8 +
>  sound/soc/codecs/pm4125-sdw.c                      |  545 ++++++
>  sound/soc/codecs/pm4125.c                          | 1780 ++++++++++++++++++++
>  sound/soc/codecs/pm4125.h                          |  307 ++++
>  9 files changed, 2879 insertions(+)
> ---
> base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1

git co 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
fatal: unable to read tree (590b221ed4256fd6c34d3dea77aa5bd6e741bbc1)

On latest next:

b4 diff 20250915-pm4125_audio_codec_v1-v4-1-b247b64eec52@linaro.org
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v3: 4 patches
---
Analyzing 50 messages in the thread
Preparing fake-am for v3: dt-bindings: sound: add bindings for pm4125 audio codec
  range: 6f3a32745b2c..b40852dc84c3
Preparing fake-am for v4: dt-bindings: sound: add bindings for pm4125 audio codec
ERROR: Could not write fake-am tree
---
Could not create fake-am range for upper series v4

I tried latest master - the same. I tried also next 20250901 - same.

You need to fix somehow the base you are using.

Best regards,
Krzysztof


