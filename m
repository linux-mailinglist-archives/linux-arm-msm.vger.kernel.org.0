Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76BD7D8933
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjJZTxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjJZTxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:53:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AD31B4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:53:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507ac66a969so1602531e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698349982; x=1698954782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnrGc+MzCjrgVDL/dcvxuUl3durnLyp4dr8xtm7UBTA=;
        b=nxyxgYYNcCXQB4VFWWPNHm14fX0Lpxoqae0plcOBQOGY2DERHwa1vDljb5J5Ohp5E/
         Z67nmHtVb+ZbEakRk6a4hh4Zvd/nqh+iXvKntF5nMvAjXErhS4FCl+uJF8WLe+c7pEXJ
         hNURfaxudVwO2xCBmcmmK7YBpaUvCEby6sBERU/kJWYeoO86DRAIPjpNWXczuq8eIntT
         xv73uI6gFiKmz/+0hwRsxczG6VRe24E7Q0nEFJEAq3yZt7yzzHIoqnXsH6bWnDgNTKlY
         TGGcTuR0F6Fm5DhrcM9qCUUgdLm+C8CMP/Hjvd//hAqVAenHZZqUpx/ohgVx+XqsDbbI
         sakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698349982; x=1698954782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnrGc+MzCjrgVDL/dcvxuUl3durnLyp4dr8xtm7UBTA=;
        b=pAUpKV/zQcc8qs+PKkP5p30O0DmX3ac8dEdBJk6dv+q3SaIA5F+0Olt/cno7blzyaO
         A+ptAriBDtcrKOcGaPBx7hcplHjcizzNXWyDIFtsmIMQe5nqvOYIMGWnQ47ACiqG+M9a
         4Ozslxq72NEPjkesBCCCMnseZUDm1majIkfMkZo8RkCnSsFgtPKPktSFuAItRUIYoxzA
         +ZlKgzAyoG0WDYabMnrWQXR5Enl4gv5lafbTgP6ths4dnxfCCzuYyqL76YwCy+fcY8WP
         yysjBr2IKx7LhBCwFaUwbDaID8nnY+dOqLDXt+2RI1tHtJ5arMz/GqSxM1tBE0fJL22L
         450Q==
X-Gm-Message-State: AOJu0YyWS7h77VLCLyNgyizHQ/60ZwfFNXUJpGwS0nnrGQB5H3dg4M4F
        oQQLvjYBYOFJKx9A0vybSMhfHw==
X-Google-Smtp-Source: AGHT+IE2IYNRl5Jz1ahBXmr4SHz+c1HwqT15gHYTCXM43ENMJnQYeuP9qsh+NCTXet9qpBh9BbsraA==
X-Received: by 2002:ac2:522c:0:b0:507:9dfd:f846 with SMTP id i12-20020ac2522c000000b005079dfdf846mr221429lfl.69.1698349981732;
        Thu, 26 Oct 2023 12:53:01 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a24-20020a056512201800b0050096cc3ba1sm3104356lfb.255.2023.10.26.12.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:53:01 -0700 (PDT)
Message-ID: <3bb1ed4b-9add-47ec-bf40-a6ac9b63e971@linaro.org>
Date:   Thu, 26 Oct 2023 21:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> In preparation of reworking the HDMI mode setting, switch pre_enable and
> post_disable callbacks to their atomic variants.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
This looks good, but I'm far from knowledgeable in terms of drm, so:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
