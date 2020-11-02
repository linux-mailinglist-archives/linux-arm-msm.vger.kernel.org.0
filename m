Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD162A2ED1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 16:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgKBP6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 10:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgKBP6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 10:58:12 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11497C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 07:58:10 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id x7so15234839wrl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6WR8URTpPLXbEyZRR9vT8a6//7XUuWvtF++mZUJuUqQ=;
        b=qSaFEDwvD4lOnnkzIT4xlf4ITxzLXauLuuveTj5gw99Cv6ME75AI/l6aab+gpsWP+v
         QR/+gnScHrSMsn6cNOOCgi2T1G9PP+4ASV6fQRLnfhWcNOkgvBsXjaQFTbsV9pf0UR/T
         ghVo9+kHipaWBxtoLnuffP9HSvoG8CN9xEpmzIFZ1VnWivWoBgPLT6LTX68qDLZXU2ct
         X5yP1r912lCGH3yoPzQ8iNS3x8osZf36uLOPZ+cAAPPIkt4N4vZmylEJIQ/VmdfxIKAk
         wu4gJN9phO9pshPdltOc7m34JZJfYK+zocQcDoOv0E5fAbCiqhGo27v1Z+wfL0s7Xaev
         yDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6WR8URTpPLXbEyZRR9vT8a6//7XUuWvtF++mZUJuUqQ=;
        b=llsFcTZuaf44dOWHTNEJZBjxmGQruCBNIgSkbgQ9eqhoyXXMBAp+xCv7YjBR4eyjmC
         bGkkyCD6k0ZTF/SLSpKUBMP5cGRkrRlhV/4vAC16WL8LximocLul/raVVVP1UEq2+ax1
         DbxjlrxyddOU/FmXDC0nugP3c9GeVwTW8je9Ad7nHmvjzpCe5kwXpeHkEyRxqQ/ahBeR
         WL4sJjeZEUkaLDxk05oWxcGtkcynsRrtTPLhoOUhHRwgw7yXVSo68M66Y5DAgcbkIUPh
         VhPw2vJR2KOHey6eUqmcKyz/bZRip67CzmfCLaghIr7XQLVNmOyAJsoJvHWUEdzNEMl/
         EJdg==
X-Gm-Message-State: AOAM532bXG9Rd6j9aTBPKf3GVgaoDDy2DobO4fay10xw+v1nw0n9MBuc
        0xXGHA20H/Vo0lbR29xy6kqvGw==
X-Google-Smtp-Source: ABdhPJyHmZ2FaZWAQo25mgGhVgX6xjocdW3tBWaR4FgbQaOFCkxeF8a931x11wRjL2NCgNjgMdz+Cw==
X-Received: by 2002:adf:dc85:: with SMTP id r5mr22225279wrj.66.1604332688624;
        Mon, 02 Nov 2020 07:58:08 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 130sm16984539wmd.18.2020.11.02.07.58.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2020 07:58:07 -0800 (PST)
Subject: Re: [PATCH v3 0/4] nvmem: qfprom: Avoid untouchable regions
To:     Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201029002827.1729915-1-evgreen@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0a7d86ee-96b0-eff8-e315-ff65086661ee@linaro.org>
Date:   Mon, 2 Nov 2020 15:58:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201029002827.1729915-1-evgreen@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29/10/2020 00:28, Evan Green wrote:
> Certain fuses are protected by the XPU such that the AP cannot
> access them. Attempting to do so causes an SError. Introduce an
> SoC-specific compatible string, and introduce support into the
> nvmem core to avoid accessing specified regions. Then use those
> new elements in the qfprom driver to avoid SErrors when usermode
> accesses certain registers.
> 
> Changes in v3:
>   - Fixed example (Doug and rob-bot)
>   - Use min()/max() macros instead of defining my own (Doug)
>   - Comment changes to indicate sorting (Doug)
>   - Add function to validate keepouts are proper (Doug)
> 
> Changes in v2:
>   - Add other soc compatible strings (Doug)
>   - Fix compatible string definition (Doug)
>   - Introduced keepout regions into the core (Srini)
>   - Use new core support in qfprom (Srini)
> 
> Evan Green (4):
>    dt-bindings: nvmem: Add soc qfprom compatible strings
>    arm64: dts: qcom: sc7180: Add soc-specific qfprom compat string
>    nvmem: core: Add support for keepout regions
>    nvmem: qfprom: Don't touch certain fuses

Except dts patch, I have applied all the patches, dts patch should go 
via arm-soc tree!


--srini

> 
>   .../bindings/nvmem/qcom,qfprom.yaml           |  17 +-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
>   drivers/nvmem/core.c                          | 153 +++++++++++++++++-
>   drivers/nvmem/qfprom.c                        |  30 ++++
>   include/linux/nvmem-provider.h                |  17 ++
>   5 files changed, 211 insertions(+), 8 deletions(-)
> 
