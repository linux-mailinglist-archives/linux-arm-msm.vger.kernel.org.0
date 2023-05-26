Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D96712A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 17:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243606AbjEZP5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 11:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244004AbjEZP5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 11:57:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2398EF7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 08:57:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30a892c45c4so558221f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685116655; x=1687708655;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOSdHbR4Wu88gf7m1ZCJ5+Wng1YTJWHsPTDZi1tytEc=;
        b=iZkGp3rzWyMeUUblP834O+UQ2YuoWf08u41UqDcS4Npz1dqcp1O/ImUgSLOxQcl/fc
         UIWUsLhdRfav36oQ5CxIjNlaxUG2bCO0GxRPFWB4RGK+Qx/EVgMywpN7GBsa5ip2Kpx/
         tGwc5QvVcRx5poX6nrgiiZ9HdKVC5vABK0y+ZKMbJgxce+ulQQZW58SbR+UIZrHuyXNc
         hDHZxw4ICeSseGYaKBzAW3fduWCqZv2H7GwlT5YoF56Jwo3BT5f8ollDNt8pWGMQqMpy
         pj/z1mgCX5HF4HwpNr48W8SGHlSoqgWEdNEulXC+JjA3mDB4Q68SbVIYsCT1ujWI7wSE
         aDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116655; x=1687708655;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOSdHbR4Wu88gf7m1ZCJ5+Wng1YTJWHsPTDZi1tytEc=;
        b=c/NZYc47Rksis+/CALpRF+OQwE2meh2FrRVALmXFDEW6h+RHr6qglPUqXyHg9jjvEu
         zMXKE539mJlQVbPPeLyz518HDLONd0OXU5qz1d8t9es2nf9vdE/IL12ZU/ZXvjhXzBz5
         wdLtMertbZSt4EjZI2zxUs09G6Bv7k5gxZwLO91NcrpK/unU+SlQg186S2O3oHxGFukO
         BygcJRshFewbRuY2ludKu26rn04+YfZFs2X1yCIxDYqaFMGyH+FQ+3aINZWSYpLmln/+
         WZSqLcL7xHgaY6QXPQRLScL3EJjWE5D+1tN1h8pqj3sNCmChUSZHPmwh2esCxGfbPAjC
         nKDw==
X-Gm-Message-State: AC+VfDzhOtmXF6TUui3MnnDieQqGhYglcesBm5srdybix+JnvcUEnTPr
        n/iGkpcd2q49H15NwWOt+UUnAw==
X-Google-Smtp-Source: ACHHUZ4clmY49xiyKRDx/JFGL5Nn1+FPQLmtPlJxv0UmteciiyDR3G7oPw+szDGZaNj9kvtAynEOUw==
X-Received: by 2002:a05:6000:1950:b0:2d1:3eb9:c3c2 with SMTP id e16-20020a056000195000b002d13eb9c3c2mr1872627wry.54.1685116655645;
        Fri, 26 May 2023 08:57:35 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b002cea9d931e6sm5465424wrs.78.2023.05.26.08.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:57:35 -0700 (PDT)
Message-ID: <58310306-2d70-eab4-4564-e77e1fb638a1@linaro.org>
Date:   Fri, 26 May 2023 16:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L
 configuration for EVO PLL
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230525172142.9039-1-quic_jkona@quicinc.com>
 <20230525172142.9039-4-quic_jkona@quicinc.com>
 <240fa683-afb1-eb60-c24f-2b3f1d7f1339@linaro.org>
In-Reply-To: <240fa683-afb1-eb60-c24f-2b3f1d7f1339@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2023 16:54, Bryan O'Donoghue wrote:
> On 25/05/2023 18:21, Jagadeesh Kona wrote:
>> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL 
>> configuration interfaces")
> 
> Is this a "Fixes" without the previous patch to stuff the CAL_L_VAL and 
> VAL_L fields ?
> 
> [PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L 
> configuration for EVO PLL
> 
> Surely you need _both_ with this patch depending on the previous, per 
> your comment ?
> 
> -    .l = 0x3e,
> +    /* .l includes CAL_L_VAL, L_VAL fields */
> +    .l = 0x0044003e,
> 
> ---
> bod

i.e. if you pick up this patch on its own you won't populate 
CAL_L_VAL... right ?

It would make more sense to squash the two patches.

---
bod
