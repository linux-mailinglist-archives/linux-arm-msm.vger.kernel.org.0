Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A88B67C5BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 09:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbjAZIZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 03:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjAZIZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 03:25:24 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190264FAE7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 00:25:22 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qx13so2980408ejb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 00:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tM3VxaZl5zM/CvacUjymAdWLAMbgccvEVqlU6otBNnQ=;
        b=YvL/1hGK6z7nzWuKnEak5LIgPXd1aXGdeRqiuswEK1ACNaSY43vN8ALvam89282NBv
         rMoo598yoratWLEaja+0iQh3K2Lry7x9MX9C7zq/dsLEUSmPjzsgDbrW0y2NoVnZYNsI
         O6Hm89f60CkhdNRKyBTkXDtpjdyQvXADFb0X9AnvwcrpzBDE/zDzER1afaf/jiKKetsH
         3zXkwoqZfYWbj3UEpu1G6xDFIh50Shl+Yd4aPFAkeC2JbCV/pcMinnFEiLUnY+jdI89W
         vN57vEfeHywtjqg3MfFcFSHJ1mx6krSO6OPZqEpDd58FH5SV8ijNDhpRFOOsCNI2njJO
         3YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tM3VxaZl5zM/CvacUjymAdWLAMbgccvEVqlU6otBNnQ=;
        b=wK3HrCYhrnxxQD2ZkylblVbvdyAWWPHVDQSJ4KjoiMglLI9KFqbk6zOWDV6G98XA9J
         n1FOE7tFOCy73LiMGqRvPxNgDfprg8LWJOrULpt0xe90uH32ViCZMlWzbE8njLzDRuJv
         3ccVS8nw1P3dhRGtxXPN6R69g/z55k7+CTdl56LfF8Ezt+8mhVAMSdD9ixN1KM9Uji3Y
         TmPJm6YZq82gpk3v8IxdhoVObOsKfnXh/RRo9KYpGINmD+7vGhs25D5g2/QeZ0bP0zKf
         FSrLJw+Pj0i8y2zawBd2oSZsfGSvEArNBv99VKd3sa8PVWuCGggP2tELYvatQv4orHxK
         qBBA==
X-Gm-Message-State: AO0yUKWJz2nOw1ovolaN/yfN8Aa+OX7lHe5qvT1+csBJlxagaFD/pxDQ
        Rqgl88EGXkAkz4UofywYoK9Izx2j5Zi9+UaW
X-Google-Smtp-Source: AK7set8tJvn/zurhAyQETXWD3WcA97e9Cz1fjhRmWhiU40b/Voppwz01Doj+a5ajyLdaKaXJ4MFw9A==
X-Received: by 2002:a17:907:94cf:b0:878:5d33:c0ec with SMTP id dn15-20020a17090794cf00b008785d33c0ecmr2147178ejc.40.1674721520641;
        Thu, 26 Jan 2023 00:25:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hw19-20020a170907a0d300b0086eb30fb618sm222763ejc.183.2023.01.26.00.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:25:20 -0800 (PST)
Message-ID: <91e64f7f-fafe-e717-0caa-94c077cff501@linaro.org>
Date:   Thu, 26 Jan 2023 10:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 07/12] clk: qcom: gcc-apq8084: add
 GCC_MMSS_GPLL0_CLK_SRC
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
 <20230111060402.1168726-8-dmitry.baryshkov@linaro.org>
 <253adc1f1cd97fb13b9aa2b3b8e0ed1a.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <253adc1f1cd97fb13b9aa2b3b8e0ed1a.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2023 23:50, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-10 22:03:57)
>> Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
>> the multimedia subsystem.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Does all hell break loose if this is ever turned off?

Good question. This is just a c&p from msm8974, which employs the 
similar combo of gcc and mmcc. I suspect that the answer is no, as we 
are still in world of alive people :D

-- 
With best wishes
Dmitry

