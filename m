Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A856B182E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 01:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCIAue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 19:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCIAuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 19:50:22 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCA499251
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 16:50:14 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id a32so236852ljq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 16:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678323012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gj6M8LTT3Uy5owTIXcvfrHSdcPzP2cHKgmz0Ok2mm3U=;
        b=l8P8GVXKDZtKAmRCS5NgablkhlkND/P0Y7yfXSOJ5UUK2scYFkB3hWJWM1Rux9yamh
         WOVEAudP63ITYWlQdeDKvx+NBUbiyur8L5yKQCE4euc3SjDS5y3VPEIJXyHNEN45LKT1
         yKrQS4ECJFRHew4trSVK0YycYArUiFfLBP7IhH0CUOkGZl/xryiNDu7TF8MENphdpggv
         pwF6vZI0VgdgP/znUjZD4gv8bTYUkarbqv2BsKqEUHBga84U/MfeSoMV00IPpeHhZqcl
         XnlgwAFOX+tdURG9yOoiLr1uiiQFs2XZAUKWLbghzn6ESX3D3Lp8iMrXESQKk4S5wwlx
         bWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678323012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj6M8LTT3Uy5owTIXcvfrHSdcPzP2cHKgmz0Ok2mm3U=;
        b=p7kC8l5mzX3bqgSmlxnrv80xDTDjyXLmAP4y8e1pSyHbv/aEtKAmvRFQJ2obi5IEoM
         9bkoZdAPoEUK72XzDC+jWc2TuRJ80sIO/JmtZBIMSeeUjXCotLdReTON4kKbYUiYjEPE
         m0kbObkoXItijDsU834fp66RZOg2I++RIj90CjcRCt0t0kyWraWuUGu/RC0ONiwEYPuv
         307dxlJ9dWNXPQWBWzLI3oC0DVjMk3PeXdBJvjRUd1GR0xftfpAMU7+U26HFm6g+P/Nq
         CCSgkYc8/6wCEt+BdW9qVXb8TpTewq/Pc3/r7DShYXSBfedU/wfbOQbd3KsyMWGn/sZj
         x6ZQ==
X-Gm-Message-State: AO0yUKV65Mp1lyBl9BgBTvRPzxiDnEOsmsp548W9p+t903zvokB7MsSX
        7KUOXhj3tY81H1V274g56ZhPiw==
X-Google-Smtp-Source: AK7set+OWTKFNn4nZkpqlH5XG0e2BTmSXWMHfiAxMDvd4QwPZ3wtrg0pObrrPIXgxEH3Rf1LX8t+5A==
X-Received: by 2002:a2e:9f03:0:b0:295:bcfb:af2a with SMTP id u3-20020a2e9f03000000b00295bcfbaf2amr5156044ljk.52.1678323012355;
        Wed, 08 Mar 2023 16:50:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r2-20020a2e8e22000000b00295b6bdfdfdsm2760026ljk.4.2023.03.08.16.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:50:11 -0800 (PST)
Message-ID: <668b950b-60c2-a8a8-722b-197b50de7139@linaro.org>
Date:   Thu, 9 Mar 2023 02:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 07/14] clk: qcom: smd-rpm: Make
 __DEFINE_CLK_SMD_RPM_PREFIX accept flags
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-7-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-7-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), make the
> __DEFINE_CLK_SMD_RPM_PREFIX macro accept clock flags for the active-only
> clock.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

