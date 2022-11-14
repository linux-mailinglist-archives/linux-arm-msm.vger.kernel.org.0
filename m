Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77621627A3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235456AbiKNKPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236293AbiKNKOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:14:32 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A9418355
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:13:30 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g7so18467518lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6cAfN8IG06N0cwb67XCQdfKg4B9Lyyex8HG2tereAM=;
        b=zUdSP0JeT13WiKx8Gt3/nM7r+KddIq3jWJoIrhUubjdl9m8mjTGrrl9c/ZbWjJdUFl
         px/4+SP6kkapuAYvY4addiAOIBnFkKNkd+wHVnnScs8FUba3RAlHI9nY6jYRWfS3YLmF
         GkzxRQKK+JJndGMQz8Vf+Hwcg6JcRM7rwaVo7IyNsUsJVeYRzw+Rjpgfk30buiJCBCAL
         7WeZ3CLEiqmsCfeAc6R4bzQhk1VD8gH7NQr1kg1h14/4FifheymJys8eI0hBBdXXpcKH
         i3Fw3NTai5YkWBFBLpUB+poIzU4o9PE5ETnMO9aDcVdjY9J3+bq3cYcleWFnEvMPttLm
         q76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6cAfN8IG06N0cwb67XCQdfKg4B9Lyyex8HG2tereAM=;
        b=2jOfwmWLwmfpKoiraTEx7eVq3kvQ7P4BvwhTpIldUDnhB78zxsqewTdEPA6Sqs6/fs
         hqm1bsrrf5GCa+hYZhhEGmw9JQ+oybuZLWD7e4XO24ZaSkltcrElpOEHYbm+ThATW0Iw
         z0OQBudG8fi7JzQxk3hZCpq+rdKlxgm0iG4mxANJUBhMM2uiukL+LhzotXwPwGBRSyGu
         XtCzq3INCscLvCjnfBFK7uJDa+scAANGqpZk7cW+9JuVbfgylgUL8u3xe/ZaqA7cl8ZE
         zJsX6Eq7382I+XNVM5XXhoxvDTK/TiQ45Q9h31AK/kn71pL5DH6OvF+09qoCBDhdEqtI
         xWKA==
X-Gm-Message-State: ANoB5pmzzLSIPymZ8QBgJkJXI9Vmj8EWD64p6pFwrnTuF70KYP7NVubK
        0pyuIg4OHAcKL2OHsw0yztJ9Fw==
X-Google-Smtp-Source: AA0mqf4Tuz7F6m9w8PcHB2AgdPxXncbTYHFe+4wzy5B9+QdsCr/y8SUDDdaTlgeazkYU2a44SCfYBQ==
X-Received: by 2002:a19:655b:0:b0:4a2:483a:bb59 with SMTP id c27-20020a19655b000000b004a2483abb59mr3705886lfj.523.1668420808932;
        Mon, 14 Nov 2022 02:13:28 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n5-20020a056512388500b00492ea54beeasm1763991lft.306.2022.11.14.02.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:13:28 -0800 (PST)
Message-ID: <8e4d42e1-b0c6-abbd-0fc4-7a88b387cfd2@linaro.org>
Date:   Mon, 14 Nov 2022 13:13:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 10/14] phy: qcom-qmp-combo: separate clock and provider
 registration
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111092457.10546-11-johan+linaro@kernel.org>
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

On 11/11/2022 12:24, Johan Hovold wrote:
> In preparation for supporting devicetree bindings which do not use child
> nodes, separate clock registration from clock-provider registration.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 +++++++++++------------
>   1 file changed, 20 insertions(+), 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

