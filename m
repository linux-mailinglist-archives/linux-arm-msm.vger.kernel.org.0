Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BF5331833
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 21:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhCHUKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 15:10:31 -0500
Received: from mail-io1-f49.google.com ([209.85.166.49]:36397 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbhCHUKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 15:10:18 -0500
Received: by mail-io1-f49.google.com with SMTP id n14so11386334iog.3;
        Mon, 08 Mar 2021 12:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W3mjVIFWEpH5SFjcD5c/+mtJcjLBlX/O/nyh0NeCyfs=;
        b=SZu81O1WPrEYb9iIoNZqrLS0GwWVLfh2lbK09TRgdxPR0KrRXL92S1jsdUKLV0AVDy
         WIckq8O4kdiEQqDzQ0Lo72S8DfSnnvfLjLNgiLd4LHO6bnv6EE+DYtRyoWDhSkNBoaBa
         Y7ijZWYKr8aIEzaS7LPYvwOM5AKQ1cw8Scsg6wZ9tGr/D9/1WbdOCgboO7VkqNNOtlHI
         8YjspqX0Cb9v1jGQnTEcBIuthSlM/PiaI+ced0Fd7i1xS+wQeSN2UnvyqcnZn3OaI7vr
         TC8akHg8JS/1YiOA2cPZuaD73RbpKqYMZPwWPPXhdkjPMfdhew/sIXWcD9erknTTWpu1
         U/ow==
X-Gm-Message-State: AOAM530FxRGPEbYL1jJ4cW2E5sQHppJBSzO9eimPQYOtcQRQnlAs/0C/
        cFh7DN7ftr/YS+rPoEQPX98RBvEg7Q==
X-Google-Smtp-Source: ABdhPJwhlcKy6MqNv0Xw0yC95WDFroIoz7Q6Q2h6oSct3VRfS3JShNjX0GjY4xiwwtsNyfsumtekZQ==
X-Received: by 2002:a02:605d:: with SMTP id d29mr25002861jaf.81.1615234217755;
        Mon, 08 Mar 2021 12:10:17 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b20sm6424389iod.22.2021.03.08.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:10:17 -0800 (PST)
Received: (nullmailer pid 2881882 invoked by uid 1000);
        Mon, 08 Mar 2021 20:10:14 -0000
Date:   Mon, 8 Mar 2021 13:10:14 -0700
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     swboyd@chromium.org, linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 10/14] dt-bindings: watchdog: Add compatible for
 SC7280 SoC
Message-ID: <20210308201014.GA2881836@robh.at.kernel.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-11-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614773878-8058-11-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Mar 2021 17:47:54 +0530, Rajendra Nayak wrote:
> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Add compatible for watchdog timer on SC7280 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
