Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021E87D893F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjJZTyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZTyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:54:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1278A1B1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:54:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507ad511315so1961755e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698350072; x=1698954872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+yKfel6jVKQdcczBrQhnxnhE7v6YeHb+nTnhUYvp60=;
        b=vDh9rkfsEs5awzdLhhpi+8g9fY8s4pu0L561/zaGQm0rJmjqEd8qet0INfFwtB6VVI
         QaPPHGv9UGrzfoOQeOpDFNQ9YMdVxz1S1pRsZKydWZtiBy1DKaO//q/T10LLWPCdP8+4
         ppHAYW2hYoGmATvofqGQrpQOlA+cy6SPI449Ql+yUotLW8TvZ4EKAOVKPdPfYunUREjf
         Er3gsOQcvskOlobgF5sPVj1piJRulqNjcH/RGGBdIiO9GYQwt2fPNuGTl2yxcEE3I+QG
         3imlGnwgRHaQnDpEupnOXT7d2c/BS0UmJHP6tIYTnAl/z4mqV1CNn06FDHaf9i2K79yc
         1E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698350072; x=1698954872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+yKfel6jVKQdcczBrQhnxnhE7v6YeHb+nTnhUYvp60=;
        b=OydHLnRL8xor8s3iY8aEISEsCelgrmGTHdLCqRoaJyVAHysfyGcL9RQciarBLeFrL9
         Qg+RaK6r3dcRiI2CYxHxw5D7S1yS8of6F53nUv7i0oXQec/NqGRpTM0HLejnJddsEdH1
         YMsIG2r9oRSxrVEEqC483ZIMsmMw99FjcJVjwbeMeJgR6DBsb0wB56S768VmeuH3lITH
         4ooHnLAEbBTtXiraWh8+a5ONMPJqgw9/88VZU8QNWstKRwo/Sc+YoF9QYgTcnRHaobcY
         ytfu0io3rqDqjK6LbmCBloAL4IBgP8NykSPUp5P7TB2RN7OzmlmVqoel9/pPBH+cP/GU
         kyag==
X-Gm-Message-State: AOJu0Yw2GSz+KRn6eTksCw0D156Ws9LdRVI2TkMpRCh7R8iQn8cSOil9
        +TrQI22pufyYhSehca0ruwxFNw==
X-Google-Smtp-Source: AGHT+IFmVIu10aBZHdYkJPouHgCG0LXa+bllX/aAIu/roVR3fko0wfX0k3pHKnLEbA6KJxQWbLFmfA==
X-Received: by 2002:a05:6512:1282:b0:505:6ede:20a9 with SMTP id u2-20020a056512128200b005056ede20a9mr331484lfs.65.1698350072248;
        Thu, 26 Oct 2023 12:54:32 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a24-20020a056512201800b0050096cc3ba1sm3104356lfb.255.2023.10.26.12.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:54:31 -0700 (PDT)
Message-ID: <36d6379b-66e6-4781-b08d-ef90f6e47828@linaro.org>
Date:   Thu, 26 Oct 2023 21:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with
 msm_hdmi_phy_powerdown
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
 <20230928111630.1217419-14-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-14-dmitry.baryshkov@linaro.org>
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
> In preparation to converting MSM HDMI driver to use PHY framework, which
> requires phy_power_on() calls to be paired with phy_power_off(), add a
> conditional call to msm_hdmi_phy_powerdown() before the call to
> msm_hdmi_phy_powerup().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Is this a conversion artifact that will be undone, or does the
framework actually expect that refcounting may not be enough and
phy resetting will have to take place?

Konrad
