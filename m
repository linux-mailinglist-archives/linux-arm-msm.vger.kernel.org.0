Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7B61CAD6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 15:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgEHNB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 09:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729104AbgEHNBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 09:01:55 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85664C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 06:01:55 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so694868plq.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kGzbyp4Kjfdk0C7XAI34MTmYL3nwyLfAJVV51p0QRQQ=;
        b=CF4q0AcAWs+gNm/BRV8XXJuYXEshbcdx4waTzNsl6f8XC/ObC2lT3BNSbf4XFQWfud
         sNOMw1dGhOaqC+moTrFmh9zxj0WCOCKaorsb0MjAj/aZ91SS2dMG8+bGbjl/8fHRZGT2
         koylbEyxvqVHw9jfcb6Tl1TpEsCt3tI3XnEonL9EYb4cxA7x9GWXPOvc5hwfNqEuSDV8
         eiiDAshP3JjOtvVVubQGeexp4BZurXK9fxJyucj+7GbiApJ6VrDDQT13jL/LHx0AGSSK
         jlRAGzq8r68eegSuYMe4GiQHnnKsMrxupn0X7lR/I8B5nthY+r0eIkQscYNdOXroQAkl
         Krsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kGzbyp4Kjfdk0C7XAI34MTmYL3nwyLfAJVV51p0QRQQ=;
        b=mat6LpbVXXCbb1/aTR36JRhBjapgvnN/AVYu2Kn97libXdyAxrgy7JAAm35H33n5rw
         rDsPZ9wSygsOmQFJEHlgCtw7QDGrUnfd36d5LgWyRPfhTIKI++XaE9jSXTZI6iqSdXtj
         QlzcCeosnQGeQ+iKJJOzYVzV3Pv2en9QW3HKWrPwQN1Dg/aET6U4n1q+GOH2Yqzt3+aY
         OrPLcpDoFxMoOxiDhikrCtUY2iI/A1jajQVJ1Dv3OSDdN035GbuW/T0hz4Z8fR3Y28Wg
         9QWoqUZ+3JxHGgyQeTPLHN/UUBmTVs7ZPXIHtTEVES0X6UFhVpZTwtEr5q4EuYmWdTWR
         /Pxg==
X-Gm-Message-State: AGi0PuYObGrYFgaC+k1tQXZusImqyrxMSoFSwmJujgBdShUpd1wGBP0j
        fgn1dXETp/nSz/ccy3l08KjpGw==
X-Google-Smtp-Source: APiQypLRMfczMLb83FfQL3CpbR7x4VwRtVYZWrJBkdljoWqkQTCekuduvqRRETs6ReWunf8OBAmmuw==
X-Received: by 2002:a17:90b:34c:: with SMTP id fh12mr5492480pjb.134.1588942914984;
        Fri, 08 May 2020 06:01:54 -0700 (PDT)
Received: from dragon ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 141sm1828359pfz.171.2020.05.08.06.01.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 06:01:54 -0700 (PDT)
Date:   Fri, 8 May 2020 21:01:44 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: add msm8936/39 and apq8036/39 soc ids
Message-ID: <20200508130143.GC30486@dragon>
References: <20200501205546.151575-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501205546.151575-1-konradybcio@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On Fri, May 01, 2020 at 10:55:46PM +0200, Konrad Dybcio wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 

Please write up some commit log.

> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

When you forward a patch from someone else, you need to add your
Signed-off-by.

Shawn

> ---
>  drivers/soc/qcom/socinfo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index ebb49aee179bb..14831ed392e28 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -188,6 +188,10 @@ static const struct soc_id soc_id[] = {
>  	{ 216, "MSM8674PRO" },
>  	{ 217, "MSM8974-AA" },
>  	{ 218, "MSM8974-AB" },
> +	{ 233, "MSM8936" },
> +	{ 239, "MSM8939" },
> +	{ 240, "APQ8036" },
> +	{ 241, "APQ8039" },
>  	{ 246, "MSM8996" },
>  	{ 247, "APQ8016" },
>  	{ 248, "MSM8216" },
> -- 
> 2.26.1
> 
