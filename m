Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E645B1EDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 15:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiIHN1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 09:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbiIHN1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 09:27:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E42C5F7CA
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 06:26:42 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f11so13705770lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VD+nOMHXMvV5AAmfRp26GJgaJ9o+VfNSHQ2AWOhkGws=;
        b=r1pmBWIsWJq+K0n7rbneEnGiv+dLZbznCNV6ZYPcV2ap2wAZaAlBZT7SHNVpPbq1Fd
         9CLivWMA/ICIU3zszxoDmnwFIKaktgBL+IHLfubNk4NxWU95AdBKKMxwxlZ1kJzOQ7HF
         XmRJdiPATyk35Lpl6RzXk0acE1vNZzAmYw0JfiNdwL+l4D4kewMKFHH8NW3n96hQZh7K
         4e5VvSyNvtnp6vv4e6chQE4tP7I9lGTxw5ELToMQxuXNx541mpDlC3Kc8xKx/7z2xtAQ
         6Cfoq9YZ9030VD8hmlbzWCkvkL5s0818h8uj51xXQV+ltEOHSEdH+1FRWswCPo8IHlWm
         8tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VD+nOMHXMvV5AAmfRp26GJgaJ9o+VfNSHQ2AWOhkGws=;
        b=ctSVE9lTBuI6/qB8vTN6DexCA+YcmdpwCFI84xVL/Ah+n1pRhrna/SQyS4FK9J4fyP
         s1xVQFpK9FjZ7TnLM9Pq1mW6RjnDC2Z0LuInqCiScPHNxpN+rpHT2VFW+qEG2+Vc9Xcu
         zsqMKlO2qQwZkw1yPOxrllCLB4125smNsl2X9jYM3T7dDzOpOdDjNfGeTzCBuPiLnpYC
         uWbsp6wJsR0PtfIkDYWHGE+tiz62OUeM0eK4YnC93eEGRFHV7K+Z5W7rbUqQdxYAIdcu
         8kL3MVDG1IpflcgISKUHVtet/LJVm4OFnvwx5nmJTGZ0q/46w9XWNSAR4hCxmpPSrY7Q
         0IbQ==
X-Gm-Message-State: ACgBeo1fbChB5MSpd2OFRial/xUw/xKU/xwS9Vc6T6PUD3gC0vk/VGUK
        xky8Cx3Dpe5YQh1cFi+TLFh3YA==
X-Google-Smtp-Source: AA6agR4vSnp6D09fIExO0o9Vn/bvoYNuSPdREVzriruoBoo4kb6zOfs59Kz+utiYBTRFQkW6gAsl/Q==
X-Received: by 2002:a05:6512:3f85:b0:492:c17e:d566 with SMTP id x5-20020a0565123f8500b00492c17ed566mr2567186lfa.341.1662643601022;
        Thu, 08 Sep 2022 06:26:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l4-20020a056512110400b00497aa190523sm875216lfg.248.2022.09.08.06.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:26:40 -0700 (PDT)
Message-ID: <6cc3a526-8ff8-8000-d406-c4d8949c6f68@linaro.org>
Date:   Thu, 8 Sep 2022 15:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
 <20220906165508.30801-4-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906165508.30801-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2022 18:55, Srinivas Kandagatla wrote:
> SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
> atleast another 2 of them for now (SM8450 and SM8250XP).
> 
> Move some of the common SoundWire stream specific code to common file
> so that other drivers can use it instead of duplicating.
> 
> This patch is to prepare the common driver to be able to add new SoCs support
> with less dupication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
