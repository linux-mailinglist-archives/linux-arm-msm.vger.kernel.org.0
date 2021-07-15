Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94D63CA222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 18:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhGOQVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 12:21:10 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:45596 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGOQVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 12:21:10 -0400
Received: by mail-il1-f182.google.com with SMTP id b6so5478807iln.12;
        Thu, 15 Jul 2021 09:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RRUPLOLj8bV7cCtORPQ6IMltdHs8hBKhq3BjsT9zV+k=;
        b=BoZ4OnN/FkLVEnNrc85QxFvuWSwBYtAc9Bz3sZNPrjdgLuKjT15Cw2/XyHhSaMNcbC
         L3ARXljd2366A/C0CBtcuEPQQp30wAJ/STI+O3LpwUj3O1JszBIFsW7ERwT6TFFG+6Ge
         CdSqftXIsAYChq2bR5nDzkh/pbCv5EpUZkFuWy0DTt2lRrXNus4CEChDgsLDWnEsO4Sl
         CLWwZ755v1aj3bGoU3WW+QcqGiB2zVwIEmfKsiJt84575/e/Mo1WlCYxulWawCS+tNrt
         teqtN2gcFn/JEtza7NSFSNf9lSFYXpldNcwWOrPlYfNgSuoYHwrDICcOEjqVpAZhZ7Bg
         ATgw==
X-Gm-Message-State: AOAM531hbuNdNEBucc7qoqoEtOKPlm9OqZ60LuR1oen9jz4s1xEGqbGT
        /os73ledfgpj9W5vq/7MkA==
X-Google-Smtp-Source: ABdhPJwIwTM19EP/DwAWM3MnwcDVy9Ok3pJjQ6Ma4W83fJ1lk2elXaCssiJf0zFQNdQjHUvGDw3BFg==
X-Received: by 2002:a92:7d08:: with SMTP id y8mr3025493ilc.43.1626365896782;
        Thu, 15 Jul 2021 09:18:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w11sm3324926ioj.47.2021.07.15.09.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 09:18:15 -0700 (PDT)
Received: (nullmailer pid 1179769 invoked by uid 1000);
        Thu, 15 Jul 2021 16:18:13 -0000
Date:   Thu, 15 Jul 2021 10:18:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: qcom,videocc: add mmcx power
 domain
Message-ID: <20210715161813.GA1179714@robh.at.kernel.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
 <20210710013253.1134341-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710013253.1134341-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Jul 2021 04:32:49 +0300, Dmitry Baryshkov wrote:
> On sm8250 videocc requires MMCX power domain to be powered up before
> clock controller's registers become available. For now sm8250 was using
> external regulator driven by the power domain to describe this
> relationship. Switch into specifying power-domain and required opp-state
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,videocc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
