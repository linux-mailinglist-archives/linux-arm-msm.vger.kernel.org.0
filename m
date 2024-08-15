Return-Path: <linux-arm-msm+bounces-28704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F7953C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAEECB26C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB5117166E;
	Thu, 15 Aug 2024 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwtYg+Fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A1171098;
	Thu, 15 Aug 2024 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754500; cv=none; b=OruA8uIf/opIGk8hlM+IouyfzdUpeqr+nchat2SlP96T2i8Xbobm9NYQ8k7RDvOfqt2R6yEnwo26gfN0IepA4NwVDwIhzya38ESyb8C1XYD+CDcU4ddZTNjT6mNwUtyfrUEbigAbg9TvJBRAYKNf7wOY7gLVloxXDS7E9ZHNv1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754500; c=relaxed/simple;
	bh=99puEiYfn5q/7K01azkENGMe1+O/ZL9Ew0Yw9gh+GPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8RGdD5qUBprLW9fpYpXRD8WoX9VBkFc1Whf7YbZDsjcDp/21vI1LtwVbBDi813m9Qi4PweECHhpQbEV8A/EviL+ylUrbkCUCSCmYpOzYpxUe6qQA4KlXuOUMBkMbt7LWwcTFmPpx5uIah9lrWr1RrPxKqr0Wx6AFn3InR7X1GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwtYg+Fr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CCBC4AF14;
	Thu, 15 Aug 2024 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754500;
	bh=99puEiYfn5q/7K01azkENGMe1+O/ZL9Ew0Yw9gh+GPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WwtYg+FrmwJ1+DtOJDq3tvnd71xwf0r16EnhnCSqlvCBkpyEBVsN+xmdEnv50Ngcw
	 5Bufav1hT6I9bQiDJdtOlhPvGAmjix33qvhrIW15J+dmsdT9owDmux31NiGYIgwTgF
	 ZwYKnK+14wvp/+vVpgmJ0lvnHMw3xS4Rvy49W/I1yRPowy9jASbPXLVsWM506/+n1k
	 ayYE29z+4koutxE/Fj3Cirsy8mLBwkQel9Xkbf0nXvjRKI+fDEzNWcK5T80LN96PYX
	 /7Zi8tbsz+y9vy+9x1elt2otYPZyTFAqly+bpg93Nrq7N/aLTEqlzxGyJCIJJFcOqo
	 Fx5naxR4U4nAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	srinivas.kandagatla@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manikantan R <quic_manrav@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: codecs: wsa88xx: add support for static port mapping.
Date: Thu, 15 Aug 2024 15:40:50 -0500
Message-ID: <172375444802.1011236.13810877795338662540.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Jun 2024 15:44:37 +0100, srinivas.kandagatla@linaro.org wrote:
> Existing way of allocating soundwire master ports on Qualcommm platforms is
> dynamic, and in linear order starting from 1 to MAX_PORTS.
> This will work as long as soundwire device ports are 1:1 mapped
> linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
> are NOT mapped in that order.
> 
> The result of this is that only one speaker among the pair of speakers
> is always silent, With recent changes for WSA codec to support codec
> versions and along with these patches we are able to get all speakers
> working on these SoCs.
> 
> [...]

Applied, thanks!

[5/6] arm64: dts: x1e80100-crd: fix wsa soundwire port mapping
      commit: d374fafd8972895eba01ebd69c993cc7d80c084b
[6/6] arm64: dts: x1e80100-qcp: fix wsa soundwire port mapping
      commit: 6e229f9118438af09b4ac6a96313c32f33027e5a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

