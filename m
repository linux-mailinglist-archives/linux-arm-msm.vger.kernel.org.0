Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC856DC0CC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Apr 2023 19:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjDIRKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Apr 2023 13:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjDIRKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Apr 2023 13:10:38 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F90730F6
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Apr 2023 10:10:37 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id by8so3044300ljb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Apr 2023 10:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681060235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqN5vgtmzxPJB8D1iXb0mZavhJ/16WwLHBHQdEhshG8=;
        b=UubL+kDMhJ8ZZV8GrkKlNeoK+Fgt9uODY9F/4uOfgJW1A7AczaW3whACUvO6pEmwYL
         jH/0/DU8xR3P3IFAxdvU3PfgvQQfMQRIvuHMCd+GWd1M7cVq8svh1KU7OJ6S6Yd8hzKJ
         LcFtLa+10I9bSR/uYcw3XGlxwpHrwY0N0ED4PvVoUyjPy8yRRjdy9b34d50DZhlcu0/O
         uKK9hPlXunfaTg7ZuGUc3CUlpRr5GPsRF8QKFH8ePIziJpJqtooL750bCFce8owaF5gF
         SjMiMgmIFJCJij3mQZmX3gomoJq2biZif2JfXMdNvFyWe1uITBGFskXbGw+Ae+Wh43OZ
         WgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681060235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqN5vgtmzxPJB8D1iXb0mZavhJ/16WwLHBHQdEhshG8=;
        b=1HbCLFmGT/TvODFToB3kk4oWBH6gQAJZgtSJshyMpBm6NeqsrcuGFKEtAMQYHju8fj
         K5mVeBR2L8+3inRSEqhwN39OwZBN/+JSWLz+AeMcLzrom1CDi1Z4u7QnHEjL/Zjwj9X3
         QiAc9wZp6r7M+yagmG69kw+tR24UJhw6aYu9FtgMC+RnMzcyq2vaAjCacTIpY5qoUIdJ
         yGyNk5349hcRJNs+ZnFu1xUQnejLUbgnVpVLG+w67cIK9l1riq6MwPL5ttO2PUGUn08H
         ak/Q6kCIi3UMqvfUoijTZKV/5zR6Gq3kxrbl5rYUfnoK2vBMgC99xW1/kIK0ils6kUzg
         gweA==
X-Gm-Message-State: AAQBX9cFLhJmUlibwc7bCCfUFESKgt02vO0Tk5Ssb5NuUC4n9I/Hp6+D
        XdZPNEX46s+Ke1kt+benp0M62g==
X-Google-Smtp-Source: AKy350bH1RgV7K/b9fCo/Px2MsMXTrmdymWA/1p7u4u57HbI73GPv8Bg4+mkj+1aXbwv6CFc/u6xXA==
X-Received: by 2002:a2e:9447:0:b0:299:ac61:4e78 with SMTP id o7-20020a2e9447000000b00299ac614e78mr2182673ljh.10.1681060235588;
        Sun, 09 Apr 2023 10:10:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s17-20020a2e9c11000000b002a773ce93casm364538lji.137.2023.04.09.10.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 10:10:35 -0700 (PDT)
Message-ID: <0f7f2f1d-3b05-ebf1-33fc-e5904200737d@linaro.org>
Date:   Sun, 9 Apr 2023 20:10:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] venus: enable sufficient sequence change support
 for vp9
Content-Language: en-GB
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-media@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Viswanath Boma <quic_vboma@quicinc.com>
References: <1680848758-3947-1-git-send-email-quic_dikshita@quicinc.com>
 <1680848758-3947-3-git-send-email-quic_dikshita@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1680848758-3947-3-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2023 09:25, Dikshita Agarwal wrote:
> VP9 supports resolution change at interframe.
> Currenlty, if sequence change is detected at interframe and
> resources are sufficient, sequence change event is not raised
> by firmware to driver until the next keyframe.
> This change add the HFI to notify the sequence change in this
> case to driver.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>

Order of sign-offs is incorrect. The SoB of the sender should be the 
last one.

> Tested-by: Nathan Hebert <nhebert@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.c   | 1 +
>   drivers/media/platform/qcom/venus/hfi_helper.h | 2 ++
>   drivers/media/platform/qcom/venus/vdec.c       | 8 ++++++++
>   3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 930b743..e2539b5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -521,6 +521,7 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
>   		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*en);
>   		break;
>   	}
> +	case HFI_PROPERTY_PARAM_VDEC_ENABLE_SUFFICIENT_SEQCHANGE_EVENT:
>   	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER: {
>   		struct hfi_enable *in = pdata;
>   		struct hfi_enable *en = prop_data;
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index d2d6719..2e03b6e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -469,6 +469,8 @@
>   #define HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH			0x1003007
>   #define HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT			0x1003009
>   #define HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE			0x100300a
> +#define HFI_PROPERTY_PARAM_VDEC_ENABLE_SUFFICIENT_SEQCHANGE_EVENT \
> +								0x100300b
>   
>   /*
>    * HFI_PROPERTY_CONFIG_VDEC_COMMON_START
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4ceaba3..f0394b9 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -671,6 +671,14 @@ static int vdec_set_properties(struct venus_inst *inst)
>   			return ret;
>   	}
>   
> +	/* Enabling sufficient sequence change support for VP9 */
> +	if (is_fw_rev_or_newer(inst->core, 5, 4, 51)) {
> +		ptype = HFI_PROPERTY_PARAM_VDEC_ENABLE_SUFFICIENT_SEQCHANGE_EVENT;
> +		ret = hfi_session_set_property(inst, ptype, &en);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	ptype = HFI_PROPERTY_PARAM_VDEC_CONCEAL_COLOR;
>   	conceal = ctr->conceal_color & 0xffff;
>   	conceal |= ((ctr->conceal_color >> 16) & 0xffff) << 10;

-- 
With best wishes
Dmitry

