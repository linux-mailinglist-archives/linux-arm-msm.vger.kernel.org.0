Return-Path: <linux-arm-msm+bounces-71746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1EDB41769
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0157C202B8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FA52E1730;
	Wed,  3 Sep 2025 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGMwpXTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F62D9492;
	Wed,  3 Sep 2025 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886272; cv=none; b=unsbe+swH6VOxED3uazKJqJttkIQnaXEjDlceAwRiqfGlKRRwx9OVhjW2MJm9Ar3hVLE1d+loQLyV9GepNxAhUjOE480zqhSAlEvYmrLl2VhJHlnHKpI6xnfpwbePDeTqOcl7AAWWtMdJCO/JtyaHqPO33/IVI5tVAKB8ZXIah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886272; c=relaxed/simple;
	bh=txtVjzdsYuWIs/X9z15B1rj35GNZ9mCU5uVqwmOF4/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+svXQTn7MnNanAQMLdmnyNBKVpC/4bYIeEuVOklBdN18t9GBMrixTruIy0oAB/FXeMmdk5xJqqsvnWVip1Idrh89RLS0a1yluEi0zlSsV6Yz/aoij/ErRfersR8OA1nsc0q3PcaKBzqHCviP+hH0QH4WlYhXkhmL7mpUCByxAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGMwpXTs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A98C4CEF0;
	Wed,  3 Sep 2025 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886270;
	bh=txtVjzdsYuWIs/X9z15B1rj35GNZ9mCU5uVqwmOF4/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGMwpXTsAfsjRre2RnwFAvr2T1lkhxY2UPJI1Pj1/GXBa7DW6bL7LyM6rTqvHahAW
	 6a8r6c5j3S/j51zlh6AZCfmBQeS2y00fDOamM6ZGbWQ+Utq9FSMVfRqMd9ASZVQH5D
	 GI3BnBFmGCJ8pQDohDUDE75fc2N3V3ej37GbED/iO/jlgFgyH/UyZU7DFAeoecwTPq
	 gskKIvotkACpEBA31a+uWhmZlAcoDwh9ExPlIAiMWc8IRsQhNFM9o/pMPVE/t+Smp9
	 Amei6ON+ZWoptjl5Pz50bZT2H1RtDATVYccbBYMr6B4DLty4q+Nv4ZInvdBSnYwPyN
	 qCSPssxzr4gig==
Date: Wed, 3 Sep 2025 09:57:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] ASoC: codecs: lpass-macro: add Codec version 2.9
Message-ID: <20250903-flawless-classy-lorikeet-0bd38b@kuoka>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250902140044.54508-6-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902140044.54508-6-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 02, 2025 at 03:00:43PM +0100, Srinivas Kandagatla wrote:
> Add support for lpass codec macro version 2.9, which is available in
> Qualcomm Glymur SoCs.
> 
> Its compatible with 2.8 w.r.t register layouts.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-macro-common.h | 1 +
>  sound/soc/codecs/lpass-va-macro.c     | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


