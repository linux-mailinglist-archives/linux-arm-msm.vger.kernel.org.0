Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3199D6E0E31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 15:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjDMNM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 09:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjDMNM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 09:12:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AD1A26E
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 06:11:52 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id dm2so37406438ejc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681391511; x=1683983511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCWUaiaWVnGIwMXJ072+drdEdGoVEQpMTGC5dkuhkzs=;
        b=gOE0ushqz0Cf8TvKuw85UEHNM+zO9/7/DBFwDl4ukRzgE2P/+QWipzXCoxv5Pu0P52
         Q63G/7jfgm/4l+6XJywI04qJPLCXIrbpRKpwGaC/6UyZOadVRT9ohA3AfZerRm2v08S+
         ki1As17D4K8Mudlkv6SgPeq0FzDra/okKDXdhJs9wR6TifjNyY1n2yMU43ubZjmqW1l8
         fDML3le/6xGOjHwTqDuyTTShNOUtGih4oWjEGlkNlzu/5NWS5/OJYFpFh6/rUZnxZs6D
         bxj63uHIG4/ynQm0znyw4ulGSnUCGJVojYZbKIxDsguFZejgys6CJInNZwyfxh1/vJ31
         hjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391511; x=1683983511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWUaiaWVnGIwMXJ072+drdEdGoVEQpMTGC5dkuhkzs=;
        b=R+S49UNPd8mq2n3eWGCo4MLMEMPwj4v1nG1Tpr0rvLj6eLPX3ufebcCBpMeu2sMtDt
         XP1H9bioOGFa9SWXqyxY0mH3HRCP6MojyHDJrNpfTuZEVLmguxDahdQoczKNUzswLiZ1
         URNlvXzzdX2S8j/nPBn38GIVI9SJpOcB2wPmfd/hayJAqOnnrq1B4e4F0D91q7s7PVqo
         CDOUfFXCXibLr0dSBZBiCe+w5X26aXv8OWTLwPhTIjnKeALNVzD3Ot5TdR3li+CVIxsU
         dN4aYNkPYNr5V+LmXf52LM2NJXeVvU0OJEKpkr6/J1x6BReY9EUOv79uoRIExDBTTqMs
         1I+w==
X-Gm-Message-State: AAQBX9dJc6IM41f14D2DH+76xywyWfjVgrGg7541C79006pon1s096k3
        06NuDPAaGXp9IiLC7p/Au2+m/w==
X-Google-Smtp-Source: AKy350YJ3uLaEKYbCc3ihWijhwZDDaFIcsFka/6gnLknW+fWV2K5RQUvLCR1fAH6/lNXlxY0M+dGPA==
X-Received: by 2002:a17:907:d042:b0:94e:c40d:18f4 with SMTP id vb2-20020a170907d04200b0094ec40d18f4mr382489ejc.1.1681391510693;
        Thu, 13 Apr 2023 06:11:50 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id s24-20020a170906961800b0094dde59ad39sm969889ejx.79.2023.04.13.06.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:11:49 -0700 (PDT)
Message-ID: <541e2684-9df6-b875-df2e-a33ceee7c780@linaro.org>
Date:   Thu, 13 Apr 2023 14:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 7/7] soundwire: qcom: use tabs for indentation in
 defines
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Patrick Lai <quic_plai@quicinc.com>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/04/2023 14:25, Krzysztof Kozlowski wrote:
> Use consistently only tabs to indent the value in defines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   drivers/soundwire/qcom.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f2e1135ef113..77a5e4cbbe9b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -58,9 +58,9 @@
>   #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
>   #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
>   #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
> -#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
> -#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
> -#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
> +#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
>   #define SWRM_INTERRUPT_MAX					17
>   #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
>   #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
> @@ -125,20 +125,20 @@
>   #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>   			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
>   
> -#define MAX_FREQ_NUM		1
> -#define TIMEOUT_MS		100
> -#define QCOM_SWRM_MAX_RD_LEN	0x1
> -#define QCOM_SDW_MAX_PORTS	14
> -#define DEFAULT_CLK_FREQ	9600000
> -#define SWRM_MAX_DAIS		0xF
> -#define SWR_INVALID_PARAM 0xFF
> -#define SWR_HSTOP_MAX_VAL 0xF
> -#define SWR_HSTART_MIN_VAL 0x0
> -#define SWR_BROADCAST_CMD_ID    0x0F
> -#define SWR_MAX_CMD_ID	14
> -#define MAX_FIFO_RD_RETRY 3
> -#define SWR_OVERFLOW_RETRY_COUNT 30
> -#define SWRM_LINK_STATUS_RETRY_CNT 100
> +#define MAX_FREQ_NUM						1
> +#define TIMEOUT_MS						100
> +#define QCOM_SWRM_MAX_RD_LEN					0x1
> +#define QCOM_SDW_MAX_PORTS					14
> +#define DEFAULT_CLK_FREQ					9600000
> +#define SWRM_MAX_DAIS						0xF
> +#define SWR_INVALID_PARAM					0xFF
> +#define SWR_HSTOP_MAX_VAL					0xF
> +#define SWR_HSTART_MIN_VAL					0x0
> +#define SWR_BROADCAST_CMD_ID					0x0F
> +#define SWR_MAX_CMD_ID						14
> +#define MAX_FIFO_RD_RETRY					3
> +#define SWR_OVERFLOW_RETRY_COUNT				30
> +#define SWRM_LINK_STATUS_RETRY_CNT				100
>   
>   enum {
>   	MASTER_ID_WSA = 1,
