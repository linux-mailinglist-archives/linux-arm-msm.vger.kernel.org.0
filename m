Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564CF3C8A62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 20:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238085AbhGNSHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 14:07:36 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:37878 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhGNSHg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 14:07:36 -0400
Received: by mail-io1-f50.google.com with SMTP id l18so3237822iow.4;
        Wed, 14 Jul 2021 11:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Q/nLBkP7w/EUB7UO93rPTeOh1JIg4gI60v2lcq0M/8=;
        b=YhmKijIFLfJnV4Q/4frl8A+9WmORIOCNUhHtgnA+VjXCEItvf8XlBGB3NdLY67foR6
         qmc4XcDd+ZkcQ6pXF+Ri+gYgxiPhvFDdUS2GdlpuO3LL8q8qSuSi+qCv4yuBhfTKRqOo
         Azw8uKsheMclQNTX52Yg857FQPEI8Yj9FUMc0ENoDSSEdbn5wkOP4IlwTpeeheoR/z7E
         +bpv/Ek+yrzGIaLvvQaOdOfU4rKqPaJEOfbcR1Z56wrSyaSXRUcw70fp/Aw2R3GtHI+X
         fjoD8T6/T+QWk34cr6Pp3GBoXYZ7edQgCcFP0QwCIX8KlLxJjWaEkbISfKiAjqOqq8K+
         HoYw==
X-Gm-Message-State: AOAM533isQza5fPhDSbvyLyAX3D3AFJPtwoEN7mzLvGdhBrTlOtbf1GW
        htK/pxg0aqr+TWUlpd9afg==
X-Google-Smtp-Source: ABdhPJxMQagyCAJihy3DS0kTgDCRG0TjfhCv/yXPtgRtNr6+0ftqm/Wt94rUti0zg0vKksJyarmV/Q==
X-Received: by 2002:a02:7348:: with SMTP id a8mr9829439jae.116.1626285884243;
        Wed, 14 Jul 2021 11:04:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l5sm1458496ilv.38.2021.07.14.11.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:04:43 -0700 (PDT)
Received: (nullmailer pid 2853338 invoked by uid 1000);
        Wed, 14 Jul 2021 18:04:42 -0000
Date:   Wed, 14 Jul 2021 12:04:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Kathiravan T <kathirav@codeaurora.org>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: qcom: smd-rpm: Add SM4250,6115
 compatible
Message-ID: <20210714180442.GA2853306@robh.at.kernel.org>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
 <20210622202156.546718-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622202156.546718-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Jun 2021 23:21:52 +0300, Iskren Chernev wrote:
> Add the dt-binding for the rpm on the Qualcomm SM4250 and SM6115 SoC
> platform.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
