Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E26F62DE71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 15:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbiKQOlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 09:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240474AbiKQOkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 09:40:41 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8705DBAB
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 06:39:40 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j16so3072134lfe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 06:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhqHTIdakMdpvgIm6p6wrgckSR+qp6nVKOdBw1n2NYA=;
        b=RJSBSDT6way2QB6z7HOF4VHWQBZ9FM3sbXcO8/5CIix4Mp/vZMTmZLxUkLjNqtf1In
         0vpKyapKN6tjlgUmXV9npaTLNABbXAkVOWSAeEBCZqbMrofXlF8zh6m6mHHtIV4XgWfB
         IbXeXtGIaInF3qUbtgheXdOd/AWwMzj8iLF0isC5t5oBmmCQTBy7nklFHT7b0oxn6Yzv
         1wIsBiVpdUG5vkX+Gy1/dfqhk/S/u5ziz3S82tjNRvMDfCJ59L/R5iJIVB1iuZWBt6FK
         tH1acOcewQWWB0gA4+iapqwA/CI81cIWsXxy/YP0o+gVyLmpeZl2nGs6H3EthqQSST+a
         Faow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhqHTIdakMdpvgIm6p6wrgckSR+qp6nVKOdBw1n2NYA=;
        b=F+d2YJxRFvTNggZkdxloHE0eGzWtgvsE0JpbxDocvhhIHqa6mV7JUWAikQBbdh5nBC
         DQmEkP/33rrJBoiUTaRVbBnPwet9ZJ+qbDEhc9ZkzUeQ0kNvj+8vpDOVYXcvt3IXQz1+
         tFR39efo/w4iR/W1kiK/S7z1UCbGpu0LnzlUYIA9w2IpfqdzCSwymy95VxMsUu8xsKzs
         AK0E/SBrkSr+vLzo2wC8BKCWMwIkG4OM2Xelfefphqql86YXOiz8GsqAaSwEJYh0eYCv
         MiXV+qvemuXA8WLYdN0RCBak/TY7ebl/3SIHUugIxqyV/vp5VLy+n7xBlG7MpcAeivL1
         gm3Q==
X-Gm-Message-State: ANoB5pkmjMEmcYp1yjcVkOelYZ/wfVp+vBcP5/EZG6vuRj+6YHKAUXEO
        woAWTJQi08rocomKoXgfozG2DA==
X-Google-Smtp-Source: AA0mqf4NaGpugqjSDrrmrqo3jAPO3q9RsT21DAZOI0kv5akXE5GBfutYL6Bg/02pvozfY5G9BEbmeA==
X-Received: by 2002:a19:a405:0:b0:4b0:8644:2951 with SMTP id q5-20020a19a405000000b004b086442951mr953840lfc.93.1668695978726;
        Thu, 17 Nov 2022 06:39:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n25-20020a195519000000b004ae394b6a6fsm173335lfe.246.2022.11.17.06.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:39:37 -0800 (PST)
Message-ID: <23a4623d-4bc3-72cf-f56d-ad6737594977@linaro.org>
Date:   Thu, 17 Nov 2022 15:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] dt-bindings: PCI: qcom: document IPQ8074 Gen3 port
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        bhelgaas@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mani@kernel.org,
        lpieralisi@kernel.org, kw@linux.com, svarbanov@mm-sol.com,
        shawn.guo@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221116214841.1116735-1-robimarko@gmail.com>
 <20221116214841.1116735-6-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116214841.1116735-6-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 22:48, Robert Marko wrote:
> IPQ8074 has one Gen2 and one Gen3 PCIe port, with Gen2 already supported.
> Document Gen3 port which uses the same controller as IPQ6018.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

