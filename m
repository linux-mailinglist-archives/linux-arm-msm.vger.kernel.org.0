Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 848D8650E24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 15:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiLSO7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 09:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbiLSO6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 09:58:24 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC5D103A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:55:50 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so13980286lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAjmhlV6Ie5/Wgl0Bk3Ju9nAa0U0d2h1BESQvg22Fpk=;
        b=PlcsYFfRqRMaUxHIJvkZklr/BUd0PUqvKymtIb2NkVCYJZB1XdX9yox78Y8S519Bkv
         WqbXJUGxr/zTBQOhB6ovWmmsm1ZvxKClFtSBZJkpg6SsAFv3Dei81bRvODmUNYaWAAwx
         kBYz7CnEqy/C9kWFcGyvm3C2+hmY/UGzh+vW6IYIXsryYVeXY4jPJyRE0mZ4x7OTGqxl
         pgdJKPM3AQjXZwsz76si106DSrT0/UFoRLX9vLkWSFy/sDmYM4i01ySesFFRNwD2qTCK
         yGvbpse/yAYlpj9gG66+Tq1m16PAnLmIrS6qiG7x2HyidoCDAL40X9DRgMD6wAGkZzfJ
         itJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAjmhlV6Ie5/Wgl0Bk3Ju9nAa0U0d2h1BESQvg22Fpk=;
        b=BfkfTNX5gMeLj44/z8sh2ZBjf4ZDARRqEVcjDqf074LMyd/LjEivWSQTkdAHGajooD
         xN2g5kXkMFgn/zU5ddV6Txg1yA2vUvC2tAlE1Ki7FdRtXSPhRfIhMQ4Ca/gG0HxZYcDt
         tlaurBZjUhORMzHG/ZOGMAhXqlpQy0mawOQWYl8k5+Cp0PDy7KRN5ievDWx+JpGNcreO
         35ljb9f0Nb6kTF8UULV1YbTgw9WvJ2zv+38hVLzEbImUy9Msp5uhOlh6IIzXCRQqSxk4
         LmSHWQv21G2z+pu4R8X1XcJP3KCAVXDTVophQ4tTT9uk3ZKERwn9/wGakj4Vlh/yEuHP
         +P7Q==
X-Gm-Message-State: ANoB5plQul9/WD2z2krxBgRYc/2ga/PYFS4dC1D4vym4U/vO8IyzEHup
        i9OWahIypbFviHm4vpNTUKM4snTvGXiFTxNO
X-Google-Smtp-Source: AA0mqf4pdsv46fu7CjalQRdeqJGBs0o2E2PD7lBfQN6PlZKbI1IQ0chdN8Ix8LzNsc+EL6ACC5Mhkw==
X-Received: by 2002:a05:6512:2586:b0:4b5:2eb9:8d3 with SMTP id bf6-20020a056512258600b004b52eb908d3mr11296390lfb.19.1671461748476;
        Mon, 19 Dec 2022 06:55:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a1-20020a056512200100b004b097f2c73dsm1124154lfb.253.2022.12.19.06.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 06:55:48 -0800 (PST)
Message-ID: <396fad03-31d5-1de4-5e0c-78141cb8f35c@linaro.org>
Date:   Mon, 19 Dec 2022 15:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add wifi alias for SC7280-idp
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Youghandhar Chintala <quic_youghand@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mpubbise@quicinc.com
References: <20221219133303.20420-1-quic_youghand@quicinc.com>
 <b3e3a8a9-9457-d546-cd04-80e5756cab2f@linaro.org>
In-Reply-To: <b3e3a8a9-9457-d546-cd04-80e5756cab2f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/12/2022 15:47, Krzysztof Kozlowski wrote:
> On 19/12/2022 14:33, Youghandhar Chintala wrote:
>> Add wifi alias entry for SC7280-idp device tree.
>>
> 
> Why? Please explain in commit msg why you are doing such change. What
> you are doing, we can see easily from diff.

Additionally:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

