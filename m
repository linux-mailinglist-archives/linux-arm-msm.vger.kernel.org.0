Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303F3204E54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 11:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732215AbgFWJqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 05:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732023AbgFWJqC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 05:46:02 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EDAC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 02:46:02 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id rk21so4577511ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x+77SZ+h191D5taiGIual/fH3dxCziZR7JzlGfHatlI=;
        b=PlBfyTlyRsdE4Hjc2qcH9bWRW/CcTDVvYJ9WSRBw17Ei+1vZse8RqGb6Nllr3H31pK
         CnRPgRvogdkUThTlf424Tj9KDrKdiFZYhkZrqpgkdLXo+MDhkT6YIZFnFOjKFF3Yzimv
         toftp8vJf8cGsApoMj8kTBeH6NIsvMh1ewEViJH1r5VWWVKCFaxm2YzgS577MopiREV0
         luu6DQIg5yd57q+i7rwrmr+Q/+2VxyWDK4IYKDHEmh4zwZ+YDr5cDM03LbO4OpxE6Js7
         sTjFrD4zHHfWRtxGFwD3C6iVO2yQzS8WzMFuCzgreTB37x+hCsTskZBU2GccvkOjrCAa
         Rgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x+77SZ+h191D5taiGIual/fH3dxCziZR7JzlGfHatlI=;
        b=mbP4ULZrn+Rt54OwZI4ukOONJy3DPh4fsgF9Fbfi2XsB/6a5sb3ZoPjQxFI345AbF1
         l7MJEfgvEXK+QcxFdntdJvdj/IVC7WDfNsxBSpzkzkiDTOvTM+cXgEw5+YJu3OG8Azan
         6FU0ZtZmnlm43baZQqQSJhw2y3IVZPNP1vuXCq7xr2/qd8KwF8vCZhA/kJudDcHLUVaO
         MGsaJw/MoX6a05djMqElxQo9y2dc6l+sGsePZoO94nuxwvx0sKV8V93zLxUwPQjsk7AV
         t0q//gTk+T1YXHpohysLkHuFmyZBSCPNCjnDS8tj1/eIpXbvjPtpd95lo/INzoWQfHtS
         Ij1w==
X-Gm-Message-State: AOAM530bh8PVYGgXuBVzi36QTR4evBZNgt6d48Ini7RE6leDPA7kWa9G
        uCgfFmLTGLu+jGWfPNFMQYwK5w==
X-Google-Smtp-Source: ABdhPJyKssYlhvVFoqJPqqFT0oY7g6LG8jXxrJ9ggE47PRgNm8b4O7gNRoAlUcC9URw4jkbhDAcKmw==
X-Received: by 2002:a17:906:d78f:: with SMTP id pj15mr2290711ejb.283.1592905560963;
        Tue, 23 Jun 2020 02:46:00 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-249.ip.btc-net.bg. [212.5.158.249])
        by smtp.googlemail.com with ESMTPSA id rv16sm4970844ejb.60.2020.06.23.02.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 02:45:59 -0700 (PDT)
Subject: Re: [PATCH] media: venus: vdec: Fix runtime PM imbalance in vdec_open
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200522111357.2613-1-dinghao.liu@zju.edu.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <5d88210d-db4c-e171-5d4b-5dffe22d4d48@linaro.org>
Date:   Tue, 23 Jun 2020 12:45:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522111357.2613-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dinghao,

This patch is not applicable anymore after [1].

[1] 63342afea65e ("media: venus: vdec: Use pmruntime autosuspend")

On 5/22/20 2:13 PM, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4ed2628585a1..6f2964130728 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1349,7 +1349,7 @@ static int vdec_open(struct file *file)
>  
>  	ret = pm_runtime_get_sync(core->dev_dec);
>  	if (ret < 0)
> -		goto err_free_inst;
> +		goto err_put_sync;
>  
>  	ret = vdec_ctrl_init(inst);
>  	if (ret)
> @@ -1394,7 +1394,6 @@ static int vdec_open(struct file *file)
>  	vdec_ctrl_deinit(inst);
>  err_put_sync:
>  	pm_runtime_put_sync(core->dev_dec);
> -err_free_inst:
>  	kfree(inst);
>  	return ret;
>  }
> 

-- 
regards,
Stan
