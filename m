Return-Path: <linux-arm-msm+bounces-26088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6657F930654
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 18:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A38C282AB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 16:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE96C13A86A;
	Sat, 13 Jul 2024 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y6WoE+Wk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226245A11D
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720887476; cv=none; b=EygY3QGiwQkJDCFZ9KlKTIe0cFpGbPVoq46tVVmLA8t7qavZMObN0VWCOEbbqe1m3slHbjwHGfsBOsSEiosyANKXAI/bO9KLVoK0+7Nqo+kzYd0BGrgv26vJcDTL6NXhVM4UhLKdypqBLZVXOgTsCwpUoz4/1tHnWmRIrP/t/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720887476; c=relaxed/simple;
	bh=AVeC6JbOmzV+YDIjEWna8+HTWY6QK+XKaF1NUnwPQhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBrh8hwkqkyHFWWBps18TGgVVFS5MRVevNZi8+hFbP2GDEz4rAXUzCK6nfKqNgD6oHf+GY8iqImvfxUljN6lYTqucMJ2rmX4fuS0tQj30ALlj+qcEOcP32Vz3ePEwe5v7pR6iJjR0EYCoAUUovyAEdfin9FGc0q1Hgxmti/nwtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y6WoE+Wk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eec7e431d9so38037201fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720887473; x=1721492273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QzoCCe+bx4WVn8kqtzz55rOaqPsJz+25YrGQnujgus=;
        b=y6WoE+WkO205b36tcQMpLkYZ6Jm4JzojxOVHii5eNtKqhZbsKEsbOcIA61bymwXGuZ
         95OZfzdEG+tZzdyQWniDL2DCCxmKsyqAnQijZEJ116ug1wSXKFZTbIfLexSmgRqsa2sh
         NWM+qvMfXnqHLylS6hdZrDs1N3d9EOheilgwjIVpX4EnOInrUk+VgMVy2oqQXr/CWYYg
         D6wd1cyCrFChbyC3NDqmCD3jZQLlj9o+IxdC7oq4a7oIAE051VFOnh21JUAW91++lMue
         02FdXoE2SSTKG5ABInR5kqKmpORsUf4ixcBnMy9xmzr5F4Npg82o53tBRH9j/IV7orOd
         foCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720887473; x=1721492273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QzoCCe+bx4WVn8kqtzz55rOaqPsJz+25YrGQnujgus=;
        b=mqBQGBveETyP+gthhqf+OM45+/HxmvEFmQ3P40FYHCOTs7hUZRpxwctL0OQM+QWbZD
         HgrNISAJGfUyMKw+lOAePcDfFonWPNuuOxEm5njDg/PtEuqJdVswfXlH6NvecxDG1ap4
         +judQb4g8Mltfa3IF8KGrUkU7WzridCKUTAneappmW64/wp4mooad3cwakoVu5Vw9zqe
         Z+es6J6cFySJw2FzRnezMERS+L64xkZ8jDN+A5SMh3ASskClep/rkozHEy/mTF4zrOK4
         EDhoOkgovyqEl2guq08iPTNNHqmWR7a+Qg3JF4PQQmrMUroq9rq8MeLJMkprxouaadoz
         hn7A==
X-Forwarded-Encrypted: i=1; AJvYcCVyDcK8/VJd1FvuZceBD83woWqCH9Q0I+2lehtPlWy5rgHLS3QIGuTAa9LvjRHLpxhdCWKnLRfGatrM0XS0nZ9prPjY5A2eNKqEIGQFiA==
X-Gm-Message-State: AOJu0Yyqbjmq/UGMWPgUszhwE1pF1+1SKPkP228n6sc+5J4bjPJCL0BW
	B1ysSE/y0evz4OLqwX7oSZh7EArngV9zDm+K9NowSruKCD/brjcgOMqBfqIcboY=
X-Google-Smtp-Source: AGHT+IE3TXvkIvufpoqfHUfMHmEf6FFMuThXBRYKg/jFDPHZUd0BIcfLpvL++WIKvIcx1cqmRDNWqQ==
X-Received: by 2002:a2e:9799:0:b0:2ee:dde7:899c with SMTP id 38308e7fff4ca-2eedde78a7emr19466181fa.17.1720887473242;
        Sat, 13 Jul 2024 09:17:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee18bebc5sm2401961fa.66.2024.07.13.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 09:17:52 -0700 (PDT)
Date: Sat, 13 Jul 2024 19:17:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] power: supply: qcom_battmgr: Ignore extra __le32 in info
 payload
Message-ID: <mz6h625ecs4ozmjxoozjdnunfmr3vsdw5yyo6il5vyzknyzqsz@pun3t27zhiv4>
References: <20240712-x1e80100-battmgr-v1-1-a253d767f493@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-x1e80100-battmgr-v1-1-a253d767f493@linaro.org>

On Fri, Jul 12, 2024 at 12:00:03PM GMT, Stephan Gerhold wrote:
> Some newer ADSP firmware versions on X1E80100 report an extra __le32 at the
> end of the battery information request payload, causing qcom_battmgr to
> fail to initialize. Adjust the check to ignore the extra field in the info
> payload so we can support both old and newer firmware versions.
> 
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/power/supply/qcom_battmgr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 46f36dcb185c..a5b5f1251af1 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -1007,7 +1007,9 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
>  		battmgr->error = 0;
>  		break;
>  	case BATTMGR_BAT_INFO:
> -		if (payload_len != sizeof(resp->info)) {
> +		/* some firmware versions report an extra __le32 at the end of the payload */

Any useful information in that extra?

> +		if (payload_len != sizeof(resp->info) &&
> +		    payload_len != (sizeof(resp->info) + sizeof(__le32))) {
>  			dev_warn(battmgr->dev,
>  				 "invalid payload length for battery information request: %zd\n",
>  				 payload_len);
> 
> ---
> base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> change-id: 20240711-x1e80100-battmgr-1eaab3b8f024
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 

-- 
With best wishes
Dmitry

