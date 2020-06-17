Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEDA1FD698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 23:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgFQVCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 17:02:52 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44359 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgFQVCv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 17:02:51 -0400
Received: by mail-io1-f66.google.com with SMTP id i4so1550059iov.11;
        Wed, 17 Jun 2020 14:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xFFFGVbhSch5Pt2svn8MimZRF1LlF10vkrqi5t3dW9I=;
        b=sQdyR7yg6FjwlEvFgoJUeHxE4yCreObyk4DB8tdEQZ8kJMm8lMOSqwmWtvzCCCc4tX
         OBM8PyeHLCgCQPFupTCiN5+9uikcM8CiTlfAcOi54zFNHzM028w7K4NTspv8naLWIfxD
         0zIOaE9/9LMO8AymXJ9JdXIqX43hBYnCtx25CfZOIAx+lahwlAT51lXVDMMOCITWjLjY
         Rn6Wdb41NGZP+TgCWoEBTtgFLry5LI8hHB+k9mPfQ2y4bokX7BQABkZw+qo0MiQHSc44
         mUftUJdb42wONV8JeDondOluvGCNbyaDhOiTDHud8BFLeGJh7PgiZDnyVS9HZyY5jQOL
         WAjw==
X-Gm-Message-State: AOAM5319ZfGjgha8FIt0dNCDbzOUcRiUpbWrfZJtc8lod9gT97WhoxzL
        QDvsJZtg/r5P1HOxI967Dw==
X-Google-Smtp-Source: ABdhPJyXhGFVD9efkJSsHu1gz54q5MCenhejfFdnSe9K2byNsnC5c7h0Xj90NBIYtbqHKRUf3MoPIg==
X-Received: by 2002:a6b:9054:: with SMTP id s81mr1423659iod.122.1592427770922;
        Wed, 17 Jun 2020 14:02:50 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f11sm398301ilf.53.2020.06.17.14.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 14:02:50 -0700 (PDT)
Received: (nullmailer pid 2809826 invoked by uid 1000);
        Wed, 17 Jun 2020 21:02:47 -0000
Date:   Wed, 17 Jun 2020 15:02:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc:     mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 4/4] dt-bindings: mmc: mediatek: Add document for
 mt6779
Message-ID: <20200617210247.GA2800817@bogus>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
 <1591665502-6573-5-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591665502-6573-5-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 09, 2020 at 09:18:22AM +0800, Chun-Hung Wu wrote:
> Add compatible node for mt6779 mmc and HW cmdq selection
> node "mediatek,cqhci".
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 8a532f4..d4d20b9 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -12,6 +12,7 @@ Required properties:
>  	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
>  	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
>  	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
> +	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
>  	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
>  	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
>  	"mediatek,mt7622-mmc": for MT7622 SoC
> @@ -49,6 +50,9 @@ Optional properties:
>  		     error caused by stop clock(fifo full)
>  		     Valid range = [0:0x7]. if not present, default value is 0.
>  		     applied to compatible "mediatek,mt2701-mmc".
> +- mediatek,cqhci: HW cmdq selection
> +		  If present, hw command queue is enabled.
> +		  If not present, hw command queue is disabled.

'supports-cqe' does the same thing.

>  
>  Examples:
>  mmc0: mmc@11230000 {
> -- 
> 1.9.1
