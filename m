Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C71A5B3513
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiIIKWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiIIKWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:22:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3646A2236
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:22:42 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z25so1928709lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hFwC0LzTCzxgDbKrtB3n4gX8c2ZFjHdWwADeZvJUcTE=;
        b=vQDUEtsMJuwtSahkY9XhJLyBtT8peYu+jywzO+YFmKPQmhLyVapSLSmhak4cxVALms
         1+akpunGrJm3qLc0uAVM8u+UUVdpXLbYsFrN8tutn9DS6e7XmmAsf9mjL7/WUwywDalz
         I6tL4QAtK/7V9vQzrDmtlppXfvYETYbo5NdMhMyWEMf3KZ9TufK/JN0iXm0HAfou5NFY
         smi39JmcTg2P7db9SzSdTN1oUQDb+ijsZ9JuUo2QsT0IDmKPEO/tPdO8K6l+MDWRS3uE
         J4mj3GrIVatt36hnpHMuP5bYhZycn/YO9yUuiP5z6OuuJjfQD1hmNhdRobIzgQ/AtdP5
         5WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hFwC0LzTCzxgDbKrtB3n4gX8c2ZFjHdWwADeZvJUcTE=;
        b=jzfPWmvV+hEKbgHpMhYKf/Xgbe6ZMyoZ9btTkOpNU+//RdmvpUj6sjFVQnBxy9J6EE
         eS9VgKndNXcBljBg2JRdSlLZD+ouwYWEG15mIi3hvkTXBTPWigP0eMINNEPbhQ2opxp3
         gk3VmL/Ntb+VrU05pc5DoWFhIJ8u6u8UqM5AENtxtITLGW5bFSluXkXHV/fyMRjD3wpL
         n0H6nlCZ/ekHmsKCLnQstc8+kvElF62Y/cDzgtIpbOdSLM4aylXkgeNVDVypZqr88zcx
         bCIJwcQ1tkd2xsePAfZy/2JXOi4qz/o6S128x/k2y8+amfU5KXnX1yqWX0AnSbTzzVFw
         C7mg==
X-Gm-Message-State: ACgBeo1nlCkaYiJL4H1HVffNpGU5OQwaCBMc4hHHMzvOPXgzfreSComw
        TzQiT83S7qkudud86ziKzPkBjA==
X-Google-Smtp-Source: AA6agR4YkjdmTN55cEBvfhAJnG9I3czjJ3mbl7ljMQEjMtU+b+F0fiGAXZCvP+hpnO3J1jwpGqqW5g==
X-Received: by 2002:a05:6512:23a9:b0:498:fc07:4ee6 with SMTP id c41-20020a05651223a900b00498fc074ee6mr523209lfv.344.1662718961127;
        Fri, 09 Sep 2022 03:22:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w23-20020ac24437000000b004947555dbc2sm27241lfl.100.2022.09.09.03.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 03:22:40 -0700 (PDT)
Message-ID: <013f2dd7-c15f-5b0e-c98a-595dd4d5a2c5@linaro.org>
Date:   Fri, 9 Sep 2022 13:22:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the
 driver
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 13:03, Dmitry Baryshkov wrote:
> This patch series depends on patches 1-5 from [1].
> 
> Path 1 is slightly fixed version of patch 6 from the mentioned
> patch series (fixed to use parent_hws where applicable). The rest is
> minor cleanup of the driver.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/
> 

Gracious ping. Yassing, Bjorn, Konrad?

> 
> Dmitry Baryshkov (5):
>    clk: qcom: cpu-8996: switch to devm_clk_notifier_register
>    clk: qcom: cpu-8996: declare ACD clocks
>    clk: qcom: cpu-8996: move ACD logic to
>      clk_cpu_8996_pmux_determine_rate
>    clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
>    clk: qcom: cpu-8996: use constant mask for pmux
> 
> Yassine Oudjana (1):
>    clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
> 
>   drivers/clk/qcom/clk-cpu-8996.c | 191 +++++++++++++++++---------------
>   1 file changed, 100 insertions(+), 91 deletions(-)
> 
> 
> base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
> prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
> prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
> prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
> prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
> prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9

-- 
With best wishes
Dmitry

