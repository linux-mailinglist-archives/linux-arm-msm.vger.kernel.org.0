Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD4573DD34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 13:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjFZLUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 07:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjFZLUT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 07:20:19 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F7610D
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:20:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b698937f85so23880141fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687778416; x=1690370416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aNjOODuL5422gkiTKfRjAGrAZ8RslF/0UlA/xkBh0eg=;
        b=YTDhOchwJomu7xbnPSJ5jeT0jdFl4uO7FV39DW1ewjNEIkpHuzpLJBc6xa/0oWDycx
         t+9GWxKmYHVfOR8p/q2dSu+8wA/rJ6vULulSg6S4ojVrS6k2EvM522sE2HbRpWaH5eDo
         7CPUWDtd+aHmplbyEhTHWzQX/q+xYE882RTUvRZbP3bpXD2rpWAJILX0h5psdmUFx1O4
         FznAezHoyNw7c/7YAFesHvY4g8MP2u1tEB92X07C3HNk4JKQSoBkEYPdHSj+51r4udYh
         Tp7q3TG2OS/jv1JQePio1FqWASZnx669oaY3k2P5mNCrZCeN5vODo8hFI3O2YWwyiVa9
         ASxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687778416; x=1690370416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNjOODuL5422gkiTKfRjAGrAZ8RslF/0UlA/xkBh0eg=;
        b=ObMwpux6ED44i35uEIK0ehnDFa9ivAdT3vfNLSSvU78/ammLVUUW07BJxkavDoWDBI
         b9E60yjF3fJaMeJ42AMMHtvihPCj4B3ikx/K+DlgHC5vk8c+WjiWm1Z3m2R7LP0rKZL7
         crkvJuyEPwLXo2Zg/5OOWg9I9LvgDhtC2ytc4wjjKmXnkGDj5SRxdGzqgzr0JBbxruWx
         Z2iyQikIU3njFuz8VYij+nxzyUcUtrk06RXrauTgZ55AJLkAS9V56y5a8RiRzwLVzoIR
         oo3ITi+/nxNRUDAFv2ZxRLMj/Z9aXzOccc47icIcNSVg/RowrAHn/RrFnU3MBTs9oZ7E
         x0JA==
X-Gm-Message-State: AC+VfDyOiAYJSNBnHGSKfU2Ky9VmXTiBAaRQh3uctBoIWASsS3+GyZtH
        5gjz7Cj/PczsLn9Cn0dZicNM7Q==
X-Google-Smtp-Source: ACHHUZ5FL8aC9JGkP8UZl5LCVlR/iV7/pxyO01K4X4g/zl6JvfAYsYgV1CtQxBK6JkrDExnBmyq62g==
X-Received: by 2002:a19:6503:0:b0:4f8:7960:f72 with SMTP id z3-20020a196503000000b004f879600f72mr10649932lfb.44.1687778415821;
        Mon, 26 Jun 2023 04:20:15 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id k1-20020a05600c0b4100b003fa82210e7asm7492485wmr.14.2023.06.26.04.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 04:20:15 -0700 (PDT)
Message-ID: <f1340d0e-3379-2d2b-e4df-5a182a2c5440@linaro.org>
Date:   Mon, 26 Jun 2023 13:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] thermal/drivers/qcom/temp-alarm: Use dev_err_probe
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230625-spmi-temp-alarm-defer-v1-1-2d57acf36855@z3ntu.xyz>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230625-spmi-temp-alarm-defer-v1-1-2d57acf36855@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/06/2023 13:11, Luca Weiss wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed message includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

