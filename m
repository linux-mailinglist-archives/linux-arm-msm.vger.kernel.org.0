Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C2F7D889E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 20:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjJZS5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 14:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjJZS5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 14:57:42 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BF11A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:57:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50797cf5b69so1764060e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698346658; x=1698951458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMg17KxuWBUiUv6A0i2QEQW2s5Z+lVHigup08bOBCUE=;
        b=GJt0pnL2HhZ7bg7hoDu6hX6zOlhVov1KtQOK0rCg+bX1Xfzb+sDTGyBz8WuNeoOFoG
         k9/Fy9eBoz2yiwVgthf6bTpHuqL4g5QSZBr4YoBxUpe6kvpcZaQ2L26ppxFh5k9Js6Mi
         9BzunVqjDEYGrlQRum13EmqbQqOfuVP7PbkDe/VCb0OghrbTJKib/N2jGWea4hU/WWTA
         uEkcs2rJeJYEV95d28mHDWJOJ0frKPyvJzp+C+jDCAYy+fFQzKpdawZ321SIitLD6Xyb
         CWSgnSxmjP0nqZrZx5EYyZ1CAiJ0LhTT0bqLqWqzaMygldYFlO+MooSKLGEw5Cadq45Q
         OdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698346658; x=1698951458;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMg17KxuWBUiUv6A0i2QEQW2s5Z+lVHigup08bOBCUE=;
        b=iUjU5z9yWGRBGcmTM+Z3KskDyFNobw7TmdNujexCcrG0/OMU+aQw7Ch3OeZIc2zkfI
         CnUtvvxX9UQTHAWzJ5Y8+Tr0UqSJ7Ky9utHF5wnKh2jvFtibeOx2HZHVWWNxCxrQmmQN
         U31jgMMsJW+ouuY3J3/zo4/qo+q3FTpmaZGZPWiHQXm50wjrXCCz09uoIhmMLJY+BNYX
         7WYM8DEfNNtstUGFNhIXic5azf2mYFVI2eSJHcwwoa6t8p7vSwvR1ySXfiuJL+7QDQwf
         hNTexGOV94q39Kt1UMKhW1l6OadohLZRNwz64cgxtG5EaBMQHxIRALBfnOdnkMp3Apjs
         wP1Q==
X-Gm-Message-State: AOJu0YzommmySHgnQS4KsFTLkGJ4lx0GSrKEKGmsaS/yAeVTD0eP6PT2
        JRb+siQgONTCwODmvzvLs4lKMg==
X-Google-Smtp-Source: AGHT+IHuQWDn7OUiBtFrH0a1lZxUUGtlxrPanh02+ZPMGloHbEwjjoFN8dI3E0sKr4JffKJU2N8AoQ==
X-Received: by 2002:a05:6512:2256:b0:503:1aae:eca0 with SMTP id i22-20020a056512225600b005031aaeeca0mr175782lfu.44.1698346658359;
        Thu, 26 Oct 2023 11:57:38 -0700 (PDT)
Received: from [172.30.205.8] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q18-20020a194312000000b0050797cbfa82sm3122255lfa.17.2023.10.26.11.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:57:37 -0700 (PDT)
Message-ID: <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
Date:   Thu, 26 Oct 2023 20:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
In-Reply-To: <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/7/23 01:43, Konrad Dybcio wrote:
> On 4.10.2023 02:31, Dmitry Baryshkov wrote:
>> clk_rcg2_shared_ops implements support for the case of the RCG which
>> must not be completely turned off. However its design has one major
>> drawback: it doesn't allow us to properly implement the is_enabled
>> callback, which causes different kinds of misbehaviour from the CCF.
>>
>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>> switched off (and shared most of the implementation with
>> clk_rcg2_shared_ops). The major difference is that it requires that the
>> parent map doesn't conain the safe (parked) clock source. Instead if the
>> CFG_REG register points to the safe source, the clock is considered to
>> be disabled.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Would the intention here be to replace all usages of _shared_?
?

Konrad
