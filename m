Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 260C07D8929
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZTsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjJZTsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:48:53 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF655129
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:48:51 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso18033231fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698349730; x=1698954530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r/etm+lGb/c7igmaEGkdQXKHCNWHHVJlTP4t8HTdMk=;
        b=YnW9nSa2BhnT49ivqzY10JXoVjZxoHn1AQe9GWxwRF3MplJvhZmfQaby0jJHPhg4DK
         SjrcK5EmWgVCMI/XYFpfQVQQIsCJpuevob/VgMbXVND6bw6BCwkglo3YYM/ng5uWtqi0
         eBkqvKiUyBSeGutLTP9dpUjWpwbslDQtEUZWP3FVrieE2aKVUd8q+pCGtOiNd3TSFfxq
         +kiEq4wfTYtjjnXxvsTWPAE7xTPOs/Sf/Z+u6RC5s4MAcqobuLdXWfvLSdVx+TSBdSaG
         ZETJgMrHjv87sfADXSOX++RHZDxe7tzuyagwLEtrbd6AzpjYlPzHHS4qo5m9hyVeoJNZ
         V4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698349730; x=1698954530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r/etm+lGb/c7igmaEGkdQXKHCNWHHVJlTP4t8HTdMk=;
        b=rgw66SuZ160lpFjwcts11vec9S/cLZA0GQRXHZE6omw3pEZoZT/cocCubvq6dvHKor
         5miQRErH2iCXLYi34ZWPt+bE/UPZN/PbMVEGhkOVOSgeNR/yv93/bTmI6LheqcJtvifx
         UDBkMi44/++q8rbwkx6QA+920QfJIcsncrCl/Gv3SjqDaMDokoWV2cRq7xKy+rItuZgh
         JUet5ggRO3decE5oBrKN9SXfY0yYo5J/eLe5PTIohNACrbnCuWDMpE6cir8S0csQ8gmD
         CFWmCs8jUTdhqiwykG3cGbX766OWW4+zqAqpWwAHHcdHIAglIkUgFe2nkFGDtY9YYNeO
         feow==
X-Gm-Message-State: AOJu0Yy4gyFqEeBiaJiNlhrUHKpNs5ZiQEZaxiDRagtrFr5EzGBQReK3
        O41Ym5sha83t19ANvEYSrgt7/Q==
X-Google-Smtp-Source: AGHT+IFtutowcYecVvg+FvFfwTHyeYjPCWID/Y90bjxIQgePYnYiIzszx0treswzBdc4bCEGpm8KBA==
X-Received: by 2002:a05:651c:333:b0:2bd:d34:e1ef with SMTP id b19-20020a05651c033300b002bd0d34e1efmr446256ljp.3.1698349730076;
        Thu, 26 Oct 2023 12:48:50 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g17-20020a2ea4b1000000b002bcdbfe36a1sm3014040ljm.84.2023.10.26.12.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:48:49 -0700 (PDT)
Message-ID: <2eef6684-d0fd-4302-8444-cc5e5e4fa75c@linaro.org>
Date:   Thu, 26 Oct 2023 21:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] drm/msm/hdmi: simplify extp clock handling
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
 <20230928111630.1217419-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-10-dmitry.baryshkov@linaro.org>
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
> With the extp being the only "power" clock left, remove the surrounding
> loops and handle the extp clock directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
