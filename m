Return-Path: <linux-arm-msm+bounces-41231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD99EAA4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CFB518890C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 08:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D6D22CBE5;
	Tue, 10 Dec 2024 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUS7JNFH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FF172BD5;
	Tue, 10 Dec 2024 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733818237; cv=none; b=tZMJaCkPhmTh6xvvICiHiFpf8+IknPsosrQnC8isC9h4WuuZ7xjxtiiTVZh7gi7VynGz98KOwi/zTqa7FBlId0NCAacbRLaC2uU0Zi5gmi2+fKBlxF9IIhisxDH6hYnuAsxi47Q+YcwwuGpcb7RnZUOukJr4cZwUVMdody+TLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733818237; c=relaxed/simple;
	bh=XpjOXRGCaRjL3EO1EVk9K19IkP0jyQ/UDOwsb1UCSe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bh0117uy6kcRwWX6o73477g7qedxEpkJXf8puaTdLQuNrIUZE+AFnVCMWWX0izd8jIjUzNlTmXrH0rk4pbhStTCF9KjQD0K11ryRKdDnA0qmoO1RDaJUY41wLNMQDFiAeojYyAXTp+T+CftsgzeJJ/dq4HX5lxI89WBZEaGeA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUS7JNFH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305E8C4CED6;
	Tue, 10 Dec 2024 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733818237;
	bh=XpjOXRGCaRjL3EO1EVk9K19IkP0jyQ/UDOwsb1UCSe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUS7JNFHySZZRP+NpqOTi8z3KQyeE2Pn5J3Se5GrwreOKUbkpOwt9za4yut4l1Dbd
	 0LKBHmZBntu2xsHuOywHRGWXXKmhx5MMnTBN0Ai64NuQyV+vd9adm9TH/Tf6wq9YCQ
	 qkDIJdwFzVMWz9i4DmU4NZ52FktO6qUfWb+kvMa2vqIQvRbYYspCpF2Cq7pjAMUS41
	 SM8qpDmQmGTsT8Wa7yHlYI4CuOOxeV2dpJXYBeIA+h/cF3LxMVXCh3aO4Yg877Pvns
	 bDHuVdVxfGQYLSdVhlDoud3GUPOtG6sdZb2+r2leQlzggOnbhmX1DSHzrqgD7EPmge
	 y13xUzN2L4cYg==
Date: Tue, 10 Dec 2024 09:10:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v8 01/14] ASoC: dt-bindings: Add bindings for WCD934x DAIs
Message-ID: <ui5rleczp6f75o7fztzbczyfris7gexj4ltdfxktrfm2wkzaom@6hccssjqfq3r>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-1-ec604481d691@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-1-ec604481d691@gmail.com>

On Mon, Dec 09, 2024 at 03:09:05PM +0300, Dzmitry Sankouski wrote:
> Add bindings for the DAIs available in WCD934x to avoid
> having to use unclear number indices in device trees.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v8:
> - remove #define NUM_CODEC_DAIS, because not binding constant
> - fix intendation
> ---
>  MAINTAINERS                              |  1 +
>  include/dt-bindings/sound/qcom,wcd934x.h | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


