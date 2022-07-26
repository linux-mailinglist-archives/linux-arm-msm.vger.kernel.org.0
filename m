Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCDE581861
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234044AbiGZRaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbiGZRaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:30:18 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6186FB7C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:30:16 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r14so17258564ljp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=i5XyBug1h7Oxv4CKlaalFltAR+iBWMVRtKUvuxm3XZw=;
        b=QODiih/k4aANBRXKxjGqTQnWG3XiMdmVLBda9fbRVehQfCsP/ztSCv1ihizFygFfEC
         8Jmo2SIxldx4vcJe6pO/7JURkfqa1weVg6uLxHCISPaIH+jmAM1ZpmaNTVpogtGKUw2c
         FkoynCDiUl+Zk0obDARAAnrwEfyOrkh7i/9NV7sUHyRhge6qcyxF1//npWHDq200PfBA
         Nlg0AxEMLIv79fyUBAedfyZEop33zrpvwOk2xIT3ovbTcGRFSuQYy9IlVaBqgqsWf8qJ
         npCCyhYgC13Otb450STiDY2fOZYaeOP0Xkl7KuhnfSOnDK0KhbZHjXzoVjcDYhcCiPOy
         0n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i5XyBug1h7Oxv4CKlaalFltAR+iBWMVRtKUvuxm3XZw=;
        b=gB5PxY93E5ucCV62OefrQwb+sa9rnmUiWvxJrIMSEMh2fF2Ffh6wn8qNGP+Cuv1Jx4
         utn9fkKke/YMuu0VcXatsCXyn/sFF5prWAvya9fdBLLkElJx6SWWvHe1Zb3HRJz7Z9t7
         e4oQ+JtYi9yHhC9AouqIIPByBrN0LzjJYkB56HHkeI0lvvhGQEdbOEmGtbsrMZwV2Cvl
         cPVrOlpsYuIOU3mjOqu8y/EPkRVOkoGS188CkFy++894RX0ZQogqxy8Me88SdBVzlvRw
         EPpLRPPzlEbWD2X70I6NC2W8jBX7i4phO8avsIUVYFUceek3/fvqEW5KITeD4EISsrI9
         iMxQ==
X-Gm-Message-State: AJIora+GSxoMFwupJqjZKumFlE/J9A/4JryejcU0IHnKjueOIOlsz9Xg
        259hSBxr6rw3Qk67rNc3fhcGMg==
X-Google-Smtp-Source: AGRyM1spkPPzWZpgibFcexA+GSxXSnYVEEpyJxs/YstHTsPt7j4hR0szRYGMpCKiAiehG4A6oQzVYQ==
X-Received: by 2002:a05:651c:b28:b0:25d:6a99:e978 with SMTP id b40-20020a05651c0b2800b0025d6a99e978mr6828855ljr.82.1658856614643;
        Tue, 26 Jul 2022 10:30:14 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f10-20020a19dc4a000000b0048a973870a0sm854423lfj.132.2022.07.26.10.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 10:30:14 -0700 (PDT)
Message-ID: <a9356472-0fef-d500-837c-ad6d9ed27b94@linaro.org>
Date:   Tue, 26 Jul 2022 19:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/5] ARM: qcom_defconfig: enable more Qualcomm drivers
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org>
 <20220726150609.140472-2-krzysztof.kozlowski@linaro.org>
 <CAA8EJppMNUV0eEF7BV6=7RgQK_XUEsqcLpmf_zu0XjSRLTLQ6w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppMNUV0eEF7BV6=7RgQK_XUEsqcLpmf_zu0XjSRLTLQ6w@mail.gmail.com>
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

On 26/07/2022 18:49, Dmitry Baryshkov wrote:
> On Tue, 26 Jul 2022 at 18:06, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Enable Qualcomm drivers:
>> 1. socinfo driver to provide some basic information about the
>>    SoC being used.
>> 2. Remote filesystem memory driver (used in MSM8974).
>> 3. RPM Power domain (used in MSM8226).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm/configs/qcom_defconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
>> index 5cd935ee148a..f02448187eac 100644
>> --- a/arch/arm/configs/qcom_defconfig
>> +++ b/arch/arm/configs/qcom_defconfig
>> @@ -247,12 +247,15 @@ CONFIG_QCOM_COMMAND_DB=y
>>  CONFIG_QCOM_GSBI=y
>>  CONFIG_QCOM_OCMEM=y
>>  CONFIG_QCOM_PM=y
>> +CONFIG_QCOM_RMTFS_MEM=y
>> +CONFIG_QCOM_RPMPD=y
>>  CONFIG_QCOM_SMEM=y
>>  CONFIG_QCOM_SMD_RPM=y
>>  CONFIG_QCOM_SMP2P=y
>>  CONFIG_QCOM_SMSM=y
>>  CONFIG_QCOM_RPMH=y
>>  CONFIG_QCOM_RPMHPD=y
>> +CONFIG_QCOM_SOCINFO=y
> 
> please add:
> CONFIG_QCOM_STATS=y

I was considering it, but it seems none of ARMv7 DTS use it.

Best regards,
Krzysztof
