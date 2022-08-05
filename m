Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED0458AB6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 15:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240565AbiHENMg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 09:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240497AbiHENMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 09:12:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FA71F2E1
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 06:12:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id c17so3397415lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=32oPY26HyZpCLO4OQmtTa4kmQRSIB5Bf+mmIizddE0U=;
        b=DVwqN94Pleq+XK1w7wpI6aecDOgGaxvp+PEXCn5D891TmajdP6/ervyiTeft18CTLE
         4irKTzYr4CkfTGGgyEeJse6Oi2ZvBmNXxY0W07A1Os4I90T3u4+h0Mz+7E3b94zdAD0+
         zvGRA8b9WEHDXGJ7fjvFEvUrM1rRCHH+0uXsBCPfO3D5O41wkeWZHwAPnG6W5AVN+/fv
         XVjLofjHBfr3fYDn34lOvGsGJD80hs166sO2E9R0CmUHY4UBf9dMzpK4KVHeTwp8q+Qy
         HLd5oPrHaEhD9d6k1KLGeJ8k/DSfOiOGt0ZWZ3Ds7+pnIrUdT6stOqbziFmGvhGprUs0
         veKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=32oPY26HyZpCLO4OQmtTa4kmQRSIB5Bf+mmIizddE0U=;
        b=mqpjQx5sMNRRfp6Vn9+qg/V5OMMJUC/qF5ftXtNvAMPtltRhL33345uirqm58yxUC8
         LhKl/ZZl3nfJOhcQwM57ADd49Dju5EfcdbWP6kTYe2Se7F7jGCds43xDNaxWL/fkNi2i
         0I9K5NMCl+ncwI9s5UmmO2173N7WwX3U8z7S648XhncbWYcOOhatnbYSNEQl2u/xf+In
         PkJ0odimp+Ep5o6b9//OqLespoC1Wzg6e0sn+Hi/bH7SQ8lcu+NGQhyLmw6GhIqevaOx
         UrdLKOoqBYKF1HjCfxca5N3l9CjasrBllKzFLGNQGnHmtZqdV2OD9r4QhdNNyMQJat6o
         mcaA==
X-Gm-Message-State: ACgBeo1AGOBVt6Gu9Z3KFGWUxt5Iy+E0XhSwfdZfqBgRYbAVLpQtJMIH
        LhVLnNe4Qzl2ZSDsn6TvzC5xiQ==
X-Google-Smtp-Source: AA6agR5OYw7pufokfC0v4jIrBZkOUQFYx/Ur2tt4AI4vbADbi6FK0+P0lxEsSDSo+iupn6XfNK0aXA==
X-Received: by 2002:a05:6512:3c91:b0:48b:f05:7caf with SMTP id h17-20020a0565123c9100b0048b0f057cafmr2562548lfv.455.1659705152033;
        Fri, 05 Aug 2022 06:12:32 -0700 (PDT)
Received: from [192.168.1.101] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id k11-20020ac257cb000000b0048a73208cbbsm465084lfo.280.2022.08.05.06.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 06:12:31 -0700 (PDT)
Message-ID: <b05ab985-5021-99de-813f-efdecf6934e3@linaro.org>
Date:   Fri, 5 Aug 2022 16:12:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] media: venus: Fix NV12 decoder buffer discovery on
 HFI_VERSION_1XX
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
 <20220726021455.1814096-3-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220726021455.1814096-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/26/22 05:14, Bryan O'Donoghue wrote:
> HFI_VERSION_1XX uses HFI_BUFFER_OUTPUT not HFI_BUFFER_OUTPUT2 for decoder
> buffers.
> 
> venus_helper_check_format() places a constraint on an output buffer to be
> of type HFI_BUFFER_OUTPUT2. HFI_1XX uses HFI_BUFFER_OUTPUT though.
> 

<cut>

> 
> Validated playback with ffplay on db410c with h264 and vp8 decoding.
> 
> Fixes: 9593126dae3e ("media: venus: Add a handling of QC08C compressed format")

Cc: stable@vger.kernel.org  # v5.19

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 


-- 
regards,
Stan
