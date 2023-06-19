Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15DD735F3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjFSVbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjFSVbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:31:39 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABA8E55
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:31:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso6032401e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687210296; x=1689802296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1ZeuxsB8oGr5ZysvA7I6ilQgKE4t1aMJoeGOZLlwFE=;
        b=nm4+MB9o3U/kIZoPOHMaKCJUFijhwqH5+cAlqo+NLW+ue79UNRMJonQdcJvAEm8D9r
         qkzFt+lkTHDPjC1GPOykj26t+g/EFMkchGwhKGmWhWxGz2j2fKqSII99fY0+m5pzsE+v
         Anulja34SFjCiY05Aj+VzGz3h1xr0hkA5mIBaIEwrwLU7WwYNiHbi0VnPAJf0LTUAr/a
         a8wPBeWbY7JQYmCFjeajj4JdbcIf+x5of4xGCfIE+pZ3a95hvucqd3RaD5lL7eNFn/SI
         D70nbX5m/ynTyjez02xGTy6Th8+at/WGOxRroeNBG3aJbvKs+pF/G2nC/1+aovkQ3BJ4
         NgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687210296; x=1689802296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1ZeuxsB8oGr5ZysvA7I6ilQgKE4t1aMJoeGOZLlwFE=;
        b=kbTLxNoCKd8Nv6exqid7MPalnfo38ajsEeeSOKfJU5gpakWCgM2NfkIG8jRhTXo0bA
         Zl9HsWw6MYlmSis/jjlOQYpBOGZDkED2qlf8TcPnTN2hgrSUpBCt0twQOUf2Bd7ZnoEu
         BerV24bpuINDFtVBmiltLgQTvs3aXHknXhNajdUW+xvQLY+643FuWjb6cwJuouL37ZTq
         DAzbEaJgUCgKZ2/KjcxbiGamQ/eVYqliNvXvhro7o6uEA6cZciX8HQR+mEhjFwwbtSB0
         akHc5Gy7yrS84rcUYx0RN+ru0wY+GOpsNLpWGhoXlW0lMpJRqCjOXhPOpTFLeCOrhEIg
         Ev+Q==
X-Gm-Message-State: AC+VfDwFi70mJVJiTXKfzSJ5PSF4sLcWaPRqkvFpc3bJQHDIvpYcZuIz
        fAsmNl4g+/USqvFY9hEo7JIrzw==
X-Google-Smtp-Source: ACHHUZ5ypeU7kMXXHXw02oRqVFN67BNNlJ6Qns5dyNdSNA/BBiVnABX459A58aIpDcfOfmm4+Np1yQ==
X-Received: by 2002:a05:6512:286:b0:4f6:55:7d73 with SMTP id j6-20020a056512028600b004f600557d73mr4013419lfp.25.1687210296511;
        Mon, 19 Jun 2023 14:31:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w24-20020ac24438000000b004f27471e0aesm89199lfl.79.2023.06.19.14.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 14:31:36 -0700 (PDT)
Message-ID: <a7efb345-a72d-4707-a880-9e4b8b0eec91@linaro.org>
Date:   Tue, 20 Jun 2023 00:31:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: remove struct drm_dsc_config from
 struct msm_display_info
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1686694742-20862-1-git-send-email-quic_khsieh@quicinc.com>
 <1686694742-20862-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686694742-20862-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 01:19, Kuogee Hsieh wrote:
> ince struct drm_dsc_config is stored at atomic_enable() instead
> of display setup time during boot up, saving struct drm_dsc_config
> at struct msm_display_info is not necessary. Lets drop the dsc member
> from struct msm_display_info.

With the 'S' in 'Since' brought back in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 --
>   3 files changed, 6 deletions(-)
> 
-- 
With best wishes
Dmitry

