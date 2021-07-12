Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F783C4218
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 05:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhGLDo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jul 2021 23:44:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41353 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhGLDo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jul 2021 23:44:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626061300; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hs7Tqld0fBRwacaQc2I/5U3RxF7nEO0L5nh1M+lL7NQ=;
 b=ct8mRNS3kU01NHoNNDSzxFPe3J7ske1cq1MtZyO2I4KZQuJnDUKNyyTpxC/vGk4I3khsmcXO
 xMJjEEdzFJIYIafyI3OXOQnxSvQFSxqLuUnRVgs+n+vefe2TylYj6VnesB4fo8bdV/GUPOg1
 5vPmP0EhxW8yHsklPaFBsG0SfO0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60ebb9ec7b2963a2828d7af5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Jul 2021 03:41:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06508C4338A; Mon, 12 Jul 2021 03:41:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12B2AC433F1;
        Mon, 12 Jul 2021 03:41:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 12 Jul 2021 09:11:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [v1] drm/msm/disp/dpu1: add safe lut config in dpu driver
In-Reply-To: <1625827244-23274-1-git-send-email-kalyan_t@codeaurora.org>
References: <1625827244-23274-1-git-send-email-kalyan_t@codeaurora.org>
Message-ID: <38beafdc174cbb16de6f1d646fff6816@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-09 16:10, Kalyan Thota wrote:
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
> 
> Issue reported on SC7280:
> 
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
> 
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d01c4c9..2e482cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -974,6 +974,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = 
> {
>  	.amortizable_threshold = 25,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
>  		.entries = sdm845_qos_linear
> @@ -1001,6 +1002,7 @@ static const struct dpu_perf_cfg sc7180_perf_data 
> = {
>  	.min_dram_ib = 1600000,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
>  		.entries = sc7180_qos_linear
> @@ -1028,6 +1030,7 @@ static const struct dpu_perf_cfg sm8150_perf_data 
> = {
>  	.min_dram_ib = 800000,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
>  		.entries = sm8150_qos_linear
> @@ -1056,6 +1059,7 @@ static const struct dpu_perf_cfg sm8250_perf_data 
> = {
>  	.min_dram_ib = 800000,
>  	.min_prefill_lines = 35,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
>  		.entries = sc7180_qos_linear
> @@ -1084,6 +1088,7 @@ static const struct dpu_perf_cfg sc7280_perf_data 
> = {
>  	.min_dram_ib = 1600000,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
>  		.entries = sc7180_qos_macrotile

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> 
(sc7280, sc7180)

This will need fixes and stable tag and I think this should also fix the
wait-for-safe issue with sdm845 (ufs/usb speed slowdown with display 
active)
which we have in arm-smmu-qcom.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
