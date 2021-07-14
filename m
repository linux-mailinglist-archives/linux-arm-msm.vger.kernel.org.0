Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18B13C926B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbhGNUu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:50:28 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:39525 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhGNUu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:50:28 -0400
Received: by mail-il1-f170.google.com with SMTP id a7so2928134iln.6;
        Wed, 14 Jul 2021 13:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hCrQsr8030QN2p/VmjzY+fbs0waPepfIG6ng+18St3M=;
        b=ccO8yEYVQVf9VYLfUbdcG+fLJhC7cyOrmCFrxa2bjwisf2c8SExzCP50t6fF9u6eNP
         HKTPzv5ozVT6n4l9z5GGpGckRGPUu2/ZmUIAWt6k23ZI8NsyiORD2nV0s1SBNydSTnZQ
         2BKB5gqIqnvyijFRb1fHyhUNtlVUcjIlImzgnVHFwtAEKoHncUaJSPauj90wC54SFcDO
         weeB82tE9FFLvpIpEGSNgtGd+KoiYSiFLgyZSqoxXjOoCSS7c7SgHIb92CIwz3O/QJ/c
         KnZ1500L2dsyXAeuLXu6ltP3VGvHLfT+PQjcA4Q8xz65EjfB7SKI5ULR/tiFxzT5sQnb
         NucA==
X-Gm-Message-State: AOAM533xco2vKk0j01CgpjFGJy0T8DhlvwEFHAf6vKwK5t52/EU83Xtq
        hyewDLJuWPxo+kOGjMc5Mg==
X-Google-Smtp-Source: ABdhPJyriRY2Dp/IymiSzqV6rt/anfKm58iFssDF5tQrraAZOAKjXZmJuFRqgbqpB2vGblyApL3FBg==
X-Received: by 2002:a92:ddc3:: with SMTP id d3mr8312842ilr.190.1626295655920;
        Wed, 14 Jul 2021 13:47:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p21sm1939916iog.37.2021.07.14.13.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:47:35 -0700 (PDT)
Received: (nullmailer pid 3493513 invoked by uid 1000);
        Wed, 14 Jul 2021 20:47:32 -0000
Date:   Wed, 14 Jul 2021 14:47:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: qcom: smd-rpm: Add SM6115
 compatible
Message-ID: <20210714204732.GA3493456@robh.at.kernel.org>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
 <20210627185927.695411-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185927.695411-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Jun 2021 21:59:23 +0300, Iskren Chernev wrote:
> Add the dt-binding for the rpm on the Qualcomm SM4250/6115 SoC platform.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
