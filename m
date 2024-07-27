Return-Path: <linux-arm-msm+bounces-27112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B331E93DEC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B1B1C2144D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F08F56452;
	Sat, 27 Jul 2024 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTuR7ebD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F97839ADD
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077206; cv=none; b=lyLgLcSIp9G1fPfOwX95G9E8t4GcHiwWfkvECER9P9DKf5C2zlIGvm9SrQzMb6SeWCgUCCpGFROMKW9qXSxg9dk8ip5Xo0L9zi7o05Rf0DEMta1UtN3D4LwLAa/2OVep7sHU+H+YYL7wB0jL9idp8Yl5UdwQ+IK/i5B3OCf6UII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077206; c=relaxed/simple;
	bh=eOfry3nuvu3HHLuEem2iFGqJmfkmEBKnxmiPgO/CPE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ap2UIIxum+MXlgt8qaRVVPTgdNdoSIYEkxIbckaTqRiLhVLgi4kWmd/ABo6en4iLbNKiiPAE2NjOvP5XivYZHX7jjMJrS4Dkv/D9gyhNw9kl3AVaKR3JGMIsfVq1UqhIxDie2J1LusvpBbJZybtlQiqQEgxsN3LIBimiDiqOokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTuR7ebD; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso2472331e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077202; x=1722682002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVI8E/Sy9x/V5MZN8kodRJsfEHReFS0Uyz6SOoGkWt0=;
        b=gTuR7ebDTw7OuoUlBzXeM+9+buk4aOWwGmH+ogH89n67LSG687iFPe6pF6f8fBQo/c
         9ABPblWDVDQ4q7rxJB/X1kjCUCJd8RtSH6i2CHCf7/GVRInHQXDBantFcrp7GenZdlwG
         eeV5+P03tAdVrC93J3329xA2lPqmEGZFPINxox0EsDuW3H0FaSfIQPvXYPmps9xVNzR7
         RFcyH5WS+K5DJUbLro5iRmzD3jId2V67lF3HfNXWhtCClOO7Ghe22/nl8nlzExnc5wAt
         FaJHXM6wwFBIfDkW6+OJrDLee32KenEwSZK6Pm3Zuw7FYDrvc7dc/zFCYTut+3PlSIiN
         QfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077202; x=1722682002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVI8E/Sy9x/V5MZN8kodRJsfEHReFS0Uyz6SOoGkWt0=;
        b=GvBOfR00w62aXz94rHFEIPJeh2td0wKAvVKenaeBJfAO76Uvgsj0/xsT9IZY1Fus1E
         yjX6KNc6iGHtfrky/qzZtMam1v0A3TjvD0SYpjJbmfkpGq/WJoi2IeOcVvZPqF4uDubv
         3U6sOmwhb1HNVsZ7CFCf0mM9mecmlCAy+c2mD06mvLWpdKZNIMM82QVUMLBYkDB2+HEH
         mRWXUzsH3krlZSDOG4sFdoefVHWU5SYDEEg5pi9ZNgyeJjSf16tkxR82E8ZedmJJOWNR
         HzPZu1utWg1US3VdFd1zNh0Zx+H/oUr4s7mtyV96Gek6vefjPwS3zSpSQtzZVQXXJu6V
         yp3w==
X-Forwarded-Encrypted: i=1; AJvYcCUFaMNgF3V2hKImrU6xqnPNhs3JtAWJOdBbxq96NCQbakeTFzRvaZ4Gd2iNnE+AsUaFDLoo8ZYsWsUQA/M7T2EfnxNFP2I2fNT/3bdXKg==
X-Gm-Message-State: AOJu0Yw8QbQFzCmMCJwAT1aTf8MmiDmjUmplEhvHQRYprSAmonSzlGTO
	iDS1jhUtN4bTp+zZxC/d/NXgutOOOpvGppSItx8ut/xlTSrv4EQwhePALUk0E1c=
X-Google-Smtp-Source: AGHT+IEJNsQBjiCy50HzlScOL2HDolaoWtEKLNxWFk06ri5hkBtcRmQ7gig1E9sGyOIgWavI8qXGNw==
X-Received: by 2002:a05:6512:2144:b0:52c:e0e1:9ae3 with SMTP id 2adb3069b0e04-5309b2c79fbmr1374032e87.57.1722077201922;
        Sat, 27 Jul 2024 03:46:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd11dasm727514e87.85.2024.07.27.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: wsa883x: Use designator array
 initializers for Soundwire ports
Message-ID: <dd7h6dg6uutup4av2dxvmtr6ucxhojmicsfnxoj5y7wtglnuwn@r4u3httvsn63>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:44PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa_port_ids, e.g.
> WSA883X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

