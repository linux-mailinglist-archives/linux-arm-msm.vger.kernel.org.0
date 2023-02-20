Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8369269CA35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 12:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbjBTLuJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 06:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjBTLuI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 06:50:08 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601271BF5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 03:50:07 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g1so3338396edz.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAkw2Bogc1dcFh3nq0mKeAkgYTOLLIjI7y9fWDZZu6A=;
        b=DHahLwJsMmPDheHqXw5xU+R0DMEZ24kDcjWBU5d9yIhDAlXvPny9p+vBiMfVs0k9Dy
         cKwhySL+kXe4Zbgmpqijh8eOCOsXC5dJMgWH8tQFaKsha5+QOhWS9XHQyzjOnDe2Q78G
         x/IAQVyyLrF95SNYEDmG1F2zGCbykVPcUqyQasqhlqJMzKl52mVKeW2zODdB28NZIzow
         f0MkjO3aofxKZxTNzTu8BBQQ0l5Zi+7OYh8kXwgUiZwLWR7nS/RL57RV50UkfbqcNJDY
         RSPe25ajSr6Fkd6N8wgaBjmUB+7g4mz9fjUTH550wZ8r2yFCcd02Thu2hOCgbCaGBeiI
         hj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAkw2Bogc1dcFh3nq0mKeAkgYTOLLIjI7y9fWDZZu6A=;
        b=d+M2frzP0u956aLlktYQaHvWhboz5NUPZXYfly3Jt7r9nRHm0SiBGJqc9N9hiM5uYe
         LquOTRVS3kLypdFxeyWiQtKSMr128Pp3Wr+hThq0n9yxhP4zES5pD/pT8OiYRcv7IIKW
         gOdOm7YTEITdAUhwPBhDbcVckkiBqt2IoGWHnnqdV1Bmu54+Hto3blyKs1rOecNunLyw
         rbSfh5E18drhxOtkKF9vltzJIAvINuyOsMmnPJy2LNoYNuqQKWZKaDX7SDFaDNLYUVmR
         3m/n4vs3G28B1mDNhAejQlp8erTxEOU5zU3WHbKZdzgYC7I7DgEdDC/Mtx2bXOP7ed4a
         QqNw==
X-Gm-Message-State: AO0yUKXc9NdLJw2bvoO/38Gw4eJAT6+rS8gCwccQUUX3aoYzXeB8dbHC
        axJhmWaalMTsXCOjGxJ73GZ4iA==
X-Google-Smtp-Source: AK7set9K1uJR8d+t26bu6BKoVAr7ZEafzH9Tbx775Zcvf0fBZICVlHEExQwMwx3FotzUeTfXjJJYyw==
X-Received: by 2002:a17:907:c004:b0:8d9:99f1:90b7 with SMTP id ss4-20020a170907c00400b008d999f190b7mr725100ejc.11.1676893805915;
        Mon, 20 Feb 2023 03:50:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id rl3-20020a170907216300b008c76facbbf7sm2461398ejb.171.2023.02.20.03.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 03:50:05 -0800 (PST)
Message-ID: <61e8eb1b-f3ff-df76-c47f-b2c27442519b@linaro.org>
Date:   Mon, 20 Feb 2023 12:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/02/2023 12:47, Kathiravan T wrote:
> 
> <snip>
> 
> Bjorn,
> 
> 
> I don't see the change got picked up v6.3 
> https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/. 
> Please help to understand what is missing to get it picked up?

Did you receive email that it was picked up? Lore does not have it.

Best regards,
Krzysztof

