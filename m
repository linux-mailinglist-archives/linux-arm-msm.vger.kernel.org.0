Return-Path: <linux-arm-msm+bounces-27116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0866293DED0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B695E282DBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171A655E58;
	Sat, 27 Jul 2024 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkX24YXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C174A05
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077375; cv=none; b=sQj54PBWKgUkkglZ01CK/xQoN+9wwHxWHYelydqyCmC+Q52royReLiwhaWtKN/KnxmIIKgeLZKGf62GEitBFgLB6taoLPO16tOhYXjZBzr9RTjaUNEThs7YP61Wh/slJgZl6gL9YHkgjdsVPrzj7khsDnGysHHTQBby0Pi82u1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077375; c=relaxed/simple;
	bh=0oZ0fowpposgg1hmSxqfPXm1dtlRuKN3xpqiuu5rB6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHDLXCE7EzuQnZF+xAs5u5/S9NTX30ABkKoSDnZ/QWcQK+5blA80RA5+hGrp213VRkijkVsq0z9hlQE/ZulMYlwVi838PUj0ekTh5CACXZ+6MPlBBogRZ1YDb/1YbFsboFMT7IJrbIAla2Vnau+IyvU2UkjG2PbZUzE2eUzlogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkX24YXU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efd855adbso2985235e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077372; x=1722682172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNKzx3azHXxh3j5OMY+IqqDu+KTxQQhcMUOz9aaOMTQ=;
        b=WkX24YXUsz4cQi/PxZhds/JgCJoFN72mJv3KS88/+z6++xWLTTqTKQN3BB7ezyyikI
         Whzy++mEiQrHfFSwRwq3BeEFmPU9yXMgufZT9QAc0mzJrwOlwK1fBSsKE++SvsyrYYFN
         g7jZVToC89yLSQ8HDojQU2RFzpzNFHOHpV/mRYOhhQqWz0nqYfWRLCNEAS1k+mcFfNr/
         YryXxtDJYxyPGsqAgy6T3EdPcVseylmHFkl368CsFCgQBQ4Gr/qbR1yJixFll5N8SK65
         FZcWxS8qR9PITOrXbdTb8tZ9Ouq14Q5rGc7oA78TesuOLLHfydVTZTQKvg+T66Y1aNYr
         6Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077372; x=1722682172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNKzx3azHXxh3j5OMY+IqqDu+KTxQQhcMUOz9aaOMTQ=;
        b=DyhOYuU+mZs/u8ChOibmeWnApReZ2VcYB3t4rQjrWceH/gqVWqjrfGhmhTYvhANPYE
         82iqBFFf+kSEo+1Xtied0fpUbLRLRUNSmhOtsfxBt++V8PxteIail4A6O2ufGGkbB+f2
         Uc4Zq3jiXmPX3j+bP76gy3swfsLUm9NDOpp6hnGn0alItN4v8XkU3xpsuhiNhMdKzHeb
         FtfdniOf8IPyoqkLOhqrVZb4ECjFUcjahzyiq+moY2Y2Ujm0wx05kytKQrND8FPjRLeH
         nrAsBuiqTz/8i5brzQcT6qRpr5pQF1eiNAtJfsBAEkLiuNLSKEAmuljsGvwF3t/ehoO2
         oUVA==
X-Forwarded-Encrypted: i=1; AJvYcCVjA0XPhbfpeNHnlCTf438X2bCVH0FpJewmJloAZfMgU0KyLUd2dzAH1N1tRkQPMeAHLFRCL3RJNHZIi5u+aBOZGv13U7iYK4QHbFes/Q==
X-Gm-Message-State: AOJu0YyXFxq/o3t6lQlv4ZJj/PHWpdIUAcFB4reV/vhW7ELqAxSg/1vr
	EPtsYCxq182RkFKPN6+Qg0Tnr26d7D1JG4nS5QvAk+nCbAulID6pVKyzt8dZlAE=
X-Google-Smtp-Source: AGHT+IGxziVLosYTzs6fsYoTWkq3wWwSbcxZCa9nxslFM0uZIZe3gN9qbnNwurh64J1lmrZMg2moVg==
X-Received: by 2002:ac2:4f0f:0:b0:52c:cb8d:6381 with SMTP id 2adb3069b0e04-5309b270661mr1909187e87.13.1722077371627;
        Sat, 27 Jul 2024 03:49:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2c133sm734387e87.252.2024.07.27.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:31 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] ASoC: codecs: wcd938x: Move max port number defines
 to enum
Message-ID: <uc3zgtkfw2gbgy5cm5hyf4i7qq54uagirxnp7sqva45wfc3zrd@wlqsuhx7mhgb>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:48PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd938x.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

