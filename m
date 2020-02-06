Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9F5154D60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 21:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgBFUqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 15:46:50 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33075 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgBFUqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 15:46:19 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so3358617pgk.0;
        Thu, 06 Feb 2020 12:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OMFNCbQ2YO6A1Z0/9//8yj3l6sKmNNuU0vkSgP75wls=;
        b=pAgicw6kLfYLDepjVg5ydX2FNhYma5pLivSQyzTRebhtAqH5eEcBepMKR/4XzxKaZp
         LK5O4beOkYjO8iRXVshWXTleNGwJrqPlyyAeiRHlgb0MEWOgibL6lxt+99ppdxWqsknf
         3ML6TcXgx89/U3G3o9FGxWRcZQSxpmulfMCh6rWpF636clareLNIdoP6JM7TgZKgY5Jv
         KmHxYORz6oCT7S+W3YRhOwbekgFe9gu/Rh7LVt167o/MXdCRs4gHfh3wRWPUoRwMORbh
         aazkeItuZi+9rXd1+dd+27uslySWkiyAROeQv/8QYgXgxZrbPD5igAad05lI7g1yhKtj
         TlGw==
X-Gm-Message-State: APjAAAVLjM3ky8I6xwTFmPOtpb68h0IhwuSTZNk1k07sj2WJT5iC6MJj
        atfJFTpOfg1KSPgXsjFK0Q==
X-Google-Smtp-Source: APXvYqwH78fxlFILftQEY20o54bUm9mztPia+dIoyrhMNnALF+J3ZEFdR49H/rI11iwOjeJV6j3e4w==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr5915628pfo.45.1581021978524;
        Thu, 06 Feb 2020 12:46:18 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id w11sm292136pfn.4.2020.02.06.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:46:18 -0800 (PST)
Received: (nullmailer pid 9330 invoked by uid 1000);
        Thu, 06 Feb 2020 18:38:08 -0000
Date:   Thu, 6 Feb 2020 18:38:08 +0000
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv2 2/2] dt-bindings: watchdog: Add compatible for QCS404,
 SC7180, SDM845, SM8150
Message-ID: <20200206183808.GA5019@bogus>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Feb 01, 2020 at 08:59:49PM +0530, Sai Prakash Ranjan wrote:
> Add missing compatible for watchdog timer on QCS404,
> SC7180, SDM845 and SM8150 SoCs.

That's not what the commit does. You are changing what's valid.

One string was valid, now 2 are required.

> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../bindings/watchdog/qcom-wdt.yaml           | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 5448cc537a03..7180c64f54fb 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -14,14 +14,19 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kpss-timer
> -      - qcom,kpss-wdt
> -      - qcom,kpss-wdt-apq8064
> -      - qcom,kpss-wdt-ipq4019
> -      - qcom,kpss-wdt-ipq8064
> -      - qcom,kpss-wdt-msm8960
> -      - qcom,scss-timer
> +    items:
> +      - enum:
> +          - qcom,apss-wdt-qcs404
> +          - qcom,apss-wdt-sc7180
> +          - qcom,apss-wdt-sdm845
> +          - qcom,apss-wdt-sm8150
> +          - qcom,kpss-timer
> +          - qcom,kpss-wdt-apq8064
> +          - qcom,kpss-wdt-ipq4019
> +          - qcom,kpss-wdt-ipq8064
> +          - qcom,kpss-wdt-msm8960
> +          - qcom,scss-timer
> +      - const: qcom,kpss-wdt
>  
>    reg:
>      maxItems: 1
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
