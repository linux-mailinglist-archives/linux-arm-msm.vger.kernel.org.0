Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2014151AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 22:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237736AbhIVUxl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 16:53:41 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:44808 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhIVUxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 16:53:40 -0400
Received: by mail-ot1-f45.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso5367663otb.11;
        Wed, 22 Sep 2021 13:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+25SGYG6cqEO2ULh927eXLNwWGkuxNP32XtUC1I7YfQ=;
        b=z4ZvLCijyWl7+Pc0XB8jQSx1MrYkcazOOCZrSsJr4kqWfQ1tONWB7fdZ8t2obstG08
         Do36XjMSkXcJ3pqjJOb7LBXql99z1xC645fRf96nOz0iH8FnXdLOwH81gzrTwWrhFGOs
         yhIAQ0k30xOnZXTcxdUpa/spyGdyZZOfj+SyljU3+8ZCIPDr2p8nzHQyy/2CozHirDrR
         +XLdqtDDfISrOZb+VA5Crn4NaUPeNmqPtlAUCS+0kVsn977FARqmmosVextJXBtLHLFZ
         XwU/hdKlnmLdjXrI6c2kKJXGAyXKq4SQ58PJPjJPRI3SaNzpQEoKdwjdR5MvFnoeeSDb
         6WqQ==
X-Gm-Message-State: AOAM533ZKXzdl/Z1R/MQsYnJTz24+BzXIXiCCsT0K6hnO5R7m6CsVCXU
        V6KhVcw8pj4GMpGjnwhzuZNhO5YA1w==
X-Google-Smtp-Source: ABdhPJwSHBCGCne5HWyN6gXAPUR3PIYQbU9dxOmMx9+SdXxwidayqXm2hmYRnuD0NDYpzaH8L6fqMA==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr1094973otj.96.1632343930183;
        Wed, 22 Sep 2021 13:52:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t80sm833074oie.9.2021.09.22.13.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:52:09 -0700 (PDT)
Received: (nullmailer pid 1272813 invoked by uid 1000);
        Wed, 22 Sep 2021 20:52:09 -0000
Date:   Wed, 22 Sep 2021 15:52:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: qcom: Add QCM2290 Global Clock
 Controller bindings
Message-ID: <YUuXeSS0SlplrW1t@robh.at.kernel.org>
References: <20210919023308.24498-1-shawn.guo@linaro.org>
 <20210919023308.24498-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919023308.24498-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 19 Sep 2021 10:33:07 +0800, Shawn Guo wrote:
> It adds device tree bindings for QCM2290 Global Clock Controller.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-qcm2290.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
