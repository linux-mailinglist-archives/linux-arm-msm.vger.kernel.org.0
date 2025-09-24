Return-Path: <linux-arm-msm+bounces-74668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB9B9BCF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 22:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E344166A35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D9D322C80;
	Wed, 24 Sep 2025 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="q5A6u4ow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bout4.ijzerbout.nl (bout4.ijzerbout.nl [91.99.166.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBCE322A2D;
	Wed, 24 Sep 2025 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.99.166.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758744515; cv=none; b=Eo2x/aqa27jaTZnuQDHTMnzf6op4GEuCMiW5EpOySLHTRQHtmklPDWg15z2WU6H9Ur5h7QsLVxbHief+RwV7xnNlwgVnHaykd70Qyfiqy36Z2NnBf/J/eMHQYVetyE+9o41XbMe1CLTrNUHyNxW573LQ1k1iwCVoJgc+nXdZqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758744515; c=relaxed/simple;
	bh=iX18mreyCJfLY6jINmc0Ca4MoXPHhMk048rx6jyuZ7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1kUf3Yu9S5BVgZU0brZsMlwx4+BpmlkTzUOe359fOpVp/aUbLHL2rNnNHu5IpC1fhxuSEnhu2aIyyRAamclPB3bMRV+aajue6tlHfkeCInsV8moqQ2yd8prrlecHSsnMaATJW7pCmkRFYFXihbzZsD6TE+d5eK5aU/Xo4KLBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=fail smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=q5A6u4ow; arc=none smtp.client-ip=91.99.166.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1758743968; bh=iX18mreyCJfLY6jINmc0Ca4MoXPHhMk048rx6jyuZ7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q5A6u4owfMHEo8OezoTfR6y0oUZe64PPyJItEUvN88tEHb9+v1aXY9QIgrd1XlaEf
	 u1iFjcbqj/8Gnq/nlp2LzddWQD5wElSRWVwqjxx+a92hiS4xMyPyUkdTQjRJejaPxV
	 KIFLxkAvVsj+vT+h0stcTudQ53fnVltmk67yoaSL6SebZjW456aSbj51Kb9lk0zSTF
	 xnUou4eh5UXzJPcDkVSfWpXOeFeudzk8hakKfr00hpvLoHDB/Ne3EnmI/42NMjapu9
	 npw29WWp0FTRlAinvdcl1/LlJRPUg1tj57+5B/rN4vw+SLgfZ9YhLfHE/ZdHs0YxaP
	 5TIp0ZoAIaJXDQZht1di5uwICIJ4CgLhIsiC1j8TigkwJEcS+GGqqer+CKZLSfqUFg
	 YDmePa3YywMh4S21mtosqGGQm6M2d3XgE0i0rBlH4xX9EAWC56c22x2Fy5kUieX2QT
	 7rtZlOM14pF1TJjNx3GIQEdjHhD524WhMDMB67KJKmBypvFDPiV8PvHFgHYwLCYJXG
	 yGxiuw3fNadXE+74SOy1V/5wcFPJnI9lU/vgPdso6XqSXW6B4q3D9ZE7eY2vxfiMVC
	 IMtEWsVdIh3Stf0F+edjDNAq2qqXtA9CHxkjqU4rOfXUNCTvRDycFA0bpGx2JAqBgl
	 qaoBrgg+Xl/hkwaet2GHiFbI=
Received: from [192.168.178.251] (ijzerbout.connected.by.freedominter.net [185.238.128.139])
	by bout4.ijzerbout.nl (Postfix) with ESMTPSA id 3973341332;
	Wed, 24 Sep 2025 21:59:28 +0200 (CEST)
Message-ID: <6f787bdf-9f9b-4d6e-b7c1-5b734ec0acf1@ijzerbout.nl>
Date: Wed, 24 Sep 2025 21:59:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250909121954.225833-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250909121954.225833-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 09-09-2025 om 14:19 schreef Srinivas Kandagatla:
> All the Qualcomm WCD codecs have most of its code duplicated across all
> these 3/4 drivers. This is an attempt to remove those duplicate
> parts by adding a common helper library for these codecs.
>
> To start with move all the micbias parsing and voltage settings these
> are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   sound/soc/codecs/Kconfig      |  7 +++
>   sound/soc/codecs/Makefile     |  2 +
>   sound/soc/codecs/wcd-common.c | 70 +++++++++++++++++++++++++++
>   sound/soc/codecs/wcd-common.h | 27 +++++++++++
>   sound/soc/codecs/wcd934x.c    | 82 +++++++++----------------------
>   sound/soc/codecs/wcd937x.c    | 81 ++++++++-----------------------
>   sound/soc/codecs/wcd938x.c    | 88 +++++++---------------------------
>   sound/soc/codecs/wcd939x.c    | 90 +++++++----------------------------
>   8 files changed, 182 insertions(+), 265 deletions(-)
>   create mode 100644 sound/soc/codecs/wcd-common.c
>   create mode 100644 sound/soc/codecs/wcd-common.h
>
> ...
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
> ...
> +int wcd_dt_parse_micbias_info(struct wcd_common *common)
> +{
> +	int i;
> +
> +	for (i = 0; i < common->max_bias; i++) {
> +		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> +		if (common->micb_vout[i] < 0)
> +			return -EINVAL;
There is a mix of signed and unsigned types here.
wcd_get_micbias_val returns a negative number in case of an error.
That number is stored in a u32. After that you cannot check that
value for negative value anymore.

