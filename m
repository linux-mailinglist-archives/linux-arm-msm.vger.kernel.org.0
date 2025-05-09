Return-Path: <linux-arm-msm+bounces-57495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B87AB1F94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E8C81BC4C7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F93924166F;
	Fri,  9 May 2025 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKKenb+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C8AD5E;
	Fri,  9 May 2025 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828213; cv=none; b=kFwa0mFu+wLVyKYhq4PpADvW3Cltrt19VYryHkL5pUg1sUH2Uy7f5JPfPyg5qbZcUG8fy7TxQJ4wE7M6JL06k04cPnUDOdFe2Cw3zgDM0Sg9a1QNOX7G0he1+c1Tv6lledrbgmuECfUeLs0nU1OVUc25w5SZQyN9For20Pn9QiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828213; c=relaxed/simple;
	bh=CW0sSNe6MztXpmpgZiLXHGBNXrv3XHCJSTcJb1kmYCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEvM3cQVHi4S34i5dUW2OYwbfJlw/Pg32MeVr/D3uiI7KquRz+p87iw0NU76LAFqnFAGy0GzBVvfq8A+w+68vJBR35tLC05wCeHsByWmxp3OFifAO2nqMLwYnFDfyVRcw4u1WqA20UaD7JoEEnb0pGd4NqzUfqEnChRe/DkuXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKKenb+H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70309C4CEE4;
	Fri,  9 May 2025 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828212;
	bh=CW0sSNe6MztXpmpgZiLXHGBNXrv3XHCJSTcJb1kmYCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKKenb+HZAolgMcdij0Me9pwnJ4j0Y5oQNJ1gyVDskwvTyFX89NTvAOQunVX2YXgz
	 n2Z0EMuWkojmkML2rxh19yIqZmBDEZ7UDV6I5HGdrB8H8PmgNWZ97Wp89zrSjKE3Wa
	 Zt8rTyj6ajwD8sCIj9FCU4DwY+udHaCujRy165FlMwOW49BY3/+PlKrmzBlCQHqAJp
	 UsjBHa6+JsAmLvOQBpheh7+zAtoTXagJIfYJdP0QfCzxF9PCCUZKi0UWs3hWT+n6Fu
	 jZhprkK2zFVnbvJSLSiRpK9saJiEYb2jEWihNxEUdpwKmbTe6JtS+8hzdY3dG0GnmA
	 7RfcJEjZrexMg==
Date: Fri, 9 May 2025 17:03:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-usb@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konradybcio@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Message-ID: <174682821024.69850.896927438133345795.robh@kernel.org>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-1-30f4596281cd@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-1-30f4596281cd@fairphone.com>


On Thu, 01 May 2025 08:48:47 +0200, Luca Weiss wrote:
> Document the subnode for Q6USB, used for USB audio offloading.
> 
> Cc: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


