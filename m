Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47E675209F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 13:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbjGML6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 07:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbjGML6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 07:58:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140822D47
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 04:58:38 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3159d75606dso724295f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689249516; x=1691841516;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bI4Oe+yP7KGWk+MZz/2r8fc2vw7UnPBIaBAakg7Fevs=;
        b=LP4oSqME43+aTM2hFOZZQl415H0bJLp60AtJcVc7OFiYhSLSSbpcXl9tGs7d1bBlAd
         hgNUz03r1oxCYwVfoC17HMNw2F4k33/Er+F//Z+dctUo7xe3qa94joAm1J7A2lkPMWJx
         yTLz0tda6nQrYNqcfoJusUXrqd/Xd8MhNMnyvdsG6izp4ubQbO/uyNBjtEo6TSCRGM1p
         l8/IO4KIQmzuENullxPPvCYkEHkjBKWzqPraWufV25FzPbqEST8t7lxT9Pc7EtGlsw9E
         km/gtIyY7Kyuf9U4JjdZC/MtTU7XXgP3BdjWAQtSwG47hb6EIVlzOjwajFebBXcNR6zx
         qxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689249516; x=1691841516;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI4Oe+yP7KGWk+MZz/2r8fc2vw7UnPBIaBAakg7Fevs=;
        b=is9bpKA5Ngo7J/9T+Q5htUpqz49jHBF0oJVj0OEXyHlqCUO+e0pPni6pI2pG3rPikr
         GJRoL0OTaI7vtEQJ5+f4j+8pvsXtLe9DV4M3KwicP0Bk/R5cnFGUTfbkP45alSJpxODE
         tsEsSq397W4eNxSSztcsGf/ySsfnZNWZ6RKLem+x6uBIfOlI0oV31Xwv64sMIrg+yxr7
         6sOwZvQd8nAqZLX4kMThL+G947cJjysV6BaIeV4abconJ4emQ+ExXG8n0jqmzOeDXp40
         dc2q76fEIh6BRtk6NnvJtUHZojZCyb/zZJizTKVEpL62IYYgY97rQLca20Ch1tAewv3H
         6exQ==
X-Gm-Message-State: ABy/qLbDMXETEzpzxGoFqLa8OFj67w9r7W4DpIFMz1YoXHBA5g4nXCXS
        LoUqSa9PbahM0qAL9zNObhUqCw==
X-Google-Smtp-Source: APBJJlHBfdmfumFAkMZv4eQHfzBEdQk5UymltbJjegH69ja2VroZqjF4b9p3XEV6ae52kjzkiTxSJw==
X-Received: by 2002:a5d:4bc1:0:b0:314:1634:491e with SMTP id l1-20020a5d4bc1000000b003141634491emr1355767wrt.20.1689249516593;
        Thu, 13 Jul 2023 04:58:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b003143aa0ca8asm7802015wrv.13.2023.07.13.04.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 04:58:36 -0700 (PDT)
Message-ID: <f9bfb051-aa39-0e87-6597-e5b5ce85a37f@linaro.org>
Date:   Thu, 13 Jul 2023 13:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq9574: add support for the RDP417
 variant
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230713115544.953998-1-quic_sridsn@quicinc.com>
 <20230713115544.953998-3-quic_sridsn@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713115544.953998-3-quic_sridsn@quicinc.com>
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

On 13/07/2023 13:55, Sridharan S N wrote:
> Add the initial device tree support for the Reference Design
> Platform(RDP) 417 based on IPQ9574 family of SoC.
> 
> This patch depends on below patchset:
> https://lore.kernel.org/lkml/20230713105909.14209-2-quic_anusha@quicinc.com/

This does not make sense in commit log. Why would you store it in commit
in the first place? Please put dependencies with changelog, so after ---
separator.

Best regards,
Krzysztof

