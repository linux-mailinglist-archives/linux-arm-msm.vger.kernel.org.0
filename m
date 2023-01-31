Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2D9682855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 10:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjAaJMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 04:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbjAaJLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 04:11:54 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB432D50
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:09:12 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mc11so17110226ejb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGNaPzK2U8OjqkkgKKeaGWvj7mZwtAIyACD8dta243o=;
        b=rJPinPrF35Ty3MrB0Wz4vPjo2Pj0WQN7bRyZ5VyYVD23whtHdYi8534sy4YjeNUAMN
         q07x31vQeWM5sQV/eRetfxA/Gd3ESUJN3OlQZzIQWeqD3BFMZOdhpL4rYb7wlWVD52b+
         N8fTTZNhisnrKRSel7heeR2UceBPd7Nc72JRi/k6iwoG3uTijiaIRLGEa+XZYM67dmd4
         DdXz6DrdUovOoO5auzk6k346RkdvWEbvJfm81bF84H/5Ckl578Epe4GhkcR4BmShGh2f
         CgSAgZVMT6gmxC/+ZMHabfT9xbo0B9+h2nJpFXwoWXlJBoRgVFFU3pRC0sAv/T1trVtm
         q0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGNaPzK2U8OjqkkgKKeaGWvj7mZwtAIyACD8dta243o=;
        b=v+85jZYlr6sOTovotF/TUTSj4ELHlWfTNVBHXsSoiqkjzrm/vILecgDpqiswF/vVq4
         yV/x8AmviVg2xZb5f1/K0QKH0o+WeWPQG2zOo5YYkpU1zMtAf5v85zZ6IqZ/7MfraNZY
         865Olnw2Bh94IyEVcFBba6jvgszBjdrmX1a5BJiPw9avoZtYgdXNTyuf/H212hDpnKtQ
         wQ9Bts8Ub5EnJaMeDWNgguaVZVTf43+nY0k4oGAVyFDn/iwcikQM8PEQwmPK1URlSybJ
         UeyvFais5bJ7r96Dm8bjHrLBdLAu30TIsCXE7HKXvWARTjBsQsqBPOXjPaKMoaT+EPxu
         KuBg==
X-Gm-Message-State: AO0yUKVv3aH4tJZxe/jlm83w92LwpS8mqKRFIEWuncC2Q8z+a6XM6HYr
        lfYR95RHWhAMheFOmBMgOpgK9w==
X-Google-Smtp-Source: AK7set9xwr0Ub6/8apgAP/fWpvDkwUVW5oRkTmfZLR5/RMrgtG7rmKP51rElWG6e8IehSDrS1EtE5Q==
X-Received: by 2002:a17:907:1c1f:b0:889:7781:f62e with SMTP id nc31-20020a1709071c1f00b008897781f62emr6971055ejc.22.1675156082027;
        Tue, 31 Jan 2023 01:08:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a50d653000000b004a0b0cd2e45sm8120510edj.75.2023.01.31.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 01:08:01 -0800 (PST)
Message-ID: <18f5a141-fa00-fb3a-6d6e-bea5cd4a7bc1@linaro.org>
Date:   Tue, 31 Jan 2023 11:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 6/8] clk: qcom: Add GPU clock controller driver for
 SM6375
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
 <20230130235926.2419776-7-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230130235926.2419776-7-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/01/2023 01:59, Konrad Dybcio wrote:
> Add support for the GPU clock controller found on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig        |   9 +
>   drivers/clk/qcom/Makefile       |   1 +
>   drivers/clk/qcom/gpucc-sm6375.c | 469 ++++++++++++++++++++++++++++++++
>   3 files changed, 479 insertions(+)
>   create mode 100644 drivers/clk/qcom/gpucc-sm6375.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

