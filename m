Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFDE1665945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjAKKpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238542AbjAKKpA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:45:00 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F822718
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:44:58 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E0F116602D91;
        Wed, 11 Jan 2023 10:44:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673433897;
        bh=WskYTWI7lWES23Pmas9JEiHG2wrjhjTKjlsjMummKE0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LX3GlsrU0lHg4XfGepuBQbPB+9rL66pjJxqjog+shuZzbhRuZfTmBHfpBNS5oABY/
         7Ols9GI8BJ43S43YRIgxvNdBbpMSZsXjlx2jTSPSI948smLY5DkwVGGpMKlB2Jx9oB
         4rfpd+lRUYSWXb6+Xa7W6yCTVFyiIrDQzNhag1YdcC6fX6Vc95UIPFOly9ZoSx9Y/Z
         HY9oTRs62RPJkqVN3hO6Y2Tnuvt9BiKOJ4bxclqZJ1+ysAW0dbo6deN6EV35cA6e0F
         miS4MejiFbJqi8N0u191on4xv6vrfne6PZ/v8sdhhCMEuWtxVmkULKPHEw+YQvEl2S
         O80gFiI2IjjpQ==
Message-ID: <26aa4f87-31c3-ec09-bb29-4abf16ab3019@collabora.com>
Date:   Wed, 11 Jan 2023 11:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 0/5] Add support for Core Power Reduction v3, v4 and
 Hardened
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 10/01/23 18:56, Konrad Dybcio ha scritto:
> Changes in v8:
> - Overtake this series from AGdR

Hi Konrad,
thanks for taking care of this series - I didn't really have time to perform more
work on it, so I really appreciate you stepping in.

> - Apply all review comments from v7 except Vladimir's request to
>    not create the include/ header; it will be strictly necessary for
>    OSM-aware cpufreq_hw programming, which this series was more or
>    less created just for..
> - Drop QCS404 dtsi change, account for not breaking backwards compat
>    in [3/5]
> - Add type phandle type reference to acc-syscon in [1/5]
> - Update AGdR's email addresses for maintainer entries
> - Add [2/5] to make dt_binding_check happy
> - Separate the CPRh DT addition from cpufreq_hw addition, sort and
>    properly indent new nodes
> - Drop CPR yaml conversion, that happened in meantime
> - Reorder the patches to make a bit more sense
> - Tested again on MSM8998 Xperia XZ Premium (Maple)
> - I take no responsibility for AGdR's cheeky jokes, only the code!

I can take full responsibility for any cheeky jokes :-)

Cheers,
Angelo

