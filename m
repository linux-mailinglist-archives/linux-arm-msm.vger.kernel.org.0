Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89AB8604921
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 16:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbiJSOWm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 10:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbiJSOWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 10:22:25 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9152F028
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:05:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g1so28262962lfu.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5+gyODwoHFKNypGT6uh/ysXTrRRHFbyILu1kotDzM4=;
        b=ZZrpWJr0JokM3BK2PpwWz7MaqS/A7K1EC66XS8ZizSz4zzmpa+PCvXIKtltBzs/reZ
         sVxov/MPI1hg5hu1I4N3B7mre2Ac8Q65gCcYCGT1pjRRu6G/5ULnx1msljvsp4+Ui4Va
         ZVumpBC5+ZAtg7DpovO1Xs7RCRcOqeiqxmPcYyZ8QhxOPZRmH8N99FG3CiaHbdyc/SkX
         ENnedz5T0tuARHVKT4qND9XHLrMMVz5tWH1u+WMU4PmQn2oWZT9AkgcMSZvPRbR9VQtq
         44rvFZk4AlKfaijtdvuEfVmcMJm21smZqNUbFbmDOisSk33aNfDbqzvOQyLVfEgwLSmK
         aZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5+gyODwoHFKNypGT6uh/ysXTrRRHFbyILu1kotDzM4=;
        b=N1lsIvon1XfgRp9tz6PVjJOQb5Dv/2qLGyNT9EarArzhYiyMRiLsDQk8gj4zVjZeW5
         0DzIHIuI6X+XUbvD8zTkJpskncilwoGaVeKpr3Zj4C5YnC+tIIFhSbOG41pAaCcurTml
         okUKJCUhnZleuDXlrY81A5B1XRjnzb560ywC5KmXvKFHU03NQVXp1MnWeIHYGmJNtcJq
         kz0OM8z69GEpdZVMt+YtjJCRnXhym8xxbmDaUN1xKWGtbNehi0GhA7ZxZmOTboyf+FcJ
         WFmmtZl6MauKAKcAgDvyJ5VtGUdwToIL3+ZNUTwG+ho/FhYFKJmN3C27kjPYK/zvKOus
         xLtQ==
X-Gm-Message-State: ACrzQf3r+2JiRct9T1Qhxz+1zL3AR9yfA6tGAW3T3KsIojqeCmK98paL
        p3lbE5mBha+J2Q+CJ6jYt8PakZOReBg7sg==
X-Google-Smtp-Source: AMsMyM6Wz4e6pH5YTXalvM3jqNkmWpZ+07QEhZ29oRNNSkpxIXajymXLgZHoHSMNHYwLDMt5DvO4bQ==
X-Received: by 2002:a2e:a602:0:b0:264:5132:f59 with SMTP id v2-20020a2ea602000000b0026451320f59mr3065213ljp.0.1666187513443;
        Wed, 19 Oct 2022 06:51:53 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l29-20020ac2555d000000b00498fd423cc3sm2288264lfk.295.2022.10.19.06.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 06:51:53 -0700 (PDT)
Message-ID: <22640161-0b28-d91c-5af8-ca9fa36954f1@linaro.org>
Date:   Wed, 19 Oct 2022 16:51:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 12/15] phy: qcom-qmp-pcie: fix initialisation reset
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
References: <20221019113552.22353-1-johan+linaro@kernel.org>
 <20221019113552.22353-13-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221019113552.22353-13-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/10/2022 14:35, Johan Hovold wrote:
> Add the missing delay after asserting reset. This is specifically needed
> for the reset to have any effect on SC8280XP.
> 
> The vendor driver uses a 1 ms delay, but that seems a bit excessive.
> Instead use a 200 us delay which appears to be more than enough and also
> matches the UFS reset delay added by commit 870b1279c7a0 ("scsi:
> ufs-qcom: Add reset control support for host controller").
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

