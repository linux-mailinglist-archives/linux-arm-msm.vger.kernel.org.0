Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F83642768
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiLELWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiLELWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:22:03 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5618318370
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:22:02 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id vp12so26963573ejc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uuxF+03OxLDWzd04I1Gr+8S8nU++NFEjRHNRsVbkrs=;
        b=V16jwDBVJHmyed9xLpJtHHCzH5PHOc5LIMZRtlnXKM9Ry31+weByEAcGHV08goaxvw
         FCWS2YouPHFfM4TuhQi4QeENkYXydiqQUo0Awyqnn+r+OKxe3gohaB/BNwfvFxfRMRhS
         pOzbd5DFzljkKry5g6i0PTponpclF43l0AOY9W0eJA4CEb12Zs6fFZXRLKxOT8jmLD97
         tmVxq5mUvi7oFigvHhZDKN+E5RGevTvBJwIkN8a2oWZmJsxSqCdvsENV6p93n9iqYdjn
         uCHe631SoY/cB8S0EpScKSJJzRdLaJ+ld99H2+AADEBMuWR5iWxG3uJQrsd5eNQTfE9a
         9Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uuxF+03OxLDWzd04I1Gr+8S8nU++NFEjRHNRsVbkrs=;
        b=39MblF+9tt8UKSuePrOmNhhA53RMp7rsUrg3J56oh3AgHBee37PuekVuMRX3F4SZ1i
         f8VvZmw2Y7TwSgP9pgh/68fvfmtY+SPQTdXyAZHtmaERRhPUnsJK5YBqA2SXwYZ4nxqB
         gaxpq70nixhxud10Yk3a3jiUqOOibGt8iiqsTD1DMcLPSoka9WyNjXI9NOLhwF4Ag+NM
         KwdPsmxBBwfGAmYPRzwlFoGWoS5j9Ks/McnbjrII+9Scp9GqcW844P4ekBtxHTpyUdlU
         9pehs6Xu53iPncLdaTEr8hV+lrCrlTzJC4CRsNaL05/jjirdUgQHD0vVUqFdClUU7T41
         Hjmw==
X-Gm-Message-State: ANoB5pkg8BBpluhK7g518Vj9pDI7CGeviQqpEkS1+LG3yE10azm61wKh
        fSAqWbDQ2786TQip2g5zdp2A8g==
X-Google-Smtp-Source: AA0mqf7secuzwzbQbaeFY86Vq5fEr+7USSWHg5fUKg0XPMxtM/BydOBcxXCNsztQhqYOexOb3wcuMA==
X-Received: by 2002:a17:906:1985:b0:7ad:d1ab:2431 with SMTP id g5-20020a170906198500b007add1ab2431mr66633472ejd.213.1670239320897;
        Mon, 05 Dec 2022 03:22:00 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b0079800b8173asm6143867ejd.158.2022.12.05.03.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:21:59 -0800 (PST)
Message-ID: <975af158-920b-4077-66ae-a79250917c93@linaro.org>
Date:   Mon, 5 Dec 2022 12:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 08/16] clk: qcom: smd-rpm: drop the rpm_status_id field
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:58, Dmitry Baryshkov wrote:
> The rpm_status_id field is a leftover from the non-SMD clocks. It is of
> no use for the SMD-RPM clock driver and is always equal to zero. Drop it
> completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index e52e0e242294..828cae6769f9 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -25,13 +25,11 @@
>   #define QCOM_RPM_SMD_KEY_STATE				0x54415453
>   #define QCOM_RPM_SCALING_ENABLE_ID			0x2
>   
> -#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, stat_id,  \
> -			     key)					      \
> +#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
>   	static struct clk_smd_rpm _platform##_##_active;		      \
>   	static struct clk_smd_rpm _platform##_##_name = {		      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
> -		.rpm_status_id = (stat_id),				      \
>   		.rpm_key = (key),					      \
>   		.peer = &_platform##_##_active,				      \
>   		.rate = INT_MAX,					      \
> @@ -48,7 +46,6 @@
>   	static struct clk_smd_rpm _platform##_##_active = {		      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
> -		.rpm_status_id = (stat_id),				      \
>   		.active_only = true,					      \
>   		.rpm_key = (key),					      \
>   		.peer = &_platform##_##_name,				      \
> @@ -65,12 +62,11 @@
>   	}
>   
>   #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
> -				    stat_id, r, key)			      \
> +				    r, key)			      \
>   	static struct clk_smd_rpm _platform##_##_active;		      \
>   	static struct clk_smd_rpm _platform##_##_name = {		      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
> -		.rpm_status_id = (stat_id),				      \
>   		.rpm_key = (key),					      \
>   		.branch = true,						      \
>   		.peer = &_platform##_##_active,				      \
> @@ -88,7 +84,6 @@
>   	static struct clk_smd_rpm _platform##_##_active = {		      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
> -		.rpm_status_id = (stat_id),				      \
>   		.active_only = true,					      \
>   		.rpm_key = (key),					      \
>   		.branch = true,						      \
> @@ -107,19 +102,19 @@
>   
>   #define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
>   		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> -		0, QCOM_RPM_SMD_KEY_RATE)
> +		QCOM_RPM_SMD_KEY_RATE)
>   
>   #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> -		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
> +		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>   
>   #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
>   		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> -		0, QCOM_RPM_SMD_KEY_STATE)
> +		QCOM_RPM_SMD_KEY_STATE)
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>   		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
> @@ -128,7 +123,7 @@
>   					     r_id, r);			      \
>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
>   		_active##_pin,						      \
> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>   		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
>   
>   #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
> @@ -137,7 +132,6 @@ struct clk_smd_rpm {
>   	const int rpm_res_type;
>   	const int rpm_key;
>   	const int rpm_clk_id;
> -	const int rpm_status_id;
>   	const bool active_only;
>   	bool enabled;
>   	bool branch;
