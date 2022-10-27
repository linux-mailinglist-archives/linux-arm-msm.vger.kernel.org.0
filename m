Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA1760F8FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 15:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbiJ0NY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 09:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbiJ0NYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 09:24:53 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EEC21E28
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:24:51 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id ml12so1271406qvb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKIXqmN8fXuaXvk/V/jBOfekdmVMA/Qz1v4HcCw6xrk=;
        b=TCdV8rayNU3MKQtnjdq9vhlRCr9G/0M7wilhh3907Iimmma59PjA9ZfGh5df3LLUkB
         yG/IT6b4XW8J8fz9CJdf7cTru3geU+OsVibORIKBnDZ5IobwbD1LwhJyeqmkpsQHEFZ2
         pfGWPbYIgKvpMEXcw8barRQDiKogA+/7Nf3Sx5Ajorhr8x/diRHFS/dyOMZS558tx8Ws
         XkjS3SHdZ8x2YTeB2KkSW/xldrx/8dfe4TsFl7YmFsdr/CuLI8StNs4wyGZTjRoByXir
         OFjGirxg+N7Pw9yDsOveRfk0Y+0+lIgmbL3mLrfaUsc68pFPRGxQeyLFms+o63jl9mDN
         ROjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKIXqmN8fXuaXvk/V/jBOfekdmVMA/Qz1v4HcCw6xrk=;
        b=AHdmzfwpf1L7kE7OoycgCLh9Nf5wOof8HJi411wSAK8DVusQMT83fsSh7T3FGr4wSQ
         3CDFvM6TdWNP9C0mWEwIXQZBupr5JU6AXW1TqzVThH+yZZ8ci1473ATExEYl6UBANsBS
         t1FK8zOwaVT713GCj8i1VPDaHqf5xalaMjZFYEQ4SoL2EkrnFWhv/k1Oi01zmIyor/X+
         Zwzkh3LO8nvAQbhzdOagviBa2AyctrmkoafK5iKQuRLO/mTg74p8NbZiciSyO/kOdldo
         FccaaOD/lk1s+hdB6b7LyNM6ITmVLsmlo9yy97dt+EKtmlZof8ys5YugXYY+4VqLaHg2
         ADkQ==
X-Gm-Message-State: ACrzQf1XPoDaKGW6L1ZFNHngmcYYa+4f1BHL4gUIYuziG+eLhHsKCa/W
        Tg0ptHERKUYDs/EI9uIaYgN38w==
X-Google-Smtp-Source: AMsMyM4ZRHfn7E15uUXl94Q3NLzRptQt9ctzDaAkWZaCMz6b0Hb3yKny5hbnB21qs5Cs9thNtWfEnw==
X-Received: by 2002:a05:6214:2682:b0:4b4:8c75:2488 with SMTP id gm2-20020a056214268200b004b48c752488mr42343114qvb.88.1666877090922;
        Thu, 27 Oct 2022 06:24:50 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id 184-20020a3705c1000000b006cf3592cc20sm951037qkf.55.2022.10.27.06.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:24:50 -0700 (PDT)
Message-ID: <da796e23-56c1-6fd1-2299-2e55b965569a@linaro.org>
Date:   Thu, 27 Oct 2022 09:24:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 3/5] dt-bindings: clock: dispcc-sm8250: Add
 EDP_LINK_DIV_CLK_SRC index
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        dmitry.baryshkov@linaro.org, Jonathan Marek <jonathan@marek.ca>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
 <20221027123432.1818530-3-robert.foss@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027123432.1818530-3-robert.foss@linaro.org>
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

On 27/10/2022 08:34, Robert Foss wrote:
> Add this previously missing index, since it is supported by the SoCs
> targeted by the dispcc-sm8250 driver.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

