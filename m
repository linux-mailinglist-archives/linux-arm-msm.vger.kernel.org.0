Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA977D8A10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjJZVJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZVJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:09:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B6493
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:08:58 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so2064077a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698354537; x=1698959337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMfPZQG3/ucH8AVq/i3Ub3YrK7tt+d1+4bgiELGiq+Q=;
        b=x0V+oF+2Zm0es+gKQXh3Hq4JaO+smfD9sb/J/2d+YRO0UtjqHqHNG/nxL5Y/WcNYhC
         /l7X+L5pknJ8o3BIeiDgFlM08HgUw5dBecLFpkxdbegHxt7I9wcTr72LvesA2SGUX3ZU
         LeixfFczGA6ohcRyE8ScZ/p+9dzCaVFxY45Wye7ughUqVAyenKFDeyLTQTcviwXVHM59
         xDWzr1YAta6ASnPv4CZ1ciwCk8JJvYRfHZSSjwYyT0YFYMIR9kx4i4wK3ZbnCp4ih7zr
         qnwP4jLYxIqIXcenkWu/ysscLIvrt5bbkzTKPCTf1ZcAO9GmYTA0bfZTug5tmCGYnAch
         6dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698354537; x=1698959337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMfPZQG3/ucH8AVq/i3Ub3YrK7tt+d1+4bgiELGiq+Q=;
        b=jP8ysnQHxyDnU15abZAT9zYz0TXexygV/MjlFHCO7x4Y+WGuwknXRVwVlzdrfSZuh8
         i5atBfyAaEBpBb+CHtT0vxcOMxKzkMLuiDlXRUTld4IJS6dRnhCrva/nnAniF6wt1ui1
         iAWGuzzhSv6MZW75lgkbXObaqvhIitSfS9QckM1IAQLoGjA9Wh9CI95lFm8WG5sxbDSx
         aIa6dkr58+3ovu+9Lep69FsujAbDfVn/JKEDNczrNXCJd0/kGssiOVfP9cWOc6yX5qEb
         m9ojiGlW3Xx1igUURgce2y6Qqo/cH0GMQw+Ne83+a7t8NCnMUbtmxF0bemc12iOI6BsR
         9Hyw==
X-Gm-Message-State: AOJu0YwQAor1Cl2W5XZwYqyR6MAFnyEsvUzHCavn8kV7Z453h8RG0lwg
        Wqde3WJufq4jNvtskHBxnwpYrg==
X-Google-Smtp-Source: AGHT+IHpOWLcn7w5EuLJRpdXs6AF75XUE7TiA9NDj5B80gxhszVR/o2uDb+GN+7c1/0kxpF8rKNm6A==
X-Received: by 2002:a05:6402:1a35:b0:53e:467c:33f8 with SMTP id be21-20020a0564021a3500b0053e467c33f8mr799145edb.20.1698354536903;
        Thu, 26 Oct 2023 14:08:56 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g27-20020a50d5db000000b005402c456892sm167715edj.33.2023.10.26.14.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 14:08:56 -0700 (PDT)
Message-ID: <cd3df2b1-f384-4d26-99a1-e53ecf9f332e@linaro.org>
Date:   Thu, 26 Oct 2023 23:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] phy: qualcomm: add legacy HDMI PHY driver
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
 <20230928111630.1217419-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-6-dmitry.baryshkov@linaro.org>
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
> Add the driver for pre-QMP Qualcomm HDMI PHYs. Currently it suppports
> Qualcomm MSM8960 / APQ8064 platforms, other platforms will come later.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]


> +{
> +	unsigned int pixclk = hdmi_phy->hdmi_opts.pixel_clk_rate;
> +        unsigned int int_ref_freq;
there's some misaligned things

[...]

> +	lf_cfg0 = dc_offset >= 30 ? 0 : (dc_offset >= 16 ? 0x10 : 0x20);
some unreadable things

[...]

> +	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG2,
> +		       sdm_freq_seed & 0xff);
> +
> +	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG3,
> +		       (sdm_freq_seed >> 8) & 0xff);
> +
> +	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG4,
> +		       sdm_freq_seed >> 16);
and a lot of magic bits in this submission

and some non-reverse-Christmas-trees

and some leftover comments like /* XXX: 19.2 for qcs404 */

I see a lot of RMW, maybe regmap could help make this more readable

on the !style front, it looks sane to an unknowing eye, so I guess
that's the end of my complaints

Konrad
