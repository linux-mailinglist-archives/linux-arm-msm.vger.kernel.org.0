Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA883C9280
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbhGNUxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:53:13 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:46605 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNUxN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:53:13 -0400
Received: by mail-io1-f49.google.com with SMTP id p186so3781232iod.13;
        Wed, 14 Jul 2021 13:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=deuGYh7LUp2h58xm5PmCtjTvuKbGxY7s5Udxelu3UqM=;
        b=AbbPKVLzfzCwcWwAPRNsM9AW8iQHx6kTLeJDs3Ah+migafHO2gz7GzERBtN/slLE3a
         Hdj4mN5LImEFjVCffvyzqgZzZ97GHQCKO7KE348KegdvSlRAbDJyUig+AQG1nWzlfFwV
         nfs1EbuVgfQQ30GjmQUiN672U2smSZDcbwRQE2ZTiT3FnH9ogj55fFafv2wb3/+iMtQt
         5TUd1dI0wg435WPfdPN7Qx2kCGgvQQiCb8JLUjnhKDo2mk4PvLJ3PaJN1qvaovuyJ173
         h20AL+2/d6B5whe2FSwRfGL5h5wjCzXwU0frjCAFnYmHAnohYBTcE8uqtLfMrgN25sXc
         OTYQ==
X-Gm-Message-State: AOAM533woy+6srZu5T+1U4zI8USYc+1M3jXN17JxeGX+G6W/sfMIaEDL
        Ik6BvZ/r6furg2l9uly4Jg==
X-Google-Smtp-Source: ABdhPJyPjP5opvVBxukBX6zsGX536SZVm0SeqjQMuSTR4zbzI1avEzQzkCYZDPuq8zr0xuJ02tWKcQ==
X-Received: by 2002:a5d:8d16:: with SMTP id p22mr37161ioj.90.1626295821082;
        Wed, 14 Jul 2021 13:50:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p19sm1840965iob.7.2021.07.14.13.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:50:20 -0700 (PDT)
Received: (nullmailer pid 3497866 invoked by uid 1000);
        Wed, 14 Jul 2021 20:50:19 -0000
Date:   Wed, 14 Jul 2021 14:50:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Kathiravan T <kathirav@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: rpmcc: Document SM6115
 compatible
Message-ID: <20210714205019.GA3497815@robh.at.kernel.org>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
 <20210627185927.695411-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185927.695411-3-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Jun 2021 21:59:24 +0300, Iskren Chernev wrote:
> Add the dt-binding for the RPM Clock Controller on the SM4250/6115 SoCs.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt |  1 +
>  include/dt-bindings/clock/qcom,rpmcc.h                 | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
