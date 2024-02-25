Return-Path: <linux-arm-msm+bounces-12486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411C862CE9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9217C1F22022
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647041B94A;
	Sun, 25 Feb 2024 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vduig1bT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E556111A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894005; cv=none; b=tF5871ZsxoxZfw4mTACEQLMgx/curIRwz/NreArdmSzQJlu1vNG2j8Kw0tJudZ06ax4Slo6JqfeEfNnSmg6OjdioVPKn4jxmzIVArI8udVaKq5IxpbS96Lu2MbQzopOHUx0JWXQaIr9pIBsP3PwYoikTXYSZHnM9v3G2Ia+Aw0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894005; c=relaxed/simple;
	bh=SrPQRCzhMvMmii9hQdPXD1YvNqRI54qycQwonRLO1ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zgqtc0mk5bZCAfxULmvNsjHlpavhCNXxr6L/caRoFwkH/ly1df99TMVOcXrbqRg/f5qpWr34Sp1RdM8kiHubw04NBIvA5nsIhFmXH/lN0IZaOMne2wjuArHyFv8Q11GBphXihiPh2TgxXm8Rv/JRZ3CRaYVvn6T8JkVze2TYSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vduig1bT; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bb9d54575cso2079083b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894001; x=1709498801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jaoEWYXtOjOULbW2yMrOmnPYIPrfPlzxVubLNRsgJlQ=;
        b=Vduig1bTlKQbu0yvrCM/lHROy/o0ypR163cnclNvudv3dUoUjENn0cFSdPIeQm89s8
         q4btaB2uktWptukeVFh/71G45Z1czfj/K3/XagmBfqv/sWCbG+uWbv7xzGv2vxxJWsq0
         J9+eXFOoWaer0ppit8cWeRTwY25TQ7qDS73DvvWtSMx6wLWzEq3KI5Ci3x85MbrZO3fo
         svQ2x81PE5dKpA+XFlXONBlVrq8JWLynaA9C1/TQFa5ZKqpufA8wA6U6INGM4Kr1qSOb
         w5HM9ksyVKdxyUZaO3RbhyWXWoTH8qtCuoB7f8eIJdH2FAd7SaHG3RBBavDT16+ClqIZ
         F6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894001; x=1709498801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaoEWYXtOjOULbW2yMrOmnPYIPrfPlzxVubLNRsgJlQ=;
        b=Ixs4AWGq/SMgogSB4AVhsyWU6VmmZT7nGcsgqzw0F7ObFBWRTz0QzAlzWiFQvooMAL
         nsIRvBqTPmQCqLeOM3SE61dZfJjBva/XDezm+ZY59hiK16NtfFpdHjSEBUYeeVESYSeG
         xrQ1aFMc8tS1uyqSk91ylXoykFtiipWjypGavDDkSjb+TxLqtlmmaIG97Okavt9+bc71
         qoOJUqvKgfQFheqvqMKZgRD6bmGu5WK+yTqEzPtN1S+xls7ZaorlNEd4H9M47bZjWX52
         80OoPoitct9hLSGEXx1IwQON8exmh50qcrwt26yVbQpIPmVfn2A22NhoEOpsnQhf8Yg+
         v2dw==
X-Forwarded-Encrypted: i=1; AJvYcCW1oqbLpIXZsj2WiDl7zYgABJG8OZkGDN3LnR1f6GveSc7E5eoqMbSWdqiCLT8r+pYH1nsFTldotGugpgDfNHse/rVuK3S2INo4uK8eFQ==
X-Gm-Message-State: AOJu0YyX9A4v9b4jk+I3fC2uEOOeO1/DbWegQgZKGv137ThdhS03ZZyf
	J9/GWckwFrvA91JiS/rlPBjwuXiJbMEa8fIPU4DwycpRDE2UdASFBaFmCVwGjBkaM/FfoMPj/FT
	7BnLSii7vGvZmT7JDJIGd7Fz4cMlQOUwdcGQ9iw==
X-Google-Smtp-Source: AGHT+IHiHD4DCI2MPVcMU8ZdLBW9A24hnVLA6ZCjQvJY+jivSwWXTU1+Dm3VJmojw/adwKuuhVJDjGQVaJJkaIHmpPw=
X-Received: by 2002:a05:6808:d49:b0:3c1:9caf:c0b2 with SMTP id
 w9-20020a0568080d4900b003c19cafc0b2mr3215443oik.7.1708894001601; Sun, 25 Feb
 2024 12:46:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225202744.60500-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240225202744.60500-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 22:46:30 +0200
Message-ID: <CAA8EJppAKRiSoHi3icFymSQjP-TQrOF2LcMEnE=BmK+=nv330w@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: qcom-pm8xxx-xoadc: drop unused kerneldoc struct
 pm8xxx_chan_info member
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-arm-msm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 22:27, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Drop description of non-existing 'struct pm8xxx_chan_info' member:
>
>   qcom-pm8xxx-xoadc.c:386: warning: Excess struct member 'scale_fn_type' description in 'pm8xxx_chan_info'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

