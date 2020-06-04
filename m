Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A9A1EE5EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgFDNw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 09:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgFDNw2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 09:52:28 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5D9C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 06:52:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so2206203plv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 06:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jr8wZhb4pJx8qPThUyDrXbZlabia3tw2g3YFZ6NyZow=;
        b=jPBIKgZSirOHvo7kMZ0JfAaDehKwnWbELDWidWKWB5maI6NK6rhB2zMh53/7rBREOu
         s/zaHev2o0vRWlK3IOjAmysDxCqk9E5uFAleswG4QlT9Ue/FYDa1kZYaqMFsl4iMSY0o
         STdElnXYJmLrmCqd/S7cdFT3vpW5cYGf+/JRB8Ob3TqJ0TMWmU8UnXcQ+CH1C76oHyzG
         Bbp526YQCO0aen0iL99tdv2LBgB6oK9RALZrPXCSFuFOXzVACHIfFS6vCXAjuepwrTM5
         4Fci5DqEvzcZCnmBH2bbzzffJkrMjpLJta4pILt5wxPNpwVEKNcRDyPcDd3iIax9lMWS
         TDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jr8wZhb4pJx8qPThUyDrXbZlabia3tw2g3YFZ6NyZow=;
        b=Ez+s+SWxdZAdh3ss8+4RG2zMYC2aAPeA4YGdOx4Pyg2YnVsALRiMVZ115SJ0FC74zB
         39xRXXsR4n9ZE6qxulXAiG0xPp37dxuLPd9o+0iLy9zVeZiGDXlYJAiX+hpr1K3HF+tq
         xETf8yDF61rh/GZwm4PgtGV9ih/gtfZXa8Tb6eV8yOb3pJN0cxHS7gsXpg8w+xYVWBAY
         vaZAaQDhTT3qd3mjLcqN61ubj0vFXP80//w6JVU6FcVM6S9ZvG5ir/GZ1mumAeXTGA5j
         WtDCvSLGHYGoxy4Fcxbf9HqB3y365gfQdniNJuCAmTNRk+R9+9T4Uv1+8AuVR5ANRmD5
         mYBA==
X-Gm-Message-State: AOAM533gyr2WgbJp/Weubt+G9DLS6C8/vv4/5yzlEDGMayxVkKjvbpu2
        3LDou8IwsXsb2bF2F+jnXMQb
X-Google-Smtp-Source: ABdhPJx5jGzTevHPTJSqrq4bsJ72Yh4odpGq73L+WtB0R5X8do+vglg5O1igVJiUAcqCO9OuAPuPtA==
X-Received: by 2002:a17:90a:6344:: with SMTP id v4mr5731999pjs.27.1591278747907;
        Thu, 04 Jun 2020 06:52:27 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6211:4cea:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id b29sm4745683pff.176.2020.06.04.06.52.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 06:52:26 -0700 (PDT)
Date:   Thu, 4 Jun 2020 19:22:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865
 dts
Message-ID: <20200604135221.GH16719@Mani-XPS-13-9360>
References: <20200524023815.21789-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524023815.21789-1-jonathan@marek.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, May 23, 2020 at 10:38:06PM -0400, Jonathan Marek wrote:
> Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> 

I've tested this series on an SM8250 based board and able to get Type C (USB0)
working. There are also couple of Type A ports (USB1) on that board behind a
USB hub. It is probing fine but I don't see any activity while connecting a
USB device. Will continue to debug and once I get them working, I'll add my
Tested-by tag.

Thanks,
Mani

> Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> few changes. Notably, the HDK865 dts has regulator config changed a bit based
> on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> 
> Jonathan Marek (6):
>   arm64: dts: qcom: sm8150: add apps_smmu node
>   arm64: dts: qcom: sm8250: add apps_smmu node
>   arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
>   arm64: dts: qcom: sm8250: Add USB and PHY device nodes
>   arm64: dts: qcom: add sm8150 hdk dts
>   arm64: dts: qcom: add sm8250 hdk dts
> 
>  arch/arm64/boot/dts/qcom/Makefile       |   2 +
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
>  5 files changed, 1384 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> 
> -- 
> 2.26.1
> 
