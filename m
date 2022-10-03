Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA10F5F3381
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJCQ0Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiJCQ0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:26:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824E5D138
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:26:10 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a10so5182884wrm.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=cTAuqn7Gk4AbhE11xB1KEODbwH7tCOHEcr01QZ55ppM=;
        b=MqI3JwT80NPPwEb6PADF+ctRbhg6zfEBed8d6+AOBi3Uz6IWhPS2IEHGIXzuoCZGh4
         Yi7X13vgvYAjHbZx0OStbEjxm/9e/1b+zYH9oXf4eWHUodQqwQTbU8rG84/dtr87LRUF
         HrSq9bpZubVRGuSqX9og3sEshIc7FzI7eWoNgXVuduycw3KYIg1FQkdviucAO0BZm4mA
         jQoH/gs+Upj9mlfeRviyrK9dZKPhAD9P99//ldwOjFWVqnPUCv0hsVBoPnoQ8COMOgTO
         G+JH8+OJGPwF3VYTOKSvgHmlTH2PZjsYHkfCWDzyMQtJKgnHh5vHIximRNDvz0JTSpud
         6r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=cTAuqn7Gk4AbhE11xB1KEODbwH7tCOHEcr01QZ55ppM=;
        b=dHanqKaMrgV/gmBqyL9ulCCOHmSBdP0ySThNcknS09GxFFs1H4RUs6YJJC7/2mfJO/
         2UxSTjpI+mkvZopaqNgk6HF3KyglaVS1qCD2ZOdNOqaPGv9MxOZvgd/Q/NZKeocG8VvS
         tDih20OqblS2SfK1K34R7IxUaXTH+pOBr7ap769DEXj1P658bN4shiYAVnwy+TtN02B2
         jD/AR3ThuhFSFhiEX4gtOwOK3xR2ydAlTbngwk9ra2ttUlXV5q1tZdYlHiVYAMeMQ5Iq
         67g1T3bozExIwcQ2Mg3WzFNCxHm8ND9A8M/YLFf/24aWTVa+YMkdxqwA/tSu3CYAL3Va
         HHVw==
X-Gm-Message-State: ACrzQf3hx3/70SDamYuteE146iKLQDZVPFcsGHuAxah1h9WKcYzwm9gS
        Vqme+Kzw/sYRnD0aJDpKkx1YlQ==
X-Google-Smtp-Source: AMsMyM6yjEd1E4u+wEJdbORfzq+urbdvvgXYGqoza0RTkNPdmN5ARy0RV64dLqWiIQAVFSOmkB5GfQ==
X-Received: by 2002:a05:6000:1564:b0:226:dece:5630 with SMTP id 4-20020a056000156400b00226dece5630mr14384427wrz.294.1664814368632;
        Mon, 03 Oct 2022 09:26:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d4bcd000000b00226dba960b4sm10190798wrt.3.2022.10.03.09.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:26:08 -0700 (PDT)
Message-ID: <d093f08f-4439-1328-dea3-55d9f4ee2c2b@linaro.org>
Date:   Mon, 3 Oct 2022 18:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 19/23] ARM: dts: qcom: msm8960: drop amba device node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-20-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-20-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> The separate amba device node doesn't add anything significant to the
> DT. The OF parsing code already creates ambda_device or platform_device
-----------------------------------------/\ s/ambda/amba/
> depending on the compatibility lists. Drop the amba node and reorder
> sdcc nodes according to node addresses.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8960.dtsi | 68 +++++++++++++----------------
>   1 file changed, 31 insertions(+), 37 deletions(-)
> 

<snip>

With typo fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
