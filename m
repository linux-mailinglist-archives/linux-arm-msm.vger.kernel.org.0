Return-Path: <linux-arm-msm+bounces-40455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B22609E4FB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BEFA163271
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090031D1730;
	Thu,  5 Dec 2024 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBqAl58U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC31B1B219B;
	Thu,  5 Dec 2024 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387333; cv=none; b=eg5zIOrFVuGTroqXld1GYpf7UIOe+g80ippf7iN15nBrLhOneBsB/QcleORBI0hSM71QBAiYLmnxYKoebr3LZVn4c4M2SLbQRtlNFHHsb49aGxeo4XfVAZuJDuJZfCrVKT+lXd/HBELX7rXHMpiR5Iq+q3oG2WNPDApwxNEISNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387333; c=relaxed/simple;
	bh=LKRcOHfP3Les8K2W2lfWxUIwy4IjqF0urRjh+fBOZL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajX5eJMAqFzB6HJpARyMPSMiNxmKZwS/UI0sXDjbIINUUtT4JClyxq4TRPlMGQxmYLfoqX1vMeE2/HTFu6HbiG4PtOtSdITE5NLs5nyEvmJ1DqGq9mtn/tvEviXWxHypSW4lPFJvwBNV1nNiiwbPVWvPSL98XKfQBXYtEMqD/pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBqAl58U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B93C4CED1;
	Thu,  5 Dec 2024 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733387333;
	bh=LKRcOHfP3Les8K2W2lfWxUIwy4IjqF0urRjh+fBOZL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBqAl58Uc4znJyPuxT7tnuYNRE0tZMYibiv84nw/uWFqBof6qIo6omNekiRkHShLZ
	 UDPr2yF/Dj4KqS7jVUYMUMRo4zLYn+csmoF4Kp0K6rWdENVIXGDauwBH+gnzeC4fqb
	 x0DWSNzTmm/Vs2r4oEU+KtIUZxuPGEd0gMCOoxB7YHNIZnQQIoAVGy/gv12MoInHyf
	 QvjxWQPzy7E2xeBwwWDD0nxBE0Xhwc2voBS3ZLhBZm78jwpxxnbeLsM1FHJdGT9oq1
	 Qp9zjgVfaLVqqstQn3Z4SULnJN0viRXZXf5ck+/uX0F7trwE1vuov41iKaA43xOn5d
	 wLKeKKw7oDAbg==
Date: Thu, 5 Dec 2024 09:28:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 01/14] ASoC: dt-bindings: Add bindings for WCD934x DAIs
Message-ID: <rmsmdoysg7irwagwjhuj2mggs2laqznmy52f3a2k2w43m6kggc@qgw25bnora44>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
 <20241205-starqltechn_integration_upstream-v7-1-84f9a3547803@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-1-84f9a3547803@gmail.com>

On Thu, Dec 05, 2024 at 12:34:48AM +0300, Dzmitry Sankouski wrote:
> +#define AIF1_PB                 0
> +#define AIF1_CAP                1
> +#define AIF2_PB                 2
> +#define AIF2_CAP                3
> +#define AIF3_PB                 4
> +#define AIF3_CAP                5
> +#define AIF4_PB                 6
> +#define	AIF4_VIFEED             7
> +#define	AIF4_MAD_TX             8

Some odd indent appeared after #define

> +#define NUM_CODEC_DAIS          9

Drop, not a binding.

Best regards,
Krzysztof


