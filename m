Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13BA66B3C1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 11:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjCJKat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 05:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjCJKal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 05:30:41 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B3FF63BD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 02:30:31 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bw19so4550128wrb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 02:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678444230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxv6k2m01S32PDt4BN/C36/MZsZ/J+NM4VfP3nQvMg4=;
        b=SlTWL4L0m5jOOnZ4iFyCezkGL2cAR14NfQCNlmyaLc1uHXrskzsL6M9bb9Rge8KoHj
         kArZ6JiN6jj7L4jMS1Gob05b3m/2AXp4bDdgZrs2xgbiVPMg3JqCoX59RMGTehpokn/R
         xl353Tar+L7RVR6N5knSp8G0fR7neIH1v6LUMAL09Y9RaAhvOlv/SzLINTsC9dUnafKP
         j3Kysmgy5eCueKKGI2gWpmMJ7Wlwzf6sOGzWNY9UiEtf4hjJYrctwjJUYGscDnXSSMR0
         FrXBWPaZ+geBZrbO/guQW88ThmU1sewjWKmbSFm5QCtFXjTlgDrJKYhn2BNYRXW+hqgk
         Kc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxv6k2m01S32PDt4BN/C36/MZsZ/J+NM4VfP3nQvMg4=;
        b=iOGXK065qB4URID3wAX2SGwFqJ8iKGofKi8AGFqVnum2ZT4fDfKB2d1gSvJiZUoQAO
         qidiQC4J/w6+ikpwoTDpS3Kgh0TyIOh/V1qKC5SHKozTBJmd80BlQ9KEeh2G2ZzyE++r
         TzFMoXbTHc48qzCc9e/Msexwunv2z6eC4kG0+TqgMgjYT2xPtNBVHUflG0Q4ogvF6JMf
         j5nGJ4sKLgjjB9/BfUOV+0yIt045POONG1YNFhZvI7bBSnh3HhlBzWeiuwwngtsus54E
         qY/lrMYViqOSYuM5F3RVggKGgkgWwbdnz9TRs9FiKSBEgdoG+txj5pK7K19SmEs1fwR8
         awag==
X-Gm-Message-State: AO0yUKXTHwfO/IctXJ637HVQn1/s6dLzcIstAqo83PikDNq2+KAVyBpd
        JJbl4W8p/yRZzu/zY0SO00Za5Q==
X-Google-Smtp-Source: AK7set/owklYqi8JaLfBaL4oU2puy9p5Cxw1Btjq94yL6Is5jHVg4Bma7PZKabrCWc4N5sRSwKwq9Q==
X-Received: by 2002:a5d:44c7:0:b0:2c7:1b41:2ed4 with SMTP id z7-20020a5d44c7000000b002c71b412ed4mr17473299wrr.46.1678444229964;
        Fri, 10 Mar 2023 02:30:29 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z10-20020adfd0ca000000b002be099f78c0sm1765644wrh.69.2023.03.10.02.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 02:30:29 -0800 (PST)
Message-ID: <ff784dd5-179a-28a9-b25f-9b09e0791b5f@linaro.org>
Date:   Fri, 10 Mar 2023 10:30:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Move WCN compatible to boards
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <20230309091452.1011776-1-stephan.gerhold@kernkonzept.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230309091452.1011776-1-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/03/2023 09:14, Stephan Gerhold wrote:
> On MSM8916 the wireless connectivity functionality (WiFi/Bluetooth) is
> split into the digital part inside the SoC and the analog RF part inside
> a supplementary WCN36xx chip. For MSM8916, three different options
> exist:
> 
>    - WCN3620  (WLAN 802.11 b/g/n 2.4 GHz + Bluetooth)
>    - WCN3660B (WLAN 802.11 a/b/g/n 2.4/5 GHz + Bluetooth)
>    - WCN3680B (WLAN 802.11ac 2.4/5 GHz + Bluetooth)
> 
> Choosing one of these is up to the board vendor. This means that the
> compatible belongs into the board-specific DT part so people porting
> new boards pay attention to set the correct compatible.
> 
> Right now msm8916.dtsi sets "qcom,wcn3620" as default compatible,
> which does not work at all for boards that have WCN3660B or WCN3680B.
> 
> Remove the default compatible from msm8196.dtsi and move it to the board
> DT as follows:
> 
>    - Boards with only &pronto { status = "okay"; } used the default
>      "qcom,wcn3620" so far. They now set this explicitly for &wcnss_iris.
>    - Boards with &pronto { ... iris { compatible = "qcom,wcn3660b"; }};
>      already had an override that just moves to &wcnss_iris now.
>    - For msm8916-samsung-a2015-common.dtsi the WCN compatible differs for
>      boards making use of it (a3u: wcn3620, a5u: wcn3660b, e2015: wcn3620)
>      so the definitions move to the board-specific DT part.
> 
> Since this requires touching all the board DTs, use this as a chance to
> name the WCNSS-related labels consistently, so everything is grouped
> properly when sorted alphabetically.
> 
> No functional change, just clean-up for more clarity & easier porting.
> Aside from ordering the generated DTBs are identical.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

