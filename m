Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE4C74BA05
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjGGXZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjGGXZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:25:46 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DADA2106
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:25:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso39704921fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688772344; x=1691364344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQ2+XEGD260QKN9UUSGir4k9TWs8vNlxD4BF4i8wMMQ=;
        b=CGwpLiT/B/4VDgrHM0hX4dL8yG/wSiWOeH7sdp3MyWqdVAIVMR2+9kp7gOzEyHZD7E
         ZGJYn2giYDpwEZab5T3oNSvPtz9ygO/rX7Wlpy7+EVo/YzXTeO+KyJGHjHapfyZ6td/v
         QYdc2SaJyqslwCAucX4hHkqD2FWBqBCwPsW+86YbekluPY+QLUXp2BnrpbNKUuRE5skX
         n89RRlrGEAaoKFRxZ4Z+TXNBwIX5oDoeCW1JlubLPzfXLMaJdJ4ht5Hd3xKZ8rzVpbzY
         zZFWT/ZB/IMCPmNmCQD0GJYmAFZDwqXfpZopApio+WPo3UuCiOtVDsWckBdxNmttWuA0
         12ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688772344; x=1691364344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ2+XEGD260QKN9UUSGir4k9TWs8vNlxD4BF4i8wMMQ=;
        b=SK5zG/xiVDzVFP9mcnazDxEbSQPDOIKCc2B85iqPBVdai+4b7lAGXphkO4rbrt/qgi
         1ZLyvNsp7oa5IHMRn+2J1RKCKLN6b0sjgsQ/i9qLnB860XZWsG8TsoYCyWx7ivqbvHZB
         HqGh7JCqLL2whR6mzgPqXT7nqCl0H1k1mt4aiIJFSqdRWVcleb5ceAGkCgTWoVrh/OFL
         rRA91MeEJGsHMobfttscWaEh61GWxWCS6XLMLfziofpCil4pQoHpv6J0xToiKlUrSLDK
         CMTTlnVRa5YHsem2hmRHXcZNCjwEIGRPkn945uk3/lIU7AqcqpGkvyeNuEbE7ZPXYyEf
         CyPg==
X-Gm-Message-State: ABy/qLY9ZPTA/FxY68tsyl0GY1CV+eMHozkr2zRGe2E0X1JFXY4MIGas
        gsptWS19/A6qj7VKJiNK9Dut/mKvqZI65c0KzhCrmg==
X-Google-Smtp-Source: APBJJlGniTahtLJ/ma4pjlCH1yxUtM0x1txWCN3QAvNj2+f0F+snWAvD+8luPjq4cFf/9eyMjhPi2Q==
X-Received: by 2002:a05:6512:694:b0:4f8:68a3:38e2 with SMTP id t20-20020a056512069400b004f868a338e2mr5647505lfe.0.1688772343764;
        Fri, 07 Jul 2023 16:25:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004fad16596fasm842149lff.21.2023.07.07.16.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 16:25:43 -0700 (PDT)
Message-ID: <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
Date:   Sat, 8 Jul 2023 01:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
 <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
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

On 7.07.2023 22:37, Dmitry Baryshkov wrote:
> It was noticed that dpu_kms_hw_init()'s error path contains several
> labels which point to the same code path. Replace all of them with a
> single label.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
it's the first time I'm seeing this code

Konrad
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index c11b3ab572ab..e7ac02e92f42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	if (!dpu_kms->catalog) {
>  		DPU_ERROR("device config not known!\n");
>  		rc = -EINVAL;
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	/*
> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	rc = _dpu_kms_mmu_init(dpu_kms);
>  	if (rc) {
>  		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>  	if (rc) {
>  		DPU_ERROR("rm init failed: %d\n", rc);
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	dpu_kms->rm_init = true;
> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		rc = PTR_ERR(dpu_kms->hw_mdp);
>  		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>  		dpu_kms->hw_mdp = NULL;
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
>  			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
> -			goto power_error;
> +			goto err_pm_put;
>  		}
>  
>  		dpu_kms->hw_vbif[vbif->id] = hw;
> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>  	if (rc) {
>  		DPU_ERROR("failed to init perf %d\n", rc);
> -		goto perf_err;
> +		goto err_pm_put;
>  	}
>  
>  	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		rc = PTR_ERR(dpu_kms->hw_intr);
>  		DPU_ERROR("hw_intr init failed: %d\n", rc);
>  		dpu_kms->hw_intr = NULL;
> -		goto hw_intr_init_err;
> +		goto err_pm_put;
>  	}
>  
>  	dev->mode_config.min_width = 0;
> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	rc = _dpu_kms_drm_obj_init(dpu_kms);
>  	if (rc) {
>  		DPU_ERROR("modeset init failed: %d\n", rc);
> -		goto drm_obj_init_err;
> +		goto err_pm_put;
>  	}
>  
>  	dpu_vbif_init_memtypes(dpu_kms);
> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	return 0;
>  
> -drm_obj_init_err:
> -hw_intr_init_err:
> -perf_err:
> -power_error:
> +err_pm_put:
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  error:
>  	_dpu_kms_hw_destroy(dpu_kms);
