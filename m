Return-Path: <linux-arm-msm+bounces-33280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795E992122
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E30E1F21188
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E11A189BBA;
	Sun,  6 Oct 2024 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3wH7NXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B256189B84
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246609; cv=none; b=L+vBHMXdYwOrw/+XezLq4dtnfCZpxuCMMytL39RWT8r7wj7K445ajjwQnVzYbLu5rdbhtEWsNdosgfvwSfIw5qRxu6F7pPuPlYhggL+AtZN1blzjXoHxPPvuyFZ7YgX6iO4AREWLeivQ99ByI6VbFgZ+QPIPys0TS302DS2f+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246609; c=relaxed/simple;
	bh=4c9+KGTiwcO0wZGDXDgLt2CmDO69Os6Wz+W7uBwFA0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCZ1+RLGd+igFORbDTI6iaK3IZtULOdJOcjyYqM32rtiWFxQJVmcnbj5oDXF7UQiy/50tTwy/3uRguR2l/gpl6AcUtwlNNWRJNivevZIBiE6PIIeHhYs13ONTWQpIv0IKIX3uePQdDhsifvBAFqxmVjEjlIqcLGyca5GUezU5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3wH7NXz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539983beb19so4534526e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246606; x=1728851406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKRJXoG/V96zfzQlXk7NxT0mKPnxf8KDSvA2Wf0bVAw=;
        b=m3wH7NXzobZilQHuzZEz7wZDnUkbBUDS0zanFobg9gzHDsMiAO5VTczdlcZ7boeEO+
         CYoEvy6EabXKwgfnK8gAwUc2sWaQmT1sF4wssY3rEae9+IF5KX2Ar+WJFQHn16fxueU7
         K8TaAiS6r2UcjqZ44gn9MSidgsCQeryPqhOACa1j5/ll3fNFrGTVUMQl5C1WgWl0nBXI
         rZ8f99mjRrz2KRgnOCF0bdZY6raUjerxupFbwUjkQWlvSTAWEZpS8J6877NyP7+4wD8+
         sLdmPpxp234iujQgKTadUgtwOkvffadLdQR+wgxBJgGeUv3Jn/nnTDjayMgw/ygC3j5L
         wfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246606; x=1728851406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKRJXoG/V96zfzQlXk7NxT0mKPnxf8KDSvA2Wf0bVAw=;
        b=mog5RkCrpWGy24GnGhqb908xg2408/Tokhl1KomUCalAyH1/HOnNHnmuvKjylFzSeT
         ttajb/20WmWqidMRg0uWIVS8bCLf1UQvgEKobkF6nwjco+4NYTMkfM3Y5lwB+V2l38YB
         McomC34jipOLIuJnHy9AZ9KbhJJ1+8QTigRN5QDtvrJac5MX1EAz4KUGSY57/iUH2l1t
         Qlz0tN0GgCQsvIhAAHLUktNUQ6IVQo93gcCTVUqQMFLDU7eINHDAun8tn5SEyrqv/LxL
         Afk7obtYpC3PXU1zni9LK6RtsYu7M8g5dslEngGRgdVU57/qk0+bd7whBmxEa6UphS0k
         CQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHpIEW2xZicWffhOj0reinbDDmHs4rD0Sp/SqBoc9jy73Iu+bNVPY3UzbezTL9U6ousph83rhiH4ATWiON@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCI8YBmAC24EFWQr5UqJkU1DtN+p6z/1sHvJ9tpgvM+MuCn+a
	4dmbpGBHnQ6js6ThzjYnPvJo5XVcGNHeZLk3aaQEdjspJtgCyZlRJBYTApyG7Wg=
X-Google-Smtp-Source: AGHT+IHGm8iXDV3xjDyilH88qj9I+HIKb78i59wZamBlD9e+iLmpZqrH0JJkihn3M1K3x9pCGJ9pwQ==
X-Received: by 2002:a05:6512:33d2:b0:539:9e9d:18b5 with SMTP id 2adb3069b0e04-539ab86655fmr4313110e87.21.1728246605637;
        Sun, 06 Oct 2024 13:30:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff27a3fsm610809e87.246.2024.10.06.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:30:05 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard
 compatible string
Message-ID: <b6was3uqd4vcs5dsu556xkbsqodqfp75vhtvclzokpzuvbqjw5@q7f2nfvdxpdb>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-3-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-3-alexey.klimov@linaro.org>

On Wed, Oct 02, 2024 at 03:20:10AM GMT, Alexey Klimov wrote:
> Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
> devices.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

