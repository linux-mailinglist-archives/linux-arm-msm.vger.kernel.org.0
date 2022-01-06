Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947AD486DCC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245579AbiAFXcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245554AbiAFXcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:32:01 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4ABC0611FD
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:32:01 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id i9so5951730oih.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1TxEIXyeSG4tz7dIuTCt6uaKwLFMleTTnKmpIan2yug=;
        b=Me/fbRO6zLra4wuboVxaZUyEoBzNaNLfErJgfLzapaifZjujWIlN1hU5NscoAtFd+u
         QhKluljhlK/Q75TfQ6z4E6dODzfvj5Uiu1Vu4/iyMJ2qu3J8Uqwbi5l1FXzCh4a4Q0Rt
         AHJPh6B65LLSBNX/1yUS4v+HnI+CZTjoF7SDuFEVZAH5NwC4tHJt+CNv/TfdMfCpWwhf
         csabGyk1IeracysmC2IUGhL5nNySjKYKAXG9WxC2jhqb0YaEfFTboHNDdzancPlgPD9q
         NnW2e6Qnk0/stAxhiqqUR6a7t6rSwy6Oy2kAblW+e/wSSj+ezRQ+PfJyaz/A5bp10KyP
         m6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1TxEIXyeSG4tz7dIuTCt6uaKwLFMleTTnKmpIan2yug=;
        b=AtyQ+qarGhNxJ+ZNRVaVpFAHYdRyvPcPIOHt3kMtlZe2twjm35SuGlsaoUt1RJpKYO
         Qkc+9Z0cPo0eMWHZBuzSzM7P3k6cMLcztZwzMvXdZZNlaY9coR5CNAfiAmtZQ3O1ExF6
         rSHoUQFMlUoY4oPZLlnlkOG1DYp3DQ8nnIS1xHjBPNFKh+slBIfQz3UoPkxOiauyXxTP
         mewxMru5adRpUOBeaIRKv7uIbCdSkVwEBiQTgDYVCM9R9KBJJxfuiSm92SWm16bPD5k6
         /yv0PmxHlD3jAvNeLm4CUOAhO9rdsT7zP3fW4RLT0rxuoD/lwwgSZOo9aq4FkdT7f/Ym
         Lulg==
X-Gm-Message-State: AOAM5334W0Wr8V7rX1w60rhu3CaVsEoeDbzXNHDsTG78bsIIrABtwLuZ
        92aqN1aSWLgnj39R80zZR4PMbA==
X-Google-Smtp-Source: ABdhPJyTcfe9jPYJqrPXVCmpe9O/Jsyf5rUpyWb/zD2QCcF+uQSC9KX6myfhDKkiUyBk6EZBsgi5qw==
X-Received: by 2002:a05:6808:23d6:: with SMTP id bq22mr8057857oib.71.1641511920251;
        Thu, 06 Jan 2022 15:32:00 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k10sm678288oil.36.2022.01.06.15.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:31:59 -0800 (PST)
Date:   Thu, 6 Jan 2022 15:32:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
        rui.zhang@intel.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 3/3] dt-bindings: thermal: Add sm8150 compatible
 string for LMh
Message-ID: <Ydd8IhMesT4QBiWZ@ripper>
References: <20220106173138.411097-1-thara.gopinath@linaro.org>
 <20220106173138.411097-4-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106173138.411097-4-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Jan 09:31 PST 2022, Thara Gopinath wrote:

> Extend the LMh dt binding document to include compatible string
> supporting sm8150 SoC.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> index 289e9a845600..a9b7388ca9ac 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,sdm845-lmh
> +      - qcom,sm8150-lmh
>  
>    reg:
>      items:
> -- 
> 2.25.1
> 
