Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5DA72D02D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 22:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjFLUHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 16:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236715AbjFLUHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 16:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87D0107
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 13:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686600421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X+0noFHcj2yLtNYh9uCwW0uaG8SfjbhqsP5is69vjY8=;
        b=Nmq5ShtWfiH5S3rXoXpJaLp6mSEgV2TNAh2iPKimY7+ZUHZKBM3zJnYBJZIw01ePcomypf
        Zp0Z+9/wEuX76JFoPckgIgvrpESXiC8LcKDyC4fZxasPOZ8/9Hnd2sQtd/4Oux21hgoBon
        MU8OEc/8fFopiX8p4JiOMHvoIU7UlkQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-YHsWi2WZPmmGwnmzjsqEdg-1; Mon, 12 Jun 2023 16:07:00 -0400
X-MC-Unique: YHsWi2WZPmmGwnmzjsqEdg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5651d8acfe2so77357777b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 13:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686600420; x=1689192420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+0noFHcj2yLtNYh9uCwW0uaG8SfjbhqsP5is69vjY8=;
        b=j7ocrssFAG4vNSRCQI3BcL7Tx1psxW7C6lSnrRHSuqj3DJwVBatC9Z6Gzka6dBoaBY
         WASiZW3LWg++urn3bxvCkO3wklb6VFQamFkxqO4R0nGTHJNRh4F+NqAjDZqF90pUH9Ly
         nOwHv0+TTF3sRyKTGwAQQSjpdaQOf90FJqyWVUzeI+clHrgCSmAkPFik3QaNEefkvaCe
         kAVSbPf+Rdu4XM6Q0RiqgCck/BOwP8fotA/WbNRgWnl5fGMsZtjRj6Jz185RS07Eb9x2
         I77rd/RRM9lWGmy7LnjOuO1Ps29FOVVjuikpFaDjEoJEPIxwSv2wsPzmV7N+QLRUjPy5
         Ngeg==
X-Gm-Message-State: AC+VfDyn5cvKz2lNaZvNVBSS8szenw7iwZ58WyM1Z3aycfKQ/DD8BE15
        MNHeDIToJllqCAN1wJXnkJjGtWPP9yf7UnJ4idOFtQSUnRf/0gPLZ6mgADoMs4fUo0/Zje1dgn2
        yE5fbX1IL41mHUCiWWzGne/fhdQ==
X-Received: by 2002:a0d:d142:0:b0:569:feee:3950 with SMTP id t63-20020a0dd142000000b00569feee3950mr12226032ywd.2.1686600419882;
        Mon, 12 Jun 2023 13:06:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7PzolWatF3tOgmfa9XBAGwXjOlATUx5vSje4PclwYgketu3avPNRnBzek6n0LaOUY30qXC9g==
X-Received: by 2002:a0d:d142:0:b0:569:feee:3950 with SMTP id t63-20020a0dd142000000b00569feee3950mr12225997ywd.2.1686600419621;
        Mon, 12 Jun 2023 13:06:59 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id m14-20020a819e0e000000b00568e7e21db7sm2713928ywj.96.2023.06.12.13.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 13:06:59 -0700 (PDT)
Date:   Mon, 12 Jun 2023 15:06:56 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 10/26] net: stmmac: dwmac-qcom-ethqos: add a newline
 between headers
Message-ID: <20230612200656.ndt5pwhi3gqj42a5@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-11-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612092355.87937-11-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:23:39AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Typically we use a newline between global and local headers so add it
> here as well.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ecb94e5388c7..5b56abacbf6b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -7,6 +7,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
>  #include <linux/property.h>
> +
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
>  
> -- 
> 2.39.2
> 

