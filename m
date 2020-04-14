Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E221A7EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732362AbgDNNze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 09:55:34 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38653 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgDNNzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 09:55:33 -0400
Received: by mail-oi1-f194.google.com with SMTP id x21so4233894oic.5;
        Tue, 14 Apr 2020 06:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FjapXsJJ1fyLNoa0nVkaYgxq1rkyUWv/mPY5Av8L+lI=;
        b=Fc9IYX9BtBIj+21cjoQYIZJhwt5c/akg4EPgYQCcDgZC5vpCVHFUoFJVS/Md9UO+AI
         fSQQAe7YMM+AFx9nSGwvTHGfciBflZpgwv2vEpA7/lRUqQCkJGQbXvw3s+K4ZL67gflt
         AYdvur6DUYGz9MMO6FEIlwaAOQ8sgTUgrGud0d1FVNCAu/Rt7yNKQFdUxykZvncxy2WC
         Nq7Eu57sswK9YYAULpo0xhUdzpdHVWmUDziEdWD3Txg6eH4dhb0bTpzBrXugNLVBLN9V
         dQwx13Z1rJCwreqXpKSC9ZUqwUBHxt2eOA75b/msjxgfZ9knMuSIAQxPvaI5QSbmaOxC
         qU5A==
X-Gm-Message-State: AGi0PuY7GQrbRr2DDaCyyO0dyUpDxiRr1sA7Tu2NNU9SL9SeKj9fhbNP
        zzI2ZSxuzWBjYbw7ISd3LA==
X-Google-Smtp-Source: APiQypLcp/5uJ/D4DypcS679K7Ewi00Jt/u7fJHXM5Ahks0NWkXNW+M1+Flus8mNofz8AEHBNeHjiw==
X-Received: by 2002:aca:d705:: with SMTP id o5mr15988391oig.67.1586872531843;
        Tue, 14 Apr 2020 06:55:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r205sm5589832oih.47.2020.04.14.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:55:31 -0700 (PDT)
Received: (nullmailer pid 29150 invoked by uid 1000);
        Tue, 14 Apr 2020 13:55:29 -0000
Date:   Tue, 14 Apr 2020 08:55:29 -0500
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
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH 5/5] [5/5] dt-bindings: mmc: mediatek: Add document for
 mt6779
Message-ID: <20200414135529.GA28611@bogus>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
 <1586165281-11888-6-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586165281-11888-6-git-send-email-chun-hung.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Apr 2020 17:28:01 +0800, Chun-Hung Wu wrote:
> Add compatible node for mt6779 mmc
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
