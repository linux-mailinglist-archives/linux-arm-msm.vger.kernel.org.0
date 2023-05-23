Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9BE70DCFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjEWMup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbjEWMuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:50:44 -0400
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB77518F
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:50:37 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so5955227e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684846176; x=1687438176;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AW95x05Cs7zVCr4QZ0d5TByJ9+4cDZxrEBugpUgmSY=;
        b=laSO6aKQAHp0nBr6G42Lzz/F0emre9Xgk0mzDLxNepoaYFbG1nIvG/RLLXxRu1i0y/
         FValRxDzMhJ4w2SvG6wfzGrpDkYeeVIkOFsE0qpiWn/mKK71ACXG++olvlvkXxry4eCu
         WNB8jzeMo75MXlsloTAdGWuCEfoRfjzAGWOyXg2vj7flWHe7aBmsvaWMqwNG2NrldkSR
         6FrKNU+rsWHs9+nL5Awnz3mm2UG5g6m5o1iPmmCKlTH177b6bQGD5Ie8GHKXRtQSrAuu
         ekLS0Sc2KTi+Uru9T4R0+EB9rydXtQnG41KEMigp+lw3ZrAwSz9VI3WcR99nmP5M3rV0
         PFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684846176; x=1687438176;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AW95x05Cs7zVCr4QZ0d5TByJ9+4cDZxrEBugpUgmSY=;
        b=UhNGII73EtU1cYyoQHbAG9cNf7d/t5gcHNdW4f1OmR0YMWXSY3zf05NqECA+ztWlR7
         2/7T4ayZivtYMJ5g6JWg9PD+SAHSdvJU5Kt9v04C4RC64PNr6APzFYKMzSyDVnIa3nqq
         wO44dlU0dhOWm9h7Y1Fo+WAClgVicLTUk9kxEtubkYiFP3xQ+blx65Egr8H6Ump+hAgw
         t5EpLNaWUtsTfwtZiBcCY32r62Ooq4hX1k+M3S/4Q56u9/3/Xx2MeaaSyez0ZJR7/Rhn
         THBhCb752XZO/asp3x+yWbRYMNLhl0Q6gll6UvdNzRiQwqva3J84Ph4VFxqCLKynWbCw
         b7MA==
X-Gm-Message-State: AC+VfDzAZYHFVZ2XgxK/HLUVuTxU9cjRAADpj5wr540dEc7vSaE4XoA2
        +pSxGiQbF7bpN3Dzbb7A/HrhUA==
X-Google-Smtp-Source: ACHHUZ4vQUyqJnd5wFhpaqBfNVnWxMU8Lk+Da0svhgAJtF/dZWkT+TX10Z9dWGSspcpv4J1osJQdsA==
X-Received: by 2002:a19:f816:0:b0:4f1:4074:b4fd with SMTP id a22-20020a19f816000000b004f14074b4fdmr5297479lff.29.1684846176105;
        Tue, 23 May 2023 05:49:36 -0700 (PDT)
Received: from [10.10.15.175] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b004efee46249fsm1325560lfe.243.2023.05.23.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 05:49:35 -0700 (PDT)
Message-ID: <7db11395-3b57-70ff-dc7e-acf8d8d4b1b8@linaro.org>
Date:   Tue, 23 May 2023 15:49:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/15] drm/msm/hdmi & phy: use generic PHY framework
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 15:14, Dmitry Baryshkov wrote:
> The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
> using the generic API framework. Move all the PHYs to
> drivers/phy/qualcomm and rework them to use generic PHY framework. This
> way all the QMP-related code is kept close. Also in future this will
> allow us to use a common set of functions to setup msm8974 HDMI PHY,
> 28nm DSI PHY and apq8964 SATA PHY (which all use UNI PLL internally).
> 
> This also causes some design changes. Currently on msm8996 the HDMI PLL
> implements clock's set_rate(), while other HDMI PHY drivers used the
> ad-hoc PHY API for setting the PLL rate (this includes in-tree msm8960
> driver and posted, but not merged, msm8974 driver). This might result in
> the PLL being set to one rate, while the rest of the PHY being tuned to
> work at another rate. Adopt the latter idea and always use
> phy_configure() to tune the PHY and set the PLL rate.

Forgot to mention that this also features msm8974 HDMI PLL code, so 
modeswitching HDMI output on msm8974 is now possible.
-- 
With best wishes
Dmitry

