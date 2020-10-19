Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822C0292EC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 21:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbgJSTwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 15:52:11 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:46217 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgJSTwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 15:52:11 -0400
Received: by mail-oo1-f66.google.com with SMTP id c25so189061ooe.13;
        Mon, 19 Oct 2020 12:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ew7/s5Mi9EkVfqC8BR7HcDgW3goCt7jOkM9uew3ofiU=;
        b=cNh+WMwM9Mb1R8VspktMNHszAMelB+NAvrC4pMvWVCcqXwBo3lbH3OJWL+Hzf7PG1X
         qqNpBpQ52am8OI/OxREJR8bFozMgyCi5oxcf2sW5y83yWNiRMELhoQa/3fC3n2UhD5+I
         Xhq0//vsRWjUmKLBcmwO0SfaDo42J31nXDA010KPBk4q3KOJEJsistiBbdtoBTyt14Ht
         p+gAlt3oh4fX2IFSQtvE2TpdR/HcWUopWZyA8AtEpDjJGuO+KNE/KnrA1LpUpvG4KYX/
         OIV19M1qYt3NYqy/v+xdJHkvaaJgB6xfuUOdk/LhRZscTtcwMRVokiceOeLQuattb2K6
         A90A==
X-Gm-Message-State: AOAM530bTc9ZSoyZC384+6UE4bJi7K1AC5H4hvOGcLHYAXgSDj9Xd4Ew
        TDF6aPNnfs9YmU5jvJmpTg==
X-Google-Smtp-Source: ABdhPJx+NoGSxSoi6odZZ4oAHUazygsVlzgZNKOkBE39HHPuHBmnPyEk+8k3NTDuCDyeWFPZvZSRXw==
X-Received: by 2002:a4a:5a06:: with SMTP id v6mr1100844ooa.69.1603137130314;
        Mon, 19 Oct 2020 12:52:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t84sm201473oih.35.2020.10.19.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:52:09 -0700 (PDT)
Received: (nullmailer pid 3500572 invoked by uid 1000);
        Mon, 19 Oct 2020 19:52:07 -0000
Date:   Mon, 19 Oct 2020 14:52:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20201019195207.GA3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 17 Oct 2020 00:10:33 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1383441

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

