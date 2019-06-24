Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCA3501B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 07:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFXF64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 01:58:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33652 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFXF64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 01:58:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so12490068wru.0;
        Sun, 23 Jun 2019 22:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d78ITbk7v25AdSX5dYSxFeiJARIaWNXxJlHgvIqiJbE=;
        b=d+ObliVHtZyhPIt+wRPxK0rIMTCjFIKqKU6jGW9eSKw3Co0qNjPTSXtSC0Ip/J0xKV
         gUu7s+cQmnvxi/9KaD7SJJZ6K602wNOslGaNEokZt4U80nRk2NgQrxv+frZmOwgnbFwN
         khbrwbldMMrW/w5Fsqiy4u9NQ7xp13TVtcfGijGg9dOjLELvSYuie8EA0nGKdBXr0JZq
         JyUIImI6n70wr0BLResQ1KaTCC4yNUlEUi44BAsEKrDWsZKPW131olPJXpPweYDs4JF0
         4LnZfob8S1vqUr8iITIBhZILCU8UTZmrNtKHXohFFfQp11bm1R+8JhLdmNfVJ3rOMp0c
         gJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d78ITbk7v25AdSX5dYSxFeiJARIaWNXxJlHgvIqiJbE=;
        b=pSAguXO/ECpBIXWyDQBtjo5wzSjQUKw+XZU4pb2mqUE9kmyY5KSRkFF4SGsCUGI4CA
         dzI6lYTpYJJ8Y3xkywnXmqoZyi4aY65pufFEvNKjLojCQwAS2gp5ilIqJrHL6E96x+3B
         i4CuPWnDMATxQfob2A9Cka9ym6wnrww0ddeisTtMNcA9RPztotiOR4TIDrJ7BcA0U/j+
         +Mn78FLNWu1t9U/GFWm6rlPytwCRydmvj9jn9U6dG45qs8pLJobzIKaWILzXiIECJ5RD
         7GbEeUiSoYhLweXbdCevpXKMco75MMqhKiGoZYdt2UUMzMa9fBUEdpsOqxhfDWWxJczK
         UYPQ==
X-Gm-Message-State: APjAAAVBph/5tgxIeoQ/ryCzr8e4JbjpL0RCQL2KwYWdme0etb1xjTaN
        Pciw5NjxwSDVLsrWZAt0jt8UO9dc2GnAqXvVckw=
X-Google-Smtp-Source: APXvYqw5KL/drCGxI4hJiK5W5g/DbbbFzlUOjM+rVewMlt13CTXhkmHtJctGxmrQk6Y60n3Z6lOPXyrvmukwVHfizEc=
X-Received: by 2002:adf:e843:: with SMTP id d3mr30225507wrn.249.1561355933688;
 Sun, 23 Jun 2019 22:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190508021902.10358-1-leo.yan@linaro.org> <20190508021902.10358-12-leo.yan@linaro.org>
In-Reply-To: <20190508021902.10358-12-leo.yan@linaro.org>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Mon, 24 Jun 2019 13:58:17 +0800
Message-ID: <CAAfSe-uwxTtSs1DN_SMzqV+TBSOUM4mv2_vC94CK2-j3_AaBAg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: sc9860: Update coresight DT bindings
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Chunyan Zhang <zhang.chunyan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Leo,

Applied the patch 10-11/11 to my tree, thanks!

Chunyan



Chunyan

On Wed, 8 May 2019 at 10:21, Leo Yan <leo.yan@linaro.org> wrote:
>
> CoreSight DT bindings have been updated, thus the old compatible strings
> are obsolete and the drivers will report warning if DTS uses these
> obsolete strings.
>
> This patch switches to the new bindings for CoreSight dynamic funnel,
> so can dismiss warning during initialisation.
>
> Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Acked-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> ---
>  arch/arm64/boot/dts/sprd/sc9860.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> index b25d19977170..e27eb3ed1d47 100644
> --- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> @@ -300,7 +300,7 @@
>                 };
>
>                 funnel@10001000 { /* SoC Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x10001000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> @@ -367,7 +367,7 @@
>                 };
>
>                 funnel@11001000 { /* Cluster0 Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x11001000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> @@ -415,7 +415,7 @@
>                 };
>
>                 funnel@11002000 { /* Cluster1 Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x11002000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> @@ -513,7 +513,7 @@
>                 };
>
>                 funnel@11005000 { /* Main Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x11005000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> --
> 2.17.1
>
