Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644DB6F0B54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 19:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243989AbjD0Rqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 13:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244494AbjD0Rqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 13:46:40 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33196A5D
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 10:46:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-94f6c285d92so1681832266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 10:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682617568; x=1685209568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTm8P/0NrUTJ/aXUbCQxsw1Cnuqf9wQlrWWke2Jv9BI=;
        b=DYsgP+b5OinukyTDU9scrGzHZYJRDEUrvszbbzyzCOTvqaqCOTGckH+CD5OOYKaNPE
         lQRRm3AC2RyAoS2NJZ11NMcPCxB0UfUurZReZje/4WareAQmTYepj7dN0tYkTxBGXvbq
         nCUWp+kRktI4xAVfNfBA1kCzCyizP1OYChqnEADzFL+itNoTZQxQxcseeevU6t1FvGZ1
         p27eY19T6e9cUo56sSJ7eTTnIFA/dThkWqFZ9YZkCfditn5sqBbp0mI/5qoycfoSLAqA
         y4IeC3XDwJUas3wYsOqA05hB8xCshQ5ENeyi0excJJ624vLFhKNBrlxJuWKyrsLrzpnW
         ldzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682617568; x=1685209568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTm8P/0NrUTJ/aXUbCQxsw1Cnuqf9wQlrWWke2Jv9BI=;
        b=E80mVuM5FTBiSWKJbXuXJ05skmha8hQh4gfCTsBxOgwyMFCoitbFR8alNnfx+LO+s9
         8rOHTrNl9LdNms2Dp/TAGlZjzEsd9eE2oAe7AkeI0krI0XqMSSa/OOuTbe17TmOGBYFE
         BRQv8WaZtHfDownadDroB5RJ70KSxh4KKo5FCROSJlg0HQq+WvKgPSgmX/wSUFAKZMol
         1+Y1UpNsZNA0piMaiu1YfJAdV0e4K37eru823SfXUd4D+tZ4o5ax4xRHgoGuIh2ue592
         vY7KZNKA7pve4wqRtCCPIy96RblQGXPab4uETkAP2Ss4av8ZuchEWWbuYa2U7EVx9jBm
         1zkg==
X-Gm-Message-State: AC+VfDz2pulLcD4AYpRH4LqwHQZ5vlwa7/NbGejRNs/3Ehg85ZRBoNmk
        SG1xGbcoENt9tAa7QCP+4GOW1Q==
X-Google-Smtp-Source: ACHHUZ6zNY1svjGXLpvCmJGQawfhTQZeKLDxcFukUsp4jHoUGvVvkSRJFYurhL+Q/r7uRnv9YWU88A==
X-Received: by 2002:a17:907:629b:b0:95e:e0fa:f724 with SMTP id nd27-20020a170907629b00b0095ee0faf724mr2990008ejc.39.1682617568210;
        Thu, 27 Apr 2023 10:46:08 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id sd14-20020a170906ce2e00b0094f5d1bbb21sm9907802ejb.102.2023.04.27.10.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 10:46:07 -0700 (PDT)
Message-ID: <c12fd2d1-4ea7-44aa-8526-3c766c8e9fa4@linaro.org>
Date:   Thu, 27 Apr 2023 20:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 18/22] drm/msm/dpu: Describe TEAR interrupt registers
 for DSI interfaces
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
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
 <20230411-dpu-intf-te-v4-18-27ce1a5ab5c6@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v4-18-27ce1a5ab5c6@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2023 01:37, Marijn Suijten wrote:
> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
> the PINGPONG block and into the INTF block.  Wire up the IRQ register
> masks in the interrupt table for enabling, reading and clearing them.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 28 +++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  4 ++++
>   2 files changed, 32 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

