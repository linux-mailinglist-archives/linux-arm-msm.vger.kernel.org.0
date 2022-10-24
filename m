Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0693C60AE96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJXPJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiJXPIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:08:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFB4AEA12
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:45:27 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j14so12809827ljh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fx5nJYBC3Q8DnGw9StujAKQsTNCS9sjAujJ7iNJnrTw=;
        b=jiOWMKP0eMVkW+a+y7F8YqwZrvDEtSXBDMBTZDaeAJd0kaBcpKkzaVXT5BlggRvChq
         PgfumTjH0RCxMyx2pyMVlX9LMq4mGfogusSmzzwc05Ug477Ou5kKYW43pGO2Ah6Lfdmm
         iW9WWsUd5t4rzqDw9jhudGnMX9NcdJ175nTA2AggsKczbb+dNsZqbNH6VeR6Trqwz40i
         gYvtOOAEiKH3Iq+1iwN4CHpsHWrfn5yo5GUZmrmgUdpMUuCeJpWTPbvmsk6m1UpSoHH8
         1irTx5Bo3CPHj6gFWlPWLWEC06tntbOQhEYXZPsGhrkguebYGxvWdJyAqyl5W+nI5l9e
         24Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fx5nJYBC3Q8DnGw9StujAKQsTNCS9sjAujJ7iNJnrTw=;
        b=mXZqNCG8aIkCxv7xejlVN4gGgONT0f1ZIsY0HFgXvLSdC3bsa5lLrSjhjAU0YXWSp/
         nSO1Dr78coaoNjvRHOOerK0BhqMVyJ+KlP2teno8twwPSG/KeeI1JcfrDrKsT4zHTRvx
         HCxOkGr3fHaXbPoY1+bGTBkva/d9KKc+yhdJkbIJ7FM494F7YYyWvY8nY2wEGkD0e6Rs
         mp5Ozm6RenmMQtaXSQUP9apjf2aCqLxsL1nIGJzisbROQJzoPjArCCCY/GZCAf9wT3O5
         DPf+ZVSymfS66ml/8F7sqHA9gV9piGpPMtpJsygk/CmP/l0FkihHkB+Dv57iM1Jsa99T
         NdLQ==
X-Gm-Message-State: ACrzQf1ufRvH2Uoh4CxYrilQ1iOh0QtipoP79ZkIpStq0j0bGD0uij6t
        kGt/kJV+t2ahMj+e7X//R+4fxw6o2e12iOWX
X-Google-Smtp-Source: AMsMyM7tA0XW4v5SToFTS92Ia64U7XEvhJ2pV2o2X1l42GgkeRZpOXOVYSgCAoofODCrAMzUqPf4XA==
X-Received: by 2002:a2e:8743:0:b0:277:10a8:3e8f with SMTP id q3-20020a2e8743000000b0027710a83e8fmr717491ljj.423.1666618503109;
        Mon, 24 Oct 2022 06:35:03 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020a05651c204900b002770f0a742bsm308578ljo.41.2022.10.24.06.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:35:02 -0700 (PDT)
Message-ID: <a42527fa-f34e-3c4e-7b34-2963c4675668@linaro.org>
Date:   Mon, 24 Oct 2022 16:35:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 12/13] phy: qcom-qmp-usb: restructure PHY creation
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
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-13-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-13-johan+linaro@kernel.org>
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

On 24/10/2022 13:06, Johan Hovold wrote:
> In preparation for supporting devicetree bindings which do not use a
> child node, move the PHY creation to probe() proper and parse the serdes
> and dp_com resources in what is now the legacy devicetree helper.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 46 ++++++++++++-------------
>   1 file changed, 22 insertions(+), 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

