Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F7B78EFF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 17:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjHaPLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Aug 2023 11:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241589AbjHaPLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Aug 2023 11:11:14 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760E2E4F
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Aug 2023 08:11:09 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so17850431fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Aug 2023 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693494668; x=1694099468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOFcgWJvykU3ufqPjMeqWWJXmE/XqPoeHSC5WspwBo8=;
        b=sTbdHp2zDtjcLXvz+flCdxxtgBkfcYgwV4O45gYt3bGT9Tzhm6ObfsjJUqYNuz5xbh
         1zzyLqWk3bnyTfOeZj+m0ejb+8Ij2mEfZop6SgMiMlNYYFALrSOM/ZG/UzhGvTxv9CUv
         I6mkuUDKIGjrGVOni5LteaoRUCX/3jArWgxbcfG8+J50yVrds6WgGgdqieleHt58EGI5
         R5Phygxi27e06MTTyYLnYwyoCPyD4fPF1MrhiwLBN2XRk9ELDacxeiJ501MmiaHLobql
         1T+14S2W8ZHO9hxxg2bCjaS+0JuUBYq1jT6I+uS6EiWZq/7xbOtyKekdIZsD73iC95DQ
         wq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693494668; x=1694099468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOFcgWJvykU3ufqPjMeqWWJXmE/XqPoeHSC5WspwBo8=;
        b=bGmLIYxR2kGNpDzDkKX9uWpqByhTS/uBy1L7zKDfU3A2MY04kAjN3E1A0nBcZNsjR7
         YOdQ+295Q6CPqpU3XijRlHB8HzMeFLF5AmfsBEo1/Im+JR+wWZxFTiCYyuDwWzyX2cGI
         LkEgQ16olERbmVgN4l07NGye8BlSQ+KzCSkTC+K9Su6uqx0K3AhPKpULzsULxoV+qVvK
         zvZQmyYGiy/esVuLILtv4z2UCqX937FVRcIg2oPNQZ7ozs8zAZOz2ZZ49bZHkdw1ctIW
         kX+cJ1ISMVtrYOAax4Pvs9ijvEbeStn4rppTlcdQmCfiJGmSVzqInkj3z4XoR7256Sn8
         ystw==
X-Gm-Message-State: AOJu0Yx0ctHI1zVmgUX0o2NrwEcBZcHfxiuOp3fgvyOMKghILd/xJ/is
        H4AdjJh5GnMnIoMW3LplWDpFU9jkB/rx/3KeGN5ZFA==
X-Google-Smtp-Source: AGHT+IG3/w4gj2xbUPTCxyRSzFHoeJLeFZiW2uiiFnMe/1mHL0wORIqiK41cZCBiiOqL4QB/7ON/5A==
X-Received: by 2002:a2e:3515:0:b0:2b9:f2e8:363 with SMTP id z21-20020a2e3515000000b002b9f2e80363mr4195887ljz.51.1693494667500;
        Thu, 31 Aug 2023 08:11:07 -0700 (PDT)
Received: from [192.168.1.101] (abxh58.neoplus.adsl.tpnet.pl. [83.9.1.58])
        by smtp.gmail.com with ESMTPSA id r11-20020a2eb60b000000b002b9cc2f5c39sm356202ljn.37.2023.08.31.08.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 08:11:07 -0700 (PDT)
Message-ID: <4c6877c9-97ad-4092-86a3-f9b314f131ef@linaro.org>
Date:   Thu, 31 Aug 2023 17:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: qualcomm: phy-qcom-eusb2-repeater: Zero out
 untouched tuning regs
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230830-topic-eusb2_override-v1-0-ab23825385a8@linaro.org>
 <20230830-topic-eusb2_override-v1-3-ab23825385a8@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230830-topic-eusb2_override-v1-3-ab23825385a8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.08.2023 04:40, Konrad Dybcio wrote:
> The vendor kernel zeroes out all tuning data outside the init sequence
> as part of initialization. Follow suit to avoid UB.
This patch doesn't do what it says. It passes 0x0 as val and mask
to regmap_update_bits resulting in a NOP, still..

Konrad
