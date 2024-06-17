Return-Path: <linux-arm-msm+bounces-22844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4D90AC78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 169AB28BC11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329441946C4;
	Mon, 17 Jun 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oH8wpgTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46C1922F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621983; cv=none; b=QTU6YvvZL8jpFzf9mREU8cVLUGouLF8g5Jz/AsjUf52vAg/AAlvVKvca+yQw7vZgdUL1vBuvzgg4yPIEJZIY/vEub4z34swrDecCirtEGbM2OyGicMO8r3F2+Xa5xxSd+Q1OoURTeqv7xiYyRW/0q+1Xgw9SzIYInUBNNm1dpKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621983; c=relaxed/simple;
	bh=hn0Bf1NWM1oc7LXNFaCahn5mq4WgzQD19N141kIkogk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFqO9T10+ktf92MeqkiuD/WTtyWPcjn2NSmEm0h46zb6sjseRSuGOteC6eywfhZK3lmN+Ql+g87zBetRvHiI+Zk8ZVAn5kOaB+4Kiwnry2XnlN2uFMFnjWxwk19OLIeTvLT3ue7tYdghVuS18YCGme/c7kodZN5qgykmNhWJLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oH8wpgTI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5295e488248so4766947e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718621980; x=1719226780; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMWWdj8v3UJOtnq85Kv3lA2ksrhKp9Sh6LU/DO5R3WY=;
        b=oH8wpgTIm1A4ecQaBntZAx21mz/6NFG9rTaqgGyrWnq2Ge1YTw+bd5wyMGj1AqRw5u
         p8qSY8W53SsQorx0ozorHZhIb1LF7CN+3+ZtYVGLgYgdOXZ3MUgduCnSilixCrwc1ZB2
         LB2IumBeOuGk5bSCK3mhk/1bwXHTtH+owvEKpmzuRXUqi3F76FXQbR43L/lb9R3EOLqM
         5pTM04icMNZxpYBhRGEKwck30XhtKn+6+JDb2SiTqowW54NYIMfr7g7tBGf2IC7MGeJX
         u70JOereUxFKBWr3frK7jWomQFBIz5NoMVf/+AXTBp1y4aFG7tlE6L1AImerrrFReVeK
         cFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718621980; x=1719226780;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMWWdj8v3UJOtnq85Kv3lA2ksrhKp9Sh6LU/DO5R3WY=;
        b=qNf3mrpKOjVd0Jvon7T6BXBNOCbigXEzmhGmKYFDKTuKLfS6QB9SvytB6uIrnvLZS8
         rhSmMJ2W8SLrtUfCJ98EUfGzU1uZI1e0mLKKeOyv89i3NFbztHEzEIXjUb+c0fstrBU2
         5OKqd/uuC3NCj2SJxO6/7Cfj4+IUaeLycsKo6HqAX6h9Eq/O1wJ9hZHykH9r8BYKbpMw
         zkSjQ1/JCqJidm4E1e/UgpkdLeElmygPADaGC3G6/5LAz2niR9afeBdrHCXFKGTWCSuF
         /tIJgbJAOYYGg635HHsEHBRzFD2Fw1hwC9oBXucJknWEP2GeAb87gcGWQ1GrUQgIjITd
         dvSg==
X-Forwarded-Encrypted: i=1; AJvYcCXwHfevvon/M6iUIik5Bfsyv7tX413GQEL8/4RJwm+Q81c2Rr0wjuuGfnHuCcIhgkPc4u4NuuKnKdANJ/rZ/yGDB16NzuIEwyv4++HRWA==
X-Gm-Message-State: AOJu0Yy+Uc6uSCmERPPag9DsGSWMRMWamxOCD9ptWRn45cx3Kn7Ja2hz
	ilPxgib/3nyPrp9I5WClgOPE9CvorOxDYKRv8MbhP91NjzjXVJloSJ/nxIwNW5Q=
X-Google-Smtp-Source: AGHT+IFqAzFY+0ttoTNIzHDFsWgde4oqakdrBhqn/iZoFRhF2FTpcHR1pQJNhRNN1sSyumZ2mhg2dA==
X-Received: by 2002:a05:6512:2345:b0:52c:6ff5:aecf with SMTP id 2adb3069b0e04-52ca6e8fe40mr7811655e87.42.1718621979723;
        Mon, 17 Jun 2024 03:59:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f3e4sm1212268e87.93.2024.06.17.03.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 03:59:39 -0700 (PDT)
Date: Mon, 17 Jun 2024 13:59:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Pavel Machek <pavel@ucw.cz>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, linux-leds@vger.kernel.org, phone-devel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Bjorn Andersson <andersson@kernel.org>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Conor Dooley <conor+dt@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Lee Jones <lee@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [v4 2/3] leds: sy7802: Add support for Silergy SY7802 flash LED
 controller
Message-ID: <nxrodsfowjfn64dn6idoi56hzrhdszxylmw6kdhgxbt53akamf@aavvblj64syf>
References: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
 <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de>
 <ZnAHsRn3N4mwPL7q@duo.ucw.cz>
 <e9fd75aa-3bd8-4227-ac07-fc762e558ea6@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9fd75aa-3bd8-4227-ac07-fc762e558ea6@web.de>

On Mon, Jun 17, 2024 at 12:18:11PM GMT, Markus Elfring wrote:
> >> Would you become interested to apply a statement like “guard(mutex)(&chip->mutex);”?
> >> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L196
> >
> > This does not look like real improvement for code this trivial.
> 
> Various source code places can be updated also according to referenced
> programming interfaces.
> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup.h#L8
> 
> Will corresponding collateral evolution become better supported?

Plesae stop this. cleanup.h might be a nice thing, but it should not be
used to make code less obvious or worse.

-- 
With best wishes
Dmitry

