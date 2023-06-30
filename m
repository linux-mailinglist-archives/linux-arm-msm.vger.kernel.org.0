Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADA0743761
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbjF3Ifq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjF3Ifd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:35:33 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645A03A87
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:35:26 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1b060bce5b0so1476309fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688114125; x=1690706125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1Gp5Gg4BNunXsleMrsnw5ZYlJcOJJdlLO0f4lwUvf4=;
        b=Xrs9VFWohqyU/H8LwH8zZ3T5PJKsE4qUa3nULVa/uzwCY3jburveYZTEQGU4h2OdVi
         2gpznjZeJwZ+mFFYBwJ0DuOwGEnxevyhmtLIj3blRjllRP2SefPyXkWFsyjYV3Hm2vSg
         zlffKwvxP2wyofstAyEnWxEDKW3X/n+QDpZrLL6dy4BOFhzijd7OCF9tEsdZMjaSKRWQ
         DRvbj0i2QDuKvdaYibY11rt1Q87SAy+LUHvraBoa5i1Emc/eb2Rjc4I7PwiArtUP8Ufy
         gYP88iMeno5kWSJ7doGeZLv0z0fzsjGAOpLsx6/tAlrndvy6WOdHzmUz8eH2sIPBfZX6
         1s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114125; x=1690706125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1Gp5Gg4BNunXsleMrsnw5ZYlJcOJJdlLO0f4lwUvf4=;
        b=lrlaMe04E9AFmynAeGsDeIZDqc88we97kjkDxCyEsVJWd5zjZG2gcwN1sjAVGKSkK1
         A27ZBWyM5ND0YuK++H/+T23QDNSgb9UvK+NyPS4eOriG3EUdL5fKecvTgmnV+UKDeY5K
         k8P4jyoXvUvhx/TC2zV6igwCW0T7epR1NTwpIK+6DKMk3lGfn4w56XcpR3aY3MNmL0lC
         QXMQP2W+5gMabuL/FqJAT3oTHbB9VCm4+/o2ufBaxCxmB2gDUklsSJvbtvTp/nCKyISb
         +iT2o6a5gSUa4ibHm7Rg1HnL1CIw9AvakLMHwzBIfinlXTSjvJtLEyIYWRtOcL2WzVDa
         0bwg==
X-Gm-Message-State: ABy/qLbnHmo4y1NPCA/vWP5nsLhRqfVer7ZtEAHi747ocnmqYKCf0YLA
        Vej5TqItK3j1vByPSmrPQTNkLQ==
X-Google-Smtp-Source: ACHHUZ41dWBdoUrDVQNrZIPi2FWG8gSP1Rq8A5pKSjChQLo4+ZXNFCQAZ1VAvbvoSvq0q3MAE0kRvQ==
X-Received: by 2002:a05:6871:8a2:b0:1b0:38f1:841d with SMTP id r34-20020a05687108a200b001b038f1841dmr2814289oaq.45.1688114125620;
        Fri, 30 Jun 2023 01:35:25 -0700 (PDT)
Received: from [192.168.1.4] ([223.233.68.54])
        by smtp.gmail.com with ESMTPSA id jx15-20020a17090b46cf00b00262e914169csm8495370pjb.12.2023.06.30.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:35:25 -0700 (PDT)
Message-ID: <2dcfd994-2729-8780-a7aa-9a051d2fa047@linaro.org>
Date:   Fri, 30 Jun 2023 14:05:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v8 02/11] dt-bindings: dma: Increase iommu maxItems for
 BAM DMA
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
 <20230526192210.3146896-3-bhupesh.sharma@linaro.org>
 <27b85110-9eb8-84dc-17a9-908e312e2e22@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <27b85110-9eb8-84dc-17a9-908e312e2e22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 6/18/23 2:09 PM, Krzysztof Kozlowski wrote:
> On 26/05/2023 21:22, Bhupesh Sharma wrote:
>> Since SM8450 BAM DMA engine supports five iommu entries,
>> increase the maxItems in the iommu property section, without
>> which 'dtbs_check' reports the following error:
>>
>>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb:
>>      dma-controller@1dc4000: iommus: is too long
> 
> Also, please drop error message, because it is not true. The files do
> not have such device node, so you cannot have such warning.
> 
> Please rewrite the commit msg to explain that certain devices, e.g.
> sm8250, use more iommus.

I have sent a v9 (which can be seen here: 
<https://lore.kernel.org/linux-arm-msm/20230630082230.2264698-1-bhupesh.sharma@linaro.org/>), 
which addresses your review comments shared on v8.

Please help review.

Thanks,
Bhupesh
