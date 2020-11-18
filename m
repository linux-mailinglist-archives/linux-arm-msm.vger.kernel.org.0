Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066E72B751D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 04:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgKRD5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 22:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbgKRD5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 22:57:54 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAC7C061A53
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 19:57:52 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id f11so729647oij.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 19:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hkDeDVPm8z3EEtXMYErIWAIVmmPC1Ustb1AIjufsLc0=;
        b=wFoI1MdRD5qXEw9klmnXnEr5A5oE1AZidmWSZsCcbu6NDwrIUF8mwmItUnRy/YtLz/
         VmKl2Ez3rutkqcvMMEK+kHmeRoAzZmQBlLnCyZAM/NvcR3tYpTNA27xmDQ+kc4+RUmf+
         nujIzRvHKDk4ruhDUWPkxJ724BuUfFBTiQv5iMWdr1DFIKXBJLPXJZwww6fAu5tIau0v
         wLxq7ceE2NdGb5tIKMt1kr8wJQJNzp1h+eed3qF9QXvjFnfILguS7pFo/pkN1T9J3R8H
         +zwUUNX6tCHnJj1hUKBl/SFYNZ9Hw1bPTNhGOwpmYeLjuj44CO+ck0mTaxoklucJnxhn
         tgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkDeDVPm8z3EEtXMYErIWAIVmmPC1Ustb1AIjufsLc0=;
        b=L005UfL3REq+wbikRXgFqjVHxNCY6ynRSjJYFxu6gpUVZq7gGi0GR+X/CbNEd2qqnX
         DXI1FtDe8bscaibeUpEA+0xeIGaTuUqr2riWfF6j2uZ0IsUJxxCi+S5ppxEvmj0+PDFl
         2FOCRR8f4OeoKgSkse+rndLX/IqebcKMHisPrMOB0mFRXTi3XzLlZ0lHhsCF3UGo30h1
         hsVNdKXkZu4pF210MUw6go4JOmBcORPcwXtTctNkc7qEy2r4D5OPDdLE+wZeL2OGj768
         dBDByngdelBl87bIA5qc8eeTxjGiCEDe+a+Y1mqM/3SuE3wa4Tay1slIw5+dZZVIFRpe
         4etw==
X-Gm-Message-State: AOAM531cVHTRK4dYILMAdnWwes6ZBBaY5IiLr5lZmSIY2OBnrj+hpPix
        pENBxfGVz5Pl++1/YLePIEfAdw==
X-Google-Smtp-Source: ABdhPJwLmLk02pk40nH7Brt4vanivaBwUWCxNW1iVUgWOy150NbSyLeuVbLBhM4ywuL4y+NA1uewew==
X-Received: by 2002:aca:4a0d:: with SMTP id x13mr1595258oia.155.1605671871907;
        Tue, 17 Nov 2020 19:57:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w6sm6868012otj.12.2020.11.17.19.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 19:57:51 -0800 (PST)
Date:   Tue, 17 Nov 2020 21:57:49 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-binding:clock: Add entry for crypto engine RPMH
 clock resource
Message-ID: <20201118035749.GA8532@builder.lan>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
 <20201117134714.3456446-2-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117134714.3456446-2-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Nov 07:47 CST 2020, Thara Gopinath wrote:

> Add clock id forc CE clock resource which is required to bring up the
> crypto engine on sdm845.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

$subject should have bindings in plural to match other changes and a
space after the ':'

Apart from that, things looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  include/dt-bindings/clock/qcom,rpmh.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
> index 2e6c54e65455..30111c8f7fe9 100644
> --- a/include/dt-bindings/clock/qcom,rpmh.h
> +++ b/include/dt-bindings/clock/qcom,rpmh.h
> @@ -21,5 +21,6 @@
>  #define RPMH_IPA_CLK				12
>  #define RPMH_LN_BB_CLK1				13
>  #define RPMH_LN_BB_CLK1_A			14
> +#define RPMH_CE_CLK				15
>  
>  #endif
> -- 
> 2.25.1
> 
