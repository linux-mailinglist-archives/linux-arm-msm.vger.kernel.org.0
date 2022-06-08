Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE90F542EB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 13:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237753AbiFHLEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 07:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237763AbiFHLEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 07:04:51 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610F9201FDB
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 04:04:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so3143582wmq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=GgaoEba9JTX/8rf6MhX/IHFUfnxIpKajZjqqNMcI1dE=;
        b=R8OVVjXXNfqwmr4RyFvKq0FPMbmCY6x1lamR22m6KbEUlP7j7PiSI2KIoeppC4SkTI
         xaybNffpGSQdTqY6jkv0esrcL16DP7F2oOTT+qLXyRwxrFbguHkD09ewOgbWQ/rPmHud
         jMrp6CRBomTmGje13S+DV2aqBpfwVbrIAglqc9Me4Rtp1obrnEhJARd2O5DPSnViuzqb
         3xY3IScRh2j2EBctqFn2xvlX12ZW8LRDfozoH8yEyhBIDARBqQwkQ59fNGGhRUeWp8BO
         MaUxfLQ1yAArzMEkbK1T/G1lyoOrxFOAbuFGW5tqxSMQxol8P5lPdyRcvsRW8qv4M0eb
         Nc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GgaoEba9JTX/8rf6MhX/IHFUfnxIpKajZjqqNMcI1dE=;
        b=WcYfaLfSRr5ONUcEq4mnQASOSUoEPKW9jrLKeB8xTEGoIEwDO6PpZsmhBJb4oliI2w
         2OxyNjn1U8Jb7lPfnpf3aCBO31qOKZiHnuh7QAEKC7ejUJDOqOk/Q0IM0dVLVSe3d8KY
         KdrvXAIENL+RhSgAS54/olLefTZ/+v6/U3sDzuPTxp5DVuCoAtFndDBodJGXtcab8lZX
         jT3/P6C8vMsA9UMOdZZg/SuY06YjekoWZNc48Ir3beHEYrfI05Z/1x6gAo0E7neRggiN
         +YiPITEkiEov7AnBOvqMGXUN5ylCS4GyppsCBKdVFT2tbPmLYxbnOP+RmpEUyMV1EWwh
         jI0Q==
X-Gm-Message-State: AOAM530Rj6ssgPf40mLnUSKTfIgAIjQz6mwT4QSPUMcV0rhHAXZbUtO5
        sJvVo50jJHKn3QWNxnBwyL4FmA==
X-Google-Smtp-Source: ABdhPJz/cEPCAdCYd2kfWJjqjQ45KHiD/unWUtPlJ67tPiMmmF9NpW0vtFwO0pisM7jXeHZSa+zt6A==
X-Received: by 2002:a7b:c3cd:0:b0:39c:474b:2056 with SMTP id t13-20020a7bc3cd000000b0039c474b2056mr22726329wmj.30.1654686285787;
        Wed, 08 Jun 2022 04:04:45 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id o12-20020a5d58cc000000b0020c6b78eb5asm21212543wrf.68.2022.06.08.04.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 04:04:45 -0700 (PDT)
Message-ID: <adb12452-dacd-7fb7-5153-220a2324fa71@linaro.org>
Date:   Wed, 8 Jun 2022 12:04:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] soundwire: qcom: Add flag for software clock
 gating check
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, vkoul@kernel.org
References: <1654667824-3760-1-git-send-email-quic_srivasam@quicinc.com>
 <1654667824-3760-2-git-send-email-quic_srivasam@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1654667824-3760-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/06/2022 06:57, Srinivasa Rao Mandadapu wrote:
> Add flag in qcom_swrm_data private data structure for validating
> software colck gating control requirement.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   drivers/soundwire/qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a3fccf0..38c3bf5 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -181,6 +181,7 @@ struct qcom_swrm_ctrl {
>   struct qcom_swrm_data {
>   	u32 default_cols;
>   	u32 default_rows;
> +	bool sw_clk_gate_required;
>   };
>   
>   static const struct qcom_swrm_data swrm_v1_3_data = {
