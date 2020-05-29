Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FED51E72A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389501AbgE2Cjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389013AbgE2Cjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:39:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86BBC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:39:45 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z26so460099pfk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uw50u2WQI2cR5oMDYPsHJxyN21BNN+C0YuB8PM3X8cA=;
        b=kRnk+ZIM1yIQB8cuETaAjQkv9EplhtLlyiMrWuAZ5NPLsfNBDwYvEFGlyWc3vYicue
         /zAm5o3Akns4HkAYxqpwB0UkuWsDwrJsvRfdcP4PUZZx2UQMqxR16Bl9+tzwc0lmjMjJ
         T0+XxHuCReD6kOp+8HunO0L+3hV7SiJ9W9C0F6J7uc4of1C4HyNtIZA9b9n716qoa/a4
         peuBGX57y+MQQGvC8JXdcv/faz8SGieNJfPtc+ntc8oGjfd2/XeFZHIzx1sMJMaZ3ZBJ
         IeyuBL6G7emN4btwoNCHssiUhYI2/P0Mtt8IElPd9TIIJkFSFaL0nQMr6a3MGtUk3fsf
         33Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uw50u2WQI2cR5oMDYPsHJxyN21BNN+C0YuB8PM3X8cA=;
        b=drgcXHmNx6cPlToB0HDx+cKUMyiGxdQQNb3+/HE20r9AT9wk3MoALorqNHmxue97A1
         +fSrQtinUteF4wxXCZop6cx1Jc/sT7LZdp9VJQLhYWhcaGj0C4rGJ5q8rGX42UVmKued
         NzSTz4OU0nhs0dYjONZvpUZKnaH8jwvwOAC3ycqfLUxMLy5v9SLOd1d6amBK11Kdp5Es
         MfxUQ873JmB9oNPr526jh2hODZmqjqP75XeFmBM/cANGGboGU4oTymp+G50Dl2RjkKAP
         N2DSxUewiAOSEdf3LVyfZPWixXyu/hPkOANiTVkAGehnaplMWdoqxKGLVDSwEUpx9j+f
         u8hw==
X-Gm-Message-State: AOAM532i9MeV8nVjr5PreW2czHq56OQSArxWyQLPlsimD03rgf2dbXsy
        f5YTTn1W22gvLSgNsJiNB6XNiXUa2gw=
X-Google-Smtp-Source: ABdhPJwqJKuM2P4Ek8P3uDITX7Fk26GA4ZoymBCbimBK+kqCX+iE0HIgo4E9vJjOXaLv/DOu8e+m2g==
X-Received: by 2002:a62:6042:: with SMTP id u63mr6715875pfb.79.1590719985153;
        Thu, 28 May 2020 19:39:45 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s23sm3389521pfs.56.2020.05.28.19.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:39:44 -0700 (PDT)
Date:   Thu, 28 May 2020 19:38:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 4/4] soc: qcom: socinfo: add SM8250 entry to soc_id array
Message-ID: <20200529023839.GT279327@builder.lan>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
 <20200525164817.2938638-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525164817.2938638-4-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 09:48 PDT 2020, Dmitry Baryshkov wrote:

> Add an entry for SM8250 SoC.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 5f98949c7562..3e08cf9836ae 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -217,6 +217,7 @@ static const struct soc_id soc_id[] = {
>  	{ 312, "APQ8096SG" },
>  	{ 321, "SDM845" },
>  	{ 341, "SDA845" },
> +	{ 356, "SM8250" },
>  };
>  
>  static const char *socinfo_machine(struct device *dev, unsigned int id)
> -- 
> 2.26.2
> 
