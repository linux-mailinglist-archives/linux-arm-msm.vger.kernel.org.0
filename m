Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DF96078B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 15:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJUNmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 09:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbiJUNmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 09:42:23 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7972527C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 06:42:19 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id p11so1794730qvr.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSSKAbFidtN+JuP6esBpkcx5JT2iYAaDI4sbSOLtKiY=;
        b=nJTj3nEcSrpxLbSFde7UT1KRIaocFjAQvt/7hgYtpBsi963etkFaNDfA4lSQAoTcmT
         fYuNoNAVWvgpu5hGOqHy+83BPu+2BgYotRR7DFIg20yqlqUeWxuE4/imxbnFteP4Z6UO
         HThN5xbXReii3DnQGrPY4rWEw+42mxkvBPwxJDR2P98UGtyRbIL/mTxc/w0tyeyD7Pmn
         08rtKxw7Ji3qjb45g5H7u1XQ5QG4crD03JWvkz6bJmSGZfQrBczmjbUs8WJmC2fckgII
         tixAtn2DKLCvp7X2G/6acX/HcCrOFtO0I4NAUqfKQKKlFqXgh/rZLP1EZ3KzluQPB9cP
         PCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSSKAbFidtN+JuP6esBpkcx5JT2iYAaDI4sbSOLtKiY=;
        b=FToRDw0oFCQpYajrqoirmcFvHCATDlNRK8HnvlfFRVp7p5DZ5cOp3n9iYUs1LhMcII
         vvEcmMv2nhOpQqlOjSDWAHPXQjYL0yX2RykVnwdwzDKwjRfV4A8wZyOhlTS9fetAt2GG
         4ZsuhNNiuFjx9TD2PfgOjBen1I22530RoDmNMJwhAEOTokh786Zafp0g8WuwIxKyNo7R
         MWib8vFXY30bLoluslB+yGloThsjEC8OTN25loHvVT0fy7+35nb9vQ0O60B8ublYvQfB
         h0MPU9uYAg92W4SAesNMGLisyJ8ukiTaOJyYEDiwrJifSRr4+CNLMk9NuxHMoareaul9
         304w==
X-Gm-Message-State: ACrzQf0o0cWTmobeBJIOZR5feFmKDp+dfL9RhlIuRX1SfUrVDxesmGtl
        b6k/UngCFVNoLPv7Y6kdx+gyRlGa5y2XbA==
X-Google-Smtp-Source: AMsMyM4Vcxg7MVFIpTWQU1GxWzjtFkF8Yb5+716oUkVhod5UbyMBDqc31ZOscBoqkLBkomECOw3R/A==
X-Received: by 2002:ad4:4ee2:0:b0:4b1:a6ac:83e1 with SMTP id dv2-20020ad44ee2000000b004b1a6ac83e1mr16847734qvb.20.1666359738683;
        Fri, 21 Oct 2022 06:42:18 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id bc11-20020a05622a1ccb00b0039a372fbaa5sm8003978qtb.69.2022.10.21.06.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:42:17 -0700 (PDT)
Message-ID: <76eca66c-5449-a125-23eb-c872324f321b@linaro.org>
Date:   Fri, 21 Oct 2022 09:42:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 02/11] arm: dts: qcom: mdm9615*: add
 SPDX-License-Identifier
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-2-dac2dfaac703@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-2-dac2dfaac703@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/10/2022 05:06, Neil Armstrong wrote:
> Replace the license blob by a clean SPDX-License-Identifier with GPL2+
> or MIT even if X11 is specified in the original blob since the actual
> license text corresponds to a MIT license.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

