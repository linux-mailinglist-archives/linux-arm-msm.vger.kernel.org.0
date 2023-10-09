Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAF47BE70F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 18:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377340AbjJIQ4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 12:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377313AbjJIQ4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 12:56:22 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F05B0
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 09:56:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50444e756deso6323438e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696870578; x=1697475378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlhqBQl9oFMKzadsnusYrJDuDpk68abfiZiL1f4YOiY=;
        b=e1RnG2rGAJ5pYOCfwlD3tDUon6SBQvXbNpPLBZp9v9GX90y28V/6ksBOryahdqjXdH
         jw5qT7FxZU5en5waqS9BliPcFMVe+5TII9yXhfWs8dxaKVNfSl6V9G7GpPj6rv9eNbO3
         gnmrZhVIGEyA4gC6cwQHkdEB7bHHLhw6BaFwxEl7nU3HSw+1CiZFjadFqn3swOGs5cR3
         kZYr1iAX++CiYFR3vggWfa5yDUvy5aVC6TVkipojlOeW5FFxZdWSt4fY9hFc3YjxOueo
         LMLvsuD2HFRQUjpIn63sOrgWUyruRn0MfO/AEtenBQ5FwmQ+/2RAtYiNuDRauouVlUU/
         H0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870578; x=1697475378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlhqBQl9oFMKzadsnusYrJDuDpk68abfiZiL1f4YOiY=;
        b=DWHvlvrHlxFvyVobbCLq7lRfsYCZ03YgsnNI6AI6rdXKh+Upbwbwumt6iOlVEPgglX
         YYcaNIcHb8nWD6lLC2oxdTYljkP1xz/7VdrWX5V8pLkEqRKbVtB35ntIQg5h+M7RYw27
         U3XfJgkH4W04NeRORmqcVJfVMj39sFjYku7EuvAtRiyA6aefq4QZbBexnaRdfeufFSXj
         yd7zWlcHqFxNlEsDDuC09jfLcKEluxvuAwc/atklEx3WE6UeVpYBAChU4oyEYmzCEiX8
         rcy40qVqZGei+8EM8D6c/roqogMvF3v1mVDUFMQzRmjZsJcQUJkk+IJg2M8b21fG/XMV
         yesA==
X-Gm-Message-State: AOJu0Ywnf8V5+NCiYX2e3TvRtM/zdcB0Kui8GHkpDQp0PF3WgAn2LZ86
        fvP7rNkiR561L6hbCNFOKZZFDA==
X-Google-Smtp-Source: AGHT+IEzc+wWdYLx/D2ts2ez2S94HZ9kZNSnVve1pOz142p3GNd2sRYfgrX3YVCBmxnsKQjBUkC4Lw==
X-Received: by 2002:ac2:5fa7:0:b0:4ff:7004:545e with SMTP id s7-20020ac25fa7000000b004ff7004545emr12437678lfe.4.1696870578282;
        Mon, 09 Oct 2023 09:56:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a19a412000000b005047baf3385sm1488987lfc.181.2023.10.09.09.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 09:56:17 -0700 (PDT)
Message-ID: <ce15113b-c032-44ad-ab03-ff1b719fcb99@linaro.org>
Date:   Mon, 9 Oct 2023 19:56:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: enable smartdma on sm8350
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, nespera@igalia.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2023 22:33, Abhinav Kumar wrote:
> To support high resolutions on sm8350, enable smartdma
> in its catalog.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Notes:
>      only compile tested, to be landed after sufficient testing

-- 
With best wishes
Dmitry

