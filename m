Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29CD793BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239713AbjIFLuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjIFLuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:50:50 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F36CFD
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:50:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso5133852a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694001034; x=1694605834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=payyeUMA0BoLqXT6iJLBiQ/AAoK7VmcqisdCZ1nbhOk=;
        b=H0VG2zw8awzpXm2KJIZQDeMCMkrQBxy9JjNY4byaBuEntWQJVPx8u2j7VsgcALTP8Q
         Y5MzFZnBboV91GWg8CTxPi49ojmhy+2bRRJQJOIZCOQEG8qgTGZw9/3B+eIgWX0ZTRmV
         Yy5RO66D2QINlrxBqvuQ809P0VLF0xEIukR2V08jdPjpcEe6wJq08d7K3q+hQ5x63p0h
         NDpiT7Ne/Xco47rioNjxgSaxog5pzivCsvNFSvncTH26PwdMHLGM7dOIUmxMrgOJPkfk
         3Ccy5wM6DGaHTz9Z/QPSTqGRhop/QSzV5MY7ATHV9JlDQFK1yEN837A/2G7QrjzWu9ES
         n4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001034; x=1694605834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=payyeUMA0BoLqXT6iJLBiQ/AAoK7VmcqisdCZ1nbhOk=;
        b=FeOpjZW0txkRXjFXc9os+J5v9toEGDKgAJLcU9WK885cBJQg5v4za3VzrntR+I1lOt
         kJzzpU5zx8JvFoLCJnvM7guiuYiGc5gaJtpn05AqRO9/L6phPor1lfFpCxcLKiWijN7P
         5r968nf4REHq4mtlsX6QDAL3EiUdcMplUmAZbMxnc0qCiVAvOzrgaYU77cS8e54miwXw
         m+Hg7DKJ4NOHuPzn0rkWW08ArbAV5UD9towpuRatZ+xeorjLAw/wYAGot+geVAKiir9w
         89euYLx5iOQrxzkc+fRLwFyfnhQQF3hY1ekzgzaVpoABivglYJr/8h4yl+fvqyi/dk+j
         3VcQ==
X-Gm-Message-State: AOJu0Yw6k5JCP95aMORPB3uT4cnbT9tOdaG9DeWa000JiaSqgWYPr9BC
        PnJeyMRdqqZTmkunWdBWr6hHlw==
X-Google-Smtp-Source: AGHT+IHyvzK6olU8wJRmdfT+yxix5FrHtH2kKgPN8F5vhkQibpqC6rdQyQ9O5tWFN4oWDGk6CEMvKw==
X-Received: by 2002:a17:907:a046:b0:9a5:c8ad:20c1 with SMTP id gz6-20020a170907a04600b009a5c8ad20c1mr2245314ejc.9.1694001034086;
        Wed, 06 Sep 2023 04:50:34 -0700 (PDT)
Received: from [192.168.37.154] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170907984300b00992b2c55c67sm8887258ejc.156.2023.09.06.04.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:50:33 -0700 (PDT)
Message-ID: <91f74079-1be3-4c66-9942-cb02c96c8848@linaro.org>
Date:   Wed, 6 Sep 2023 13:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-mtp: use correct UFS supply
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
 <9c7fae56-85a2-4691-8192-24237761d25c@linaro.org>
 <fe346849-cd0f-aee5-9ab9-ea581025329b@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <fe346849-cd0f-aee5-9ab9-ea581025329b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.09.2023 13:39, Krzysztof Kozlowski wrote:
> On 06/09/2023 13:28, Konrad Dybcio wrote:
>> On 6.09.2023 12:47, Krzysztof Kozlowski wrote:
>>> According to schematics the VCCQ2 supply is not connected and the L3G
>>> regulator instead powers up the controller pads (VDD_PX10).  Use correct
>>> supply vdd-hba and drop unsupported current limit for the vdd-hba.
>> Why is it unsupported?
> 
> Maybe I was here not precise. I move the regulator from vccq2 to
> vdd-hba. vccq2 has control of current in UFS core driver. Bindings also
> allow it.
Looks like the bindings are out of sync with the driver.

ufshcd_populate_vreg() which parses current is used for both vccq2
and vdd-hba.

Konrad
