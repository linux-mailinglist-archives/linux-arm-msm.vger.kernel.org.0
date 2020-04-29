Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084171BEA07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 23:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgD2Vf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 17:35:28 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37627 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgD2Vf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 17:35:28 -0400
Received: by mail-oi1-f195.google.com with SMTP id r25so3249707oij.4;
        Wed, 29 Apr 2020 14:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P60CLGRCVH/w+wVlBp6MkL7Ds15Cvq4t9vycfLUjyFI=;
        b=l+lmEETa2u5ynCMun8a8xy+7aQyvXM4rrpc4TDYoGfigpFkmOZJi8gAy5QNdWdXcfS
         S/ovB2GnVzl1gA/omdyvkRXHTH2HGS6hILnGAMMjYtqSILem/RbeKvUq169xvY5MaPbR
         ZKv2ef0eHsqsFN6NysaRSLo1k7YahYOySWKaYz7EUfP+f9kIaKETyVg3BFkrh1RWY8e1
         cf1szzKpQvM+HmjGNXLh3t/po8Q3ScJNMtyo2PVwSwwGlPzCNfILDinWWe/Ae/rXP//a
         7WayWGr6hii5xZxNbEzujo+vn3YpB653vpYjgrBKRSceKu66NvYoVDrcMJ0Vbh6q/jQ/
         wNzQ==
X-Gm-Message-State: AGi0PuYze/62DMH5KtSeCXXUIoQI7+oiThTER8Dn7WrOYrfcldYy89Cz
        q0PalazabIg1oARIrvrgTQ==
X-Google-Smtp-Source: APiQypKoDEYLt06UnLfe/uPG+G9+07x8ZmccseGaZQiUJmc7TvMtKNzH6fV3dRHIJ4P4gPpt97gkag==
X-Received: by 2002:aca:7251:: with SMTP id p78mr279418oic.32.1588196127566;
        Wed, 29 Apr 2020 14:35:27 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d18sm691623otk.63.2020.04.29.14.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 14:35:27 -0700 (PDT)
Received: (nullmailer pid 6694 invoked by uid 1000);
        Wed, 29 Apr 2020 21:35:26 -0000
Date:   Wed, 29 Apr 2020 16:35:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: mmcc-msm8996: Properly describe GPU_GX
 gdsc
Message-ID: <20200429213526.GA6644@bogus>
References: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
 <20200417070044.1376212-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417070044.1376212-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Apr 2020 00:00:42 -0700, Bjorn Andersson wrote:
> The GPU_GX GDSC depends on both GPU GDSC being enabled and that the
> VDD_GX rail is powered, so update the description of the node to cover
> these requirements.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - vdd_gfx -> vdd-gfx
> 
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 4 ++++
>  drivers/clk/qcom/mmcc-msm8996.c                        | 2 ++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
