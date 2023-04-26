Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F43F6EEB32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 02:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238028AbjDZADV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 20:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238023AbjDZADU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 20:03:20 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE9F13C3B
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 17:03:19 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-504efe702d5so9572882a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 17:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682467397; x=1685059397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRVhWkMKZivSpY0wYZD5uOa2bgROjQL/7zymO21uVoA=;
        b=Q392l+x2KFNeu6328CzD7ySXVmsmaQZSDPTzVKkT5LIuOezJrWV9PDyEMrxKw0YxPE
         HSxgggHrHReqIDvIZwqAHVj7I1O0J9AcPOksU1hapxAimTs0a5bgaCKXE0c/X5KND4yV
         Lpkr8Hiz8E+VA3rsCwHn5H3xDdT2ZU4Mpb/uPcDR6FhG/D8jvyugBzvRVe+bAKh66Cpa
         QKqn+ZERvvV6irIYXlXn03VmobsoaIERy4fTMvfyOhPI/JVQWSG/9SmqBbUYqnbn2zBx
         3UI/mDvQTGmjnhMNABfDyLcan0yQasK/8UIACwilLkh+B+wWxMUyejpXcFWO/9IqJvu8
         x0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682467397; x=1685059397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRVhWkMKZivSpY0wYZD5uOa2bgROjQL/7zymO21uVoA=;
        b=ftVqlA/s7Hstt31d/jNMchdBL/AwaZq44Ygp32ab5b8R91Ssb3+/Od5CkifWO4fx8D
         GSiKxlfHLcuYBJjsfpbpgoidOYehOyRBsHyBnpSffCEgItZnjrwAHLeAZAqTP8Et4hq3
         2b6FaLNomPkU+t4EoXpFWLp+urqAcAy2boZkdDuRPcGQwR34I+VdFMIm7Ld9IKFdP5zc
         zcm8qo+T+nLhHPCVWfAJOB4BehgkxEROJ5dC310Wn+LyVMfhzdTltSpFa8QzY3h05Ajr
         6GiuJbj5RZ5AvJLLKD9eoZl9XORIbDlTAyLWfiXMM1dKDgjbOYINrbKKthtqEkpZ1K8w
         7E1g==
X-Gm-Message-State: AAQBX9eXew1l/CZ2pZcFPdKmt6AOjF8ZIFrc2ZS+MZsq4OKqY3AOCLg6
        RLBownaWjXhi9PuGvGeZyNF0XA==
X-Google-Smtp-Source: AKy350a8WmKy65DIWCeLM/7FjOwKIt8z6sNVa9zWC3nyJQchP1QE63hpq6lkCzTY10NCqk8SaWXcZQ==
X-Received: by 2002:a17:907:7888:b0:94e:6f2d:d1c9 with SMTP id ku8-20020a170907788800b0094e6f2dd1c9mr14666185ejc.68.1682467397106;
        Tue, 25 Apr 2023 17:03:17 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id kw15-20020a170907770f00b0094f8ff0d899sm7294372ejc.45.2023.04.25.17.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 17:03:16 -0700 (PDT)
Message-ID: <d24ecc5f-1322-40d7-dec5-e4dc2f09ff84@linaro.org>
Date:   Wed, 26 Apr 2023 03:03:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 10/21] drm/msm/dpu: Take INTF index as parameter in
 interrupt register defines
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-10-693b17fe6500@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v3-10-693b17fe6500@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2023 02:06, Marijn Suijten wrote:
> Instead of hardcoding many register defines for every INTF and AD4 index
> with a fixed stride, turn the defines into singular chunks of math that
> compute the address using the base and this fixed stride multiplied by
> the index given as argument to the definitions.
> 
> MDP_SSPP_TOP0_OFF is dropped as that constant is zero anyway, and all
> register offsets related to it live in dpu_hwio.h.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 156 ++++++++++------------
>   1 file changed, 72 insertions(+), 84 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

