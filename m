Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88CD351CBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbhDASVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239833AbhDASRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:17:02 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1813FC061221
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 05:26:25 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id r193so1979656ior.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yzoc7dlOuPc3fxpeVRBd2xxNN+g9BpN8EdGoYo9aWVE=;
        b=m5QiDBDooUfCNqfYQlVTwxVtvLK54ia5tZo6Wys7ChLrzR/J9dXdq7Pexaq2BrjoVV
         bz09dEbLFywRSzfY3pWZnETz3jE/J1OpCQ0y2UvAg9cPwQPdZ9sCCyQIMzv6qzeQspij
         gRmUY2LoFzHD29EWn0vUjYOEsd6KlWw17JzhLQEWPHXOrXlUa0fx8epVjIj069gYGUH9
         QrSPV9b7mKtSWkQX0PClaYqdNSuOb5HwyVB3YtPRIuj3z7HEcLH2C2eoMEOuT0ZAPpXw
         prdzXQ+vyGc1khcnnotPCu1aoM6ejtTVjokiJ7nVSZ319txyAyZNeWgZbFCqRU2NGXh0
         AYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yzoc7dlOuPc3fxpeVRBd2xxNN+g9BpN8EdGoYo9aWVE=;
        b=FdExNVHYPfTRzcJmICi+wTC/bOzgZvQDRXLdHt50/boPopNuN+K0+gspxgigeswzuL
         553/99HTrOhrHZVnYPGaOsmsEXi43iCORUuEPzP4cMoIGkkcoEiozXIr6pcq53zH8L7H
         RWMpirI0K0CobNcPsNqfqAxzw8a8RyG1DwrvWj3TcxcTZKSQn5jt9J7VDMqdp4FlkBVX
         GcTojWQ+BP2EaHT5ev69s88TWunCu8PY2gAzdHW5g+3IQNYKZ4Cx/QlNy7d0W4rvj/6C
         4eniuaYedvXdtReZP4ykj6I9+s7Nm+ISMkUfLJOWjYHsGW1sufCP59dJWNqG71fkF7du
         tvEg==
X-Gm-Message-State: AOAM531y6kHc23xos0Tx7X0ruDloGj8voyJUerbMslmwWft/gHroWJp1
        lFppDw6ngPJkZv3wr2718HofuAG+7ZXa3yo1
X-Google-Smtp-Source: ABdhPJyE24mml/gnaveIp3qOdCpfL7fwfK5stVOa3qBN51+rH8IAcY9hD0/00XIwekootMyJpESaXg==
X-Received: by 2002:a5d:9807:: with SMTP id a7mr6644491iol.7.1617279984396;
        Thu, 01 Apr 2021 05:26:24 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id w2sm132030iot.29.2021.04.01.05.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 05:26:23 -0700 (PDT)
Subject: Re: [PATCH] interconnect: qcom: sm8350: Use the correct ids
To:     Georgi Djakov <georgi.djakov@linaro.org>, djakov@kernel.org,
        vkoul@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401094334.28871-1-georgi.djakov@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <ff0c1b21-7d83-cb29-17d5-06061f46006e@linaro.org>
