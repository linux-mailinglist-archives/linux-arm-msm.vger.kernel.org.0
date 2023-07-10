Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDEEE74D4AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 13:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjGJLjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 07:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjGJLjB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 07:39:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF558E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 04:38:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f766777605so6674192e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688989137; x=1691581137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ag3WH7Gl3i66UMSEqyN82e6pm2E2I7iWQJfooNytnM0=;
        b=W7wU2Ut2KGlSNifU2hcihtvxecaPlHvCkulSm8AuSeVozwdnGThSNVTM80yzJRFylW
         tMSN0ch93RFslfbwoZa8yZg8snxRy2JmFPDphNH6ZrAYOWx5JlOH/A84a6K9UYEqMsyg
         uL2WJK34uaXsBkYxHXg5NScl63DFSUSDOuo2gA/XtlTa571qvDJXithcGiqqkRddbu4V
         hsyHtbX8idJVIWUiQPU1gvZ6uX8q6gNnpGRo8jDd3imCPPpls8j/9CoTuVH25SmH8vVq
         4II23bkAqPdh/Wa+hkc7Mf99pOnDxOVTUpFjnhRc/r9o3PUzifeRkTdu0Q8hPZ5fZsdc
         M4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688989137; x=1691581137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ag3WH7Gl3i66UMSEqyN82e6pm2E2I7iWQJfooNytnM0=;
        b=W1JbscvWWAl/3mcl5Xf48siOpj2Y0sFhHpaMqJSZ7/oDiW9h5aRE2fCHAccOZR2/em
         vN2DlJ1at9BpHBXzwUr7V9jueNbLRuz+H/lCnRgIlpSB4VWwH7f1wdx0QX/FzI6nqB/8
         ZIbFGxjD6OjVSDlcrI1NfOaJ9WT0z8fGxuhJFeDHBJoPQIHK6F3w7nLmU4uTdP1xwEar
         2TWwHcewizaTTSpJPF/n1A6sLgiP5ry1YF8XHbAn39MBdG8YTT2eFCxAmWsfI6qjJ1sG
         TzJL7mLL9bhmXPWiBntJABV7VAgj3FjmN0NErXHKvS1TjZ2iLmGAmwULhmALtFgeqCVv
         MjAg==
X-Gm-Message-State: ABy/qLbIl0NRo5TGCkRwiJKEu0uCSj8bRiDdxnZ59RJJpJEADSo2dlj8
        z2jF72uxHUb/we4Fy5CJMFH/0A==
X-Google-Smtp-Source: APBJJlHzhZ3gCW7bToP/7NHZ7Tu4eDDr/+HKh1AMWjp7qvvKiEDGSUTToy9y90eQ5GScRsTK7K5gJQ==
X-Received: by 2002:a19:504e:0:b0:4fb:893e:8ffc with SMTP id z14-20020a19504e000000b004fb893e8ffcmr9193851lfj.17.1688989137006;
        Mon, 10 Jul 2023 04:38:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906851300b00992b0745548sm6049419ejx.152.2023.07.10.04.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 04:38:56 -0700 (PDT)
Message-ID: <b293432d-fc1f-2d2e-1289-548f44ec8c02@linaro.org>
Date:   Mon, 10 Jul 2023 13:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: drop the IPQ5019 SoC ID
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_anusha@quicinc.com, quic_saahtoma@quicinc.com
References: <20230710105419.1228966-1-quic_kathirav@quicinc.com>
 <20230710105419.1228966-3-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230710105419.1228966-3-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2023 12:54, Kathiravan T wrote:
> IPQ5019 SoC is not available in production. Lets drop it.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 4d49945b3a35..78293ab13c87 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -406,7 +406,6 @@ static const struct soc_id soc_id[] = {
>  	{ qcom_board_id(QRU1000) },
>  	{ qcom_board_id(QDU1000) },
>  	{ qcom_board_id(QDU1010) },
> -	{ qcom_board_id(IPQ5019) },

Similar concerns as for patch #1, although a bit smaller because this is
not an ABI. Anyway, commit msg said only that it is not available
anymore, but does not explain anything about existing users...

Best regards,
Krzysztof

