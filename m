Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0EC6B5C7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 14:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjCKNyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 08:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjCKNyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 08:54:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAC661332
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:54:10 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m6so10243272lfq.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678542848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lyo4pWqakc9SaitF+kgsd4Bj1TksOtpn16ZnKcAkEvk=;
        b=dJ55ymOri7tDb7SJVWfpXdH/Ac1AookzD6YZyxLMYwRheY/eHDP0EWkIqbSkog3k1d
         oTyMTHgykP+SR1jqaNMsIL66xcZEdfQ0KAMLDyXsiM6ZHKSJLql3bIU7EpKnbqmdH3n7
         vrFGObJyW/lBe5ZKl0yJYZDPcWhzEmiGO+yeqUII1qTJY9M34hpPN4oq3RIhI5xqgepD
         XkDpGFNvmKo9lzLFlZTVu4cTxxpXcJuKai19S4YfXz2vgMb27KQ/9jfAb5kedQANskIm
         KcosnvhfsvCmGYk0tpO+T8I/ADr6Pxv3y2bHdS5BWU3azGnc5RF8GMZSjroYHCXT6jjx
         A/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyo4pWqakc9SaitF+kgsd4Bj1TksOtpn16ZnKcAkEvk=;
        b=YAcM0ovy/SR2onRvI0H3aRsTPqXYDBSSgmCgsM5NIVCzpkVU25kFIpMKSAd0MAd9iM
         Uk+xurQU5mNvBGpOdl9bs7P9uOhSUBnVGa1kLeAcX4bfOQAp9S0NVoYkDFGEnXs4ZBvc
         0nZGd1HCzvE1g7+1PT86nntMJoCMuC+SPmdm8QRRq7GsIbaabXcNITNPpLUtDc7M3swl
         K/hkYBxDtFaO1WuLyGmtoWWtK+BQl4DKff0FhKEEbscsz4NU67Lv7VCzO9ZoftK7DjG7
         vZpt5booL0+P+I1NCoWst1eYe4/Xo8a6bn4NCYuzUE+H2lS5TO4XyXLlK2PHErh3rbvV
         3fuw==
X-Gm-Message-State: AO0yUKWeyWdALzxipvLAjl1i36XRjyp1TvDLst6m6dWZ9DjXVNXMKa6u
        toLyADv9cgvtiYcSIzWCBGpy6g==
X-Google-Smtp-Source: AK7set+RiSMzuswrJp0VEO5cua2aCLlXzR4LAGPKa4gv6OLZ0KfEiPw/NvafxhfBswwzMSl2nfR8CA==
X-Received: by 2002:ac2:55b4:0:b0:4d8:6540:a72f with SMTP id y20-20020ac255b4000000b004d86540a72fmr7504748lfg.46.1678542848521;
        Sat, 11 Mar 2023 05:54:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u15-20020ac248af000000b004db2ac3a522sm324806lfg.62.2023.03.11.05.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 05:54:08 -0800 (PST)
Message-ID: <a9202da2-5f17-0699-e4f6-db6dc85912e7@linaro.org>
Date:   Sat, 11 Mar 2023 15:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/9] interconnect: qcom: rpm: Add support for
 specifying channel num
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-2-815606092fff@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230228-topic-qos-v7-2-815606092fff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/03/2023 23:40, Konrad Dybcio wrote:
> Some nodes, like EBI0 (DDR) or L3/LLCC, may be connected over more than
> one channel. This should be taken into account in bandwidth calcualtion,
> as we're supposed to feed msmbus with the per-channel bandwidth. Add
> support for specifying that and use it during bandwidth aggregation.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.c | 7 ++++++-
>   drivers/interconnect/qcom/icc-rpm.h | 2 ++
>   2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

