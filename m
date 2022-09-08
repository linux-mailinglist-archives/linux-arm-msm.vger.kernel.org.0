Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAEAE5B2046
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiIHONU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiIHONR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:13:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290E7B08A5
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:13:16 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s15so20068191ljp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=o+TCgSTIjUJf2ZyvZPD2DDvJwwEznDT2FZ47NjeBns4=;
        b=iq3nL2djKggombliRyDV6ER47DIbJhmHz3D3HV1nfuc7dkI5gJz7Z14ylgCEAJvCJR
         8lR2fQka0L42XcIzlXzEjy0ZLfGZ5Zgwp/ijOjXxsc5SFmHEVz7TvCOkffQit0sgsoB3
         a5fSjVk4QObKSYxvGHzAlSgx2u8TLx3zA7cEnSOrh3piDDAz3kuWHYH5al5JEKdrN1RJ
         K/3XErhEZIngqvhTkwgowkpl2NQi/Pw9B/srHNqpyBLmXYuc72pJHHijXn9hSTIpfTfj
         VrGUyurBEqxDkFWA9YhEcHQqh+5NZ9tH9ExmZFmTvUGnOGckhdeI6NhYQhfPap99o9cO
         DJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o+TCgSTIjUJf2ZyvZPD2DDvJwwEznDT2FZ47NjeBns4=;
        b=nL7NhwB8jC+K8rzG9kSZ5DIzCwp69eqsKybOP6LQwFc1yvAe08D8OrSIXVV2hRsn2N
         RCzRGwfs9MfifHY8k73XBgZPvQFbyLQCI8dWosp6WzsKcnOSJEFw9YFSsXPPvKVikx0T
         r0MInMASyNw8jrVr69Z/D0WjOWLLskdi048VH51s3z4PUZj/kmEfypmdvpf1WgRxGHT6
         NK5r1loUoftawNByfTgNmDZXlaFaUgDgsHxqqiYRV/TRaM5n4W2FwnplqVDtUcivwNZN
         yTXl3w/9HQFyG4C5ak9CxD4LYsQwQEX0A95kPXcUHwaVZr7mlvDuJ096V8wXByXbUIjW
         ES5w==
X-Gm-Message-State: ACgBeo2kSp53kvI5nwblnVeUrDqOVgz0YeYPgeHj0wehLbfL46OEckLF
        M4L47Bw+2WWXHFGjY6v19pWqIg==
X-Google-Smtp-Source: AA6agR40orb0LN0Pe63JfkxHJ7vt6mFQMheM30SPtDuMAVm8Ga699Zm5dWYan6cT8BdN6bpXu3lHFQ==
X-Received: by 2002:a2e:9ec3:0:b0:261:c893:679c with SMTP id h3-20020a2e9ec3000000b00261c893679cmr2534772ljk.378.1662646394477;
        Thu, 08 Sep 2022 07:13:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651220d100b00492f0f66956sm3044998lfr.284.2022.09.08.07.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:13:13 -0700 (PDT)
Message-ID: <91c097b1-3b15-5565-5ec4-747ac5f688c7@linaro.org>
Date:   Thu, 8 Sep 2022 16:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sm8250: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-12-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 02:01, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the sm8250 DSI
> controller block.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
