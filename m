Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFBD390908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 20:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhEYSgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 14:36:10 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33190 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhEYSgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 14:36:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621967680; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WIyhPKKaXWb+9OY66v6kTHVLbjk02qsEX8PuE7ar4/0=;
 b=qiGnOUSvh+pr4UlWLrgYEOPqUNNwfcbfx536HgJ96ojSdbloLYfs40uVzI4DwPr0Eqc3V3e0
 1N/zTRR+j81GxXyJjgnAOcw9DeNH1BK9JVa5xijgCiSb2fMTKovCi3MG0Nt9C8cxHcUKpGTJ
 a8R7A1CzBOdGUAy2CyD/SjyLLLE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60ad433f67d156359aabc863 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 18:34:39
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 96B12C43217; Tue, 25 May 2021 18:34:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9216CC433D3;
        Tue, 25 May 2021 18:34:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 25 May 2021 11:34:38 -0700
From:   abhinavk@codeaurora.org
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove the repeated declaration
In-Reply-To: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
References: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
Message-ID: <1a928a9f4fb4973b265a160cd1d6369a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-25 05:22, Shaokun Zhang wrote:
> Function 'dp_catalog_audio_enable' is declared twice, remove the
> repeated declaration.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
> b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 176a9020a520..f12468dcbb56 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -124,7 +124,6 @@ void dp_catalog_audio_get_header(struct dp_catalog
> *catalog);
>  void dp_catalog_audio_set_header(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
>  void dp_catalog_audio_enable(struct dp_catalog *catalog);
> -void dp_catalog_audio_enable(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
>  void dp_catalog_audio_init(struct dp_catalog *catalog);
>  void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
