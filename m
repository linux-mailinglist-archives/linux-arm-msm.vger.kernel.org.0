Return-Path: <linux-arm-msm+bounces-29956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A809640F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A4E1F22C36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8362A18CC1E;
	Thu, 29 Aug 2024 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGCPhCqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104815E5C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926158; cv=none; b=uixOfXIloWmcE+0n0qibxXrhg9GMJzUoRSeMF35GdLkGbJmTXN+/47jNP2iZ88R+/pCREg6JgI1fKp8duvDTdwOijSWQn91l74/Wd7UJ4IeovIeL1MkOMj6N1cLfiDTZGvtpCLYYqOuWdyJxaGrWf/Y/vqBE0WCOjCiNl5+sxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926158; c=relaxed/simple;
	bh=kWBsuFmGkihSEyQQDgT5DhJM7D7LFu6T4elAYRY96ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezWaYdd4sIvZY7ZmUwAhR/uasLIVSP81czP7g9WHLGOfOJ1Cv8emh296jQaKGb5p3VbEGFzjdGt3EoJMkcM3XUzesufDpt0kzE4RnMm4z91hB2o+f6F8uh9+bs43mYfrBO2jmPUB0SQFrlUrdpA8WtJcTBADSU1SFPzrRRHHq34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tGCPhCqg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53346132365so668258e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926155; x=1725530955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpmTADqgKTRDxLQsnyWv6F/72Kra2IwfcRmr0boWBT0=;
        b=tGCPhCqg4lCoqiYBE6VKzfmDLtLxBOVGyvgv/Prp+a7t3rh4EsOvT/2JvXWu4tjrqs
         e5WqKOYXKcesHaJBdO6/Tj9vtuK66uP0XFmdXJccF82yaS+PysvgktS2p8UV+02X2ptB
         WJUDuxQmqxQ65+RoYhBFLIUofgXOCtAm4gu1ovaOZUQYhMbrY/gk/OcinusJdOzOkI9C
         ikz7++nMDE6njKgO7B4XbfUV2VIBDNhvtYT/uOQCWDlgpR1hzdm3BLyiBd6zljcHFllW
         XlXfauNxQKqmQfqpo61W/imaOb7354KDdjlsLGfF35IpLa/EAWENPDdFA6QYjzf/JEzY
         WsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926155; x=1725530955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpmTADqgKTRDxLQsnyWv6F/72Kra2IwfcRmr0boWBT0=;
        b=RU2oYCx3MVBfzKMSugCg8GgpxCDUHwOmjeV5cQuNjyaGU7U8Pv8aaTZfu88gYGtSiH
         UeouPTGCc0Qw7FqOWaRkH9DFrkI1metqyOvPiQ1eqS+N3JVDDu1bDJcrTfcjeX10DsiW
         qlYGUpN/ypfewEwGI7WmRCRWWbGN05KWM1UW24nOlhZVaivfWcqoEyaL6MzDRIGbbK2j
         qMprk8fEOzm87i2xCHEZh3m+4UOPfwmVh6oTiJy/5PufLVjwQ+sg9FCO0z25SRZVxyjE
         zpEhSf2uekRpH+Xy1U+ngl6RLgtAEPSem34JU0Qrpj1OSFoMTVo5NZy2OHG1g4G9P7Wh
         EeJg==
X-Forwarded-Encrypted: i=1; AJvYcCXAsqTocJ+nSbMnA2+BD/Y45x3qGDhBt33LFsTcPl7QhNxMGmtbGhFRrgkYS1qG+P8jCNr4bPAvecL5iLzC@vger.kernel.org
X-Gm-Message-State: AOJu0YwCgtLWjWgGKWHLCzoaYVyRUvGsgDm711o3ca/WFnZpRklgsPa6
	IJe07q0UdxkbjEKOE0arSQKKmpuereCgVq6xgynFS8JJNaMdx0PInjEK1QIXLZU=
X-Google-Smtp-Source: AGHT+IFTVCDd/VtNow23vJ0byz0hhcjE/CtVCsVdqnShlf6q5GR7gRU4fm+vifvapKfv7govaRhZpw==
X-Received: by 2002:a05:6512:398d:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-5353e5690a6mr1346437e87.22.1724926154126;
        Thu, 29 Aug 2024 03:09:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827a11sm112831e87.162.2024.08.29.03.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:09:13 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:09:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: qcom_spmi: Drop unnecessary
 of_find_property() call
Message-ID: <b374tfltb2vp3gr6nqmamlcl7lkz5crwj7elyxy6wh4izynxut@uin5lvjdhmz7>
References: <20240828130056.3481050-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828130056.3481050-1-robh@kernel.org>

On Wed, Aug 28, 2024 at 08:00:54AM GMT, Rob Herring (Arm) wrote:
> There's no need to check for presence of "qcom,saw-reg" before parsing
> it. If the property doesn't exist, parsing it will return NULL.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

