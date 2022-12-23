Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF69654D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 08:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiLWH7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 02:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiLWH7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 02:59:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59583137A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 23:59:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id y25so6102011lfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 23:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viOrbf0lksHmeNui5UjSPJobEOSpD+pjXXVPV5boCAQ=;
        b=tQLQF7M5nCUMF9MOzlhAWlMSaNfDW0bTYJERXXzPRo8N1VaVL6bQK3ohsbYs2GWFWt
         UYCKWvAKU9TSVeSrLSs8lh7vRgGU6tLb7XAH2kv7/LsOzrZabrQgPzF23zZuG1ZjwPjI
         31lzhgElPhcZQNFQPrEWqo7qKzRdiVXkJGIZ2akcMa+s/S2/xS6Kz3u17HzonzoPZC5b
         P1oaQBNbBrTVnrPhtu7fTdw3y2pRbLQmMBLEuY52/3u+LOSOZBsIqJ7fmhQoqLCJubs0
         I8a9b2ICMlc34z0F3drCqty21nUMWxVLxTlpfkRX0sUJZdDCUueB3PE/4/zz19wZ1vHN
         Is4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viOrbf0lksHmeNui5UjSPJobEOSpD+pjXXVPV5boCAQ=;
        b=L5YnGMfYoeUQXly98hxr/jrUFl/josObX6+JNl58LAjEj1cDawrM2Ooj/CFC4T6XlE
         tNruwJfP81KoVL0RsU4uigwlZ8GBImJNQMljwSBo+0mSiidUXzc47uPoKNASgzQFCBv0
         fB9538an0mL99DIju25DZF6oOXqj27GavYuWsSdKcgSo1D8xNpq5QWg53Qg4Q8DVJxiK
         qz7UN/C1ymGXQ9ecZl2eEhd2xKdZgkkvmnvaop6fU8sp3FK+AjxOEzXZ6dHbkugHkp0M
         EzTQZc1fLiFYuCc5aesUUaxVtlri52ARZeTBuzsiCP8jXJwbZHi4drfQYwIBupseVV24
         tK8Q==
X-Gm-Message-State: AFqh2kpTOifdQqwHeW2h6bGvbQ7ja2BGq5Q8Uk5ZvePjacrwN/f+fAsN
        +GoiYmTMgAfKd6ydjbnlPqpnpQ==
X-Google-Smtp-Source: AMrXdXv+Q2LBKY+o6Z2CycHSIFaw3tgNY5FOtMuUAMC1pv1zdlGhTga1GoZ5eSsZ9PNMvwYj3q2IJQ==
X-Received: by 2002:a05:6512:1054:b0:4bb:70b2:6f50 with SMTP id c20-20020a056512105400b004bb70b26f50mr2944636lfb.52.1671782378254;
        Thu, 22 Dec 2022 23:59:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r21-20020ac25f95000000b004b5a4cf69dfsm413023lfe.261.2022.12.22.23.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 23:59:37 -0800 (PST)
Message-ID: <8f9ddaeb-5481-85e2-314e-8c2a99bd48c0@linaro.org>
Date:   Fri, 23 Dec 2022 08:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add wifi alias for
 SC7280-idp
Content-Language: en-US
To:     Youghandhar Chintala <quic_youghand@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, quic_mpubbise@quicinc.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221223073353.20612-1-quic_youghand@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223073353.20612-1-quic_youghand@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/12/2022 08:33, Youghandhar Chintala wrote:
> Currently, the boot loader code used in the SC7280 SoC accesses
> the WiFi node using node names (wifi@<addr>). Since the bootloader
> is a common code that is used in SoCs having different WiFi chipsets,
> it is better if the bootloader code accesses the WiFi node using
> a WiFi alias. The advantage of this method is that the boot loader
> code need not be changed for every new WiFi chip.
> Therefore, add wifi alias entry for SC7280-idp device tree

Sounds good but which bootloader.

Best regards,
Krzysztof