Date:   Thu, 1 Apr 2021 07:26:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401094334.28871-1-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/1/21 4:43 AM, Georgi Djakov wrote:
> For creating an array with the members for each NoC, we should be using
> a local indexes, as otherwise unnecessary large arrays would be created.
> Using an incorrect indexes will also result error for the consumers when
> they try to find a valid path between the endpoints. Let's fix this and
> use the correct ids.
> 
> Reported-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Looks good to me.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/interconnect/qcom/sm8350.c | 80 +++++++++++++++---------------
>   1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/sm8350.c b/drivers/interconnect/qcom/sm8350.c
> index f3aab02b8678..01202989a5b2 100644
> --- a/drivers/interconnect/qcom/sm8350.c
> +++ b/drivers/interconnect/qcom/sm8350.c
> @@ -228,20 +228,20 @@ static struct qcom_icc_bcm *aggre2_noc_bcms[] = {
>   };
>   
>   static struct qcom_icc_node *aggre2_noc_nodes[] = {
> -	[SM8350_MASTER_QDSS_BAM] = &qhm_qdss_bam,
> -	[SM8350_MASTER_QUP_0] = &qhm_qup0,
> -	[SM8350_MASTER_QUP_2] = &qhm_qup2,
> -	[SM8350_MASTER_A2NOC_CFG] = &qnm_a2noc_cfg,
> -	[SM8350_MASTER_CRYPTO] = &qxm_crypto,
> -	[SM8350_MASTER_IPA] = &qxm_ipa,
> -	[SM8350_MASTER_PCIE_0] = &xm_pcie3_0,
> -	[SM8350_MASTER_PCIE_1] = &xm_pcie3_1,
> -	[SM8350_MASTER_QDSS_ETR] = &xm_qdss_etr,
> -	[SM8350_MASTER_SDCC_2] = &xm_sdc2,
> -	[SM8350_MASTER_UFS_CARD] = &xm_ufs_card,
> -	[SM8350_SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
> -	[SM8350_SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_mem_noc,
> -	[SM8350_SLAVE_SERVICE_A2NOC] = &srvc_aggre2_noc,
> +	[MASTER_QDSS_BAM] = &qhm_qdss_bam,
> +	[MASTER_QUP_0] = &qhm_qup0,
> +	[MASTER_QUP_2] = &qhm_qup2,
> +	[MASTER_A2NOC_CFG] = &qnm_a2noc_cfg,
> +	[MASTER_CRYPTO] = &qxm_crypto,
> +	[MASTER_IPA] = &qxm_ipa,
> +	[MASTER_PCIE_0] = &xm_pcie3_0,
> +	[MASTER_PCIE_1] = &xm_pcie3_1,
> +	[MASTER_QDSS_ETR] = &xm_qdss_etr,
> +	[MASTER_SDCC_2] = &xm_sdc2,
> +	[MASTER_UFS_CARD] = &xm_ufs_card,
> +	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
> +	[SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_mem_noc,
> +	[SLAVE_SERVICE_A2NOC] = &srvc_aggre2_noc,
>   };
>   
>   static struct qcom_icc_desc sm8350_aggre2_noc = {
> @@ -414,10 +414,10 @@ static struct qcom_icc_bcm *mc_virt_bcms[] = {
>   };
>   
>   static struct qcom_icc_node *mc_virt_nodes[] = {
> -	[SM8350_MASTER_LLCC] = &llcc_mc,
> -	[SM8350_SLAVE_EBI1] = &ebi,
> -	[SM8350_MASTER_LLCC_DISP] = &llcc_mc_disp,
> -	[SM8350_SLAVE_EBI1_DISP] = &ebi_disp,
> +	[MASTER_LLCC] = &llcc_mc,
> +	[SLAVE_EBI1] = &ebi,
> +	[MASTER_LLCC_DISP] = &llcc_mc_disp,
> +	[SLAVE_EBI1_DISP] = &ebi_disp,
>   };
>   
>   static struct qcom_icc_desc sm8350_mc_virt = {
> @@ -439,24 +439,24 @@ static struct qcom_icc_bcm *mmss_noc_bcms[] = {
>   };
>   
>   static struct qcom_icc_node *mmss_noc_nodes[] = {
> -	[SM8350_MASTER_CAMNOC_HF] = &qnm_camnoc_hf,
> -	[SM8350_MASTER_CAMNOC_ICP] = &qnm_camnoc_icp,
> -	[SM8350_MASTER_CAMNOC_SF] = &qnm_camnoc_sf,
> -	[SM8350_MASTER_CNOC_MNOC_CFG] = &qnm_mnoc_cfg,
> -	[SM8350_MASTER_VIDEO_P0] = &qnm_video0,
> -	[SM8350_MASTER_VIDEO_P1] = &qnm_video1,
> -	[SM8350_MASTER_VIDEO_PROC] = &qnm_video_cvp,
> -	[SM8350_MASTER_MDP0] = &qxm_mdp0,
> -	[SM8350_MASTER_MDP1] = &qxm_mdp1,
> -	[SM8350_MASTER_ROTATOR] = &qxm_rot,
> -	[SM8350_SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
> -	[SM8350_SLAVE_MNOC_SF_MEM_NOC] = &qns_mem_noc_sf,
> -	[SM8350_SLAVE_SERVICE_MNOC] = &srvc_mnoc,
> -	[SM8350_MASTER_MDP0_DISP] = &qxm_mdp0_disp,
> -	[SM8350_MASTER_MDP1_DISP] = &qxm_mdp1_disp,
> -	[SM8350_MASTER_ROTATOR_DISP] = &qxm_rot_disp,
> -	[SM8350_SLAVE_MNOC_HF_MEM_NOC_DISP] = &qns_mem_noc_hf_disp,
> -	[SM8350_SLAVE_MNOC_SF_MEM_NOC_DISP] = &qns_mem_noc_sf_disp,
> +	[MASTER_CAMNOC_HF] = &qnm_camnoc_hf,
> +	[MASTER_CAMNOC_ICP] = &qnm_camnoc_icp,
> +	[MASTER_CAMNOC_SF] = &qnm_camnoc_sf,
> +	[MASTER_CNOC_MNOC_CFG] = &qnm_mnoc_cfg,
> +	[MASTER_VIDEO_P0] = &qnm_video0,
> +	[MASTER_VIDEO_P1] = &qnm_video1,
> +	[MASTER_VIDEO_PROC] = &qnm_video_cvp,
> +	[MASTER_MDP0] = &qxm_mdp0,
> +	[MASTER_MDP1] = &qxm_mdp1,
> +	[MASTER_ROTATOR] = &qxm_rot,
> +	[SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
> +	[SLAVE_MNOC_SF_MEM_NOC] = &qns_mem_noc_sf,
> +	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
> +	[MASTER_MDP0_DISP] = &qxm_mdp0_disp,
> +	[MASTER_MDP1_DISP] = &qxm_mdp1_disp,
> +	[MASTER_ROTATOR_DISP] = &qxm_rot_disp,
> +	[SLAVE_MNOC_HF_MEM_NOC_DISP] = &qns_mem_noc_hf_disp,
> +	[SLAVE_MNOC_SF_MEM_NOC_DISP] = &qns_mem_noc_sf_disp,
>   };
>   
>   static struct qcom_icc_desc sm8350_mmss_noc = {
> @@ -472,10 +472,10 @@ static struct qcom_icc_bcm *nsp_noc_bcms[] = {
>   };
>   
>   static struct qcom_icc_node *nsp_noc_nodes[] = {
> -	[SM8350_MASTER_CDSP_NOC_CFG] = &qhm_nsp_noc_config,
> -	[SM8350_MASTER_CDSP_PROC] = &qxm_nsp,
> -	[SM8350_SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
> -	[SM8350_SLAVE_SERVICE_NSP_NOC] = &service_nsp_noc,
> +	[MASTER_CDSP_NOC_CFG] = &qhm_nsp_noc_config,
> +	[MASTER_CDSP_PROC] = &qxm_nsp,
> +	[SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
> +	[SLAVE_SERVICE_NSP_NOC] = &service_nsp_noc,
>   };
>   
>   static struct qcom_icc_desc sm8350_compute_noc = {
> 

