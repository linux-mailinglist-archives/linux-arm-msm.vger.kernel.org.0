Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFD67D89EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJZVAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZVAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:00:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB4C1A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:00:48 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32caaa1c493so912532f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698354047; x=1698958847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0mjma84WMq9b/LapGl0vTYYJiWs1xZ6cRV2SXhERRk=;
        b=rDsM7XXnvuRXf4BBRh7ctDE/zZvpA5Xogj5k75Ad3iTgpk9WC4jbVli++1WzEGDmBc
         KkhHZQe7Al9qfS38P27A7ayBu3EtkpemL9vfb+1eivncgL4jg3XsWvJ3ZJciPHgBIPpc
         eocxh8C9QPhsAHILC+z7XLb0MgqItRIF9cRCzqv9cmrDKGvAD5qxJT+lP1e5CW/K4Ujb
         0lKyWywA1rNS67Eus/VF7o3cxZFqjUKJrYeps6WExxqOYgcoSto7daW5qwHvXpdREHfC
         UUnbHXQyiHNEoUVCvdTH1Mu6ESfUw6DWFGrVJ923p8rROoFiIrlbK07fvOpcNJ8lX0lu
         s90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698354047; x=1698958847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0mjma84WMq9b/LapGl0vTYYJiWs1xZ6cRV2SXhERRk=;
        b=r1QlvMpWl66BSE7MLnUc5ikXlMeeTCaUWHAlbE/EyZbQk3FybmDXgEJ5upkJasSLsg
         Npw5vfo7IDUbjSC3rzvqdcAFbPuCxRqHrBKfl83myP9PnyQP3YjJzFo+KyALLe0xKhF6
         zmHmU7Bg32MN7CiJ1qGDKnG2QqfrumpycLvBOEl56bjNcVPISsfkHQ8yxEtlwmkZgRJR
         T2oT5fxjmcG6DgZw+ToSQANUxVRxJAw5juHHM7rQlbabXY8no38fEds7lEpXmHtd+Ga4
         GTvX5Ho24D5W3BQNU9SsrybmZ4LjfIiKMYK+fC/CYIrBiAQ2SSMl8K670Lr9j//bgoCI
         eSbQ==
X-Gm-Message-State: AOJu0YwmQ3FiQscobVTU3a69VO8jXkZ9BnpEkNw8Le+ZqwP55vurUCtZ
        TlBy0PxO0mbBbzrXGCt7Fl1WAQ==
X-Google-Smtp-Source: AGHT+IEfhhLYylIduYkXq6MRvxYQEjqp5ZqhMAToFXaZMFHGlqgOi/vTtnPKL+amQAp6vTiD/WTufA==
X-Received: by 2002:adf:fc49:0:b0:32d:be57:795f with SMTP id e9-20020adffc49000000b0032dbe57795fmr545587wrs.6.1698354046861;
        Thu, 26 Oct 2023 14:00:46 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l12-20020adfe9cc000000b0032dba85ea1bsm235247wrn.75.2023.10.26.14.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 14:00:46 -0700 (PDT)
Message-ID: <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
Date:   Thu, 26 Oct 2023 23:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY code
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
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Drop source files used by old HDMI PHY and HDMI PLL drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
>   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
>   6 files changed, 1675 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
Uh-oh, is the 8996 HDMI phy accounted for somwhere else?

Konrad
