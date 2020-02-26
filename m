Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DAE16FDF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 12:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgBZLiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 06:38:17 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35736 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgBZLiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 06:38:17 -0500
Received: by mail-wm1-f67.google.com with SMTP id m3so2696803wmi.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 03:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mQFv2ptApTIAiUn/IDnNgZylYWpvb4JaReKMP2qGRB8=;
        b=TSDY4K1jK4zC8azCDNMC5WXyxnatPyfc/pal1j+EIbnQKW2zaRx9qYncNZj9heQkOO
         JPA+Ec8cjsQg6KPJTGTR298QW22hIk2vO2pSGBmthLDnIMXTxfy4D5uUGGeH/dYYm0ud
         eMcAg3Bu9XFBTe55fTumqTQ3Wa7el+GPollNpMOMT2TW/Qvto6SaX5A8pyz9WNbivBlr
         vFofurtnEsP0LMC65L6LOWe/25tOhrBG5tmt7XQ1Q7ePkCKHLhS3dVhxEPoemgBU+6FQ
         hgqDhOq0ydIzX+XqKIKeRoM+qkoUsa9SbbsP/GG/pObX16rdcmO2HtjTUv2aTs5/gHkc
         +VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mQFv2ptApTIAiUn/IDnNgZylYWpvb4JaReKMP2qGRB8=;
        b=DdOuah/3QpL6mrDVqFg9QxWEB1xyukW5ZSV6ixme8/zDjwCgalX5DFQGINhGFGFe8F
         AEETfFnzAMrZ77RQxFTrrLFdUvxisaeaBA81/+1KfJbLYAuMprq2CkzWbCRsqUQLiiJB
         A9/tq0WfjnA159Ca8yiC7fQp1o9F88T3bW9FBQrsL4baE5PqLMQE7ylPf4bF/GHonUm4
         JfHNZ7Fu+NY5FGH677cWIJtLVvHzQLt4BewrxxUOIM6YHTLGbh5D6U40feX60t06bHhq
         KQII7I/AGN6Dy1mQcxJGRHms7A22h0wPUu+uqwVXNFhX4mAeodLdqjW64FzoqAj1BV83
         hG9A==
X-Gm-Message-State: APjAAAUuBQqQyu40I5Se+sf5f8+Ze5Pu+HFYGFVFv86H4r+lN8TF4L30
        j9To993IxbJYhph3c0T+5YEUrg==
X-Google-Smtp-Source: APXvYqyak90IvO19aKLILtWxBiJdRlI2XwGyaViPcGIDLyWqQbmhah1/I7K4BB75W9pOuWCAz2jGYQ==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr5369132wmi.25.1582717095791;
        Wed, 26 Feb 2020 03:38:15 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id h13sm3391406wrw.54.2020.02.26.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:38:14 -0800 (PST)
Date:   Wed, 26 Feb 2020 11:38:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Adrian Panella <ianchi74@outlook.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: add smb208 support
Message-ID: <20200226113846.GM3494@dell>
References: <20200219163711.479-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219163711.479-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Feb 2020, Ansuel Smith wrote:

> Smb208 regulators are used on some ipq806x soc.
> Add support for it to make it avaiable on some routers
> that use it.
> 
> Signed-off-by: Adrian Panella <ianchi74@outlook.com>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 4 ++++

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/regulator/qcom_rpm-regulator.c             | 9 +++++++++
>  2 files changed, 13 insertions(+)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
