Return-Path: <linux-arm-msm+bounces-76833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBEBCF4B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 919794E148A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 11:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA3C24501B;
	Sat, 11 Oct 2025 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="oteCeune"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FA24502C;
	Sat, 11 Oct 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760183651; cv=none; b=k/9CRe6IQGZHBRR749H/laOkuZndNgEs8P+ubDkKBx1eNwYts9PtJlRJwTVOIO2fzkom4Y7XU0eHbPgmZaKC0jPEYsxujvTaM86QR9u1ZMbetNgQaY8csEkos+eoTR3+HWoPvYGlEcJJkoDlwGs50NXQlMWPiIAxUEgg10Tn7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760183651; c=relaxed/simple;
	bh=mEewQEeW1ZKMWAqqei03DAOaM+/b1B4crk7qY31w4fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC3EcTTKmsCZ+EByUv0SDEXeG/X4pEZ+UtbKxZ6RitOGzjxsr6q+t77IKB5YW1v6GGRg69vV5bNMiH6erc0UTCOvRSuAgwgwCgaZLO8h3q0lPyxGBxPee4w2iGxOKABJLVorSQx2Hw7DyYaPo9MWUWGMIu165cDCCvu6Ej5re3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=oteCeune; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.10])
	by mail.ispras.ru (Postfix) with UTF8SMTPSA id 73E0440762F5;
	Sat, 11 Oct 2025 11:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 73E0440762F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1760183636;
	bh=iGhdXXwysSfRYci35fH810kNOp+mcARlZ/Mo2TyUUAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oteCeuneXRUXO6cK8/T7KWzLJs/hi1ssScrkCsEQZahCZeZjsvswiFHyjI26ksYWD
	 tD8TGyiMPggDvvf24M9aJWVn/QYKbDSOo/FNxwDoG3CWr1ubvJhs4oNn7c4n2pSwSw
	 1uIkvgjLhHduezIPyOx0z+JaaaFBvyZQNOXZu0/8=
Date: Sat, 11 Oct 2025 14:53:56 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, 
	Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, lvc-project@linuxtesting.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: q6apm: fix potential overflow in q6hdmi_hw_params
Message-ID: <20251011143509-ddb58b57cf935caeb3294008-pchelkin@ispras>
References: <20251001101304.612758-1-n.zhandarovich@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251001101304.612758-1-n.zhandarovich@fintech.ru>

Hi,

On Wed, 01. Oct 13:13, Nikita Zhandarovich wrote:
> --- a/sound/soc/qcom/qdsp6/q6apm.h
> +++ b/sound/soc/qcom/qdsp6/q6apm.h
> @@ -14,9 +14,10 @@
>  #include <linux/of_platform.h>
>  #include <linux/jiffies.h>
>  #include <linux/soc/qcom/apr.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "audioreach.h"
>  
> -#define APM_PORT_MAX		127
> +#define APM_PORT_MAX		DISPLAY_PORT_RX_7

(DISPLAY_PORT_RX_7 + 1), to be precise?

>  #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
>  #define PCM_CHANNEL_NULL 0
>  #define PCM_CHANNEL_FL    1	/* Front left channel. */

