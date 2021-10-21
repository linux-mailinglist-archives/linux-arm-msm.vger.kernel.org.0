Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D06436124
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 14:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhJUMPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 08:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbhJUMPZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 08:15:25 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B61C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 05:13:09 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u8-20020a05600c440800b0030d90076dabso7106045wmn.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=owYFM55aP56rDs5EWvgoXTHHvnZP3ih1QEcPV9bvrhs=;
        b=ldx+vWNYbkgie7M5aaF/195y7BkfcqHpNSlAHho9tOMXzsKxFshah8V9OjRxVzKvWA
         vBNn9W7oGV39i+NR9FsmME+88hdpmpKfRP3fq8qtf6BnhQ0zKN7ut5SmO9/ySmFY12r5
         yJyfaqbiwChqViLbch3/uWw2/vvHKxt/aoB1nVXjY4jD/Sj5fYvk8ne7nb6Ni/k9wolk
         EUkYZ9q1yArClmK9+RYdatWAP9JHUX3uZOgm6RybnLk4wacwgMGx9uHc7GoXmx7Nnh4m
         BMGGCvu2p7mP5iyhnOXOyI7TqtrbiNftNDIv5+n2GmAEoIoGzJr1/l5np5BkyoaL0yeg
         bE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=owYFM55aP56rDs5EWvgoXTHHvnZP3ih1QEcPV9bvrhs=;
        b=NjjcBRfFdxZjCxIi664EoslE7F/GFmTL4rCGq9IniJSP9/CwA45wzLplV72v/cBTmT
         y9dSBuKbVu9hDiUWwR8QpYFYnt5Gg1vZBxY0z0e1F26t+J1Y+cWHlBuYx5Y15QCXa/Wb
         mGyIa/7bBjhAK6PpJFTUBARbEgvgMSVibfe22sxXMDVIM0KIrtOzUXpHFf+LO7SU4TJ+
         rJC2Mo/B+tPJ2Jb8vee6RryPMoHEK1FrpyJa5kZP+IQMf4Fe0vM4x/tOIu1C/S2cHhpl
         YrUEqvsW4fQhgNmgqYPK5pTE7t5BebvyjKwWjvXxF23V1EFSDwdtkXvav36zEdwBx5n+
         MxLQ==
X-Gm-Message-State: AOAM531NjudnkCGdzbauRYVpMBODJCG7G/JA1bHT2L22LCdpQUxmfktc
        6Or8Rfb1NuZfAVyoCQq9N1nD3mAUneE=
X-Google-Smtp-Source: ABdhPJzL/H7g1S4PgfSqOGhhgqxYnCklysw/apV7GI7zZ1gsUA2IRIdf3lO7BsVrtf05AOuVQnsvIg==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr6253430wmc.117.1634818387845;
        Thu, 21 Oct 2021 05:13:07 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id k8sm7519770wms.41.2021.10.21.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 05:13:07 -0700 (PDT)
Date:   Thu, 21 Oct 2021 13:13:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom: pm8xxx: add pm8018 compatible
Message-ID: <YXFZUcVFOg0uQRSv@google.com>
References: <20211020231646.278706-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020231646.278706-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Oct 2021, David Heidelberg wrote:

> Add missing compatible for the PM8018 model.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
