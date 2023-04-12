Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707046DEC33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 09:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjDLHDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 03:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjDLHDi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 03:03:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E514659D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 00:03:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gb34so26480238ejc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681283013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LzhE8XDEHN0mE13t9qLmnorPLOmISq2GFATJ1xxmIA=;
        b=wRXFdRpdUxWsWOIZg8dikxSelGtuZLguzJn0hWsvIqkcFUtUQziNMcdzRVnTvDTqeH
         FW97zIGDOupJLwsBG7wu+16HugtpMfJRuA63ySfBOo4QmMoOkFtLl4x0zG2pkePAmFaV
         7MEYu/rYKgOjBgAdbqIhB6ZtzbSjMzMxwfH8rukdAsUdcD9n6oEXLe6cNtYH2batotpL
         ZmvjAlvxfaR72zcfG8GQHB1X2DfsUFRKq97vnojoTMJBdbhSzU80rOImxi0TVMB4WPhC
         SDDiT/qAngGcUhRjz7IrBjlGrwCwECBL+tGp1M7arv9qV/kTK09sfPeEDTeZA52Bo653
         DTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681283013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LzhE8XDEHN0mE13t9qLmnorPLOmISq2GFATJ1xxmIA=;
        b=xh6zBTgUlbJ5GJithVuDXkRTmp5koU5y0dwtxkZ1GiASj1P9dlb7hZYUWRSR/AGV/p
         g7GKVCcYHoIcS7YWXrMZwnHEAb+Epu+CALXT1RYd0yhE393UDg85D3zOW7AopPX1+PLs
         Yqq9YVJCbVYr5IGAVIb7wiuhRH09tUf6+1VjfVLNAVKvfJ7XwY9EZkvPLTCn0Ozvby26
         1hDoamexC0Rh6lqz4LLg/czA+RvJG2dcROjwzovCOKBPiK8nH4hIboMqXsMEhVVR86FW
         ZDCfNGBtkqDe1ETJi25qSSs+4oKSb/7tw83A+0jp3kh319klXsqcOxQ4Is8M5AFVHpdh
         thOg==
X-Gm-Message-State: AAQBX9fbDKbn0oRxmaK0+662sFhKb7iLXv5vbztPdEgfqp15nVg5ZTSv
        5lm91NfL7oAWbUzofJZCbhc1CQ==
X-Google-Smtp-Source: AKy350bQSyb2tXwMQt2uxDvqWUUDBrt1x3Jjs+y34xcL4WKJrFQcvNsAaagC6xcfspRReV6mU5rwUQ==
X-Received: by 2002:a17:906:2e85:b0:94d:a2c2:9aeb with SMTP id o5-20020a1709062e8500b0094da2c29aebmr6032088eji.49.1681283013345;
        Wed, 12 Apr 2023 00:03:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906319800b008e9c79ff14csm6864614ejy.96.2023.04.12.00.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 00:03:32 -0700 (PDT)
Message-ID: <15e1d05f-b7e1-27bc-7363-aefd2d155eea@linaro.org>
Date:   Wed, 12 Apr 2023 09:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-lenovo-thinkpad: correct pin
 drive-strength
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230407180710.128815-1-krzysztof.kozlowski@linaro.org>
 <ZDVtXkCON8DFUDjh@hovoldconsulting.com>
 <887eb9f6-9882-37c6-4332-ddae7a354187@linaro.org>
 <ZDZUiW+74rhhRAfS@hovoldconsulting.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZDZUiW+74rhhRAfS@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2023 08:49, Johan Hovold wrote:
> On Tue, Apr 11, 2023 at 06:58:33PM +0200, Krzysztof Kozlowski wrote:
>> On 11/04/2023 16:23, Johan Hovold wrote:
>>> On Fri, Apr 07, 2023 at 08:07:10PM +0200, Krzysztof Kozlowski wrote:
>>>> Fix typo in drive-strength property name.
>>>
>>> In the future, please try to use the established commit-summary prefix.
>>> In this case:
>>>
>>> 	arm64: dts: qcom: sc8280xp-x13s:
>>
>> Sure.
>>
>> commit ca1ce7207e53cfe69aee5002eb3795069668da53
>> Author: Johan Hovold <johan+linaro@kernel.org>
>> Date:   Fri Aug 5 11:23:17 2022 +0200
>>
>>     arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add alternate touchpad
> 
> Yeah, we initially used a longer prefix (including "x13s" which was
> missing in the Subject of this patch), but quite soon decided on using
> the shorter
> 
> 	arm64: dts: qcom: sc8280xp-x13s:
> 
> instead.

Thanks. Do you know if this rule applies to other long-names? I was
usually keeping full name or shortening them by cutting end, but maybe I
should cut the middle?

sm8250-sony-xperia-edo-pdx206
sm8250-sony-xperia-edo
sm8250-pdx206

Best regards,
Krzysztof

