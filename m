Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF27F5A9308
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbiIAJVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiIAJVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:21:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EEA12D531
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:21:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z25so23533890lfr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JjiYojy0Mwz3pYQJAf6nrTE41i34ENgZHI5xsaPwkbs=;
        b=QgAVOF+/vTR23gXiTAAucIMrT6xpBgRluRcyan6ZkbCBcvfK9t7qM/oscy5mxbGgW6
         yiHVcseXrNhwyZRwcje8hiK34BS/ZgwXTOdR2ba0BbrvVPvmnUmDmQj1HPfupjOkywfx
         XPMnS70CqhpwVZCNHpJleXKtZY9LNVrIYreW9p42W2mKoJZZCZVCVHYqqXSu6Xdnw6qA
         vc9Fk4Zuwoc0D9TT9C2iuHkdz6AahWd1MlPxIBTN7RtZwDoYCfTZpNTVrxKxHuGruVM3
         2KgfRak+QpSWD3OgRJXAAVmLE+//leXzwgE+1ZXfcExDDl3hvS1j849RBo0mC9iwzPqE
         1Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JjiYojy0Mwz3pYQJAf6nrTE41i34ENgZHI5xsaPwkbs=;
        b=p273jRYCAjtgJ0bId/02EqvmAb0B3ynGo69gL+JUAXOlMyusSio/zd9iQUmbwpgnSq
         /pnVmpz6ZHy4/RZ1VB5IXqCc43omDlFMB28NGx5+H/NmgVfm6tWIkT8a+oPDKY3cTUd+
         17pP1wY26JBW9+K7kYnDoF+7H4n873+gqBTV+x1Y7tXy8s1MRQy+7VpSzLZMvhW3ir9O
         LmaVltDo3FDWwD59MULJ5Qr2izt94C2e/g7HYlSU6H4RTePBNh/Ht+TrN5lJ20isYHuc
         sPxyeivfrBLHf07jzpkExWkaBmv7oBwJ/SqtEIoeqxQ3dEbdXdRQ413KFRtqKzAqiVZ1
         /Yew==
X-Gm-Message-State: ACgBeo16J/nltnS4EgB1Xynp0IkVL/md+hNDRRvFzVqZIehcafhZcCkv
        SiyUuhpRdhNZEChB0AWYcPagDg==
X-Google-Smtp-Source: AA6agR5xBKtqNVBobHsboicM3GsM+gKu8FjT9rT6Hgc1fgYbyDDsJMPvBhpW0VBSx8Ht3bv9lehQ9Q==
X-Received: by 2002:a05:6512:2293:b0:492:f04f:2ff9 with SMTP id f19-20020a056512229300b00492f04f2ff9mr9908720lfu.95.1662024097903;
        Thu, 01 Sep 2022 02:21:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 10-20020ac2568a000000b0048a9e18ae67sm2293466lfr.84.2022.09.01.02.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 02:21:37 -0700 (PDT)
Message-ID: <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
Date:   Thu, 1 Sep 2022 12:21:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 12:20, Johan Hovold wrote:
> On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
>> Johan Hovold has reported that returning a probe deferral from the
>> msm_dp_modeset_init() can cause issues because the IRQ is not freed
>> properly. This (compile-tested only) series tries to fix the issue by
>> moving devm_request_irq() to the probe callback.
> 
> Please try to reproduce the issue yourself before posting untested RFCs.
> We're all short on time.

I do not have a working DP setup. Thus it's either this, or nothing.

-- 
With best wishes
Dmitry

