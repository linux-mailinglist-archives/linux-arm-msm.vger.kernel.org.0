Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299556A91C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 08:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjCCHgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 02:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjCCHgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 02:36:41 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E48A3C7B5
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 23:36:39 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so6629728edb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 23:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677828998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lD3WNNJ/JfE+85airrus3P2fQXvOECA0Dr0b1uIncAs=;
        b=EFIsNG/S4zPvAcqQGle3ZcNvhRHSWWvyvLVlYwvOZT4vept/M+JBmXs/lQkcuWAS4k
         sw0wq/AL5ZD8zVeMg0jIXDbL5lPFAm3gpqRH+FSyZscUVI+xHFkoeJpll1rlM7AAp07Z
         1eOsHqOvIx/8jWQfV+K3YhwGUr31ZyHD6ovFvwSYveRI5pkLfNq9nMDO0i11ONWj0bNl
         bUOS0+c0V2UuhljB+ozn5OdgXbp+p3MCa9vQ7dEodQoT68iQEge45z7CU86Fyew/mP98
         QpZngUwUKBUZkFQvpd9WhxE/UpX8R7qflgV9CcwJhc3h/ZwEo2a1ThwbvEWFHFgl5s33
         y3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677828998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD3WNNJ/JfE+85airrus3P2fQXvOECA0Dr0b1uIncAs=;
        b=5S1AwvLhTw9AbpoIGqqizYzaaQXzJH2OZD6zgo9JoC8WedVnny/Kjt3+mha9rdWqK8
         SrDlnL98jOMflstDwZw3hfHQsXciV98ENApgRaZIOfZzUyz0puqELm9QuAB6VRGb9QQM
         v3ke4gSn/aypa7r1vDtAJl9peeS9MJfr5dcN6KzcvEdS1WMn+zslwJc+a6JrpF2/yPfl
         Ra/FTmvLpbz+68kpjxrNUedj8dT4FNGHtfmtz+KA1hAsloQ4iZz8MNLcG5FQwSnhqyeC
         kNG37cjk5WrZg62MeqfzGfdT+0Xwerc6ruXATCBphboTJu/DXCL0CGFDTVUNWzVC1yGi
         LmUw==
X-Gm-Message-State: AO0yUKXp5+3Ny9t9/e4UumVKoYMxUnpGPPl33TsvBBVPNCZI0VtyfT/h
        3MYeoqSolfLvrMqkdaczvL3pPg==
X-Google-Smtp-Source: AK7set+9A34NkjNW8rJpLhB8K7vzbcrDtVYTZXH1WEFeIMKOJ4DUIKMu4acyau4x2tvUISZ7f3EW8g==
X-Received: by 2002:a17:906:4783:b0:8b1:fc:d737 with SMTP id cw3-20020a170906478300b008b100fcd737mr1051626ejc.19.1677828997912;
        Thu, 02 Mar 2023 23:36:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v12-20020a50c40c000000b004bb810e0b87sm824867edf.39.2023.03.02.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:36:37 -0800 (PST)
Message-ID: <5dac3aa4-8dc7-f9eb-5cf3-b361efdc9494@linaro.org>
Date:   Fri, 3 Mar 2023 08:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/8] dt-bindings: phy: qcom,qusb2: Document IPQ9574
 compatible
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1677749625.git.quic_varada@quicinc.com>
 <70beab86eb21d1130e61f52753f514cfb433a4f2.1677749625.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <70beab86eb21d1130e61f52753f514cfb433a4f2.1677749625.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/03/2023 10:55, Varadarajan Narayanan wrote:
> Document the compatible string used for the qusb2 phy in IPQ9574.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

I just acked the same patch... what's happening here?

Best regards,
Krzysztof

