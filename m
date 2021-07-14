Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7DB3C8A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 20:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhGNSIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 14:08:51 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:44827 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhGNSIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 14:08:51 -0400
Received: by mail-io1-f43.google.com with SMTP id v26so3229970iom.11;
        Wed, 14 Jul 2021 11:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tOUUujimy6tu2WN4ctcSgxC5Dujf/VQuL7UZPKd+o08=;
        b=c2PMire/aBGKb/8OjGVGNCbq75XANWdYh6CujGlI9g61EbvEFQetozjbRFflT4I2GS
         8NDIWDhTW/DNdS59pGW0l5Ox5vQqaneM4bmtXxRE4kslQcaIQKhGHoe5pHzijm1GzxzJ
         5JhYdWcOT0lXQXL/pzeDZlTLLFZrVLcoWBvBDyCHoVfLi2aKH8fLewgmLJ0cWcPn2omL
         89BTlkZhstbXMl+6nrVsMuJLEhVxErLDBbDINLa+XOXNIT961dU2hM2gBTCSVGZgP9nY
         TdDH5BnFqZvdVgaBAwTtY7bpsKXokn4sN7E5HCeNDUyevMOsMAFKUN3tM2OxUSozwkXg
         2yFA==
X-Gm-Message-State: AOAM531BSvF1BFraJePaRgjV29AfDzpGwJBLK3i/7wAmgtWJngkq5oPs
        88R1wzhihQBVnwOVXBeAoA==
X-Google-Smtp-Source: ABdhPJzNd4BWuGRurt7unIpBLP9QS69wGAugqEyrZgya0uR+hQZ+85LGLbo6Onc1bEXhPDOVXbJmUQ==
X-Received: by 2002:a05:6638:2390:: with SMTP id q16mr9938163jat.59.1626285957962;
        Wed, 14 Jul 2021 11:05:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t2sm1642188ilq.27.2021.07.14.11.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:05:57 -0700 (PDT)
Received: (nullmailer pid 2855533 invoked by uid 1000);
        Wed, 14 Jul 2021 18:05:54 -0000
Date:   Wed, 14 Jul 2021 12:05:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: qcom: Add SM6115, SM4250
 APCS compatible
Message-ID: <20210714180554.GA2855492@robh.at.kernel.org>
References: <20210622203759.566716-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622203759.566716-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Jun 2021 23:37:58 +0300, Iskren Chernev wrote:
> Add compatible for the Qualcomm SM6115 and SM4250 APCS block to the
> Qualcomm APCS binding.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
