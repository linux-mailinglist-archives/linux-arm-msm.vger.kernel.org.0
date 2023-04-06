Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7E46D982A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 15:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbjDFN2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 09:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238302AbjDFN2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 09:28:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC50C61A5
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 06:28:29 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q14so40692759ljm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680787708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRMl5tP4avmZIwtGIOxBRcaMj9GFhkoxx5NiWKp1wTg=;
        b=g6SNlKh2ImuDKwjuN8GoC2n3bz6tqsdQbcUHAAycJ0wm1rj7eeO/5jb2XaH8m9WcW7
         6bMfMmvOupRJo4GP+U14a/xBQRn4fyJyuzeqvJjLQGSPDAhDkXZrQu4sexLYptwecu9r
         zlbiXtMSP/6tkyFGNbDnEGb+yVuTav8cZ4bMRragoC3wUuJwhRBtYy9C6ql7VE36717/
         uZr2BELPnSDIyvZZLSaapMdVNNTB10OO74rLdQvSk8QWuiTChSsxXfvOSX6oxRGW89mU
         UdGGxB673dTPP0M+JK9635akE79A/iHU2nzVBcEpnY0cSsJMyEx91nJQKLpLG/KplcSq
         d/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRMl5tP4avmZIwtGIOxBRcaMj9GFhkoxx5NiWKp1wTg=;
        b=rFoawEz3ZTrHNyzX17PdTwrnY64RW0G+U7gtMQsWYfYoPk5/A1nxIn4/4hyMXXRXNr
         hM07jrQnm7669qcnZF7OpjuBFLZ3CqTFc/dRu0ENpMuSbU+xcK4NeqD+SuXw9NP5JG1j
         UmEElVSKrls1s9KDSyzj9tUWLGeyKmLCjQwxbfUNtyq8UFviVkihTQDtgHMLutJaN8Fa
         bhyEYM2F99Q0AHhgKPUguT0/K9+LZqB5r4ydxYjqX2wgcztO7V9xqi7K2ZebmeY4sCrP
         4HuH8VP/hgVMIiAaLlapMucqszQJlR+/g7jsfZgAIh4bDtWOna5M3u6LbieMBbqKsfuf
         X1oQ==
X-Gm-Message-State: AAQBX9fm/5Y6G053g6u8DoWOcbfJ1qDm1TR9n38gztAaFU2PtGauMD4w
        SiW1d8fdY7rtcn1zIPIIKzzpxQ==
X-Google-Smtp-Source: AKy350aq63xXfADHam0MwfZcQprABn7EPyGc2eWjG6O1DFFxRTSaaT7DFN5OH0kM+MVt8tQdJfntKA==
X-Received: by 2002:a2e:9c50:0:b0:29f:1e4f:a71d with SMTP id t16-20020a2e9c50000000b0029f1e4fa71dmr2967555ljj.44.1680787708197;
        Thu, 06 Apr 2023 06:28:28 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id f3-20020a2e6a03000000b0029c13f4d519sm285717ljc.119.2023.04.06.06.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 06:28:27 -0700 (PDT)
Message-ID: <63da0c87-5343-509e-4786-96a5b10eef33@linaro.org>
Date:   Thu, 6 Apr 2023 15:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 7/7] soundwire: qcom: use tabs for indentation in
 defines
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Patrick Lai <quic_plai@quicinc.com>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3.04.2023 15:25, Krzysztof Kozlowski wrote:
> Use consistently only tabs to indent the value in defines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f2e1135ef113..77a5e4cbbe9b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -58,9 +58,9 @@
>  #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
>  #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
>  #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
> -#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
> -#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
> -#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
> +#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
>  #define SWRM_INTERRUPT_MAX					17
>  #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
>  #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
> @@ -125,20 +125,20 @@
>  #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>  			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
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
>  enum {
>  	MASTER_ID_WSA = 1,
