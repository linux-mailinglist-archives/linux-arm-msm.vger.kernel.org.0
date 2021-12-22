Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760CE47D0D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 12:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244565AbhLVLSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 06:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244549AbhLVLSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 06:18:17 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F05C061747
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:18:17 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so1263071wmd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UqlZAuK587EnmAYWNwie5YNKKe3+Y4dPueeQgf26x50=;
        b=vuOSX1bxQMEKxQcPN+VUUzKo5/t4x6aE8a4lqBIBg/AfdmqB+6KVo2XrTQoBcSf2tU
         KYJuzyeQqh3/veN33Hl/w1tg5wAKXrHSqexWXadPAvPdIo2fytqpF+9ocXySUdMR3RSa
         MRY/zjG3TljBxAp93rn6PZZhO6CIQlFo7eg8MfpoGY4uLFl8WbhQVQWDCNgMFXMJEXEj
         59Cpgd/Db1D2YmwSp6L3dll3YieiAaOsusYepMXSzdIcvxRt/NSzk4VWzfgi+tPzySeJ
         6nMIr7jC78BS9CfRNHmzaVPCONacS2shsylJV4x54vPtLpx+iIqlcIRIMe/fJbdR7SWF
         PRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UqlZAuK587EnmAYWNwie5YNKKe3+Y4dPueeQgf26x50=;
        b=H677YLmx/1YvnKTfc7P3mvvX6ogWD9NX3lHt92+Ca/X6BoQaccSCfeVHvtYeEipPZ5
         +PEw595G69Cjc4QlpLXuO7+M14foCXVbcVhW1I8lNFT/aMPPhoMN9tKwDTcIx7weJ76u
         Bf0Jxm42D9K6jKe3+b0MY8vAWdIJiUXVmHfZXp6982xFxX7oUSFWoicV0aaG2vBauPbT
         CI6nqlu872HgmPnlaUeek6HXzxd6Z+B7OUmaGWOeW2YKylWmsfP+Xr4na0tN+FeP4Xhk
         /RzQ2pWyC/NFaBKJfusv9zVM5FrYoiP8xfozu+BqtIocn+BMUhQ3v3Klsh9eBZ+OTiPp
         XeTQ==
X-Gm-Message-State: AOAM532IXHnIMWt2VRY4yYgchpoXJb9Ftcz5b9qylZNqlYNB1KRMgR4q
        t9WY4DumT3/0rBeHqXq6OrO8Wg==
X-Google-Smtp-Source: ABdhPJxTnsCCzl4VAhbNMA9kFEFyPrCJC8S3xlkUnNwpH7/g4OOdhsrsOwbBPBROyn7j9hcnjUPYSQ==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr609179wmh.3.1640171895690;
        Wed, 22 Dec 2021 03:18:15 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id h4sm1643585wrf.93.2021.12.22.03.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:18:15 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:18:13 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 7/9] backlight: qcom-wled: Provide enabled_strings
 default for WLED 4 and 5
Message-ID: <YcMJdZRoOtUrWvkV@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-8-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-8-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> Only WLED 3 sets a sensible default that allows operating this driver
> with just qcom,num-strings in the DT; WLED 4 and 5 require
> qcom,enabled-strings to be provided otherwise enabled_strings remains
> zero-initialized, resulting in every string-specific register write
> (currently only the setup and config functions, brightness follows in a
> future patch) to only configure the zero'th string multiple times.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
