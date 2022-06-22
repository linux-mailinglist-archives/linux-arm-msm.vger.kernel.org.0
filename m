Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94960554475
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 10:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354289AbiFVICl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351684AbiFVICk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:02:40 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D0537A8F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:02:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so4345762wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=m863z0pgWMZqiS8zLvuIC/ZbrigTpOaSH5CDWyLnu/I=;
        b=jpiD1Cv93PTPRpfRT6QQv3Izru048qNqQsp514pPfQ9QtAtZW9rEH9h4cz7TZtuGlc
         AAEO/bZWKPXFXieaJk5XvTGRYAB7R9jxBmTcdU75m16U5FpUeJk446EQK26yi5gDrbE5
         BHet2i0KJKePeaFyt+5J+6gy0PgBMdjl/w8Ym8h8Wf4f7VQHrJ5TB8hLRlUcjwQkxAKm
         pUzrj/bKagvRh/NrLGCI9Z4BQ5WZtH2pYbKWVXCiirv9Up0SriPaDdaGbTzMrI8OGvwh
         JpoJUJ0E4Tdmw+nQtEOZAyD2/4v5gLrPjgzKWkx+d5qlF7pn5lH1vhbttiIXNEqadqFb
         kIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=m863z0pgWMZqiS8zLvuIC/ZbrigTpOaSH5CDWyLnu/I=;
        b=lxbO3SWWsKKrDxkWVTDBEPJqQisNHjUUTrer+mo/kw74/L+1P8Hwfmzwb23Ty7ZZMf
         p6Fpbk9fEaB6Eu9+shfpMDWXxCOooPwMVBctxZNtevRmqBa3fERWB4pKE7zdkeLZogJi
         WCVDlUxzppvSPngGfOr98GyU3KKyLFHwmSiPlVHlxcwt9RJJv93D/14cj1zgOkTbFpzS
         uEUiI6kh7xENhvyfAmxASJLqM2khgOdHo2I4Dr41PVhWcflD4T2OlkEoyUASPqAxpr9Q
         0SQyFBJprifqnd+qvxnLwDe2VNYE9zoW/akWQBvXMA38DzleD7jHxE+fTaNFChGiLdvE
         DLaw==
X-Gm-Message-State: AJIora8UL5zdGUVIgRZYFtdPqxrZi3XltD6q/sM1Os1sqXHQr0rzulBs
        HrI05pkhNFAdq3Q4d4APNAhDGw==
X-Google-Smtp-Source: AGRyM1vd91Id0y+PwjJQkEJRyS0YCzLfSoMbi9ZYYYNQ3pflBLh8T3fqS5OLwnS21TKB0bX8qm8g0Q==
X-Received: by 2002:a7b:c1d1:0:b0:39c:605c:1530 with SMTP id a17-20020a7bc1d1000000b0039c605c1530mr2498931wmj.80.1655884957569;
        Wed, 22 Jun 2022 01:02:37 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c359300b0039c54bb28f2sm21720775wmq.36.2022.06.22.01.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:02:37 -0700 (PDT)
Message-ID: <320422f3-3873-341a-55a1-6892a7d7cd87@linaro.org>
Date:   Wed, 22 Jun 2022 10:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/6] ARM: dts: qcom: use dedicated QFPROM compatibles
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
 <20220505113802.243301-2-krzysztof.kozlowski@linaro.org>
 <a0dbea42-7a6b-142b-17a0-c819040b7129@linaro.org>
In-Reply-To: <a0dbea42-7a6b-142b-17a0-c819040b7129@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 21:11, Krzysztof Kozlowski wrote:
> On 05/05/2022 13:37, Krzysztof Kozlowski wrote:
>> Use dedicated compatibles for QFPROM on APQ8064, IPQ8064 and MSM9874,
>> which is expected by the bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
>>  arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
>>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 +-
>>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
> 
> I'll take the bindings (patch #1) but what about DTS here? Any comments?

Then I assume there is no problem me taking it.


Best regards,
Krzysztof
