Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B98B7A9B16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 20:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjIUSxu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 14:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjIUSxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 14:53:22 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA0AA6174
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 11:37:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5042f391153so1170825e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695321439; x=1695926239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXv2swyixrrXvv0zGvrj0+c4WbYkAz74mw7u1eEONl8=;
        b=JFrgwPahVkCBNJJqAjGmn0VLw4a1aFAmH/yGL0AkQceFwXuh6OlYi0iwUIlldzL5cd
         0QT2BzYr/do6aknG6MIGK51XsbHV9iSvESj8KwjpBmMXpQUy99Ow6X2seDqXcQAbSAQ4
         LxhtLSmMlVNmWT2zyGhmKp7bisSKZLInHIqbfvp1T0CLy4o5GOn0LzgK35YErdD84tzb
         KuCqYYXGIpOvAWu5vYOI1J4OcuksbZNhrlb+INEINhXZYd/k0xcxhgQx4KtFxLRDQmTB
         NcYkUPiKRzAlndZHQvBRJ+7SzegNbjIRjFhmcqLsmey41JoPxxbhca7j0nA2hCLKOylt
         m9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321439; x=1695926239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXv2swyixrrXvv0zGvrj0+c4WbYkAz74mw7u1eEONl8=;
        b=Hqe/5DPyxAA3CERo5ixWa7fDe+Q+uCjkN7SI8TMGxw9gfkXfKW5ilRG2Aeq/zFUgkK
         zA16tNtsGitvYnh5i1aDosFayLIn85uIvhIKA0ZtkiJCmRv5/x01iQRkRf+4l+xwDHAu
         BoaUiDBv2nx6wfW1bwt9wbeYxfmjs70dZU58R1rN74zQxXFvvP/Jra6aeIDPfilbudFH
         DQXsMtUlPFEBLU39hwaaJEVZH3I7ri+X1zHBlFA+JUPoRUsfdirvjQpogSFG4/y8qnuu
         OE8gR4LAHO7YBgwwZ98T8iZ6hSbQ0m2VrT9XYxEJMiv4jjb3vGBFH3EqICMW8EWnpQN5
         V9xA==
X-Gm-Message-State: AOJu0YxUUZl3WT2GPc4iuPvdvwXX0exNO62T+TWXlO4bpXccfxk61Xp4
        nncUB2me7uYrao5NX0aEEAqedqc0G+9YXMWVZg7Tkg==
X-Google-Smtp-Source: AGHT+IF33ZszVwsMibxsoJczJ31Md6SkIWFl+NgIPjyaeu55oxkozMwjQ2+h4m7DsUHVeCJrMeMh0Q==
X-Received: by 2002:a50:ec83:0:b0:531:1f3b:cb47 with SMTP id e3-20020a50ec83000000b005311f3bcb47mr7302479edr.0.1695279710178;
        Thu, 21 Sep 2023 00:01:50 -0700 (PDT)
Received: from [172.20.15.189] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id m26-20020a056402051a00b00532d2b5126bsm389571edv.94.2023.09.21.00.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:01:49 -0700 (PDT)
Message-ID: <8f24963f-a016-3095-29da-a2fcae5ec9eb@linaro.org>
Date:   Thu, 21 Sep 2023 09:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] drm/msm/dpu: Fix SC7280 PP length
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
 <20230921-topic-7280_dpu-v1-1-6912a97183d5@linaro.org>
 <3b23270c-ec89-2177-8252-6ccaf58d37ac@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3b23270c-ec89-2177-8252-6ccaf58d37ac@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/21/23 01:41, Abhinav Kumar wrote:
> 
> 
> On 9/20/2023 3:46 PM, Konrad Dybcio wrote:
>> Commit 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
>> macros") unrolled a macro incorrectly. Fix that.
>>
> 
> No, its correct from what i can tell.
> 
> Before inlining it was using PP_BLK_DITHER macro and not PP_BLK.
> 
> PP_BLK_DITHER has a len of 0 and not 0xd4.
> 
> Hence I cannot see whats wrong here.
Right, I misread the thing..

Konrad
