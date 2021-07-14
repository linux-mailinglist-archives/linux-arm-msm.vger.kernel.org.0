Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B536A3C9267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhGNUuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:50:13 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:34814 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhGNUuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:50:13 -0400
Received: by mail-il1-f182.google.com with SMTP id e13so2937814ilc.1;
        Wed, 14 Jul 2021 13:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IkchVDvXN7Bw0jVewYrn/898llcAeX6Q+JNup0NjuQs=;
        b=izaU2pj3pMG474+hCVSwjdrsNMfVas/uAe2WFlrQ4KvAmWFH7Foc9EWmx0DiA++zJY
         02/rqyq24FbNscJEWSNaas+NZ3J+EN/XdJrmH5/KjIhjzZvUYi/QqW79yMvacL5DVKVh
         0D8Fcuh+YTicbbgtv0t1UkR5yuEYOaKWwVIf2mCgq6hd6wRr2S4Rx79N5HSeDzIFd+rr
         yxUJ7HxNqiIxns9WHdimBCQbYyaUnCNVmzP8IF0llMc2vRm1BHWXuNYNhQkEMRaYxVxk
         hX79IBgPWMf4S0OrqvCH+gyKFz8uzjzg5GKsxcSXuXpSbjkrGEKGHLfQUTv9PEfNnBNA
         w+UA==
X-Gm-Message-State: AOAM5333z9j1IijvDw+wRu+H54utN70aYxK1BaaJcd65FC+o/3gLsxE1
        ulaQcrUwaKXqEzLUoBh9gQ==
X-Google-Smtp-Source: ABdhPJyIUiLWl7fOKj6QSiJv+KebXMb5IQ+tSB/Agsbss9+uFB2uo8FEQaVwMpVjBkWkW/AozH0MaA==
X-Received: by 2002:a92:7f04:: with SMTP id a4mr7791297ild.156.1626295639786;
        Wed, 14 Jul 2021 13:47:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k19sm1923928ilh.60.2021.07.14.13.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:47:19 -0700 (PDT)
Received: (nullmailer pid 3493023 invoked by uid 1000);
        Wed, 14 Jul 2021 20:47:17 -0000
Date:   Wed, 14 Jul 2021 14:47:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Add SM6115 APCS
 compatible
Message-ID: <20210714204717.GA3492994@robh.at.kernel.org>
References: <20210627185829.694136-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185829.694136-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Jun 2021 21:58:27 +0300, Iskren Chernev wrote:
> Add compatible for the Qualcomm SM4250/6115 APCS block to the Qualcomm
> APCS binding.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
> 
> v1: https://lkml.org/lkml/2021/6/22/1189
> 
> Changes from v1:
> - leave only 6115 compat string, there will be one dtsi for both platforms
> 
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
