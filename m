Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B8C7D80A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 12:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjJZKYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 06:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbjJZKX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 06:23:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E966E12A
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 03:23:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso12034451fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698315834; x=1698920634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpHNzaNnGzJDoenjeZleAPUoWRMrdSrD5ESAN+FMcak=;
        b=h0GqJ5t6G265X/OozvIU21IJ8uTrDAyra/VYnuEzDKcEcHp94Re4lFxpPZcgmLYvkb
         xx3CRetqZpJS+mcXvRU0xaNoq9HlUYfhhbgTvy2Nk1WeCGbM92J9VFPwbIg4Gn/Sil91
         USaynIOC0esqMyTu2hXmN2Z9FZAdBQxELiqsO4lHRHRbnzgRReeRPJbXxALNzD5r/eHx
         uGTp/1We3WQvOKy6sOcRuLHuw82kXkT2WWqTXv+/+tXpQW+uCs5baEVHfoCioEUEW8ED
         8qICfT1gXBPbndTWzrq+/91PaGOF9LJXPPey0KBcql6JgJH6DVZWOE11iXLP9Lzpvh/v
         +lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698315834; x=1698920634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpHNzaNnGzJDoenjeZleAPUoWRMrdSrD5ESAN+FMcak=;
        b=F2eiNG4WHdjGZ3K8/NyAhCZHY6iC5xsKaL/+E0gHYdS+mEXPCM4zdJNE1YQksGipOC
         5V1XD/UeMdmQ6a0HY70QgFV5z9YGr8NEXIsAcwsRutG03aJRYNpXIhh6D19Y4OUnxIjy
         h1vb7g0bxQJcR8J5kEsApPhsJWyPAE0GxYTblIvbizXaF2p+RdkGvl1zwsBa1XGhrbyB
         1881fRVgxNax3SQ7wWsmzJkUkkYOP9wHkIFz3QNTNtxmnFmzZTWCRYKbDpoEqjG9mhHg
         1LV0y9G7qcA+ki/FHwWy180wXBxQBhC1nb33DcbvyHIzwY5Xnr310oXyWeLMeN8cyIBM
         irhw==
X-Gm-Message-State: AOJu0YyJK3LVvC/V08V6E5osjKCPbIFkOF9ui35UTU/+yyoR++kWcvtG
        qm4AoXdCYuwCDeM1gJ/Y8siq2Q==
X-Google-Smtp-Source: AGHT+IG9JqVY+mqg7HhWv7eQKI5L9L3KgreCiYej72sPk6Eo+gOn4P650gnDL2YAR2JzVL0gO+OR9g==
X-Received: by 2002:ac2:550b:0:b0:507:a86d:89bb with SMTP id j11-20020ac2550b000000b00507a86d89bbmr12135845lfk.23.1698315834022;
        Thu, 26 Oct 2023 03:23:54 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 14-20020ac25f4e000000b005068d6de988sm2940995lfz.226.2023.10.26.03.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 03:23:53 -0700 (PDT)
Message-ID: <b165d2cd-e8da-4f6d-9ecf-14df2b803614@linaro.org>
Date:   Thu, 26 Oct 2023 12:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: cpus: Add qcom,oryon compatible
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        catalin.marinas@arm.com, ulf.hansson@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com,
        j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
        lpieralisi@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
References: <20231025142427.2661-1-quic_sibis@quicinc.com>
 <20231025142427.2661-2-quic_sibis@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025142427.2661-2-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 16:24, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> These are the CPU cores in Qualcomm's SC8380XP SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
There was an off-list discussion, not sure if it reached you in the
end, but this won't fly. I was told there are at least two separate
core types (discernable by a different MIDR_EL1[PART_NUM] [1]), all
of which should have their own compatible, otherwise we will introduce
something as meaningless as qcom,kryo before - we want more
granularity, like arm,cortex-x1 or arm,cortex-a78 are separate.


[1] https://developer.arm.com/documentation/ddi0601/2023-09/AArch64-Registers/MIDR-EL1--Main-ID-Register

Konrad
