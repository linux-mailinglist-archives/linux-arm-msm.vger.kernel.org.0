Return-Path: <linux-arm-msm+bounces-26147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B059A93128D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C1B5B22DB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF54813D8B1;
	Mon, 15 Jul 2024 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scQt2OIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF3188CA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040343; cv=none; b=Q+UhDcT/0wsPmnjkD+MtIwWH6XXdwGy8D3A5xCaJsQE4uJCkUGM4Q8ucMch+bxR8a1scOk5PoeOXO9IJ2OZpFeWr7rZ7xAnOivobaNIxaemqeLB9+5AJsPXeaBZdfpJcv0uWN+q5IKfa8O9by4Z4IRyCZXbaeeXtI6/Nk42aFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040343; c=relaxed/simple;
	bh=xjBL2fmW3TgBTvZT0aWd1kqyspv9jLM8TJPFJw+qAII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvqOGwtx8DlxDz6+6f1ihCDJnxvOxF3btldlePD+mThAvh/t6yUuEFztuLALDv74hX03hO0FB8OTtGA+hU9XSaZznbXruXY1ccRDPlFi92BnA0vMmRKzz3/WJggzBQ64t1KIhzJxfqQ7fOCkwTedLOPzmoHwEt9NQQsYwwIX6lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scQt2OIV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso7084692e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721040340; x=1721645140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUzWRVB3Ign+byNOBs/BvozI65zwxs+5D+rjLO5GL2g=;
        b=scQt2OIVkgUQeOaEWb/DzOkDG11+Yy67QVuuptOsvninmGvADk/wqeIs9zjx76q9fo
         qJa5LIPqqTnclamN4PGoY+H8cvum3lJWb5/xBGgIPfILH9DXmgBXuP4hx3qWDu+wy/7q
         s96QyAtW2L7FOmurSIbJb5YmypJFGndby55PRH6zE4DSFz75rTQWHpNsZnHN89CS+hkp
         yhCUO8SREOXVMJtZe3y2PTwvzI8LArGKserCmw7HIkDy2cXvxBf/gQZFu9ih7jwOENsC
         vywKvF+FTMwcQGQ2aM/yldC9q6Q/oc1LoVpHj8WcWgNcJkk/UwCQ9HslG9OchJ93O2W3
         bTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721040340; x=1721645140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUzWRVB3Ign+byNOBs/BvozI65zwxs+5D+rjLO5GL2g=;
        b=BIhDUNUMfioCFsUawg4m42IIwnJ413pjcak2XKoi9r0Cb73FoaQx53+hDBZIuyIOXa
         nq7KJjQdY4BvyLiYUrVXlxU3/o4HmNwrrXpM3Uw/GuofcUaxFklFO9jA0djnh2yQMcZS
         sVC+hpd6agU1iSG4mIXDpsllWYZ03gBe/ZEFJwuzNFZ28IzOtx686K5RPinEFFKVu2hY
         csiCKOYukYxmDEi4KcVRtCZE6EBzw/OupYz2frmnNieEXPIuTQA3WkSlSW9ZSV15GcOk
         4CE5174aGUNjGFzMun9FgMbzLpVGmEOE2s20wG8B20zGvBrm8h1spfLABNrtYbi2/bqi
         3vZw==
X-Forwarded-Encrypted: i=1; AJvYcCUXxaUEoQys54NPs9ZBeN6Na9mlfv2iDK7j0cWOdYRvMgl8nJxZv8t8X0bGdBNfkxcdV1LytYtEu8b29SzGXZaRcj4zgYey+PqZHYmy9A==
X-Gm-Message-State: AOJu0YzMV/RCqFdD9fxIEga9PHaca3IPh6x4y4ChfowuIRbJBX5f6MGD
	r/2U6wuy+JMcCCKMdv29IzgzwLKJSA4fqNSUUiMIoT8HYnpgRTEamM0B15Dopns=
X-Google-Smtp-Source: AGHT+IGlLc7ogIwMfIOjYjHViVtMeOvAD5PbbH1+l3irHrd7ow0h98tjC4a6fY+TC/cyAIx1PWbN9Q==
X-Received: by 2002:a05:6512:b8f:b0:52c:9942:b008 with SMTP id 2adb3069b0e04-52eb9990ca1mr14838566e87.2.1721040340187;
        Mon, 15 Jul 2024 03:45:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d74asm805405e87.122.2024.07.15.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:45:39 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:45:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] power: supply: qcom_battmgr: Ignore extra __le32 in info
 payload
Message-ID: <72ogcymwktce2qhkummff5kkaugmtmpk2467dk4vymsyb447gi@qbo2ql27mvqp>
References: <20240712-x1e80100-battmgr-v1-1-a253d767f493@linaro.org>
 <mz6h625ecs4ozmjxoozjdnunfmr3vsdw5yyo6il5vyzknyzqsz@pun3t27zhiv4>
 <ZpTopJi7GJSLaF99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpTopJi7GJSLaF99@linaro.org>

On Mon, Jul 15, 2024 at 11:15:16AM GMT, Stephan Gerhold wrote:
> On Sat, Jul 13, 2024 at 07:17:51PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Jul 12, 2024 at 12:00:03PM GMT, Stephan Gerhold wrote:
> > > Some newer ADSP firmware versions on X1E80100 report an extra __le32 at the
> > > end of the battery information request payload, causing qcom_battmgr to
> > > fail to initialize. Adjust the check to ignore the extra field in the info
> > > payload so we can support both old and newer firmware versions.
> > > 
> > > Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > ---
> > >  drivers/power/supply/qcom_battmgr.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> > > index 46f36dcb185c..a5b5f1251af1 100644
> > > --- a/drivers/power/supply/qcom_battmgr.c
> > > +++ b/drivers/power/supply/qcom_battmgr.c
> > > @@ -1007,7 +1007,9 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
> > >  		battmgr->error = 0;
> > >  		break;
> > >  	case BATTMGR_BAT_INFO:
> > > -		if (payload_len != sizeof(resp->info)) {
> > > +		/* some firmware versions report an extra __le32 at the end of the payload */
> > 
> > Any useful information in that extra?
> > 
> 
> No, I don't think so. I think we can just ignore it.

If that's the case,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

