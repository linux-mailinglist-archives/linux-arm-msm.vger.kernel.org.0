Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CFF6E9064
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbjDTKhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbjDTKgM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:36:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8DF7A88
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:33:44 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso467961e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681986823; x=1684578823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Km7fYpP6TW/v//SsQT00GnyneejX9uUDDOVhZE5n5xI=;
        b=omq6USS+6wPohpA8a0n0uXqurlRJCRBlTGmxbfed9VYsZHD6xxp8Z7lnZYfHm7JF1I
         Ugpb+KXIro1kjq1OfPs/dZ6amfgct3ZJMGypRTpYuXvYKpOIUql260eVCSIMUrd5WgjY
         +GpYIVfVvePMUmhYkvkT1o0AGpbnHfyTNjN1ZFAiNSBto9kJZJW3xqHauaSmXBWxOxlo
         rINiyoQlHMS/gGmDujvisgk8WaJgXNBaKbfyRczEyQWAOV7mmXi7kLfxPt5NCz2a8A6d
         zoE+048Nw6BlGD5ThUmW0JyZND4vPI5ZFOpBhYp+4uCOfMUTcCFM6P7YFbN2ZP+Y9nF3
         thDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681986823; x=1684578823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Km7fYpP6TW/v//SsQT00GnyneejX9uUDDOVhZE5n5xI=;
        b=dQ+c00Mo7OcYd+BSI+bupCR7kaUsTS3raIFuhsW+8K2gJ+AmTO8LztrnLPDZp0OAny
         W+PPFjgi7KVwkmR5wgV5phe1+K0zd1+u+1ecc3fpgxW3VAAHTyWYqogB53gqo4+ujsSA
         1TVL1PF46P2qA4Y8zqb2VpTu+MIYemkrdD3/ge16Zvh9RySE4tNdG7yvpgKk/XfY2Syn
         LeeHQjddlgSbQNwESVs2izVdb/gT+MXFdu9bB1T5FRTwhYlF5NsKTKfH5I7F48ubdHh8
         7c85ZBy/2HfA+jeraDAIKsn8dr/VxiyF5QGbcAAJNdCD7hfb+bZfOgVUVrrRqev60ixc
         VRtg==
X-Gm-Message-State: AAQBX9e7uGqDigcXHMsdg68p8Lu7MkgtC94H2nqK3+qFv+Nf7hl8JVyc
        PmkTmW3WynOrbqY89nlDEmEQJA==
X-Google-Smtp-Source: AKy350bbg9I6ZBPxb4VonvL9ujTQrhDttBE9Pxlis6/qvpG/a5zlxV4mrfqhjY4IdvKCqIzishwMyQ==
X-Received: by 2002:ac2:5444:0:b0:4eb:2529:cbb2 with SMTP id d4-20020ac25444000000b004eb2529cbb2mr445613lfn.49.1681986822894;
        Thu, 20 Apr 2023 03:33:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n1-20020a2e8781000000b002a7e9e4e9dcsm190172lji.114.2023.04.20.03.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:33:42 -0700 (PDT)
Message-ID: <2c4d7635-4b59-fcbd-133e-984205379e11@linaro.org>
Date:   Thu, 20 Apr 2023 13:33:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/2] clk: qcom: Introduce SM8350 VIDEOCC
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v3-0-0e404765f945@linaro.org>
 <20230413-topic-lahaina_vidcc-v3-2-0e404765f945@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230413-topic-lahaina_vidcc-v3-2-0e404765f945@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2023 15:53, Konrad Dybcio wrote:
> Add support for the Video Clock Controller found on the SM8350 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig          |   9 +
>   drivers/clk/qcom/Makefile         |   1 +
>   drivers/clk/qcom/videocc-sm8350.c | 552 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 562 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

