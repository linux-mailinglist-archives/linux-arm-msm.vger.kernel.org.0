Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22B975C66A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 14:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGUMDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 08:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjGUMDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 08:03:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CDF30E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 05:03:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso3087059e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689941000; x=1690545800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IhkoDF78CCv7y5GQYbbsjZT44iTH15rIG128hk87YQc=;
        b=JBT7HZNg/+51OOwGNYhejjohC3pQ8vhkr4nA5qcrwkIWAETyzDUWiCAEpzh4SK1YkZ
         JveSjdBTPPbpZflUrtS93foCZMRht4kIgbltSJ/UFedBgJyDLN7C5S0uoDmH4WGSbl+w
         /SBZlTNx1u3NQog52Pxqm5MFiDKTEtBw9/xlSQE3bXIRrOK604PrdKhzaTCB/d5Upo1K
         ByTHDugbdPIE51TWQ0zgfrDyFrNgp+cZKJEVvefKqbJk4txy8VMxt7Y2gejrB0B3tfvV
         gwQ4YxEIsmVJWNuXcuOgPbOvztUqp3CQz9XoVobyMPTyHrrakFkKR/Lv9geknSs0tlM6
         fjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689941000; x=1690545800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhkoDF78CCv7y5GQYbbsjZT44iTH15rIG128hk87YQc=;
        b=dROZsTWS1LepxUC81eMZfBElI4eAqnrfdK3nnNtcEI4XlvsGu4h6OygdiHX8jNaQQK
         38VV/vZ+2PTrj35LzyUCPWiwQByXZl1xsoKYAR+bIBNGgjw0Or3orUS0h5efKRTXm6SD
         3c5Zwn9GcoJk89eNYnj2mvqmUTkL8Rl0JdD0peIZH2ac66MNmTD3Geb9ovKNXAPPubPk
         Yi2JIQZLGnpTOixYPDAlwvNHuvZ9K9ehF9e7VWJT37gKxU/LqFAwRs4ae26jPBqSnQoX
         qJM9iztaHWPbl7vcz0k0bdLlt3XPj6srYb1Pof/o7AK8y/q9H/N9PPq5jp6cKAQ9QbQ+
         g4ow==
X-Gm-Message-State: ABy/qLaiwPIHryr+jq9EoMIctHluKGBMpaxMaFac1sLQc4va5fWgY1cK
        Ozao/Ptztf0TdIdQ7wyoK+Wv6A==
X-Google-Smtp-Source: APBJJlFGmpYr3UvI/UTEAO4mdaH2ulDlpGO5iK6eLCqJ87k4vm0gVfwsJpQK9hsB1IjkHPsU27C2tQ==
X-Received: by 2002:a19:6541:0:b0:4f9:5404:af5 with SMTP id c1-20020a196541000000b004f954040af5mr1091273lfj.46.1689940999971;
        Fri, 21 Jul 2023 05:03:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id l14-20020ac2554e000000b004fbacee6028sm698628lfk.110.2023.07.21.05.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 05:03:19 -0700 (PDT)
Message-ID: <3e1d650d-7c5b-381c-464f-3c464c056a1b@linaro.org>
Date:   Fri, 21 Jul 2023 14:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: qcm2290: Enable sync state
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230720-topic-qcm2290_icc-v1-0-7f67f2e259c1@linaro.org>
 <20230720-topic-qcm2290_icc-v1-2-7f67f2e259c1@linaro.org>
 <ZLmQdjDgIbbhyTMJ@gerhold.net>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZLmQdjDgIbbhyTMJ@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.07.2023 21:52, Stephan Gerhold wrote:
> On Thu, Jul 20, 2023 at 08:24:01PM +0200, Konrad Dybcio wrote:
>> Very surprisingly, qcm2290 does not seem to require any interface
>> clocks.
> 
> What does this mean exactly? The interconnect .sync_state() is
> responsible to drop the initial maximum bandwidth votes, with the
> assumption that all active devices have voted for the bandwidth they
> need. How does this relate to "requiring interface clocks"?
If it required such clocks to be present, sync_state could not
complete, as trying to access some nodes would crash the platform
due to unclocked access.

> 
>> It's therefore safe to enable sync_state to park unused devices.
>> Do so.
> 
> Doesn't this make everything painfully slow? There are no interconnect
> consumers at all in qcm2290.dtsi. I would expect that all bandwidths
> end up at minimum.
There are no interconnect providers defined in qcm2290.dtsi.

Konrad
