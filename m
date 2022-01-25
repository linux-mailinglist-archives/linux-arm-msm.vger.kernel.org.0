Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11E549A83E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 05:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3415955AbiAYDBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 22:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3417550AbiAYCJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 21:09:54 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9059C046E16
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 18:00:20 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b9so4713194lfq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 18:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=z9cFZ1E2s24LcCxX+TonvupwH3rhf/yXaLQUkB9G9lg=;
        b=e6YoBi5Li5l3ffqcYqv7m1pmWSKUtt1XgNdBzvlqTUzMdC5cVbwWAQ/yrma7sE63Bg
         7d+GNgWbQCJ8laMN+M+a6IJLgkT1VnAkApTSaQKqLFr+3NzTS1GUTCrKQ4EaLJBDc7GW
         DBwVNT6T+2mOd9Gq8TnUkWVWF9kRBzVFktg2ReG/qrOMXl2nkDo11KqKff0fLWCuuF7F
         xSIGdrywlb5w5o6eUm3jMlRzG1KFGz0g9DvzOukLPZjC0qGdadsGnJnGSgnjGI8dB61f
         PWyfvAv/RBvOb4EKD+xTCzKaVZHieZ8bdvgMPepihXo9zfBD4z1cLCwYwCIFqMLhgfLT
         1PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z9cFZ1E2s24LcCxX+TonvupwH3rhf/yXaLQUkB9G9lg=;
        b=SyTG1KzOa3Lsj9PdTzOIPOaBury4sdOmUTWvzo1Gnek0B4pWsI/QidsPgNY1IVvpAe
         uwabWiK0jFq5U1CMcy8cJaL7kFYeY+t26Ev0GDLOH8M5DKJz+4Sa4C19wmKln8HslNmk
         75Dlqs76Hv+f50O6Y7yGFd5F6umTkv37C0a4wVt7uPLJBehI90IU+ZXaEiH31anpxNJt
         6XJZ6wP20omp+fNj+jv7j23LshPMH4hJosCraoJblcqeNtzWBuzPhznsQ0ZT/GAYBbad
         glRSwUvAU6FgnE6Wyd0Wgk0rqnM26ZJSYczyTfDRHRBfKrfB5ezzHJdMPipI7ua3TkLv
         JLwQ==
X-Gm-Message-State: AOAM532LJY+AGnnZV3AJ1RQrZutKOuZlXJC45/vi8YLqneadRc09fWmR
        j1OLJzhdrNbBScJyMr/SCj/NAg==
X-Google-Smtp-Source: ABdhPJzR7Nty4CWBcIaaTsrQRiQiwDCL0FqPuoLJsr1Uu+KP4cnVI3Y3KVI80EIbpDT5tyLNEnKLQw==
X-Received: by 2002:a05:6512:114f:: with SMTP id m15mr4955248lfg.678.1643076019122;
        Mon, 24 Jan 2022 18:00:19 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 8sm22197lfq.200.2022.01.24.18.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 18:00:18 -0800 (PST)
Message-ID: <d60f663a-c986-4076-736b-05d50e4aefc0@linaro.org>
Date:   Tue, 25 Jan 2022 05:00:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm/dsi: invalid parameter check in
 msm_dsi_phy_enable
Content-Language: en-GB
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        hali@codeaurora.org
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, abhinavk@codeaurora.org, rajeevny@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220116181844.7400-1-jose.exposito89@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220116181844.7400-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/01/2022 21:18, José Expósito wrote:
> The function performs a check on the "phy" input parameter, however, it
> is used before the check.
> 
> Initialize the "dev" variable after the sanity check to avoid a possible
> NULL pointer dereference.
> 
> Fixes: 5c8290284402b ("drm/msm/dsi: Split PHY drivers to separate files")
> Addresses-Coverity-ID: 1493860 ("Null pointer dereference")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 9842e04b5858..baa6af0c3bcc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -808,12 +808,14 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>   			struct msm_dsi_phy_clk_request *clk_req,
>   			struct msm_dsi_phy_shared_timings *shared_timings)
>   {
> -	struct device *dev = &phy->pdev->dev;
> +	struct device *dev;
>   	int ret;
>   
>   	if (!phy || !phy->cfg->ops.enable)
>   		return -EINVAL;
>   
> +	dev = &phy->pdev->dev;
> +
>   	ret = dsi_phy_enable_resource(phy);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",


-- 
With best wishes
Dmitry
