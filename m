Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3C85EE60B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 21:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbiI1TxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 15:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234034AbiI1TxU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 15:53:20 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3A67E30F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:53:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a8so21907112lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bXUCw3zJ8ZYfuv5F/h/y3vQdTBrhHcccT5yw9HbuDDM=;
        b=zW8ptox2gw1JG0tpwrsRDbW9oE1Cy4h8JzHBQFsnDk0EUe6Olm85A82ihdWeGLNhiR
         lVlCYbeSIhB5Kd0gzfqBYanJE2OW2/URExlq17eU6H4IthjYWzYL65VZvcFlDWfWio0z
         KgUhUxnmnEphrctTDeR5BrkPcU4OEnqbLicmrnMdK8RxxPSZLZUlKRoHEeMfw6sJ+ty7
         pSP2th3oIzPFIbks2eHHxT2Uz5i1RgeDeFUq5CgvRWecEezLv8cHKFMf04r5IojdLqLN
         f342SL+w7sPAPXfylnJl43Paf7s1lOhsg7ujLzVdoP4X+GBByYbV6y4MAQwW5PrC+zKW
         iEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bXUCw3zJ8ZYfuv5F/h/y3vQdTBrhHcccT5yw9HbuDDM=;
        b=7sQbi1OBuVwCNXeC2w+PJkYF5tx/r/ccKb9ZMoSk1HhTh7lYcbI6oyfZGxQRsIluVt
         OuUKQ+qgLQiRyXUgX6+RzWyDqNfwzLVpWLk+23mLwez7zoGOw3EWtYKjcuo0nIuLZJZT
         F0u8JEnHR1FwJQJMLLil/2XPhGuUiNGzEAW+SaHvZ9n+IqC3nreg39cEyBT42QnGcclU
         LTBcThz8t7rw1W4fzYdoAEXfQaQ56AoUw+qhPVlN3Ggd3IkbPjJ1y4M3dnB5kGK3kPYW
         gzezMIOU7fIiLQo+0FTu8AH8LQ68vWhlCv/7xkXXl+kRyMcUrEmihW4UJSCXIxP8hizN
         Mslw==
X-Gm-Message-State: ACrzQf3oqShqiO6yB/iNc3NhkumtXlpVouamce3sXK7mJqfJ4k4XWn0k
        Qwr6/pVDGkAbGR6T+W6lS23YSj6Y2cXFQw==
X-Google-Smtp-Source: AMsMyM7y2lLKg3TRBlhfRTK/b5eZCxHr+aDsfu8PvRB3IrTIdz2vt+TmC4V7fWWyaVdXPOdF7CfYdA==
X-Received: by 2002:a05:6512:33c1:b0:48b:2ef6:f510 with SMTP id d1-20020a05651233c100b0048b2ef6f510mr15197286lfg.237.1664394799025;
        Wed, 28 Sep 2022 12:53:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j23-20020a2e8517000000b0025dfd2f66d6sm522884lji.95.2022.09.28.12.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 12:53:18 -0700 (PDT)
Message-ID: <563c360a-4edf-4642-4805-1df0ff31075a@linaro.org>
Date:   Wed, 28 Sep 2022 22:53:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 10/13] phy: qcom-qmp-combo: clean up power-down handling
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220928152822.30687-1-johan+linaro@kernel.org>
 <20220928152822.30687-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220928152822.30687-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 18:28, Johan Hovold wrote:
> Always define the POWER_DOWN_CONTROL register instead of falling back to
> the v2 (and v3) offset during power on and power off.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

