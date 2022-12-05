Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092C2642E31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiLERFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiLERE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:04:57 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDC81838D
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:04:56 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id s14so8597699qvo.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0glkS7i894sy6UaYbp4HFCMWg4xwuIMvg+RzwqmS28=;
        b=ekDMSvFSdEjtcgkCeN9huVrTegMSrm9fF9DIM4RBc6WF/zHd2Eq5JK30cy236R/na5
         +0e+a7FlhubOjo1GHOv5Tke613QVi7B3Disylu37AaERhefgWlOxP7YxUNiYur/uP4DV
         bJDR0QsI5iq+fH4BmtpBKZHJVH+ZSrTZ5cMW0tu08So5pWCBUyBoT3rBkRflzb5rWu52
         3qNCKLyOBPIRXXA9+C1N87okqCUwlxCGleqYtru2j5FhfLKvdTBipziWGOnvMzmWXJah
         bMdYV9kP3QpbMD5s/cJqMNswR1iYgaKuY+eZmXJr0HXnIm3KyCZRv7XLijF8TPKhRiQ6
         tmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0glkS7i894sy6UaYbp4HFCMWg4xwuIMvg+RzwqmS28=;
        b=XndUiWxlqiCUEB0meZc/bYVgfdgL7XuW9I8oyv2OeHhBqAPFwvHk/AcC9Vp8r3yAx9
         xSaHmBgtmc4iyl/6MAf5eWDmSebg7e61VEWhoPn9z5Bav9wuVIbSGJ3qUimPWkiFZpZb
         M3TZHWEwKeUhd+m0fCxpTIqQtdPg3VnAamiHJulcvNeQgpKuD4v7DYfbSrtAyQyXwms3
         79YDSPLCuYWcamGDs7SwQOIFlh+lrTpD0uLCFuVMp3rBv/h4pM+s+EZ8Et1SdogdkJAP
         hHYMLO/nNmuZAhw7P21P3Og0YXSTFqlUvU6l0RW/o2JIx3tT2wLlHT4YLZjA3I+AOJnt
         mJwg==
X-Gm-Message-State: ANoB5plBdIo/eEQLHmjEbIBU1Kzr8zqP+PmmuX9zKEqdazvZc++uRf9p
        KXGvii0y/2Q1pLrzvtKAYaySwT0qrMKJgNGZ
X-Google-Smtp-Source: AA0mqf5qL5UbzuWtodAHBC7oFhdWmMN0ADVp1uG4Tv+48kxwTXE3nplGHf2l9L+IwVCdbfiPQfH0Sg==
X-Received: by 2002:a0c:c584:0:b0:4c7:1e33:847d with SMTP id a4-20020a0cc584000000b004c71e33847dmr22627585qvj.46.1670259895762;
        Mon, 05 Dec 2022 09:04:55 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ay9-20020a05620a178900b006faa88ba2b5sm12718639qkb.7.2022.12.05.09.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:55 -0800 (PST)
Message-ID: <b250eddc-5164-817a-1c8b-26999feb6b27@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/16] clk: qcom: smd-rpm: drop the rpm_status_id field
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-9-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
> The rpm_status_id field is a leftover from the non-SMD clocks. It is of
> no use for the SMD-RPM clock driver and is always equal to zero. Drop it
> completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since the macro is defining static structures it's fine, but it
could be reassuring to see the rpm_status_id explicitly assigned
to 0.  (Just a comment, no change needed.)  It's a good change.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
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

