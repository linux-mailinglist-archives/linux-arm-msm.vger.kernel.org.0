Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A9A63F813
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 20:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiLATV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 14:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLATV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 14:21:26 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AC0B5D8B
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 11:21:25 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id h24so2142177qta.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 11:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HvhV+BehbrfQKfVYjjvI2R6vuj+JQoQJPNZguzNrYM=;
        b=TF88Ymh9dN7EFV9PjxlQq31tZSIiAadPgxOHP18UTl7XgaW8eeD1J5/YfQPhmYlDeC
         5PY+0hr9rwWnlPV1qCy9iKPC6YGgFj4kBiIqcFVgKqWQBMLxxEBm/Huv8plzUgzSJ7lH
         ZCotYJuj34eLmCTbin5GSj1VU90urjvMlsff+GUfd8h8hbTjDN/CIPIF/FR8J0oa4ULJ
         yeLivoNUo5Abj6K5FgyHWxjGh+pVfYIGXv83goo12TgEXQkGSXLRUeCytHWgl2yhhPv0
         MDWSYZVUUWx6I72eHZVmpN8mq4ct2pDaAs2viCZX+u29EmarnxfGU9udfqpyc5D6PBwG
         6UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HvhV+BehbrfQKfVYjjvI2R6vuj+JQoQJPNZguzNrYM=;
        b=dX0OYll5blhaejqjEARBiDq5d/xA+2KCUXlwdoH2xCseUjYoZr25+b//7zk2woZnsa
         g0jpjcyItk/0O3g8njb4mP7gaNYOcMWVTQfhA9iXytdp2ItOK4Yfgll4JDx7Sd8utef5
         M8koQ2WSeTcDulIM8Vfh+2xvdJWHzWTMNCclUb3nBdstwD4KH9Njf7/OuFucPj98qlf8
         ycobhvNp5EqNpiRsMkXxRBn9G/Lc2S3xERe38kDSd5bqUbYzw89gpa9uD1+McdL/f1EH
         owQefNXYpxcW/7tOg9wIfFOjVexF6KoHmlKFK79/td//9c1W65xz1mjtBw1pQbtyE6vD
         hDWQ==
X-Gm-Message-State: ANoB5pm0jIXUdqxNH5R8KdNiJZSCsJ7mBF7Tuj+BPi+9evXBDjmkOhb9
        FybrLCBsuo1Jxhekn6WBFiYvpO8xtsj8Kw==
X-Google-Smtp-Source: AA0mqf5x3TvQjtigcprJTSCmgzC8f0iBjaavot5vbN2RIGi2EuM9RZohEbO0lgn/leUhwHDwBgaA1g==
X-Received: by 2002:a05:622a:228c:b0:3a5:c024:7f31 with SMTP id ay12-20020a05622a228c00b003a5c0247f31mr62979735qtb.311.1669922484896;
        Thu, 01 Dec 2022 11:21:24 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id u12-20020ac8750c000000b003a622111f2csm2912975qtq.86.2022.12.01.11.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 11:21:24 -0800 (PST)
Message-ID: <0a12ee5d-8bbe-7fbc-1d43-1c1b5ca750af@linaro.org>
Date:   Thu, 1 Dec 2022 13:21:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 8/8] clk: qcom: rpm: drop the platform from clock
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-9-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221130131001.20912-9-dmitry.baryshkov@linaro.org>
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

On 11/30/22 7:10 AM, Dmitry Baryshkov wrote:
> A single clock definition can be used on different platforms. Thus the
> platform part of the clock name is not correct (and can be misleading).
> 
> Remove the platform-specific part of the defined clock.

I didn't realize this was "clk_rpm" and not "clk_rpmh"...

Why didn't you also manufacture the "active only" (or just
"active"?) clocks here too?  I didn't look closely but it
seems like the definitions in "clk-rpm.c" could be transformed
further, as you have done in "clk-rpmh.c".

And if you do that, maybe it's a second series?

