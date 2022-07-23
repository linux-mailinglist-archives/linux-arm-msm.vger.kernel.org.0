Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9957F0CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 19:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237628AbiGWRtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 13:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237240AbiGWRtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 13:49:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBE81F607
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:49:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y11so12209226lfs.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3WvhIh/bRaogkR+V5wEnXmkMdkRVdBNsY2erUf6SfCw=;
        b=KLNcDQXRrBybFG8VEBcJF0pSEIFy6VuBLkNOhJ6RO9D/JV6tC1kS29CgaNFF3tUq2d
         etKvTfiJQgUxCnukAAz2I1IDrReOHFBV9CYX4v92bk/V4/zTOXwBtZGRT7LVyu6b8Tl2
         sikWSkHUQRpn6pW/TAqG5xtuGHCiM+jMsYZLvq70/H0wdNPvezf7kRlFadV3Tbq9wORN
         FeQ6SAxMelZBozoJSC7z3zBAFtGRxA0HN6R1dLL/ENk4E9hfD6ntogFP+Tj8UsJIcQlb
         DO434UmR7bQ2KT0us7mJZlvrAW2ySA0lpEqtBhdpmJwnQHxsk/2COnr3M6awQhoQqxgE
         P8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3WvhIh/bRaogkR+V5wEnXmkMdkRVdBNsY2erUf6SfCw=;
        b=jHb4u1zhaOM6ETlG1PNiT2ae16//AN/meoE2FM+KzfL7/IC876GM5YSKEgjnXI3o1a
         kMgssYLJqNycwS7oAicuqSUu6QWUt2SA6+/tuCRW4IjXN7n5NMLuJJNbtqPUX+l0+F5A
         W0WQOigaiHdAKad2XyPf0qwacYeVZzSTmBaYu3NQBty8SEs07zsDhbbIG0ITTUgfa1lP
         iK0GJMVi43mAShmGxMHQ7/up023CHwvqiBBQOpFfiDZ4ak/6xGtGkzqYaooUqoilRDrE
         QVKnlWE9VMtblfGs1rYXRg0rTIHv8n5I/GEUv3xTcK42HMKibzRmas14wb+ennMl3Gg7
         9Oeg==
X-Gm-Message-State: AJIora/S7RoTUQR59UOOxuakLLlaBfVwgCoE+BtDdlhbev2nZ3aM9MpJ
        1yndkuhAVrfF5JVkNEuk8OY2/Q==
X-Google-Smtp-Source: AGRyM1sl3JYeLHur2ZAmMDmY8dWer+ZIK1ui6a9+vZol8JLb4s6rFjzmFJbsXgVmKrBm9qjort4AZQ==
X-Received: by 2002:a05:6512:13a3:b0:486:e7fb:c4f2 with SMTP id p35-20020a05651213a300b00486e7fbc4f2mr1970563lfa.175.1658598552406;
        Sat, 23 Jul 2022 10:49:12 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id k11-20020ac257cb000000b0047255d211c7sm362132lfo.246.2022.07.23.10.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:49:11 -0700 (PDT)
Message-ID: <ee2aaa0e-d14d-4d71-81d9-cbb297f34d45@linaro.org>
Date:   Sat, 23 Jul 2022 19:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: stop describing individual
 boards
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <20220723090942.1637676-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723090942.1637676-2-dmitry.baryshkov@linaro.org>
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

On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> Describing each compatible board in DT schema seems wrong to me. It
> means that each new board is incompatible by default, until added to the
> DT schema. If any of the vendors for whatever reasons tries to validate
> their new device's DT, they will be stuck with it being incompatible
> with arm/qcom.yaml until the file is expanded to include such devices.
> 
> Rework simple cases by dropping individual board compatible strings and
> replacing them with the empty schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/arm/qcom.yaml         | 203 ++++--------------
>  1 file changed, 39 insertions(+), 164 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index fb1d00bcc847..d4d945a43178 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -107,60 +107,39 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - enum:
> -              - qcom,apq8016-sbc
> +          - {}
>            - const: qcom,apq8016
>  

No, this removes documentation of compatibles thus removes part
documenting the ABI.


Best regards,
Krzysztof
