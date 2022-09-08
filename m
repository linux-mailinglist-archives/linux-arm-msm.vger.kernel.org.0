Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE835B2043
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbiIHONS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbiIHONO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:13:14 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909E6C6B5A
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:13:04 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bt10so27958723lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PbwgkCCaBAA2ZyKb6cCVxA8TSWP0joZNZFjmpwbATks=;
        b=UOXV4IDEbNXRCtXtUkbhEDo4isQ+2MAf4v6GLr5fTXRvun2JRtrHdDVCi1RtLFxC3w
         ZFXetd9+9ynZOsUbV+2HYJTgNvs5e37vJMewrM3tk5ecPD8ukMLw5bVEb+x4G9rwcZJH
         Q24q6/nyJrCcOl9OKhSLhMQiX0bkYMdQ2nxqCodtPFu4dBeRF+XpnQJ+7FwBLlniwwEW
         u8vDNzFYafA/igfqQxj7dvDXzhwDXQSeQMPYbRsxaomYXRQjjpaF1f08LZI430BeG2AP
         LXMP1fas/BuVJIFH2IJUMQyXMMZlK+H8mWL4ZFni1gQD/SIt+gW+JqurOSCYGGaALmIt
         ai4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PbwgkCCaBAA2ZyKb6cCVxA8TSWP0joZNZFjmpwbATks=;
        b=ajwvTEH6+lbuBILEIafULkv63/4NoVkJkLNKsm2LoGNsdbFku7Cimbdj0BGjmDzoun
         sbUvxsHEOU6M3/fMnk06JodxVkDutCjnqzWe5IBNQfBofEAL9+HFgxxEYr4eXfuhNfIW
         ccXlqub98dJn+gDoJk1fp3e7JAhCuHOjuOyuVle7KnvN9mfnJkmaDeKbvAcrNdJF+bIr
         Pnu7FwM/B4JZBdUmOP1I217+i1vhmvvqZbXfDUQnUpPF8n4VekIZg2MwrNoesjfuyy0M
         u4z9+r+MdbkvEkYcjizxYOVL6vaU882sljRnQz7MFvfN+GBSTZ19bhYKO+f5vS0KFzA7
         fAkA==
X-Gm-Message-State: ACgBeo2Aa9ZJ8j4FIcmO3mcLRLiUhJ+gU8B4iNFGoIDKnPydV+hS4OWP
        xwlFpaGEPR0eQCRzyeSbKVzScA==
X-Google-Smtp-Source: AA6agR4ZwQ4tYQuWeET/+KUz2qNVmunxJNcQO59SVmPskdrMzvypWCVEhuv88Ae4pNX1qTBYwIQ41Q==
X-Received: by 2002:a19:6b16:0:b0:48c:e218:7c51 with SMTP id d22-20020a196b16000000b0048ce2187c51mr2648393lfa.681.1662646382968;
        Thu, 08 Sep 2022 07:13:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e12-20020a2e9e0c000000b0026bdf0f180csm28197ljk.87.2022.09.08.07.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:13:02 -0700 (PDT)
Message-ID: <9599c4da-5c71-03cd-480a-5b71181cbe84@linaro.org>
Date:   Thu, 8 Sep 2022 16:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm630: Drop redundant phy-names
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
 <20220907000105.786265-10-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-10-bryan.odonoghue@linaro.org>
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

On 07/09/2022 02:01, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the sdm630 DSI
> controller block.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
