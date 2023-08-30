Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0188B78E32B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 01:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344402AbjH3XWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 19:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239154AbjH3XWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 19:22:53 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8EE9C
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 16:22:47 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99cdb0fd093so16900466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 16:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693437765; x=1694042565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qx5DJCNgJ8zJ230zq1kmkZEmDWRvp7rGzLqeHmcD04Y=;
        b=T3Hfx8qB0Jzo/ZeelPkVAd/nXvhxf8F+spJFSwg6pfR317FB2sZxtdCpQYZpd42f0w
         PLi2xYS/2x0lMKgbPBNTiBUD8YHzq9emtH9Hz9NpmDLba70lvIvIhCPtOwwbEF6w2+gX
         iEpnh2jSqRs3hOGBY39W+WmGugjbO+fvobgwvnI7TivKQ9neDfnKwJvR+ZWNl42Vga9a
         3wUy8rL2FxrTp+MvyJB8xn+A9k7J/z37v1EnTMtOphVduz3IR0rpNiuEZyy5ZRcbeDep
         rrv9aDSZe13Bkv3j7t2/TdP8Gi28HhgQ36JTL8R/MqeJziRyh8+EJRTIkzX3wAd4CXhJ
         7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693437765; x=1694042565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qx5DJCNgJ8zJ230zq1kmkZEmDWRvp7rGzLqeHmcD04Y=;
        b=hCO+oGMYIBDWWCLjlJCHLhzGeiksRFxax+dJDK7FFaCHMGe9diVDobgisf2lSRp+wr
         2oJHuirhzSTQNDWN6hQAYSaiO8rFmu9SPe2lTDm4pRp5uagJEqjDyz32GKfQjHcfLRJQ
         +IRBYpGdrNFv8ND4YgH8CCeZElG1Dy5hWOtNXcIrfqnoWpRPrxhR/KrUSdDiMvIfBEIw
         CkyzMUYyyz40infG851ekuIKBfShh0k/neHbThJm+3wx547igN7wHvkg8cj4gb8D9lAB
         6s/KMJs+/dbfT0KETYv/H2uH/Sfs/pCQiR1QraQ8NG0AfT7nyRN2ybsrpTwrr+TeIYW6
         6IPA==
X-Gm-Message-State: AOJu0YwojsX/lE6rfOBkCm3B1taph2uzzV+5jl7mHO6YaXmrUdy5n0b8
        yx90u4Zaom9JPCyOMkv3ezKgU2y0QUneLzEQcmk=
X-Google-Smtp-Source: AGHT+IFXNZcyo4pUIk1PPXndLXO1UNfBpn1JrGCeRhJIxONMleDn656s7prFtG+aetDALvFjZFL6tw==
X-Received: by 2002:adf:e6ce:0:b0:319:74d5:a2d7 with SMTP id y14-20020adfe6ce000000b0031974d5a2d7mr2636773wrm.32.1693420543899;
        Wed, 30 Aug 2023 11:35:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b4-20020adff244000000b0031423a8f4f7sm17337600wrp.56.2023.08.30.11.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 11:35:43 -0700 (PDT)
Message-ID: <e0a4ba7d-7cc0-2b51-994f-9f48284dcf02@linaro.org>
Date:   Wed, 30 Aug 2023 19:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/10] media: qcom: camss: Bugfix series
Content-Language: en-US
To:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2023 16:16, Bryan O'Donoghue wrote:
> V3:
> - Adds Reviewed-by where indicated - Laurent
> - Adds a new patch for genpd cleanup. TBH I completely missed this so thanks ! - Laurent
> - "media: qcom: camss: Fix V4L2 async notifier error path" stays the same fixes spalt in -next
>    Fixes: 51397a4ec75d ("media: qcom: Initialise V4L2 async notifier later")
> - I like the suggesting of using a common fix for vfe-17x and vfe-480 however, I believe
>    we need to support multiple write-master/RDI => VCs in 17x which currently we only do
>    in vfe-480 so sharing the code between the two here right now, is	n't possible.
> - Included other suggestions on vfe-17x and vfe-480 - Laurent
> - I didn't change the val |= 1 << CSI2_RX_CFG1_VC_MODE to BIT(2)
>    The reason for that is all of the code uses this odd bit-shifting and I'd rather do
>    the conversion from shifting to BIT(x) as a distinct series instead of piecemeal - bod

Pardon me I forgot to add a link to a tree for this series

Link: 
https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/c13bb323d4f081d634dca3a9f3f56fbee370e8f4

---
bod

