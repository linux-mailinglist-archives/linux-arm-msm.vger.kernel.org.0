Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BBF2B8B17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 06:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgKSFpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 00:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgKSFpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 00:45:06 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B22CC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 21:45:06 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id l36so4237259ota.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 21:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TMS5XxHXA8HnDyOa6csmMz3nOTPbgIfQVudWfCsAbc8=;
        b=XUmZ6vpzDKdu2Y+mFAu1/ex/vzO6hoUr3ygepbs0LS52dQMVJhVegWLVqEmCYjNpH3
         qUp8aSvHlGDWNVHzX1EgSs9NCDCyOVWpNv9CkpafOPA/y3J5F5/RmuLaekZAx/3f7SFM
         sjU5qlRyPl2ekvLUzeQIq0wIjEi1OYRS3ARZGiTsoQ7Gcj3tApeZcgFa1m+sIJVGFrG8
         IOtjJG0kEVmhL7d0ju96gpdTZtjkhnA/wQihq/mueKh+FUWo5tK6bKnFVBJQFZhyuO0w
         87/xMLbHuOF71Fdoyya4URh+tSi4WjKpNrQqDS0qKF6+ghQAEsV2h9FAkERn0o+zNSts
         nsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TMS5XxHXA8HnDyOa6csmMz3nOTPbgIfQVudWfCsAbc8=;
        b=SSd0n838ltM5fvdEAGIbsZfh9GWwNlg609NorbH++YPIlyL7FdpLvltLhTmgQWfVLt
         xTYfzu+xNiw9M5T0A5NS2dPy6QGWwfp2xo1dJgqO5+J0HPtacTG6kdVAScr1otKVDRr2
         a7jFbxl/MMDfxCIHaMOkwFyEv/2djeE8YvC4jIuB2JqOtB/hfNWip01qbqtc8kaGb1My
         146DmPq2AUjtCjDHPbCx+omspF+cKw8+yVGndxSWJRqKAxwOf6kQchuFyqCV1p5SJldw
         sYFKDSX1bRekBdZ5kzkWfjyL80Nj2kjBOaTRLgjUZotcXm5ADJGd3twLGb+tzQ+2+cgv
         oE1w==
X-Gm-Message-State: AOAM531mgYMgQP6ycr/r0mxeNN+kcfDjvWs9O+S6p7gTKQ1akLTYCGzs
        IIrX+4UjYpXj3vRzBo2Z693WQQ==
X-Google-Smtp-Source: ABdhPJxkbnksx3ECJpiTpas/HhwTtNaMLsDlS0ZGNaAQ7je71JjzdLz481CVrpobf+hZSvyNIUZykw==
X-Received: by 2002:a9d:1b2:: with SMTP id e47mr8641928ote.45.1605764705660;
        Wed, 18 Nov 2020 21:45:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m2sm746892ots.11.2020.11.18.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 21:45:04 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:45:03 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     mdtipton@codeaurora.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] interconnect: qcom: qcs404: Remove GPU and display
 RPM IDs
Message-ID: <20201119054503.GK8532@builder.lan>
References: <20201118111044.26056-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118111044.26056-1-georgi.djakov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Nov 05:10 CST 2020, Georgi Djakov wrote:

> The following errors are noticed during boot on a QCS404 board:
> [    2.926647] qcom_icc_rpm_smd_send mas 6 error -6
> [    2.934573] qcom_icc_rpm_smd_send mas 8 error -6
> 
> These errors show when we try to configure the GPU and display nodes.
> Since these particular nodes aren't supported on RPM and are purely
> local, we should just change their mas_rpm_id to -1 to avoid any
> requests being sent for these master IDs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> 
> v2:
> * Keep the nodes and just set the IDs to -1, as suggested by Mike.
> 
> v1: http://lore.kernel.org/r/20201111100734.307-1-georgi.djakov@linaro.org
> 
>  drivers/interconnect/qcom/qcs404.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
> index d4769a5ea182..9820709b43db 100644
> --- a/drivers/interconnect/qcom/qcs404.c
> +++ b/drivers/interconnect/qcom/qcs404.c
> @@ -157,8 +157,8 @@ struct qcom_icc_desc {
>  	}
>  
>  DEFINE_QNODE(mas_apps_proc, QCS404_MASTER_AMPSS_M0, 8, 0, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
> -DEFINE_QNODE(mas_oxili, QCS404_MASTER_GRAPHICS_3D, 8, 6, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
> -DEFINE_QNODE(mas_mdp, QCS404_MASTER_MDP_PORT0, 8, 8, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
> +DEFINE_QNODE(mas_oxili, QCS404_MASTER_GRAPHICS_3D, 8, -1, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
> +DEFINE_QNODE(mas_mdp, QCS404_MASTER_MDP_PORT0, 8, -1, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
>  DEFINE_QNODE(mas_snoc_bimc_1, QCS404_SNOC_BIMC_1_MAS, 8, 76, -1, QCS404_SLAVE_EBI_CH0);
>  DEFINE_QNODE(mas_tcu_0, QCS404_MASTER_TCU_0, 8, -1, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
>  DEFINE_QNODE(mas_spdm, QCS404_MASTER_SPDM, 4, -1, -1, QCS404_PNOC_INT_3);
