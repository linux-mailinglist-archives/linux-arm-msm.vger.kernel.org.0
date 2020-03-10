Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB6A1806EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 19:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgCJShW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 14:37:22 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33081 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJShV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 14:37:21 -0400
Received: by mail-ot1-f66.google.com with SMTP id g15so8079933otr.0;
        Tue, 10 Mar 2020 11:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bStnjeILIp+VzZ8fMwpW/+qgm3aAxexeon2+1WxP6aA=;
        b=cPgY/hTX7SyVzlva3Nvrk4dmifk1MSYggTrG7YuxXDvQDR6wyedcuwqUcy6C1eVz2c
         S6d2nIMHDmSjUSoot2/gsW+xC5XjLqnYY5nD1axphBfZY7CJ7IVAE1bHLDOMIs5qEt3v
         4nnZmgzt+KV2IPH1vjxdx/zNJpro1k8A8X1LXKZk1e17BH5MHnrIwJXlR9MMrYVw7wGf
         JkqbHV46Yye47uo3xGNWCSyrobQYB2Uq15MKmBgAs9HaMWkGxzexZunzfc5VK7TwpQZz
         PLMLRBp/BOzxU9A1kgR2sEwBk5JfN8jEM7JPWCb50UKJ4eHDCDUNEYpCe+nkBJfIIzhV
         2ErQ==
X-Gm-Message-State: ANhLgQ1VnusP3yB2knLpIbFmhj94cgdsz2+7tJqwymqIKur6SJ9SlxfA
        Pcd6/sCQpTZNS8QZ8T3GUQ==
X-Google-Smtp-Source: ADFU+vt/iDfLkvwbRfBp4buxNH8xW5VjVGdVTyzfuNPZHlx1nw1+bw3O8O703thxs0CVWYudGmKyJg==
X-Received: by 2002:a9d:7591:: with SMTP id s17mr6765112otk.60.1583865440549;
        Tue, 10 Mar 2020 11:37:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m134sm1843499oig.14.2020.03.10.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:37:20 -0700 (PDT)
Received: (nullmailer pid 24429 invoked by uid 1000);
        Tue, 10 Mar 2020 18:37:19 -0000
Date:   Tue, 10 Mar 2020 13:37:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200310183719.GA23977@bogus>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
 <20200310063338.3344582-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310063338.3344582-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  9 Mar 2020 23:33:34 -0700, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm peripheral image loader
> relocation information region found in the IMEM.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change since v3:
> - Fixed spelling mistakes pointed out by Mathieu
> - Fixed description as requested by Stephen
> - Specify unit address in example
> - Add missing ranges in example
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/qcom,pil-info.example.dts:24.11-44: Warning (ranges_format): /example-0/imem@146bf000:ranges: "ranges" property has invalid length (16 bytes) (parent #address-cells == 1, child #address-cells == 1, #size-cells == 1)

See https://patchwork.ozlabs.org/patch/1251981
Please check and re-submit.
