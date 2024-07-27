Return-Path: <linux-arm-msm+bounces-27111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139F93DEC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15D56283285
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291BA4D8A8;
	Sat, 27 Jul 2024 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zS0aIosM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4B42A95
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077192; cv=none; b=Gyoib7kNomHLaoq315J18NS70QVQbmYiOqd/bgChqkhns8sO/GR2ciPMsinGF0ec3BhvZH1kxYQ1mH3V6zi/fcY6nVvz5YUcqTSh92VRoKMKXVHm00lqJHJgBU6rUqycW4zq1xPdp7HVmP4N3IffLmo6lsU+PeklYU9f/1wF490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077192; c=relaxed/simple;
	bh=fa7kLGj++0G0Eg231uyiEToWORgo2WWIgnIiDtLOJqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAl8F9HScyiJQoAuDiVe2kosbZAoFMC5ZVNBUlDo7BFzSgAf8xEns7an6NEfFWgw3Wkm7koquJr5yPXWI+W9PHfq2M22PW88dGWC/PxbOeqNiRwNZ7bEpEdWGiHF637JmPJqy6S4222AiFrNWpEzCGQ0wg3Mv5pWXDwQxrV9/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zS0aIosM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ed741fe46so2200166e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077188; x=1722681988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ/xr1RKgXgl0tJIEKuoNjq+bUa/0Y66j4NiEBoptb8=;
        b=zS0aIosMcof1+y4RkLmOh4tKkhirP6S0w7mO1iwPqyPhFbHYI9MctmJqqdEnyF9maq
         4gQEsZGlVBoLKmusjkQ9BrW6cFXDKZZodsT9EKmZA3M3BcJtX7jqVGqQJlWeDUOioRtl
         L46x0+ehiKxIAxSd+gLEd/07j58ZkRfKubhon77diGL2iy0SqO3VDDSq4UYCG6xXDjML
         /y/cefwqOn1rR/8tHR3NQ9h4mnfxqt21uQ+OM5iRwjsP7h5O+jyUpWUTaM0zPi0BEZGC
         CNRUnO6oee+pR/+ZdoAYV4okoOxWrT/zpQ1MBW9h1PW0tMpji3Ywr7V6GPJx4GqmYYVj
         jnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077188; x=1722681988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ/xr1RKgXgl0tJIEKuoNjq+bUa/0Y66j4NiEBoptb8=;
        b=PK6A+cHwY3+6YNQoIb0jCkfYHBZ+wTmnMGtHF0wKe5hMK+np9JQp+Ns4PEtTwyoZLL
         7gOrU/+rsGiF+45CzZBOhwN4AXu/D0LBTU2Dh45CX8ZvlgUxV/yivSMlKpDGu2vpoUhD
         XX/bqTvJHd9eNqG2r6HjueGXDp2ILz6ABlC9m5EoZFaNK2GiZOIQpaYNnCHAV1ZE+0Or
         Fr8qH1cRDuXp3/WzGzsMgd9UevxXV5nsPyWygMwbkknab4IDHFT23ATxaWNsxC97eKB2
         iUkUFdw6sk+AygxSmIzoexCKpoxwB36AZXWXX6lZMB283n1rAcQeCEsO4dFUIiv8tZx3
         HvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+3H/mKU67WHx8fYqXgDbE0v5V8lDIRikmzW56CpNW8ycHIMiTWQ7ak4jRYaC0chIsWUhC37NSckz2DRxduJzTRknOSPKLOWpnX8X8nA==
X-Gm-Message-State: AOJu0YzBeqcNEde1HaW39nQP7+H2ioSjRikfL6aescIrxt5wh3xU4eiP
	KfJSQyS5nTlRntaIu4z6zz9Ha1vjxBpdWlcqb73g43uvWm9gIrt8aGBGNOmGMRjs5WWei1QkIKZ
	I
X-Google-Smtp-Source: AGHT+IGGP1B2SaB4xulY6ueyuAVpyf5RWWcSGeN89eSnIuMZurceJMYLWHdDgl7Jret0zGlTBndyrg==
X-Received: by 2002:a05:6512:128b:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-5309b2ce92dmr1450181e87.54.1722077188458;
        Sat, 27 Jul 2024 03:46:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09109sm729450e87.178.2024.07.27.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:28 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: codecs: wsa881x: Use designator array
 initializers for Soundwire ports
Message-ID: <bsnfiskyvzf2zrsarek47irjmt3feqyqxi5b6s7zbanagkh7dl@yhqpncgaxgtv>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:43PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa_port_ids, e.g.
> WSA881X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa881x.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

