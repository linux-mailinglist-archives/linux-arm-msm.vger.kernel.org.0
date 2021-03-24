Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE9234806B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 19:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237577AbhCXSYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 14:24:45 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:35475 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237571AbhCXSYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 14:24:40 -0400
Received: by mail-il1-f175.google.com with SMTP id 19so22243988ilj.2;
        Wed, 24 Mar 2021 11:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2uCZ/bwWNO1uVSwIWibQv13vsjAJC18SvkGaZ7yVAoQ=;
        b=hYm3Kk2Fk9vQ+fxAS7dmYEIjf/IVnqWNXld6+7hzpCaN9RJJQebHOuzunvfljLIl9j
         GjgbVM2Zy4/L3tDTYRHbqM+xhAg23rETdvd/WI0I+Rmc6yOi3/9+ICa9lhBQiBhgrB3S
         OLvqAljiU8SZ8q3TkK/ba05lfLGcX6t6bts0guQ7OB2tyGiWxEa910laEIJLbqh/UJBj
         hfwnfC72G/KuEZis4Skr8qR0WCXAIVQsWWOn/fTcixSZ4gsoUA7IO8Ki3tBkpHfphVzR
         IOuCwejisXsTxgxqS1CtXTVctbo0wDev1/K1hvOSwjhPC1sF1V1ehP8wG9ZI1SpnrF2s
         Al7Q==
X-Gm-Message-State: AOAM530Tqm8pChyD2oDUg7BVOKTm2MWJphLkJ5xcaVOnNgsvkzxEpffZ
        ZRN9ak8Dnuv4V0qM0IHZSw==
X-Google-Smtp-Source: ABdhPJzDhMoyyUt2DgAmUZOSiiH4Txzeab4TTfv0MBbnAy5yt9G95NIs1um6UYEEwNrx8jGr4UYjpw==
X-Received: by 2002:a05:6e02:1d98:: with SMTP id h24mr3478175ila.38.1616610279375;
        Wed, 24 Mar 2021 11:24:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k12sm1417689ilo.8.2021.03.24.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:24:38 -0700 (PDT)
Received: (nullmailer pid 3378228 invoked by uid 1000);
        Wed, 24 Mar 2021 18:24:36 -0000
Date:   Wed, 24 Mar 2021 12:24:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] dt-bindings: mailbox: qcom-ipcc: Add compatible for
 SC7280
Message-ID: <20210324182436.GA3378168@robh.at.kernel.org>
References: <20210315184410.21063-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315184410.21063-1-saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Mar 2021 00:14:10 +0530, Sai Prakash Ranjan wrote:
> Add IPCC compatible for SC7280 SoC.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
