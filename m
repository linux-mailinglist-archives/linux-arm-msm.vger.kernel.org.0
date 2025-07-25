Return-Path: <linux-arm-msm+bounces-66736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F7B1251E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 22:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F27AC5F5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 20:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1FA255F4C;
	Fri, 25 Jul 2025 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYyt4KE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D71025393C;
	Fri, 25 Jul 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753473937; cv=none; b=EIgf8KNOnQVCA1t8K4i4t5kVyUtc0lTWJnX0ZTLzfaMedQmHHzyiIstwUcN8+YoU1PzqLYT7wixiWdSe72OKtmUrQH9zbZMekoWZJRs/2lrXjKuMI5t1KZilf5eAe+I9JL96gPUkWWH+ZINVUYPT8HuheyOzD+XSjZ8N/9UVWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753473937; c=relaxed/simple;
	bh=Q2jZW7v9hu+TpLa3xYjqej6AtWSM3G3mIsRSK1nrrV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8s8jLPQYShiJYSZR7W4nAPtFtg7ZYry/HDr4SuvYyjcleJZDscAQFysaeFlgiCNLRlvhVoEnq0QwziOR2SjQDtRNZe/eln5tUheVGMHJLJIvlrvYkVxgW4otICQEgLoQ+GTZfHJ4/PF0CYKq+7/xRKVXnUnUTVFGte+zrGyQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYyt4KE/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C308AC4CEE7;
	Fri, 25 Jul 2025 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473935;
	bh=Q2jZW7v9hu+TpLa3xYjqej6AtWSM3G3mIsRSK1nrrV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYyt4KE/LNDKndF9oqGXS6Zhkx92ObAXyUnaVzcFEs+wFhiOwhQ6vC0lrB3fFdWmn
	 nVVHDtQgHFKR43P4y+uk/SaOdD7P9KPYZCM8gBNh4GJ5gG5lmNZHUWrBqaFpnPUcUj
	 19QI3ewFM5rz4IzbyS5KIv4NtPC04bBCg8z7x1rAmyXc7grFqCRVD7uF1OevZr176e
	 es++8I+y+mYSKcrw7zXT+x9B0+dJDSfAHnDJ+QpsNoYz1uoRPycknATR00XMZ5In1C
	 lCBt7IQEs5DXZR7zfxC2GRYQWjrtBU9xwM2axK0B2Tvl1RLeDW2Wpge2nCsusoEYwP
	 HjjMDrPiwOO0Q==
Date: Fri, 25 Jul 2025 15:05:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: conor+dt@kernel.org, srini@kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, linux-sound@vger.kernel.org,
	broonie@kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used
 include
Message-ID: <175347393332.1760852.9382967903042104261.robh@kernel.org>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>


On Thu, 24 Jul 2025 14:42:28 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
> removes it, this also enables us to cleanup some of the dead code in
> kernel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


