Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760527CC946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 18:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbjJQQ6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 12:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjJQQ6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 12:58:05 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF95DA4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:58:03 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c53c5f7aaaso10804261fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697561882; x=1698166682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1ClCw7ik0QFiMV0GzYa9kALOXJru7vc9VzqBic4bFs=;
        b=zg4GaKFC9RDUFBa3q9MHuFB+LCsaIy2lfLzFIkKWBIScOv9BlEULzZ2jmvpdONYEqc
         PP74HZm5oLgSR5KLACG02cTyPUIieY7DhVFs7lVzos4Zhw9lr5aSRszt2m2i64SDdXDt
         uGyHa6jmDA0a+wLLTfA0e3NEamiRrGPOu5MqlGb6k6MUIdcIAP8TUASsdXwh7i5SpvxF
         qYWlf7tKHMHu7f1MRaX6b6bWQhcg1HC6ovmUHc5Xa389uwZNwdBqecGItSBBGRH9ypnv
         Eb2AvCQ38mexHBbxafziW8IRUFibgE+wITZZ1wEA1nMucRW64eruX1RcXRcMzrq6Vr5D
         Tt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697561882; x=1698166682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1ClCw7ik0QFiMV0GzYa9kALOXJru7vc9VzqBic4bFs=;
        b=DbAz50XNnkBlt99bZJ5gG6/LVKUK8C7lqFcoKVMlgvzBe0gTKSEikkwmmd4qAUG13o
         vWRXoUT0xWNLdmseQPI2Q8TXmWBu6B/GWdHY0wFLWKxfTgXGO02PuCse1B51aXI2TxJr
         K2z1T5BfHAstXhHi3pLErR2cn4TBMWRcnZwr+qMDmxjxZkpMH2aOUqUOH36Qg2tEBe5o
         FgqAPhLUDxfsj6dWIQjV1PKEI9yPI/CvB1zszg5plOBILJQS6dPGWj71wV9nRPrisP/T
         DyiS90brd+S5+O2fE+JpC5JHPE00CmQ5ZFsm4/Iq19JrxDYHZNBJM6LcVYTSLKXkVAzi
         IvhA==
X-Gm-Message-State: AOJu0YzGlvJiASjkFvCaKo6jJghqgyyIxWe8r2fdcVJOPF5aCEZhlddC
        5Zd50EKvTDNpQ/UAC/pgwbxYnw==
X-Google-Smtp-Source: AGHT+IG9tcHfPANCe3OZQybpADiG89MsxrF8vuLurtvPSk2VtaOh6QNbxtaxrHEKKGliGXgQ5NaklA==
X-Received: by 2002:a05:651c:83:b0:2c5:623:aa01 with SMTP id 3-20020a05651c008300b002c50623aa01mr1997499ljq.49.1697561882218;
        Tue, 17 Oct 2023 09:58:02 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b0040813e14b49sm1752232wmq.30.2023.10.17.09.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:58:01 -0700 (PDT)
Message-ID: <d56c032d-b52a-4caf-b815-1133a12a792f@linaro.org>
Date:   Tue, 17 Oct 2023 18:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-sm8550: switch to
 clk_lucid_ole_pll_configure
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
 <20231016084356.1301854-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016084356.1301854-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 10:43, Dmitry Baryshkov wrote:
> Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
> alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
> function to configure the PLL.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
