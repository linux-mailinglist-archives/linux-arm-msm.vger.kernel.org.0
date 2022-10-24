Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B76760AEA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiJXPKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiJXPK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:10:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0768010F890
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:46:45 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bs14so12850015ljb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXDMfbSvdfRJmnrB7Bcegq0YwNab1P2a/cSzHqB7sk4=;
        b=Ev+R/iByfTSfP39Rd2yDi4ivGXPJP5rkZVEBuevoWI0BvgeqNL+TSY6mhXtGIKwAhs
         ngHWlJBs81jFtaPLSADx2fpR2B4ks+F6s9CVTD9Z1N1O7+QS6857TmtElBy/GHDS+8ZK
         dlXdeTldpBr9U5hITtsE+ZKC1GFjSruwzYXeuo3XTQvOMvszIrmwL5H1y9KzEFwNMfWJ
         Hy0EEuVWDpdO/svJ34mDSlm050tJrCzO8ALcErUMTRuBDgXI6lU82FxOw0TVX/p6LXTr
         gYoG9fzwdT7v5ln2medVBSwR1ESi4a6LhTqJ0rh33pvq8KKUfMzcp01ERiQLVu4Ns2bJ
         zlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXDMfbSvdfRJmnrB7Bcegq0YwNab1P2a/cSzHqB7sk4=;
        b=l0muZEhMd2an/PIpDjofqgGVL3FzqbYrnh89uA/anKRNRz6VBdv1Txlr1Q5/md2Uni
         JJr1rF0hA9wgPFR5cfi0528+0vmwrg/Xm9lwYhTt9UKABOgnN7p3Zt/SDIBJWC7+AhrY
         cFKrmcSfDPOQ2Orqv2NzhAK11gr14RONI+vqsNv+/sYsuXjvtyzs5ar3m7B8DGyad/d/
         eeOZrq3VLiZke+G6rfJkD+QXak62vcNGCkxB/h3PC/hZ/9cRQvDkFDX6RWWsQ4Kwkb5o
         grO8E+eCOPOlCQ2oYR+Ky4Vidk2FnrdkM+VrCD3BnMa+xFWBgxVIzIxNPD5Hs2NZ0E6q
         im2Q==
X-Gm-Message-State: ACrzQf1B12B9thPkzrqbcF568oPGNOfQqa6Rj//kiyGUg9+lvgjtYfrh
        kpSbvXNmr5bKbdhzds+fwIN5VtojIJVAOUhU
X-Google-Smtp-Source: AMsMyM4PJ88PVCPjMKghg+zRn3JJ16K/+Z7xJXEWO8J3+ykBBXlXRim6GW7JveGLx2JhXB2MEZMuAg==
X-Received: by 2002:a05:651c:242:b0:26d:fb4b:9c8 with SMTP id x2-20020a05651c024200b0026dfb4b09c8mr12278995ljn.353.1666618345667;
        Mon, 24 Oct 2022 06:32:25 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o17-20020a056512231100b0049f5c71f1c4sm4518301lfu.198.2022.10.24.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:32:25 -0700 (PDT)
Message-ID: <966b0ca2-c474-9009-04ed-5c57a68dc2b5@linaro.org>
Date:   Mon, 24 Oct 2022 16:32:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 10/10] phy: qcom-qmp-ufs: add support for updated sc8280xp
 binding
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024090041.19574-1-johan+linaro@kernel.org>
 <20221024090041.19574-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024090041.19574-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 12:00, Johan Hovold wrote:
> Add support for the new SC8280XP binding.
> 
> Note that the binding does not try to describe every register subregion
> and instead the driver holds the corresponding offsets.
> 
> Also note that the driver will continue to accept the old binding, at
> least for the time being.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 90 ++++++++++++++++++++++---
>   1 file changed, 80 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

