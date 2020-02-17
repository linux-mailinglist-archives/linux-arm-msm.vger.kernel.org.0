Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD99160FB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 11:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgBQKPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 05:15:10 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43172 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbgBQKPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 05:15:10 -0500
Received: by mail-ed1-f68.google.com with SMTP id dc19so19975020edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2020 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ITFb8L5DSsMxg9jB22o0lWJvDZuM6JEd6aFvL/faZ20=;
        b=Tc37W/dcRFvEaw5SUUfljM2gXORiwGMatrDI535QpyCb1XVbzavym+gTI6mk2u3INm
         a8P/TUWnck2kQsVMSGD/fz6b7igk1TjhQk1mYMCvXM1jJAK7/jp0rndHwnSZgV3NEm1h
         SOsEOE0OYjb0FyOxzlbxpzK6EuITAgOTwCp0WR2AaIIF466+YbNduFyOR5PeHdwXT0zZ
         u6eLT4+arHzirhsvQQXMJSbM5yemeStR9ECetDD4czGNLQpbSBRF0ru69/PT+zXA8BUp
         LgdoDNdw1v5yM+bDn+PY4BDXW1zitDweXatBylJMw8kjThJkseOBkdTOWJVxY+K1T9eD
         UiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ITFb8L5DSsMxg9jB22o0lWJvDZuM6JEd6aFvL/faZ20=;
        b=hffdwMTiNiTGaM0cJ3FykhoHNApraSYNWnluJEA78hWfM56pq013v+S2SYUbWkQ29A
         QeFG0KRUgieC3bF2sCalB101FKE347gdUwqq+8JYGpnO/zBX3eBfqhfw5U0vXIKdud9M
         nWjXAYYbDHJ0r06jEFjbW9LXmya5zJ0M0naAxy9epAn4ZPoOpqPZFWQ+yj0gPnxbcnjL
         ZXhjzlocT463Skl/fYMOlO7UQgtZIRl8bbMWsdif2gPBNX2NnQcXzdnFIf9KGSprr5PI
         sQPwsipSUWjWhLUb8pj4r8dKEfHBe+xxkZWcTrI2AI+pUqiXYx8EWWrOwj9UKpI56HFX
         zYpg==
X-Gm-Message-State: APjAAAUmdNwgWsOLzXCNZmcftKeOaOYDsPzM8aFF8kW8P8pAcQn17vcO
        FoWWa9f0ZC89pOryI5NqafLK4A==
X-Google-Smtp-Source: APXvYqwJr4dk7coEDW+rWoqenoO/7AFXgQjgp/QFLtrfGG97zeRM1owWs4FxfqUHlPTTZzvK8wuU2Q==
X-Received: by 2002:a17:906:2651:: with SMTP id i17mr13819564ejc.246.1581934506821;
        Mon, 17 Feb 2020 02:15:06 -0800 (PST)
Received: from [192.168.27.209] ([94.155.124.210])
        by smtp.googlemail.com with ESMTPSA id m5sm437327ede.10.2020.02.17.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 02:15:06 -0800 (PST)
Subject: Re: [PATCH] media: venus: support frame rate control
To:     Jeffrey Kardatzke <jkardatzke@google.com>,
        linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Mauro Carvalho Chehab )" <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200213213007.17023-1-jkardatzke@google.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b471217a-1877-eaed-55c2-084f4b126bb4@linaro.org>
Date:   Mon, 17 Feb 2020 12:15:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213213007.17023-1-jkardatzke@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff,

Thanks for the patch!

On 2/13/20 11:30 PM, Jeffrey Kardatzke wrote:
> Frame rate control is always enabled in this driver, so make it silently
> support the V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> ---
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 877c0b3299e9..9ede692f77c5 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -199,6 +199,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>  		mutex_unlock(&inst->lock);
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
> +		// Silently ignore, it's always enabled.

Please, use C comments and follow the kernel coding style.

I wonder shouldn't it be better to add rc_enable field in struct
venc_controls and give the user choice to disable the rate control? We
can keep the default to be "enabled".

> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -351,6 +354,9 @@ int venc_ctrl_init(struct venus_inst *inst)
>  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>  			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
>  
> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
> +

you forgot to increment the number of controls in the call to
v4l2_ctrl_handler_init.

>  	ret = inst->ctrl_handler.error;
>  	if (ret)
>  		goto err;
> 

-- 
regards,
Stan
