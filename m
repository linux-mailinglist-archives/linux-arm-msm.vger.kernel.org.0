Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD06F7927E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237787AbjIEQEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353692AbjIEHSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 03:18:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067F2CCB
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 00:18:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5007616b756so3697200e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693898308; x=1694503108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuvpSS4ckHm46pTl5yI33CFnbIrbtXLno+MDWp/xx7Q=;
        b=pxJz0jnZFzLKjNWWfgR+9eI8SsOUDAX4Hd6GKxp88jd7RJblL+BDuCduyfRHJuzzPY
         LqBaIT8F5Po2hGxuNp8aZEyXc3QmaTeU+Q4d9UIAwuqLIisqRW+LJy2u86hMLCVQDkxE
         fKDzM7u83K0jbbbLbARIxqGD0WLn5zABwwIXs9gUX/a8B21xfkuKDBu/q+sovrSTsfgP
         k9AKk8/11yeKiSAzgE/56oSZ+UiAeryHlLYfzgj295sutoJZxLSyLvxBa1QlQVnJoqfA
         hyTYKmwa8VELF5pPTxR92fua9oXPfKlh8JL/oKKyqnWwuZOrW7mCy6yfZirgyc/MwFk2
         LhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693898308; x=1694503108;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuvpSS4ckHm46pTl5yI33CFnbIrbtXLno+MDWp/xx7Q=;
        b=fDd8io/lVcjB1GCXBIuw7B5RPZPgei2zSAUYIA7cSKY0MS5E5UolBa3PpIlY1QQAl9
         vzcPuQjhw6vGV5C5dNCqZ7ekzwgARxwuFP7QnyIsdJsxgpWsTDu2+ItE4rqvETbfkMSv
         PmRQbgYaqGTVdS2Gekg5dM20Gg+GUfTOm1DdMOITX0UBPQEI5Myf4+oj4HbEmnBXz53R
         NyfwnB1Gc2m+mITsUU8D4hQ8/qdDPo3o8qq2z24Gxz9b8/qxlp11N/gFMzKrHtxBVM/Y
         YT8rDr8CtDrJ8GXFPuSMfN7NHq40187f/2/pWPJ4PEUXwK9dpUpUKYOhehsAQhx2ypC+
         ltLQ==
X-Gm-Message-State: AOJu0Yxc80IAj1VnXkIXoxGbM8yKHSoq8ITQpH/myPIMyTh5zcjA0nLM
        uVgHHo81WIudYahGNVeRKN88CA==
X-Google-Smtp-Source: AGHT+IFyvQykAm9PQJ6njmwyaSXancmjEzSh1xPGqrh3Ic8O4eWUweS/0MFsMn9Oy1o/Xv/AvwWfxg==
X-Received: by 2002:a05:6512:234d:b0:4fd:fd97:a77b with SMTP id p13-20020a056512234d00b004fdfd97a77bmr9269605lfu.50.1693898308174;
        Tue, 05 Sep 2023 00:18:28 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id d9-20020aa7d689000000b005256ae8494asm6720148edr.17.2023.09.05.00.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 00:18:27 -0700 (PDT)
Message-ID: <4a140653-06c6-77d4-d336-0b04a7e6217d@linaro.org>
Date:   Tue, 5 Sep 2023 09:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7180: Add ADSP
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230905-sc7180-adsp-rproc-v1-0-dfea7699da7b@trvn.ru>
 <20230905-sc7180-adsp-rproc-v1-4-dfea7699da7b@trvn.ru>
 <7d0200c6-0a87-54fd-5909-e4076dfc0a0e@linaro.org>
In-Reply-To: <7d0200c6-0a87-54fd-5909-e4076dfc0a0e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 09:12, Krzysztof Kozlowski wrote:
>> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +					};
>> +
>> +					q6afe: apr-service@4 {
>> +						compatible = "qcom,q6afe";
>> +						reg = <APR_SVC_AFE>;
>> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +
>> +						q6afedai: dais {
>> +							compatible = "qcom,q6afe-dais";
>> +							#address-cells = <1>;
>> +							#size-cells = <0>;
> 
> You do not have any children, so drop these two. I will fix the binding.

No, address/size cells (and next comment) are correct - your board will
bring the children.

Best regards,
Krzysztof

