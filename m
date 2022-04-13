Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1ED84FED19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 04:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiDMClC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 22:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiDMCk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 22:40:58 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174D4101C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:38:39 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id w17-20020a056830111100b005b22c584b93so295728otq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ykH6KjEFb1Bm4V2s69ZXD8+HWFP0pZr0KuSwAdAfJFs=;
        b=MIM5AITEbAxJIKnda6Ow2jOK+K8CJyBIxSEXwQULbONBe8sRDY6sSEWUB8POXS3ulh
         aip1nYsCBx7quPjwL7asOjwP1jfJTjR0ctMIQL3ypW9ZEj7oUIAbuUthGt8zoauGpO2S
         MTDwXTR6AkNbiqp1Jeo4Q8/gAHfqnzIil8+kMjtdPONzp9SGQ+dd7Yy380rOkP5vIIIx
         UIGpK+EKA4a3xyg8/eJzUA/0LA4HgRFa1W6CJJpZMeNYQ5R8bZ88jvokfFKsfdMWSC51
         h2173RDdjH5xrh83dHszReZwTjX4nf1j6ErXcZ+BdMJem+RfWDrDh2Lm0lQ92aPV+RrK
         e+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ykH6KjEFb1Bm4V2s69ZXD8+HWFP0pZr0KuSwAdAfJFs=;
        b=R7cLjv/iUPeJn8AU28qwihywahrG3s9R1hnizpbTUl8laAmeDIDyERJDWNOrd9wZ37
         j4zlGwEXyMJWIv0RFJtgtXJZJ2QJIHhHEMdtkF/3UFko0gFeojnaZTi9TrqV2W0/ftKC
         3RyKUpemDOie5nJHAe1NHcVf8Zm92lw6XKT5ODf3siQ42XKuMesQjQR7pZQz7ev4Q2+y
         3cODpk8LEaCUYMba4xBWNVJVscxl9jttQq4ae2+5JbZvhw14tGj9BLzxGZrzbsW8z4UV
         PRIx9m82TSlRvE197rBY6BFrDgvNBDV3LRfC1R8T41TmOz2GK3DKfCZZTUUjAkQS04tm
         U5jA==
X-Gm-Message-State: AOAM531SWGqcgzBeQ4YObFKrS9A8YbL+pz8kGOVb7sqrfsZQkOMiFboQ
        OXv7KRjb7IZleHGDwR40AeKQwHMuAU4hATYN
X-Google-Smtp-Source: ABdhPJz3IxfURlRgXYZUzriJi1wMm2dDOWPLzxK8mkdVWqkZqiuqlH3bhXG2PQFYmiJ5tkwFq5dYIQ==
X-Received: by 2002:a05:6830:1deb:b0:5b2:308f:e5b7 with SMTP id b11-20020a0568301deb00b005b2308fe5b7mr13681405otj.332.1649817518423;
        Tue, 12 Apr 2022 19:38:38 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o7-20020a056871078700b000e29ff467dcsm5435867oap.50.2022.04.12.19.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:38:37 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:38:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom_scm: Add compatible for ipq806x
Message-ID: <YlY3rPpYvclK8L3z@builder.lan>
References: <20220310220723.3772-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310220723.3772-1-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Mar 16:07 CST 2022, Ansuel Smith wrote:

> Add compatible for ipq806x. Just like ipq4019, ipq806x doesn't require
> Core, Iface or Bus clock.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/firmware/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7db8066b19fd..7348c5894821 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1338,6 +1338,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
>  							     SCM_HAS_IFACE_CLK |
>  							     SCM_HAS_BUS_CLK)
>  	},
> +	{ .compatible = "qcom,scm-ipq806x" },

If you in your dt do:

	compatible = "qcom,scm-ipq806x", "qcom,scm";

Then we don't need to update the driver for each platform, only the DT
binding.

And if we some day need to quirk something off qcom,scm-ipq806x we have
that option.

Thanks,
Bjorn

>  	{ .compatible = "qcom,scm-ipq4019" },
>  	{ .compatible = "qcom,scm-mdm9607", .data = (void *)(SCM_HAS_CORE_CLK |
>  							     SCM_HAS_IFACE_CLK |
> -- 
> 2.34.1
> 
