Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D4969F059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 09:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjBVIf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 03:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjBVIfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 03:35:53 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D5D367F2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 00:35:36 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r7so6733886wrz.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 00:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqLeqFtFWR7kaexVhVYdbucppafycoMX3HxsJln5QQM=;
        b=BAU/BMflrsd71jY7Zmy3wd0a4qTln571RTTpXWhFuGHYxwkvkLbTTMkx+ioUthDrvT
         Fu/R2R5Pp98GMtOFKCvFBPbUUU13+8JyZNUWGbv7u2OxGLbGfZCxoxfjnS4JmILjl3ZH
         SPo8bug1dwrlw7YzVnW+Cw6WYZ2rlimj1jp4Y1lSMP8ME0bJg6Sl3nie235eUCJ1awg6
         +a163sCHSJcXX9DL9EgyQDZHjIS9C86HLAvSB+wGse/fnjfGNnSPHK4ulbw/KFDbUeRi
         FasbI5mTxIQPQD4INwTX7rmhT+7jpQMECP53hzp0e5j0CIHOUFeNEMKtb2lbnSATHXTV
         QtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqLeqFtFWR7kaexVhVYdbucppafycoMX3HxsJln5QQM=;
        b=MppYHh1C/MbMbuIH/NeMpvc4dcqV4y3GdPb++SbncSR+ZdeBueTqmoDKiW2PFsa1Ly
         dpGP3NiSgSR5HQvDQd5VVVL6bFARgEzkZWL9J8wdn9wrDGFp9xGfoxK/yBEvyYWxqP+3
         R0o+ydUtKC5oTs0lLDqhTissrj4Wjb3T1WPnP5NQM+Z5IRLpF/P8Uk8VyZjlMXVt7NI9
         Xcuncy9ZMI2+bF6VjIVNFT9Jetcp3zUtNpFLaQv9iK7udWBV0sZNpAH3zbcbRgZEifdD
         28J0NR2fYTEFNVeQjSR9Kk3Am7MeiajZsBsuC793uiMr+tZ0UnZPnkhw+lBiRQdDmYax
         mYDA==
X-Gm-Message-State: AO0yUKV0QnvTMI3dU76nUeFiv4AvtqjXI1mPCK0g9FTWTh4OI2N4McyH
        LpjwqjEkgFsEuTzjwUf+3UV/KA==
X-Google-Smtp-Source: AK7set8GLsJhTxHAyhh53R74Sa0dq3t8sxHEvLlHWZlORb30d+ZvUUNAXVBNiT7qWz/VfbI4AM9QZQ==
X-Received: by 2002:adf:fb8f:0:b0:2c5:58fb:fa92 with SMTP id a15-20020adffb8f000000b002c558fbfa92mr6272938wrr.7.1677054934954;
        Wed, 22 Feb 2023 00:35:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002c54536c662sm6451624wrt.34.2023.02.22.00.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:35:34 -0800 (PST)
Message-ID: <4aee9ad3-fe3b-7be3-ce71-df2365dd3482@linaro.org>
Date:   Wed, 22 Feb 2023 09:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <e62613b331da617d53515998a2c967d1.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e62613b331da617d53515998a2c967d1.sboyd@kernel.org>
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

On 21/02/2023 20:50, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2023-02-18 20:53:18)
>> clk_disable_unused() is altered, to not consider clocks which comes from
>> a provider with sync_state defined. This makes it possible for
>> individual clock drivers to invoke this process once all clients has
>> been probed, avoiding the need for booting many systems with
>> clk_ignore_unused.
>> This is then enabled for SDM845 and SC8280XP clock controllers.
> 
> This needs to be reverted. I'm not going to pull this until then.
> 
>>
>> Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
>> clock controller, SM8550 TCSR and display clock controller, SM6350 clock
>> controller, nd MSM8996 CBF and APCS clock controllers is introduced..
>>
> [...]
>>
>> Bjorn Andersson (5):
>>       Merge tag '1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com' into clk-for-6.3
>>       Merge branch '20230104093450.3150578-2-abel.vesa@linaro.org' into clk-for-6.3
>>       clk: qcom: Remove need for clk_ignore_unused on sc8280xp
>>       Merge branch '20230103-topic-sm8550-upstream-dispcc-v3-1-8a03d348c572@linaro.org' into clk-for-6.3
>>       Merge branch '20230112204446.30236-2-quic_molvera@quicinc.com' into HEAD
> 
> When you make merges, please describe what they're for and put that in
> the commit text. Also, reword things like 'into HEAD'.

I think these are all merges of patchsets (eg. b4 shazam --merge
<patchset_id>), thus it's the same as applying.

Best regards,
Krzysztof

