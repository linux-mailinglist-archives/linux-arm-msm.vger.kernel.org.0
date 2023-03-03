Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B536A9656
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 12:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCCLcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 06:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjCCLcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 06:32:45 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A761D5F233
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 03:32:13 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p16so1354968wmq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 03:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677843127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzHuXbKM6eBllD1OBbqdIYjoQvCqYBm7gWprgBVzMmc=;
        b=I7FObc6COIBpcyuROgPmG5D000nXHaU1fkhACoth+u+qZObDW2cYixTVvaN8VlF74u
         PEUbdDI/4ZSeQFygHf2FpXctPFbxNNk38luEEmYJcOkHO6+tphvp22ckZqdysgipUkU/
         MjYNJyb3DRqMjewmeF/aY1QV25lUSraSRLzVcqkzH5NbWuw6vfiF/qKf0QXSeZ+SthZN
         IRrFAiPd7NF5VGH44fjELbqF8VgiUdKTsMG20GpswlIKzvd4MrfyXz7F5fFif7DSIkBa
         uVhAZI+NMusr3SL5cLWT/EvN0V/W3hq5u23YGvBVbcUp8N50e6nnm6zWBvw3Wbn9Y7S9
         oVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677843127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzHuXbKM6eBllD1OBbqdIYjoQvCqYBm7gWprgBVzMmc=;
        b=Lg9bcI0r71pc7FGgUmipb01msI55gt4Ugdu6Pm96z0ke7pTCRq052AqhEYcRGLdEN8
         90N8BcrE4WkpUMHz0Lgleg497nDPCcEb9RNwRrwi9h+BrfImVoLDa6MYHHQFn5qkJVcu
         SxOmBpXaDM/Y+U/hfih/SaIYPw/e/ux3Co98hW0+7q+hfEz/Hp/s+JVS7jHWu2pjXymi
         ZLQV5BctrLM08p2GkgD9lDKlmrn8F2fzWSG3b0NAPUXPr7vU9LbWFZohqVV2yn5RtpAa
         hOjp2sBxt/Wf/8mnfSb46Ci7t+RVGW+yj/9jnYdEH2DE4F8HMttGXYZEqkqSQiaKdqqs
         FYow==
X-Gm-Message-State: AO0yUKWVEsOl9TSH0lyZhmkFfXs/z62zZ/A9RN2zsJp2FXdxBD9YElWz
        Sw3R4/Z6vggwOpwLRWN1hBVjHw==
X-Google-Smtp-Source: AK7set8G4lVnhqvMdFEEgrqLg/40gDjFWvxJotw3SGuRKGfXhIjKEhzT6sxac2U8LKZfWvERG7UskA==
X-Received: by 2002:a05:600c:45c8:b0:3ea:ed4d:38fc with SMTP id s8-20020a05600c45c800b003eaed4d38fcmr1345724wmo.31.1677843127280;
        Fri, 03 Mar 2023 03:32:07 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o33-20020a05600c512100b003e209186c07sm6904473wms.19.2023.03.03.03.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 03:32:06 -0800 (PST)
Message-ID: <59b28fb4-1367-9872-ed63-90847e380bb6@linaro.org>
Date:   Fri, 3 Mar 2023 11:32:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] interconnect: qcom: icc-rpm: Don't call
 __qcom_icc_set twice on the same node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230303023500.2173137-1-konrad.dybcio@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230303023500.2173137-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/03/2023 02:35, Konrad Dybcio wrote:
> Currently, when sync_state calls set(n, n) all the paths for setting
> parameters on an icc node are called twice. Avoid that.
> 
> Fixes: 751f4d14cdb4 ("interconnect: icc-rpm: Set destination bandwidth as well as source bandwidth")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> RFC comes from the fact that I *believe* this should be correct, but I'm
> not entirely sure about it..
> 
> 
>   drivers/interconnect/qcom/icc-rpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index a6e0de03f46b..d35db1af9b08 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -387,7 +387,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>   	ret = __qcom_icc_set(src, src_qn, sum_bw);
>   	if (ret)
>   		return ret;
> -	if (dst_qn) {
> +	if (dst_qn && src_qn != dst_qn) {
>   		ret = __qcom_icc_set(dst, dst_qn, sum_bw);
>   		if (ret)
>   			return ret;

Is it possible for src_qn == dst_qn ?

Iff you confirm that experimentally - add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