Anyway, this generally looks good to me but I'll wait until
you re-send to sign off on it.

Thanks.

					-Alex

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-rpm.c | 194 +++++++++++++++++--------------------
>   1 file changed, 89 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index 747c473b0b5e..bcab76776571 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -31,11 +31,11 @@ static const struct clk_parent_data gcc_cxo[] = {
>   	{ .fw_name = "cxo", .name = "cxo_board" },
>   };
>   
> -#define DEFINE_CLK_RPM(_platform, _name, _active, r_id)			      \
> -	static struct clk_rpm _platform##_##_active;			      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> +#define DEFINE_CLK_RPM(_name, _active, r_id)				      \
> +	static struct clk_rpm clk_rpm_##_active;			      \
> +	static struct clk_rpm clk_rpm_##_name = {			      \
>   		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_active,				      \
> +		.peer = &clk_rpm_##_active,				      \
>   		.rate = INT_MAX,					      \
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_rpm_ops,				      \
> @@ -44,9 +44,9 @@ static const struct clk_parent_data gcc_cxo[] = {
>   			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
>   		},							      \
>   	};								      \
> -	static struct clk_rpm _platform##_##_active = {			      \
> +	static struct clk_rpm clk_rpm_##_active = {			      \
>   		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_name,				      \
> +		.peer = &clk_rpm_##_name,				      \
>   		.active_only = true,					      \
>   		.rate = INT_MAX,					      \
>   		.hw.init = &(struct clk_init_data){			      \
> @@ -57,20 +57,20 @@ static const struct clk_parent_data gcc_cxo[] = {
>   		},							      \
>   	}
>   
> -#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, _active, offset)	      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> +#define DEFINE_CLK_RPM_XO_BUFFER(_name, _active, offset)		      \
> +	static struct clk_rpm clk_rpm_##_name = {			      \
>   		.rpm_clk_id = QCOM_RPM_CXO_BUFFERS,			      \
>   		.xo_offset = (offset),					      \
>   		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_xo_ops,			      \
> +			.ops = &clk_rpm_xo_ops,				      \
>   			.name = #_name,					      \
>   			.parent_data = gcc_cxo,				      \
>   			.num_parents = ARRAY_SIZE(gcc_cxo),		      \
>   		},							      \
>   	}
>   
> -#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> +#define DEFINE_CLK_RPM_FIXED(_name, _active, r_id, r)			      \
> +	static struct clk_rpm clk_rpm_##_name = {			      \
>   		.rpm_clk_id = (r_id),					      \
>   		.rate = (r),						      \
>   		.hw.init = &(struct clk_init_data){			      \
> @@ -403,37 +403,47 @@ static const struct clk_ops clk_rpm_ops = {
>   };
>   
>   /* MSM8660/APQ8060 */
> -DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> -DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> -DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> -DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> -DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> -DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
> +DEFINE_CLK_RPM(afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> +DEFINE_CLK_RPM(sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> +DEFINE_CLK_RPM(mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> +DEFINE_CLK_RPM(daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> +DEFINE_CLK_RPM(sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> +DEFINE_CLK_RPM(cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> +DEFINE_CLK_RPM(mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> +DEFINE_CLK_RPM(smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> +DEFINE_CLK_RPM(ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> +DEFINE_CLK_RPM(qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
> +DEFINE_CLK_RPM(nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> +DEFINE_CLK_RPM(nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> +
> +DEFINE_CLK_RPM_FIXED(pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
> +
> +DEFINE_CLK_RPM_XO_BUFFER(xo_d0_clk, xo_d0_a_clk, 0);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_d1_clk, xo_d1_a_clk, 8);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_a0_clk, xo_a0_a_clk, 16);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_a1_clk, xo_a1_a_clk, 24);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_a2_clk, xo_a2_a_clk, 28);
>   
>   static struct clk_rpm *msm8660_clks[] = {
> -	[RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
> -	[RPM_APPS_FABRIC_A_CLK] = &msm8660_afab_a_clk,
> -	[RPM_SYS_FABRIC_CLK] = &msm8660_sfab_clk,
> -	[RPM_SYS_FABRIC_A_CLK] = &msm8660_sfab_a_clk,
> -	[RPM_MM_FABRIC_CLK] = &msm8660_mmfab_clk,
> -	[RPM_MM_FABRIC_A_CLK] = &msm8660_mmfab_a_clk,
> -	[RPM_DAYTONA_FABRIC_CLK] = &msm8660_daytona_clk,
> -	[RPM_DAYTONA_FABRIC_A_CLK] = &msm8660_daytona_a_clk,
> -	[RPM_SFPB_CLK] = &msm8660_sfpb_clk,
> -	[RPM_SFPB_A_CLK] = &msm8660_sfpb_a_clk,
> -	[RPM_CFPB_CLK] = &msm8660_cfpb_clk,
> -	[RPM_CFPB_A_CLK] = &msm8660_cfpb_a_clk,
> -	[RPM_MMFPB_CLK] = &msm8660_mmfpb_clk,
> -	[RPM_MMFPB_A_CLK] = &msm8660_mmfpb_a_clk,
> -	[RPM_SMI_CLK] = &msm8660_smi_clk,
> -	[RPM_SMI_A_CLK] = &msm8660_smi_a_clk,
> -	[RPM_EBI1_CLK] = &msm8660_ebi1_clk,
> -	[RPM_EBI1_A_CLK] = &msm8660_ebi1_a_clk,
> -	[RPM_PLL4_CLK] = &msm8660_pll4_clk,
> +	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> +	[RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
> +	[RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> +	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> +	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> +	[RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
> +	[RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
> +	[RPM_SMI_CLK] = &clk_rpm_smi_clk,
> +	[RPM_SMI_A_CLK] = &clk_rpm_smi_a_clk,
> +	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> +	[RPM_PLL4_CLK] = &clk_rpm_pll4_clk,
>   };
>   
>   static const struct rpm_clk_desc rpm_clk_msm8660 = {
> @@ -441,46 +451,30 @@ static const struct rpm_clk_desc rpm_clk_msm8660 = {
>   	.num_clks = ARRAY_SIZE(msm8660_clks),
>   };
>   
> -/* apq8064 */
> -DEFINE_CLK_RPM(apq8064, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> -DEFINE_CLK_RPM(apq8064, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> -DEFINE_CLK_RPM(apq8064, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> -DEFINE_CLK_RPM(apq8064, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> -DEFINE_CLK_RPM(apq8064, qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, xo_d0_a_clk, 0);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, xo_d1_a_clk, 8);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, xo_a0_a_clk, 16);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, xo_a1_a_clk, 24);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, xo_a2_a_clk, 28);
> -
>   static struct clk_rpm *apq8064_clks[] = {
> -	[RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
> -	[RPM_APPS_FABRIC_A_CLK] = &apq8064_afab_a_clk,
> -	[RPM_CFPB_CLK] = &apq8064_cfpb_clk,
> -	[RPM_CFPB_A_CLK] = &apq8064_cfpb_a_clk,
> -	[RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
> -	[RPM_DAYTONA_FABRIC_A_CLK] = &apq8064_daytona_a_clk,
> -	[RPM_EBI1_CLK] = &apq8064_ebi1_clk,
> -	[RPM_EBI1_A_CLK] = &apq8064_ebi1_a_clk,
> -	[RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
> -	[RPM_MM_FABRIC_A_CLK] = &apq8064_mmfab_a_clk,
> -	[RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
> -	[RPM_MMFPB_A_CLK] = &apq8064_mmfpb_a_clk,
> -	[RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
> -	[RPM_SYS_FABRIC_A_CLK] = &apq8064_sfab_a_clk,
> -	[RPM_SFPB_CLK] = &apq8064_sfpb_clk,
> -	[RPM_SFPB_A_CLK] = &apq8064_sfpb_a_clk,
> -	[RPM_QDSS_CLK] = &apq8064_qdss_clk,
> -	[RPM_QDSS_A_CLK] = &apq8064_qdss_a_clk,
> -	[RPM_XO_D0] = &apq8064_xo_d0_clk,
> -	[RPM_XO_D1] = &apq8064_xo_d1_clk,
> -	[RPM_XO_A0] = &apq8064_xo_a0_clk,
> -	[RPM_XO_A1] = &apq8064_xo_a1_clk,
> -	[RPM_XO_A2] = &apq8064_xo_a2_clk,
> +	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> +	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> +	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> +	[RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
> +	[RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
> +	[RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
> +	[RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> +	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> +	[RPM_QDSS_CLK] = &clk_rpm_qdss_clk,
> +	[RPM_QDSS_A_CLK] = &clk_rpm_qdss_a_clk,
> +	[RPM_XO_D0] = &clk_rpm_xo_d0_clk,
> +	[RPM_XO_D1] = &clk_rpm_xo_d1_clk,
> +	[RPM_XO_A0] = &clk_rpm_xo_a0_clk,
> +	[RPM_XO_A1] = &clk_rpm_xo_a1_clk,
> +	[RPM_XO_A2] = &clk_rpm_xo_a2_clk,
>   };
>   
>   static const struct rpm_clk_desc rpm_clk_apq8064 = {
> @@ -488,33 +482,23 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
>   	.num_clks = ARRAY_SIZE(apq8064_clks),
>   };
>   
> -/* ipq806x */
> -DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> -DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> -DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> -DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> -DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> -DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> -DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> -
>   static struct clk_rpm *ipq806x_clks[] = {
> -	[RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
> -	[RPM_APPS_FABRIC_A_CLK] = &ipq806x_afab_a_clk,
> -	[RPM_CFPB_CLK] = &ipq806x_cfpb_clk,
> -	[RPM_CFPB_A_CLK] = &ipq806x_cfpb_a_clk,
> -	[RPM_DAYTONA_FABRIC_CLK] = &ipq806x_daytona_clk,
> -	[RPM_DAYTONA_FABRIC_A_CLK] = &ipq806x_daytona_a_clk,
> -	[RPM_EBI1_CLK] = &ipq806x_ebi1_clk,
> -	[RPM_EBI1_A_CLK] = &ipq806x_ebi1_a_clk,
> -	[RPM_SYS_FABRIC_CLK] = &ipq806x_sfab_clk,
> -	[RPM_SYS_FABRIC_A_CLK] = &ipq806x_sfab_a_clk,
> -	[RPM_SFPB_CLK] = &ipq806x_sfpb_clk,
> -	[RPM_SFPB_A_CLK] = &ipq806x_sfpb_a_clk,
> -	[RPM_NSS_FABRIC_0_CLK] = &ipq806x_nss_fabric_0_clk,
> -	[RPM_NSS_FABRIC_0_A_CLK] = &ipq806x_nss_fabric_0_a_clk,
> -	[RPM_NSS_FABRIC_1_CLK] = &ipq806x_nss_fabric_1_clk,
> -	[RPM_NSS_FABRIC_1_A_CLK] = &ipq806x_nss_fabric_1_a_clk,
> +	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> +	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> +	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> +	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> +	[RPM_NSS_FABRIC_0_CLK] = &clk_rpm_nss_fabric_0_clk,
> +	[RPM_NSS_FABRIC_0_A_CLK] = &clk_rpm_nss_fabric_0_a_clk,
> +	[RPM_NSS_FABRIC_1_CLK] = &clk_rpm_nss_fabric_1_clk,
> +	[RPM_NSS_FABRIC_1_A_CLK] = &clk_rpm_nss_fabric_1_a_clk,
>   };
>   
>   static const struct rpm_clk_desc rpm_clk_ipq806x = {

