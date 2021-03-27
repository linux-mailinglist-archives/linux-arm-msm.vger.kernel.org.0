Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A2334B8F2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 19:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhC0Sk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 14:40:58 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:46845 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhC0Skb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 14:40:31 -0400
Received: by mail-ot1-f50.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso8358302ott.13;
        Sat, 27 Mar 2021 11:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+M2kvMB+069qzfjF+ZeRQuQlpYFrlnjM6pNZJzFXW9w=;
        b=mxhYk/pFJY0pT4IavOJDpW+phrhefp26mc2WjqSUuchAvsrdXAec4zvuOze4TN8wUT
         rlPv7IdgAhzoXOmYI7CMFA8ek4rwbqmVqJtF+y5h4EDNy/xa542hMY8aslawoIF6sBuU
         MEiLsxrazDvZJ73oJsc4QT5lzB7j/+Qc53o5iR5jvfSII7QC3m1SJemIXjwtTihpPL/u
         F3v2XPwnNKEojBqfMAiighFGTzvMk6oXreamvM1T3Cl9RVAy/ItZ9dNOJ0g85xBzNQYW
         wwNAUg8dCNZEht6US6NtQiHoXIAq7N+p2xIE5y370XxER0aPMVLzqecTnwEucHuYzdpK
         1bbA==
X-Gm-Message-State: AOAM531v+C4Q1XXh/wFyfXP4l9j5nuc0rkZCdlHH41dT/zmxTqOt2Ijm
        iE4fYG2i+ZlTfi33PdK3zQ==
X-Google-Smtp-Source: ABdhPJzJcz9eAYnp4SAf42GEg48ePUdcaOms8Xe7M/5IQheRc3ucJvlI1gibjSxFUYwQc/2sG5u5SA==
X-Received: by 2002:a9d:3e10:: with SMTP id a16mr17133360otd.261.1616870430979;
        Sat, 27 Mar 2021 11:40:30 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.41])
        by smtp.gmail.com with ESMTPSA id 33sm3004932otp.66.2021.03.27.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:40:30 -0700 (PDT)
Received: (nullmailer pid 364782 invoked by uid 1000);
        Sat, 27 Mar 2021 18:40:26 -0000
Date:   Sat, 27 Mar 2021 12:40:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add MSM8226 GCC clock
 bindings
Message-ID: <20210327184026.GA364227@robh.at.kernel.org>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
 <20210326145816.9758-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326145816.9758-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021 15:58:12 +0100, Bartosz Dudziak wrote:
> Add compatible device strings and the include files for the MSM8226 GCC.
> Also add missing includes for MSM8916 and MSM8960 SoCs.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml         | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
