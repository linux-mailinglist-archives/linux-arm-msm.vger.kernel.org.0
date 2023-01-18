Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6730E671BAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 13:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjARMPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 07:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjARMPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 07:15:20 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3625656E2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:35:49 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso1183131wmc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6Ndbj16TIZmtNw6BmwboGu9eKIrdjGHAGvmQw8N4Y8=;
        b=P8H37d4pf97MS8V5za+szmMn1Y9ePHQKn8visj69s5QkfEUHcqGAnFQqMkCkEjxuHF
         vsD7Uqgl6AM78a7CY0EsJQ9AemAAnuz0QxCEfP7BHM7IU+YEv4D38FV7/HA9/LOjp09+
         9KUWPinPw3DVtG4wh+1Apwh4l2hrzBilaA9rNxksxalcYTcGs1TDpSVESf4cxCLJM1Vw
         D1nqncfFeKStXxgyRdJ7X0TjbhsGBqPzvtlXffsCuOIEi+4YdEyftEDArHYX/fHfmNhn
         Wk14V3A4Y7mz7r4o/Xj2pRsuhsMgvKmK7GSitwDjrBNO7b+HWplT68OEyIkf7q+o2aWm
         a/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Ndbj16TIZmtNw6BmwboGu9eKIrdjGHAGvmQw8N4Y8=;
        b=GuvgEh7iJEInwb8281WgVkMc1t1j4fORnd2FH05aNNHPjaclEtjgGeKtdiuhSo6SLI
         BOlzTDK6h73zzSypPlys3OOTvVcUnLda8SuA6vAFYU2PlhaLyU5G5+zuLwEcCDS80a3L
         FRT5c57qVY3cOfINnOr9P3CaOYvdK3NyRuPNjk/t2AJ6ueMK+bQsUay/ZNcnsdjmJ/Cg
         T/u06gGoTD7hguXayO3yp9em6By8Ts2AWLLQyAX55LMhUSaIIsRZOrvp60OpVptNYYZ7
         hTkQHNmm6ZyqvjveqO6iVTa423xXBKj0mK/liTcMQ7/FK/StClCOxTmSZo314aIpzLeL
         cekA==
X-Gm-Message-State: AFqh2krdeFnEOlT3fCtln495GntGDJC+kgADJDhTZBQwjMzNtxnQAPoF
        q1lJEex8kedEP8Y0HkN+vj/AZA==
X-Google-Smtp-Source: AMrXdXviNPoHp2tXGasKlh3ppYM7jRdIFLAEgMkjDroB+Oi/uChijAvpTMZMjFDkyXxQQUFiIYBy9Q==
X-Received: by 2002:a05:600c:5545:b0:3d9:f806:2d26 with SMTP id iz5-20020a05600c554500b003d9f8062d26mr6721236wmb.7.1674041747623;
        Wed, 18 Jan 2023 03:35:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003c6f8d30e40sm1844839wms.31.2023.01.18.03.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:35:46 -0800 (PST)
Message-ID: <722d14ac-dc4a-acee-0b36-2a3b475754bb@linaro.org>
Date:   Wed, 18 Jan 2023 12:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117225824.1552604-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 23:58, Dmitry Baryshkov wrote:
> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
> between two CPU clusters. The CBF clock should follow the CPU
> frequencies to provide enough bandwidth between clusters. Thus a single
> driver implements both a clock and an interconnect to set the clock
> rate.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

