Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF0B4360AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 13:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhJULsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 07:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhJULrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 07:47:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D0BC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 04:45:37 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 193-20020a1c01ca000000b00327775075f7so1039927wmb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=F+qAS+mhY6yRfCRNETby0UpQHRseEdMMofPhAfH7ev8=;
        b=Pwk6viT49X+syXYKYWNK1KKREh4DtPRMQG9EV30yd3vyA1O15WFi1wpeTMAgll/opz
         RksxPNrDeGpjN+Z8omHmyNG4ZJ/4x8Pf/ivMm0XE79c4wx5mrUx/eVnF6oy0qEnZlJ25
         cracL6jn0GfyUSc+FuNl0eS10ghCBuT6SYGJOUT+htgcVoe3lxDnDP2d/Zt9lwuyUaW2
         SyqzDus3GPjQqyBcuhXWPeTo/S27vmJ96BmDLj24OM0DEdYJX5tLR9OPDmDxgyxq7NPf
         jhr/Nd6kA18TacC6uQ4iatMS6OmFX81aOxCB9yaRes+aqic1o3AXv8fPBk+Hqiz2qc4K
         RAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F+qAS+mhY6yRfCRNETby0UpQHRseEdMMofPhAfH7ev8=;
        b=GL31aJT9suZhFBoJQ+8bLr4BfHnparEkDgj52v8CtY1vWNIqMB91PVyDbka2s4viBh
         cq9FMPlxnFEgHI0Hgql9o8tCS1QEsAm03VvvagvYgO64CxLj8AMRfgA51YG+CA6oHq9k
         ZxuHMqMg58prT0psepveXllxszohiEybXypehiJxAbjUL3UjPZKjlNl8VWreEOJkkwul
         dCU9L9BGiXoDYYfeYCYf00jRC5eVn1T5iHn9Vkda+TgHYuGOWnUnxa5HdbxBAXyORvko
         1EML87DW8e9rgWxUI0psNCTD4ut7xn0tPJ6uDLNtTgXq4aDPZjqI6MQV18Svi1+SzZCw
         DY/g==
X-Gm-Message-State: AOAM531BBGR6FBPwDZpdGDRMnJ0VWY08TZgPM+w4RLSEMoAH4OlvgKqO
        9PZO9XsMz5WxlIRAMhmflBP1iv4LdxU01A==
X-Google-Smtp-Source: ABdhPJz7QOQP57aRGeoLHQetlmKk3gOhEUiZirCaK9m0eg6DgYnQhpdyWktuOyZPjcs78zytWDh0Cg==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id n11mr5889196wmq.54.1634816735665;
        Thu, 21 Oct 2021 04:45:35 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id o6sm6735697wri.49.2021.10.21.04.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:45:35 -0700 (PDT)
Date:   Thu, 21 Oct 2021 12:45:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] mfd: qcom-spmi-pmic: Add missing PMICs supported
 by socinfo
Message-ID: <YXFS3Y1Q0QtqR93b@google.com>
References: <20211017161218.2378176-1-bjorn.andersson@linaro.org>
 <20211017161218.2378176-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211017161218.2378176-4-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 17 Oct 2021, Bjorn Andersson wrote:

> The Qualcomm socinfo driver has eight more PMICs described, add these to
> the SPMI PMIC driver as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Rebased on top of sorting of entries
> 
>  drivers/mfd/qcom-spmi-pmic.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
