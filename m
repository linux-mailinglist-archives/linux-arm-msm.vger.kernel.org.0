Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A6647D0A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 12:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244469AbhLVLPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 06:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236735AbhLVLPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 06:15:52 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725B3C061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:15:52 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v11so4131668wrw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wm7ceiBo2JszsCIJkrhp1xhqeVltfP3wlNwXPrRjP24=;
        b=JuDGpd4Hf730Hy1xkZzdm7Jm917/6CwrXFdCWLv4thxaPaEAifEYweXoJTV2dVFxiq
         5xNyIY8uwWCzHqo0fIzTfrz0TCDGF/U3IMQMKFidXd7Wya1wS/CDmt9LGkmKh9VOdxwg
         mJABWKYoU0c636DwooyIxlIV1WtLmeZtbP7evZqI20Ft33qK8PHZFj/UWPobzGv+fL6j
         eJ1MR6XCqEs61xqgDGX08pWrOy9fzmd3qJ/tz8fZ5a86CY4EoTFamlTp0O7xsPvU2RVv
         M5W+bMyn1VJxWuoY5gA8vqSqAuUF/dmwjl+6S7X8vOkqg6XTljUe/M6I4lBeR79ZS6G0
         mt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wm7ceiBo2JszsCIJkrhp1xhqeVltfP3wlNwXPrRjP24=;
        b=2lv7K92pHoS1TyzVKeOy4nCYx+rxFOBkzvwJJP4cO96JWa9O9gIvfbtm0BRfgiZVAp
         IdwuDSjiJSWWtC9B7ABWgV4nQFAsquhgZ/h4B/tfZOmxzZNB/Xf2rnYdDDdlFmjNQgPA
         iJiflIdj+MbssG1TFM+ONDnh3qyhe4iY1HJ3zHe7vAMl97MRytfRV/OWOQHoPRbc3q4m
         3r1HA8dEEWDagdJqAHLuwbg/DxlFtYzZ27AV265wrTB5h4KK83ZPWwNW7xFimoWox5Ur
         tviT+ibBtg7DX3OOF/lWu1hoawSsKXVZUp1m9o3qtonwYYdbm66f62OveZWMqVpWLGyn
         vHHw==
X-Gm-Message-State: AOAM532Z7MSr9mmiWHCBn2KxTKPrOqfsMGMu55byuS9L7Hj2qdRBWpgE
        n6ZaCR7a6U2HInpVpz587bUF6g==
X-Google-Smtp-Source: ABdhPJyaGzs1v4cpza6jVqOa8pif0o1C0RknC0vja0TI23nk6gWPNt71MTTcv4gmRcsLQ98s4nzF8A==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr1755010wre.622.1640171751048;
        Wed, 22 Dec 2021 03:15:51 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id 14sm1801429wry.23.2021.12.22.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:15:50 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:15:48 +0000
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
Subject: Re: [PATCH v3 2/9] backlight: qcom-wled: Pass number of elements to
 read to read_u32_array
Message-ID: <YcMI5Oq3jOIFQvKc@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-3-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-3-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> of_property_read_u32_array takes the number of elements to read as last
> argument. This does not always need to be 4 (sizeof(u32)) but should
> instead be the size of the array in DT as read just above with
> of_property_count_elems_of_size.
> 
> To not make such an error go unnoticed again the driver now bails
> accordingly when of_property_read_u32_array returns an error.
> Surprisingly the indentation of newlined arguments is lining up again
> after prepending `rc = `.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
