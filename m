Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7BC79FD28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 09:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjINHVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 03:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbjINHU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 03:20:59 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C205CF1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 00:20:55 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so506605f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694676054; x=1695280854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taIxm6eL4Mx2J2zzMyGsdIis7l49d87TRLXgpFhjd5k=;
        b=k7uXVF9bXvTEZqHpb0toZYrxewmbq9qjFB2nAFYooZ0sHeGFvfJQdIT0b8EhS8tHfz
         FShvk3WuvMElqYQ7/5uOdO4kqFcRHXeSR7FudL4XUYlqDKGLxRvj+WV4zafWyZ+iHyhx
         ZgLbPF68BjcKV6Swxo5Mt4ozDlIvgOV64+xopXTIglCSmzkGiDRkZJusTIzPTf0pfpPj
         RKFEwyadLRLTaLcK5eNSQt1qtL8eIaYf3wf15w5kzKdNt0GzdcdZzCu6ZL5p7L29yUN5
         jvoYnZDySzcyMu+vYP5A11bwSsjwigG6NuI2yWiqkh890JGdHMKd0cS/E6w6rZjR+NS3
         W+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694676054; x=1695280854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taIxm6eL4Mx2J2zzMyGsdIis7l49d87TRLXgpFhjd5k=;
        b=Le5Nbf6ZI7pkVvX4XCWgh38XkknebjbjxnSaSOwgU4teYY63G56x1A1Ig4DS2mXnXJ
         Rc3hi3HmyYAvSTFSFL4sL5iPTsJLfU924SeSDxeoDKkw68VM8GelW49prRWbfvVvj7bc
         M/WjW4CBWT+ooPalXYZFTa4Ez7EPtSq4EvC31/xxZ7dybE8rfbYRuAJqDkb9zJ7TvkRz
         7aoWiLpQWehKN4eeK/jVd7dPUenCkIKsoDE3sPcPN15eODPBDOAZCyLCYxll1/52s+gA
         EISH1Is8m+p6kZx1+7JrVKvp93OuwEjlEcmv3xX41uOVyWMIVkwjOzO1yCsAeHMmbh1w
         IHRQ==
X-Gm-Message-State: AOJu0YyelB1Al5zARfdRAIBASaHaMJFE5QQCdg30vRYZPctSH1lzgwaT
        h0Ic4F3Mfot9Ko5ypI3E9sK+WA==
X-Google-Smtp-Source: AGHT+IFOtrDzFl+9oDW4vU8GYnttUJKqkzHOZyb0l5f+lzpVsekbk/NNZ4ppoXmbhdEUUFCdfgos3w==
X-Received: by 2002:adf:f112:0:b0:31f:8547:2a59 with SMTP id r18-20020adff112000000b0031f85472a59mr4283144wro.69.1694676053680;
        Thu, 14 Sep 2023 00:20:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d5490000000b0031773a8e5c4sm930114wrv.37.2023.09.14.00.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 00:20:53 -0700 (PDT)
Message-ID: <8af594db-3f8b-617e-b558-21120e11122b@linaro.org>
Date:   Thu, 14 Sep 2023 09:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/3] dt-bindings: power: rpmpd: Add MSM8917, MSM8937
 and QM215
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230914065422.5452-1-otto.pflueger@abscue.de>
 <20230914065422.5452-2-otto.pflueger@abscue.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230914065422.5452-2-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/09/2023 08:54, Otto Pflüger wrote:
> The MSM8917, MSM8937 and QM215 SoCs have VDDCX and VDDMX power domains
> controlled in voltage level mode. Define the MSM8937 and QM215 power
> domains as aliases because these SoCs are similar to MSM8917 and may
> share some parts of the device tree.
> 
> Also add the compatibles for these SoCs to the documentation, with
> qcom,msm8937-rpmpd using qcom,msm8917-rpmpd as a fallback compatible
> because there are no known differences. QM215 is not compatible with
> these because it uses different regulators.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

