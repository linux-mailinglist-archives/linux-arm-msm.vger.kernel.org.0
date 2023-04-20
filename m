Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFAE6E86BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 02:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjDTAqF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 20:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjDTAqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 20:46:04 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0F0272D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:46:03 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2a8bcfbf276so1669061fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681951561; x=1684543561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5UTDS8/MS3VS6xHJciTdouskvxQrmpDUWCPfu+muRA=;
        b=RkEh/zVgE9stt/xRUg3A9i8zUpmT5lbttbj/10PoJ4C1ZlN9N92e8hwbRxBw59tBg2
         7AAfFXsQVQ/E3M2gZmI6pmy504+SddSZazkZEJYMqyCMMjlyWIteJf4/waONQ+YggSOO
         YhcFMqq7Tdb/p6Y/44vOc6JfCjxQw/x8eVUkbIh81bpNF5F0gVa/JP50Mcka90h+tc2q
         uxIqy45+53SOjgRYJ9cjV0iPpo2zYo3/nZngdIImonOJ8PzJ4/2/b+RwAF1v/DRTYX1J
         7LwfIhS9tc9wR1QMHVUL6Yg48YQ+ohIply8giG1DSzqHKZse25u3L7hVjNeI6/vvy+V5
         BOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681951561; x=1684543561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5UTDS8/MS3VS6xHJciTdouskvxQrmpDUWCPfu+muRA=;
        b=hg8XJ6aG/roTr0LAzlfnXU5loF1A5rtaqHTjgjtz3t+grfTk0aHKjfQvhcX6BYZ+CB
         fKDbZdQ7SO1GKNLZrbuz+H1JC+jWjKqXPBqeTeqsoHCaU9+ZriBnOnLzv/o8SRhaXsEv
         XYN+iVPB194JomdskiXlveXD0N/fWo8GzD7t+z4WABFbgPHA7mymB7rtRiZa1hy513/o
         dktd3wlvTIDZyCn+fzYNQ4FmQBKJTMcms/bPaRD/jHnnE3rbo8m227bIfwXfZamBeDbA
         28OxogsYF4IKNKGuugW4FcLVErcI91LGenbs75+G85LWAvQweCzBSijS8IkEzEU/YsY1
         8pUw==
X-Gm-Message-State: AAQBX9eWBYQ39zCZF00i2SAK94I0btpc4ywcSSPQBntKuYl0eHI4p/I6
        nWn0MIOVA/f/AfNua1hLmKumdZNRxKOMn+PRskU=
X-Google-Smtp-Source: AKy350YawJTuM7ApeAn2yoXOaxbV6j25doSog73B8n5yooEfDjrMuVNLb4Ul6zgxH8SsKYb4PRQM/w==
X-Received: by 2002:a05:6512:374b:b0:4eb:2d45:f67f with SMTP id a11-20020a056512374b00b004eb2d45f67fmr4707310lfs.33.1681951561547;
        Wed, 19 Apr 2023 17:46:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n24-20020a195518000000b004db513b017esm57432lfe.45.2023.04.19.17.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:46:01 -0700 (PDT)
Message-ID: <20d415d7-ff04-a4d2-b9f3-5d9f95fb3fd4@linaro.org>
Date:   Thu, 20 Apr 2023 03:46:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
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
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 23:21, Marijn Suijten wrote:
> SM8550 only comes with a DITHER subblock inside the PINGPONG block,
> hence the name and a block length of zero.  However, the PP_BLK macro
> name was typo'd to DIPHER rather than DITHER.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

