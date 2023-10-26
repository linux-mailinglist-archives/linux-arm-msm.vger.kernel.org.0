Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99C17D8A01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjJZVE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZVE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:04:27 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F7C93
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:04:24 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32daeed7771so852155f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698354263; x=1698959063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+WjwVDuEjfphxivxZ019Dx0u0fobKcWgfHyoUTG59Q=;
        b=HRTox2+FrHmeTpNdhWmMjrGLl4WCkGEMMLIQz+N6K4XnFSI9yF46EtmsQO6mRyUCFh
         wvmGKFGG0iNT4AjQuy4b8lKQKWakwcRpWJE+/1uNaw6q3dr+6A16CDa8mW6cLBCiyPxr
         wZC1qTSf507XOgN5ecHR/InI+Y/Y/GJ7V7BJpHzKGEMmSTg4wquScpoTIPqVxPClspMI
         5ncWRd7P/QddM6RiNdn2AM090OlEk87Q5hEFvQoschKpGSr4F8BL5doNw+6ENYVFmdUa
         4GswuRICOgxLiPGOmIFVLMs6zWISUPlefiqDfkhMBlgB0ropuHtd6YxKkuEeVIjDYsxS
         gFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698354263; x=1698959063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+WjwVDuEjfphxivxZ019Dx0u0fobKcWgfHyoUTG59Q=;
        b=vm3VrXOO05bp/cTe+FCF0NxyvL8CuGXX5DujQuworB7u+ehncCcl2htp8UM/nVsxuz
         DKjHJJdZl8gUaxsQfxCI24BODOKFRQtESJnOtEfMfN4iKws8DdVIPesKgXKC9w659ujI
         Ci98v3IjmRfgnWbWeg88of38hr1iMft4UjmJXDrlNg7Bj6NfS0JiqnV+njZI5YTfdkQO
         UuynVcHO1mNWsN83AV4vFMmmYD3bjDS7eNUusQpaZSzONNxCUruejfKz7Vzy2oGA8PRs
         r/s1nGz0BFZ7z8OLuUYX7wqaJbWR88wvU3fVaTpbK/Bz03ROtqcE+sKLQ37Q+vaQgV/d
         EhlA==
X-Gm-Message-State: AOJu0Yy73wV5hlW+Z0izkp1uGTffDJ546TMV/1tcEhgEVT99yxyU4pRS
        TTym5yOOrPwq3y57KncjyGuMPg==
X-Google-Smtp-Source: AGHT+IEDywECpnt7wzKwh/plP8K8CxNVzDQhhmdPRvs5IAb52+K0gslBi53+Q2RRbjXloa2XGGxWlg==
X-Received: by 2002:adf:ed83:0:b0:32d:a688:8814 with SMTP id c3-20020adfed83000000b0032da6888814mr679214wro.19.1698354263261;
        Thu, 26 Oct 2023 14:04:23 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d4950000000b0032d81837433sm256158wrs.30.2023.10.26.14.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 14:04:22 -0700 (PDT)
Message-ID: <90c8b0c3-7f42-4d35-9cf2-d5274184d8b6@linaro.org>
Date:   Thu, 26 Oct 2023 23:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY code
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
 <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
 <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
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



On 10/26/23 23:03, Dmitry Baryshkov wrote:
> On Fri, 27 Oct 2023 at 00:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 9/28/23 13:16, Dmitry Baryshkov wrote:
>>> Drop source files used by old HDMI PHY and HDMI PLL drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
>>>    drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
>>>    6 files changed, 1675 deletions(-)
>>>    delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>>>    delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
>>>    delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
>> Uh-oh, is the 8996 HDMI phy accounted for somwhere else?
> 
> Yes, it is the QMP PHY now.
Right, I realized that as soon as I've seen that you replied :D

Konrad
