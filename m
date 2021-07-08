Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54253C199B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 21:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhGHTKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 15:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHTKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 15:10:48 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647FBC061574;
        Thu,  8 Jul 2021 12:08:06 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id l2so10093390edt.1;
        Thu, 08 Jul 2021 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=w6xQrdlpLvMz9Z2fEFC8sZJylqr+6d90oIbrx+u4s3c=;
        b=NAZ77vUts2H6sxt/of4jZUQwgAdFm5NGy1srYolKkTVzPhwiXsUO3ZyaQ77wnZxUkN
         RNWxUIEUve6juNXSxNzKT6WzxIjUkN3a8ohHXhXcTA3rau/pt7mCCOxH54phCfTHKd20
         cu33RPgug+Un3NmyeGDmuA4sBrZWXERXw5NxW/CksA3Ne6NLXexGHgrzLa2H9YlkdAvT
         fuFtOTJWVbckWrlQo16S5SbqL2gnJf0lrvccdTacc7uCDEjXLWPv7cjejRLZZ8WMlzNR
         N63v9y0j1d2GrJgKLG+pYnc6QjPaRBE1rtyb6TPkDHt0eEpJv67wsK4LGymnla2oETdW
         iDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=w6xQrdlpLvMz9Z2fEFC8sZJylqr+6d90oIbrx+u4s3c=;
        b=c8w542ZkQfmkXN1/GPqAzBL2IziMOKPsNiQPNh/xV5+PBb4Msi6ucoytHdYI7yKv2R
         O+r9704CPIRgzyPqfbZYAJgrPq0pvYrq3gkmR70HFZHcgZBSzKyFMtjBc1cY7XYbg3ng
         KNE6MuLzw3XlHEpSJTRqqLQf7nF6M3Hnkv7xBodyLNh7jloAIWhSXwRnhQMPzLnRFAH6
         hUqAOozoB5tszDgow/hDdMJDLWvwY3IsGyRG12OcO/rihJvsC1pT6K98PF8Js2zBCMvl
         KqREnt/BPopW16jtFqGBhNtuYqw0x1P5aFqDg14na04h7CGLwF/fWvQp4qSvRhy88qEI
         5RwA==
X-Gm-Message-State: AOAM532p8Ie3tQFlg1OMBGyuGrCqKGYlti1sBy/o/fyDs7kQi2nea/FS
        FGDUPUprFJDzcjHHMA2WxEVPzazSqph+Gg==
X-Google-Smtp-Source: ABdhPJx+pP8VM4XA6089+QLUuJyhCyhU1Jp8zNBVDG8JgjIMt+8UMmHpgNRPEqg1vhZGIHsm8zQPzQ==
X-Received: by 2002:a05:6402:501:: with SMTP id m1mr40599871edv.163.1625771284993;
        Thu, 08 Jul 2021 12:08:04 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id r12sm1745038edd.52.2021.07.08.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 12:08:04 -0700 (PDT)
Date:   Thu, 8 Jul 2021 21:08:00 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Disable
 cont_splash_mem
Message-ID: <YOdNED18trTFO0YV@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210622191019.23771-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622191019.23771-1-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

gentle ping for a review, please.

Kind regards,
Petr

> As the default definition breaks booting angler:
> [    1.862561] printk: console [ttyMSM0] enabled
> [    1.872260] msm_serial: driver initialized
> D -     15524 - pm_driver_init, Delta

> cont_splash_mem was introduced in 74d6d0a145835, but the problem
> manifested after 86588296acbf ("fdt: Properly handle "no-map" field
> in the memory region").

> Disabling it because Angler's firmware does not report where the memory
> is allocated (dmesg from downstream kernel):
> [    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 16 MiB, limit 0x0000000000000000
> [    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for cont_splash_mem

> Similar issue might be on Google Nexus 5X (lg-bullhead). Other MSM8992/4
> are known to report correct address.

> Fixes: 74d6d0a145835 ("arm64: dts: qcom: msm8994/8994-kitakami: Fix up
> the memory map")

> Suggested-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3->v4:
> * add a comment in dts (asked by Konrad)

> Kind regards,
> Petr

>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index ffe1a9bd8f70..c096b7758aa0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -1,12 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015, Huawei Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
>   */

>  /dts-v1/;

>  #include "msm8994.dtsi"

> +/* Angler's firmware does not report where the memory is allocated */
> +/delete-node/ &cont_splash_mem;
> +
>  / {
>  	model = "Huawei Nexus 6P";
>  	compatible = "huawei,angler", "qcom,msm8994";
