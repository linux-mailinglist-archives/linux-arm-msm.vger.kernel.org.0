Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9467BEC51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 23:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378740AbjJIVGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 17:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378689AbjJIVGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 17:06:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABBCE4
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 14:06:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c131ddfc95so62387481fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885573; x=1697490373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vKTUsS3jt/q9uog8W3h3j1F1pdGaoyiXk9H6Hdeahc=;
        b=qoo5paBdSuhxwQzbead5PeTeeqTF4AeNPC6C/bM/VGZ+noCR04iXHMy15U8C/z3gnb
         o8dMaCw4qPNOyeFyRkZYIAMgH00RbeZXttW/1sdce+EJqmBJ4dnygXm78HTEbY7z10bI
         8grNMahj4InEYVN0OyHnOKm0OVIyT6AfLfV6+QxiBE8O6xbE8bn/jOFJKHtPN+VGGWLr
         X+68imrvuuUpIZxkMZN9/Ues4xI5YJrYc6NODE4ucW8DywwPdU2J4VbmBjMZolIBQGmm
         xbVT+NoI4Bq/yHFYWdGoSy8LYvI1ecXpjsrSw62JlXvrYFcW22uT/LgR5qdLttt+f0Aq
         BT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885573; x=1697490373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vKTUsS3jt/q9uog8W3h3j1F1pdGaoyiXk9H6Hdeahc=;
        b=nzRtvjNGMaGHPImC3AVKXCVZprBQDT5DKuiCvjGPQmlCLXjtOELn0qCs9mMileZOcP
         bePcl+f69EwIhbLKWG8SfYCq9MYmJLKEKaOgZSHVOdNHrGb9pV/6e1dGFvjdu8oP78da
         mNCZHbf0kkonpriPJWnwMyqLbl7w1WVcXP0dL9II9U9Er76yrr/ijKjBEaqMdlRsHpC1
         kKpadEFGxDQv2k6vxjWIPtFfKHKNXjxZm++o3OBINSWTRUxgUkOuUcNXF99GyMom3L5/
         MLMaYf9kaxh2vVAi+QAOM4FzNerLfSwaYUDcKX3KIEGEL5Zn/EB+Iyqs4MGTLM5JPVKY
         bfvg==
X-Gm-Message-State: AOJu0Yy7m10dXOx3ATv0QSZQOt1LdhSHIPF44vdzWSWPHyohndEQmZu4
        prKG8nJyHab9WiJIGsq62xeCiQ==
X-Google-Smtp-Source: AGHT+IG/ozHt6pvCAggbUKSVRh8/+ylUdcFfhhP61eq+Dq3YRvE7aSZ6waTDkD4RLdRmJHm6EZ5QSQ==
X-Received: by 2002:a05:6512:2022:b0:503:1be5:24eb with SMTP id s2-20020a056512202200b005031be524ebmr12031818lfs.50.1696885573272;
        Mon, 09 Oct 2023 14:06:13 -0700 (PDT)
Received: from [172.30.204.90] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512390f00b004fddb0eb961sm1549081lfu.18.2023.10.09.14.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 14:06:12 -0700 (PDT)
Message-ID: <6509775a-e45f-40ce-8295-40f696819e09@linaro.org>
Date:   Mon, 9 Oct 2023 23:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pad generated DTB files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231009172717.2695854-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231009172717.2695854-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/23 19:27, Dmitry Baryshkov wrote:
> On Qualcomm platforms the bootloader populates device tree with some
> extra nodes / properties (like memory size, boot time, etc). Usually
> default padding is enough for the bootloader. But in some cases the
> board will fail to boot if there is not enough padding space.
> 
> Add `--pad 4096' to DTC_FLAGS so that all Qualcomm DTB files get this
> extra padding space.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> This is primarily necessary for SA8155P, but I have the feeling that it
> might be better to be enabled on the global scale.
> 
> ---
Every day I discover something new that makes me lose hope in this 
software stack

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

