Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16FF41EAEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 12:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352214AbhJAKaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 06:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhJAKaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 06:30:06 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EC8C06177B
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 03:28:22 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id m26so8460037qtn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+gRi93ICIYhobVAL5GEzt+moQ65uKWUqaq2BoT5lL84=;
        b=i6XxsNIjWOUkSCaIuZ4Zpn4QRlKAsZY6wrojfJixi2mdRYfvXW2S3ySfjkwRZzuii3
         dkYwYiQiYIvcx0gcRShdbLMo956liqG0jtek6n3uYNmJ4pQXMz7Elpscp8xRHuxpQljs
         EzloI2RMkkSIbTVRRm1bQEUZ8ps5+2A8VNPbc2FltxKqoGN1JLOhDKe2v8TIHTfkicSu
         gvou5gDJRUoVfSen3sBWiSaJZJxVH6K4gRJyuZCEBGo7a8/Y7wI6tjdSGtEofGVuK8PB
         k3pQdAZiAD8YMdDaMHoeSyWTgqCvIbBlmwa3mJUv2UasLJd9NBg+i86fIAhIsxTsXFxC
         cIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+gRi93ICIYhobVAL5GEzt+moQ65uKWUqaq2BoT5lL84=;
        b=diDCD8/5NT1dfP7UutbM6MrTs+/QOSIqCsUzL0la2XH45COb7+kk38E3pvejo9zKg1
         WHjLDAMr2DL83OTs0g9NYj7pWYG7C8JroWk0GUzxo7jeRyVV3SCL+br4ofXFRpoCD+d8
         9oTN70VGt7ikuefSv1YlYJgDUQtrYizpoNkgT9IPuH0AjQXhSOTwmTx2sNyv+T+s7wDD
         FcGDw8DCiJE2tbqn2TkW+SdxJ1ykIABuYVX8/UhMIKa6eWTNMoKCBSs/GX1dqw+xHRrZ
         tJpXNqhVzcH5AM00rZw0LE/mkC2nk/AM8KOM/von3dvzWaw8sY2CMwMZRIEcWra3//bB
         uPfQ==
X-Gm-Message-State: AOAM533D14cwA3+5UPm/z5VcDxWMbfyH7GazcRceEPu/dn3JzgitBeGe
        mPndpqXLQ/1GC9JZBrfA4irZpPxZZRKWPA==
X-Google-Smtp-Source: ABdhPJyzhD8jytJih98e2GqEKbvygKymH8WSueCcMGsR3JKrq+HelSvIV0F8NBfVoiVTK39m/CXQog==
X-Received: by 2002:a05:622a:295:: with SMTP id z21mr12248464qtw.125.1633084101399;
        Fri, 01 Oct 2021 03:28:21 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id i18sm3353134qtx.60.2021.10.01.03.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 03:28:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens: remove data indirection in
 the debugfs
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210926134237.23863-1-dmitry.baryshkov@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <973f7fd6-3d35-205b-5405-d9daa3510a4e@linaro.org>
Date:   Fri, 1 Oct 2021 06:28:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210926134237.23863-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dimitry,

Thanks for the patch

On 9/26/21 9:42 AM, Dmitry Baryshkov wrote:
> There is no reason to pass platform device to debugfs just to get the
> tsens_priv from it. Not to mention that for TSENS_V0 the platform device
> (gcc) might have other device data. Pass the tsens_priv data to debugfs
> callbacks directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/thermal/qcom/tsens.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 4c7ebd1d3f9c..6aeea74c1bb0 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -657,8 +657,7 @@ int get_temp_common(const struct tsens_sensor *s, int *temp)
>   #ifdef CONFIG_DEBUG_FS
>   static int dbg_sensors_show(struct seq_file *s, void *data)
>   {
> -	struct platform_device *pdev = s->private;
> -	struct tsens_priv *priv = platform_get_drvdata(pdev);
> +	struct tsens_priv *priv = s->private;
>   	int i;
>   
>   	seq_printf(s, "max: %2d\nnum: %2d\n\n",
> @@ -675,8 +674,7 @@ static int dbg_sensors_show(struct seq_file *s, void *data)
>   
>   static int dbg_version_show(struct seq_file *s, void *data)
>   {
> -	struct platform_device *pdev = s->private;
> -	struct tsens_priv *priv = platform_get_drvdata(pdev);
> +	struct tsens_priv *priv = s->private;
>   	u32 maj_ver, min_ver, step_ver;
>   	int ret;
>   
> @@ -701,9 +699,8 @@ static int dbg_version_show(struct seq_file *s, void *data)
>   DEFINE_SHOW_ATTRIBUTE(dbg_version);
>   DEFINE_SHOW_ATTRIBUTE(dbg_sensors);
>   
> -static void tsens_debug_init(struct platform_device *pdev)
> +static void tsens_debug_init(struct platform_device *pdev, struct tsens_priv *priv)

You anyways have to pass pdev here, as it is used for referencing dev 
name below. So drop sending tsens_priv as well. You can get it via 
platform_get_drvdata as in the original code. I am okay with the change 
in using priv instead of pdev as private pointer in the fops.

>   {
> -	struct tsens_priv *priv = platform_get_drvdata(pdev);
>   	struct dentry *root, *file;
>   
>   	root = debugfs_lookup("tsens", NULL);
> @@ -715,14 +712,14 @@ static void tsens_debug_init(struct platform_device *pdev)
>   	file = debugfs_lookup("version", priv->debug_root);
>   	if (!file)
>   		debugfs_create_file("version", 0444, priv->debug_root,
> -				    pdev, &dbg_version_fops);
> +				    priv, &dbg_version_fops);
>   
>   	/* A directory for each instance of the TSENS IP */
>   	priv->debug = debugfs_create_dir(dev_name(&pdev->dev), priv->debug_root);
> -	debugfs_create_file("sensors", 0444, priv->debug, pdev, &dbg_sensors_fops);
> +	debugfs_create_file("sensors", 0444, priv->debug, priv, &dbg_sensors_fops);
>   }
>   #else
> -static inline void tsens_debug_init(struct platform_device *pdev) {}
> +static inline void tsens_debug_init(struct platform_device *pdev, struct tsens_priv *priv) {}
>   #endif
>   
>   static const struct regmap_config tsens_config = {
> @@ -918,7 +915,7 @@ int __init init_common(struct tsens_priv *priv)
>   	if (tsens_version(priv) >= VER_0_1)
>   		tsens_enable_irq(priv);
>   
> -	tsens_debug_init(op);
> +	tsens_debug_init(op, priv);
>   
>   err_put_device:
>   	put_device(&op->dev);
> 

-- 
Warm Regards
Thara (She/Her/Hers)
