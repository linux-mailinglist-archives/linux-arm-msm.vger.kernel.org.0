Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAAE7369C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 12:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjFTKrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 06:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232271AbjFTKrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 06:47:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108F610C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:47:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f87592ecaeso2241980e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687258023; x=1689850023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BanzYfOAs/+LK0KUuxID5DuNcuAu4dyTjY5amtOp7CY=;
        b=yt3K7926CXy26DDCHOljWDzCnOoNmtnotKJOFweXwHqsSoOfOST492odDdIbNozCoy
         JwJJU820/ahdmpzuT6NJgwmcqQJ6/X34AwlN3RUbMIn+ccSUN/dsm7wLqaR4/Clnk6km
         u7ryvwTV/FPDM6e6+Fsj253VoPn+1bP3ghv9M7PPazeuCbbc56B4Tq/nt9gI5V8D6J5G
         I/wgigJ4GOJWcHaQmQj1ILEODB+sPpl7/F5aQWT875oEQNwR5vM36JP0JDx7AnrxP9HY
         NtKmKkyQbLPPiY3/8/ZiQ5SQ3swJ3EdTRvq8hSbeepWx4DRd2xif7p5hOrdnzN/ModUt
         1ZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687258023; x=1689850023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BanzYfOAs/+LK0KUuxID5DuNcuAu4dyTjY5amtOp7CY=;
        b=MjNOGX4fNsbUI/hd64w5IPZLMpx7a+yu/rZ4OzjUXOSK22GxblHNQ4llL2/9s8+abm
         AtyiEkgmf9CPX2IPVBXaKkARVYB+I+92N1n1BNe3xD8tKOUxEAYze6gNc2sbPHIzb4oj
         g2+C+VR/+jRiZ4HxXs6D2ZJ4+t1CLVRcs2XCtJTjIa0nPeFVVI+igqyP3ASa9Iksk+Qh
         HLNreZEg0i1981nJbx/gpHa5xH7d7AkU7jk0ez8QG8ruN39cxTfxxGOjMuMoQOqFOWoh
         DrTDAMr6qYs0Iy2XRCZNGn7D9L01m8VMh4PTrJOSD1qaINmzQB2D7wb/3e8GyoJjIho3
         czxw==
X-Gm-Message-State: AC+VfDzjeSZg8A0jJ2zKjb9ayMeOkm1yNSHkUdE3I4FZWXr2uWhWbD2t
        revna+DASz3x+tl0goIj9SvEdCZD7lMIVQ7Vk20=
X-Google-Smtp-Source: ACHHUZ4yw1nODKolfTWGMZpG34CpSQPnPV/9yBYVCrYybA03/xmKPKB9MJAMNkr+ZMGAAsvu74lXyg==
X-Received: by 2002:a05:6512:3d90:b0:4f8:5600:9e5e with SMTP id k16-20020a0565123d9000b004f856009e5emr8479659lfv.47.1687258023652;
        Tue, 20 Jun 2023 03:47:03 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id d4-20020ac25ec4000000b004edc72be17csm317269lfq.2.2023.06.20.03.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:47:03 -0700 (PDT)
Message-ID: <c0d94c16-45f5-c56c-4b8b-8e05663653f4@linaro.org>
Date:   Tue, 20 Jun 2023 12:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/8] drm/msm/dpu: rework indentation in dpu_core_perf
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> dpu_core_perf.c contains several multi-line conditions which are hard to
> comprehent because of the indentation. Rework the identation of these
> conditions to make it easier to understand them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index ba146af73bc5..f8d5c87d0915 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -148,8 +148,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
> -		    (dpu_crtc_get_client_type(tmp_crtc) ==
> -				curr_client_type) && (tmp_crtc != crtc)) {
> +		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
> +		    tmp_crtc != crtc) {
>  			struct dpu_crtc_state *tmp_cstate =
>  				to_dpu_crtc_state(tmp_crtc->state);
>  
> @@ -194,8 +194,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
> -			curr_client_type ==
> -				dpu_crtc_get_client_type(tmp_crtc)) {
> +		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
>  			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>  
>  			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> @@ -325,10 +324,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>  			update_bus = true;
>  		}
>  
> -		if ((params_changed &&
> -			(new->core_clk_rate > old->core_clk_rate)) ||
> -			(!params_changed &&
> -			(new->core_clk_rate < old->core_clk_rate))) {
> +		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
> +		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
>  			old->core_clk_rate = new->core_clk_rate;
>  			update_clk = true;
>  		}
