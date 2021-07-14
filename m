Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26583C9263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhGNUuD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:50:03 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:47083 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbhGNUuD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:50:03 -0400
Received: by mail-il1-f175.google.com with SMTP id y6so2905518ilj.13;
        Wed, 14 Jul 2021 13:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kco+/XxZYLDb1ihGt1/0DCCP9J4L9oldTTVHBfVd0KI=;
        b=QYhStsBpHNji4LowowaHof8agdkhv6i698pCTQiit5IjIx1S4PE7LfqKLRGi6ubne4
         gabHftNVxMa3F12uzZr8DagWmwp0soCB/Y31cybpaZRVR6Ya7/P+rAmRZB+9QkbEwos2
         nuajlRNay0aEaaXBtl6obSU3FeERGZiF1XcgTSKpHtjCzNgaC/swW+Q8rjSz0Dps12+Y
         r9hiXxra4EqIlXB+e5JCsv8grMSRqPR+5dBq9l2vw+BBAxfn464aec1vcGxXTjwVxQ2q
         AxPkL2/SAyo2MZn9KrIMeLz2GOK9NFyqPEsBIpUhuim6GgsqrJduotk2l42BHydFPKhT
         /XLg==
X-Gm-Message-State: AOAM531Yo7Hpm+Gxvq9mcpHjTs2B4DQPpj2VmTDLY4hw7/FbdFkVaCjl
        U0COuNXclpc0dLytGMQXTA==
X-Google-Smtp-Source: ABdhPJy9xASZGcOP/LI92DJsMDZVCmDOQGStFYEqHGuGiLCYT69R7undrrRAibu1aU/kGujw2Kr5mw==
X-Received: by 2002:a92:c888:: with SMTP id w8mr7701379ilo.140.1626295629874;
        Wed, 14 Jul 2021 13:47:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w8sm1701212ill.50.2021.07.14.13.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:47:09 -0700 (PDT)
Received: (nullmailer pid 3492671 invoked by uid 1000);
        Wed, 14 Jul 2021 20:47:07 -0000
Date:   Wed, 14 Jul 2021 14:47:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-usb@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: phy: qcom,qusb2: document sm6115
 compatible
Message-ID: <20210714204707.GA3492616@robh.at.kernel.org>
References: <20210627185750.693222-1-iskren.chernev@gmail.com>
 <20210627185750.693222-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185750.693222-3-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Jun 2021 21:57:49 +0300, Iskren Chernev wrote:
> This compatible string is for the HS USB PHY on sm4250/6115 platforms.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
