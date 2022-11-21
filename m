Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63FB63252C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 15:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiKUOLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 09:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiKUOKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 09:10:53 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887EA111A
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 06:07:31 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d20so14567571ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djRHmBukKstiuYNqNkBJ087KSGKz5gsNDoOKPXzoyGI=;
        b=Vq4n8sEk3X7zXCunG8wrGWxC2P0GMkYwKRf67UcVymusPtKeJ9HMX6HVArVvcZ9JJU
         gq6P2N8JuXgbc1BYS2NzltLn4ByOnf70TDsXkNs6ht/w9E+AtcY4NZsU4RviZ4JO5d3T
         smuQBAPS2pbas6N1Qe8O3CS03WOibQQTFAZAOdmmUFWoyJNOUOezKVXiM/lPLLziVzko
         JERL6g3ycPPuBy8uYRJC88quMsYTFTMimvdSdmJvOGzTTxXsh4006ZpB0CNS5F5uBQoV
         p33k2d13c+NbpVXiKWSlilTsv3GV5aym1iDQHcxMLpJ4gGuq6xIqZdQCpb/Bpdf1O6JF
         wdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djRHmBukKstiuYNqNkBJ087KSGKz5gsNDoOKPXzoyGI=;
        b=ui4MaeFbkxUiAyfCyEzIGEOdRzY0hoxkrFUkJ4F0Lxpcgvq3psk6iuMAZDWLrDcth5
         PxxRXvyMLt48pIS6cWJeYpK5iaKyc0ZQ4iqKeyIkG5JO8+eNKwe+chyMAMxw/KEB68fI
         lRb8vQ6MFGDtXuTqdJ4FraCI7rVwtFCHq0C6+DiKLVa38DYOHuNoJwPN2J6YoIIt0SgI
         T5s4eg/kZEVSPmbU5oIausDArGBDsQ35wr8tPVDgMTLAMAnuGU2eqZrrdY/RQaBKIWlO
         myOFKvwPZY1hBujRNrG3uHc2Jt+VGHnDiIZPgSbcL7IC2F6mh4bg4rfpunZpwGmzgn+U
         a3BA==
X-Gm-Message-State: ANoB5pn23dbzDIw52hOP+XNgkLkvZbwYGnQHtD4S4dYiGbvy6t78URmI
        SnPYtqqQzzTUIfw49yVp9fn/eA==
X-Google-Smtp-Source: AA0mqf545E8HWL6+SWv7of49yPT7WdBJYQRXCb01GBzalOnfurtK6peAdsw/1IMr6qoLvpWyp8SqmQ==
X-Received: by 2002:a2e:a4b6:0:b0:277:34a:f656 with SMTP id g22-20020a2ea4b6000000b00277034af656mr6276080ljm.78.1669039649923;
        Mon, 21 Nov 2022 06:07:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y23-20020ac24477000000b004b4ad5ee601sm2061431lfl.255.2022.11.21.06.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 06:07:29 -0800 (PST)
Message-ID: <6584d47e-e26d-614f-8dce-c2b79161ebba@linaro.org>
Date:   Mon, 21 Nov 2022 15:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-x13s: Add soundcard
 support
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221121130403.161817-1-srinivas.kandagatla@linaro.org>
 <20221121130403.161817-4-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121130403.161817-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/11/2022 14:04, Srinivas Kandagatla wrote:
> Add support for SoundCard on X13s. This patch adds support for Headset
> Playback, record and 2 DMICs on the Panel along with the regulators
> required for powering up the LPASS codecs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

