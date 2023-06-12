Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4434272D02A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 22:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbjFLUH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 16:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236160AbjFLUH0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 16:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870ED118
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686600398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0M/d98x762H4zuN8FNzgVtnMfzxWhlymbFLqT2RC6Mg=;
        b=X8U3mcth8HCoftjlWL+aYu6f5z5mlGGqQR1LUzAKwtmZ1dGBze1QNThhyx87Y/AexnuJiD
        rbvojcFSG0iizFP0qptCC5Vb7GR/GXakG3+qr7lBXht3m5CeIt8w2vQSgd7MyJFeXUt72C
        PFPzCAh+MJ8JmnH7a7c4fK9MYc4lSxU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-C_-YJ_y_PGOJ8IQismGIEQ-1; Mon, 12 Jun 2023 16:06:29 -0400
X-MC-Unique: C_-YJ_y_PGOJ8IQismGIEQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-56d4daabd37so11538757b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 13:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686600388; x=1689192388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M/d98x762H4zuN8FNzgVtnMfzxWhlymbFLqT2RC6Mg=;
        b=lHMXhvxN5032CIkUEySgcc7RWQsm6p163kLX0DWbEtFfinUohoGVilOOIjeNlto7R9
         eQoj/NMcJtLzV32EVOIm4jYywPySyMLPj9EauWXFaPi3WW03ouubEdK6ANSEqqEqvQ+4
         u2aUYBdz1tTpdyLZWUTX6JmH6rYOMogv8bVOSGBKW6hXzFbIk0KBGLkYiFRJnlMCi6Yt
         Mu8mcNPMHZlvBkUZE2qIFxUk2Fqp/xqfXwAK7Gqz+6MuFrlTPhas0rOoqlPbz95mwhhu
         zaCn0ijE6nOrC/YqFx7OGDEgNdPJe06+7MZGKQfaJ8r+hqHJ8mPBjj1HjOZJMu6FgMCv
         koXw==
X-Gm-Message-State: AC+VfDwyVMdc5u/VA78J7LxIVPyRjS6dIGcztZhvgVYXh/Rtvc2C23st
        j4VfzQq2uGrIOXr7wYUeDpafBHE/FUxY7agNU7CfnnDIQQO16gqrXEZSugDF2F83xGILGp9tBGF
        DDvSG2ywOClqWIs72WDbMZpO7gw==
X-Received: by 2002:a0d:d914:0:b0:56d:3cb6:8a85 with SMTP id b20-20020a0dd914000000b0056d3cb68a85mr3028353ywe.13.1686600388572;
        Mon, 12 Jun 2023 13:06:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76nT4fsOumxEmo+PTpkq6Cy2kw7r9EpHd6856hkyTJvZHjyfWwkpG7DXRuh3pkEkAcTXM4cw==
X-Received: by 2002:a0d:d914:0:b0:56d:3cb6:8a85 with SMTP id b20-20020a0dd914000000b0056d3cb68a85mr3028315ywe.13.1686600388330;
        Mon, 12 Jun 2023 13:06:28 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id q67-20020a818046000000b0054f83731ad2sm2736173ywf.0.2023.06.12.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 13:06:27 -0700 (PDT)
Date:   Mon, 12 Jun 2023 15:06:24 -0500
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
Subject: Re: [PATCH 09/26] net: stmmac: dwmac-qcom-ethqos: add missing include
Message-ID: <20230612200624.jvlyemz7g5aoen62@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-10-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612092355.87937-10-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:23:38AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> device_get_phy_mode() is declared in linux/property.h but this header
> is not included.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e19d142630d3..ecb94e5388c7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
> +#include <linux/property.h>
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
>  
> -- 
> 2.39.2
> 

