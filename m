Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05021B9F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 17:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731299AbfEMP2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 11:28:24 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38422 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731294AbfEMP2Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 11:28:24 -0400
Received: by mail-pl1-f194.google.com with SMTP id f97so1557144plb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LMcHhVUanXtNp8UGi1hE6QLdFyx1JwZi43KNCz8OqQI=;
        b=Ve0piJlFoPsHHA/V+7kFHF1y+MroWg6pY0ttYjy8as3Qvek1yy6HPYM+AOtZ9UUMNi
         EP0ejXgecPT2ugxAWQ2R8U1ivabvV1jWKlEU51yYaTZAtUXK3DoIlM4s3MYFt3LiQAvS
         yvtW9K+s7U7rfqC9LpdxlMJKctjzJMMwerY1TGW38G7vX3K2pM36Y49iaN8FapjYzebU
         baWO5BWRL/VELmwLRblp7kJhEliqRu0mEGjSXBDTrIkSrQEhDSMMI3LuUIR8Bl2s83IL
         vzx4l6kWQMTRHy9bSv3RhmFcwLO8zxjzV7xNDSFCRaK6ytd+59fIR9dZ8WLiFJ43mw6A
         vRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LMcHhVUanXtNp8UGi1hE6QLdFyx1JwZi43KNCz8OqQI=;
        b=a85vwKN33CuadCjpKNWaHiMrZyoh6gJgPxilp0SR/P+Tw4ADIgyFtpyhmlBA1SJb6+
         a6yx3ATAzbPsPHwoThETeqq55dY0bN7FBn0X74yYs7SZXjfOjh9ROiNFjU+euZ6uWFPa
         tta4b/mDJMyP404PQuD5xPPTEsG/+HJ19fROjkse6LRv9pRPIULjxvcixJ1xtdiGUvNG
         kq21gzxfeyUR7PkGoLkyEjc6yrNNdUmjRXOB/C0WKFAPDgZ6f9NMEeXU4eRVhumx2SAo
         Zs+t1jSOVLklyn0TZZ+fjRPL+VdrQptdPKt4xWOFYYkxtBfFTsoA5kUhCVKZPqTX1ZbK
         1kdA==
X-Gm-Message-State: APjAAAXCnb6rcaEjAY9bm2Xy8VK6fjH+rnFbcUPs0VztlhHnevV7cdc2
        jE+jw6qniE2HMLKVlqVaiyhziA==
X-Google-Smtp-Source: APXvYqykOVyIh1OL7tHpA9rGJZCNmX7tM0rAmgR+Kv6tfiy1Jn+wziO39Jgznm16VZhGZIak5Ql82Q==
X-Received: by 2002:a17:902:5ac9:: with SMTP id g9mr31476056plm.134.1557761303523;
        Mon, 13 May 2019 08:28:23 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j189sm28711990pfc.72.2019.05.13.08.28.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:28:22 -0700 (PDT)
Date:   Mon, 13 May 2019 09:28:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Guodong Xu <guodong.xu@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: Re: [PATCH v2 00/11] dts: Update DT bindings for CoreSight
 replicator and funnel
Message-ID: <20190513152819.GA32523@xps15>
References: <20190508021902.10358-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508021902.10358-1-leo.yan@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 10:18:51AM +0800, Leo Yan wrote:
> Since the DT bindings consolidatoins for CoreSight replicator and funnel
> is ready for kernel v5.2 merge window [1], this patch set is to update
> the related CoreSight DT bindings for platforms; IIUC, this patch set
> will be safe for merging into kernel v5.2 because the dependency
> patches in [1] will be landed into mainline kernel v5.2 cycle.
> 
> In this patch set, it tries to update below two compatible strings to
> the latest strings:
> 
>   s/"arm,coresight-replicator"/"arm,coresight-static-replicator"
>   s/"arm,coresight-funnel"/"arm,coresight-dynamic-funnel"
> 
> Please note, some platforms have two continuous patches, one is for
> updating static replicator compatible string and another is for dynamic
> funnel change; and other platforms have only one patch since it only
> needs to change for dynamic funnel.
> 
> Avoid to introduce merging confliction, I rebased this patch set on
> linux-next branch with last commit fcdb095ad001 ("Add linux-next
> specific files for 20190506").
> 
> This patch set has been tested on Arm Juno and Hikey620 boards, other
> platforms are only compilation passing.
> 
> P.s. when use scirpt/checkpatch.pl, it reports the warnings as below. I
> think we can ignore this warnings for this patch set, please review if
> this makes sense for you.
> 
> WARNING: line over 80 characters
> #29: FILE: arch/arm/boot/dts/imx7s.dtsi:178:
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> 
> [1] https://archive.armlinux.org.uk/lurker/message/20190412.102734.2afbb29a.en.html
> 
> == Changes for v2 ==
> * Add explanation for the change in the commit logs. (Fabio)
> * Merge the separate patches for funnel and replicator per DTS into
>   a single patch. (Suzuki)
> 
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Andy Gross <agross@kernel.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> 
> 
> Leo Yan (11):
>   ARM: dts: hip04: Update coresight DT bindings
>   ARM: dts: imx7s: Update coresight DT bindings
>   ARM: dts: qcom-apq8064: Update coresight DT bindings
>   ARM: dts: ste: Update coresight DT bindings
>   ARM: dts: vexpress-v2p-ca15_a7: Update coresight DT bindings
>   ARM: dts: qcom-msm8974: Update coresight DT bindings
>   arm64: dts: hi6220: Update coresight DT bindings
>   arm64: dts: juno: Update coresight DT bindings
>   arm64: dts: qcom-msm8916: Update coresight DT bindings
>   arm64: dts: sc9836: Update coresight DT bindings
>   arm64: dts: sc9860: Update coresight DT bindings
> 
>  arch/arm/boot/dts/hip04.dtsi                   | 18 +++++++++---------
>  arch/arm/boot/dts/imx7s.dtsi                   |  6 +++---
>  arch/arm/boot/dts/qcom-apq8064.dtsi            |  4 ++--
>  arch/arm/boot/dts/qcom-msm8974.dtsi            |  6 +++---
>  arch/arm/boot/dts/ste-dbx5x0.dtsi              |  4 ++--
>  arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts     |  4 ++--
>  arch/arm64/boot/dts/arm/juno-base.dtsi         |  6 +++---
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi      |  4 ++--
>  .../boot/dts/hisilicon/hi6220-coresight.dtsi   |  6 +++---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi          |  4 ++--
>  arch/arm64/boot/dts/sprd/sc9836.dtsi           |  2 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi           |  8 ++++----
>  12 files changed, 36 insertions(+), 36 deletions(-)

For the set: 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.17.1
> 
