Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B4A5B1AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 13:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiIHLIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 07:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiIHLII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 07:08:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE58AC6FD3
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 04:08:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s15so19460269ljp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nl/gX4imOToZho5UFDxzEpyUWNGOIGDYdp1e4bXjgB4=;
        b=j4lsWoDPctiBxd4wxmRuYGfMFJUNfe6PRsJpgILjez06ENaILpJhI0wLm4tSj63ChR
         bn8gyjis9Ciho+TYSJQXe2wUPMtVdJfD8Ml1WXBz/oGvhv+A3BE6U9xT23Deze2FeuSM
         aijopf1+NZPC+3ITBTtV6ovL9q1psr0hV/POn30nqhXjWbnRfnuvXEoxJaiDGoOx5FSp
         DTKWwvcNO8r95D55qJF++4jWV5OeP8ne/6BQto18dLkiQza9+Ec08uxjjVzhUfgXj9De
         8sDhZzDvmgQTHxpeK/0mi9VtAazViATWUiPMdDyQYWjlFRUntnuRxmLoqmtgfolfO5uv
         8/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nl/gX4imOToZho5UFDxzEpyUWNGOIGDYdp1e4bXjgB4=;
        b=Y/H+ydeMJ3gDMDfxlQxPmSoKgI1AJuCOc+GDkJS0yfZhiudgmM2pp4Tp3NtCpeJ/p1
         5bsi1sZmm+Buksl3BE1oIXw0hb5/ZMHrGwV1T/MQlH/Mpi9kxaxbxjssK50z3bU4Wn+n
         7/dGcIIRs9D2j3OwpvvPoTCgjZsHSheTQmDB4fmd7GR+2wmWGZaReAvWyTstEfIQZRtX
         oBC5v2AKglkglvAymJ5HWRoJjrKCq4VRH8P+HKfmB16A2Z3nwh/noR7mJ3ymymnazgoq
         Dgbds0xY3UpWDuFcI0Sro26MRj5D52j37dl9uyVwg5MPM9YH6lGiEGzHpGM5DNYePWau
         lUVg==
X-Gm-Message-State: ACgBeo2lVrhfCAzfTux9tBuiIc2TMzTKQwCPDsqNlwu5EvAIMS9QLoAz
        xTDecttL1200y8adNnM2IM+0SQ==
X-Google-Smtp-Source: AA6agR6a67h3FkF7g5VWCRuxJI82Pbb2Odo+CPi7d5MSQ24A3s8wKjqKWAGxCHM/STfol0ZZgMU3wQ==
X-Received: by 2002:a2e:9b91:0:b0:26a:ce59:c517 with SMTP id z17-20020a2e9b91000000b0026ace59c517mr2037370lji.181.1662635284068;
        Thu, 08 Sep 2022 04:08:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n27-20020a05651203fb00b0049488c97d39sm2985477lfq.212.2022.09.08.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:08:03 -0700 (PDT)
Message-ID: <ba44cf8a-a4d4-3f8e-91ab-43002b73c312@linaro.org>
Date:   Thu, 8 Sep 2022 13:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sdm845: use device tree match data
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tdas@codeaurora.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, caleb@connolly.tech,
        jo@jsfamily.in
References: <20220907223927.139858-1-mailingradian@gmail.com>
 <20220907223927.139858-3-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907223927.139858-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 00:39, Richard Acayan wrote:
> This driver will support more than one SoC's set of clocks, and set of
> GDSCs. This behavior would be unclean with hard-coded static variables.
> Support it by grabbing clocks, GDSCs, and BCRs in the match data.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
