Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30923379DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhCKQrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhCKQrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:47:07 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C8CC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:47:07 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id t16so2084906ott.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mCXfqu3nwx0JUOfdiuLknr7gE8Wy23ffbFfKe/e7b9g=;
        b=QQl6Wf0j2nI2aaEJCsUu7MgeqqqBT2IK8hSiQUohskpW5UIkSirhY016X6Latn46MQ
         b00jfpuRNFf4c2nmlrUD7/gDhj8W/5rw1kreN4TAfgWjt5MsiTygqUp8VWP2I7OKy8XL
         0L1pmSTXQpVuyrPM+nK9DUpD0ZiD1TbTGrPidzbgJZn+lTe62WDbpPS7Vln+fpFjjc2Z
         3dNnUiL88tjmsHraMQmVyhIZXbne9La9J0z71WGuHSt7Ej7uxOjqmnOSyLL0Qksmow9U
         Alquskedx35q60qCb3yMKmym5vbI6SUvV0u3/riaS7EvkwwP+I9S5CuFFY1EnD/eOoUS
         7jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCXfqu3nwx0JUOfdiuLknr7gE8Wy23ffbFfKe/e7b9g=;
        b=LOKIqfaofqAiiUgZMJU+ew4uQitMgIlMHaAxB8BRGESS2U/6jizMzS8LBnR/mm7jQ5
         ZzXXtaGyDk+sFIjYMUzNaxspG2IGehBnqhpVYmE9MyFJLOcf2DeyBKOEdBay2eDn62NG
         8UzJEP5qFG2XwL0jCyVm/QUmVz6IR4k6wjNa+WjGiMlt6XfqBY3Wv1ayiXiLRKK4UMqH
         0EuwvAij+dyVh3JWMFw9l0ZWo5JDHINPBRSRklD08xUw9NvGCnolK46y412qj0j72SQM
         gzkK5hVeFYkpFaaJuBnLFVzOeoHrYV0Q7qSMGXr2zJQrqPMynU3PAzJtbFwZz8dIYwVp
         peXg==
X-Gm-Message-State: AOAM530/3pHtRQcHTHHh8wwERc617/2SNlp5OjPSMb8Ckn8fo2AQQxX7
        JiG34Ipny3tQJ7dCKHsnG8DceA==
X-Google-Smtp-Source: ABdhPJzGZ+Ufp6Gos8RwBHeA5XlXy4tdg+u6QgEbayHvZ7xgtYCZC9AzdeLfZ0DA3QeDVUNONiexHw==
X-Received: by 2002:a9d:4808:: with SMTP id c8mr5319392otf.181.1615481227083;
        Thu, 11 Mar 2021 08:47:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g2sm218770otn.32.2021.03.11.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:47:06 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:47:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v3 10/14] dt-bindings: watchdog: Add compatible for
 SC7280 SoC
Message-ID: <YEpJiADnYXbQB/Ar@builder.lan>
References: <1615461961-17716-1-git-send-email-rnayak@codeaurora.org>
 <1615461961-17716-11-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615461961-17716-11-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 05:25 CST 2021, Rajendra Nayak wrote:

> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Add compatible for watchdog timer on SC7280 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

And this should be merged through the watchdog tree.

Thanks,
Bjorn

>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index b8e4118..ba60bdf 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,apss-wdt-qcs404
>        - qcom,apss-wdt-sc7180
> +      - qcom,apss-wdt-sc7280
>        - qcom,apss-wdt-sdm845
>        - qcom,apss-wdt-sdx55
>        - qcom,apss-wdt-sm8150
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
