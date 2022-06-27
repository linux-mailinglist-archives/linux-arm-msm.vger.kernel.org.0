Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F2455DE39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238854AbiF0Uk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiF0Uk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:40:26 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAD7DEB4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:40:25 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-101b4f9e825so14441321fac.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jmzqCLZEusFvK30GUvwarTPAI/2hAGgafpqukT2uCeY=;
        b=F0+f2j6fH/kSwW8e/OqSf1WkPdi/HOLnWsY5Wc11wwGJIJHoHKiCOiRdy0CBi4xpC/
         UjF8PzFLbSdglDlCkSvxR23w6DYPoR4VC8KvlNg6/+q8nXASFfihtjl1ntPTBtdvm0hp
         GYW7SbFIoQ+kMeMbgcn3KJ6yRldtsLD7RvVe72K27HWOXBi/cgvEqJnn82d7Ikcsntuz
         028Xoy0Q2Xzlfvvt+U8FwqmrZrIrhlL1GME62bwBqNf1FA8+Rz1/h5EJ2CowyRJs9ZPp
         w5xofn+9XZmS2+3Y1W8XMNNk1lyHpBoy5T17Xt6Ut2iQT1WpCXXMG27pNoRSBx4Ic4CC
         jslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jmzqCLZEusFvK30GUvwarTPAI/2hAGgafpqukT2uCeY=;
        b=1WQzA17fi+BJAhF/tx0bOs1luRlE2FwwHHzspfjcwT7cIkTGBJmdNrz8dIAJK3yYZl
         VtjYyIM60dhTZfjYPhAtnqi7mzd30vUGfBWsfXxf8Pj/7zE0w5q+4BKG/1v79tBxfnUe
         ngPKQidNva3UwpibcuR1WLfkErFCEKvd0ZFne7i3ZcWzuzFekliUGW6bsinsyi4SeeUi
         ChxaNrU27pvGMe97b4Dya6B7HtcRDm9zZlHe5kiVQnaTeEwqFiZBbegDyffp+ClB4opn
         dhG7GQDY94tEENANTyg45RigGiDAnOKED67YqByDj/kjC/er8ny1fPrihiAULrbsyYo3
         arrw==
X-Gm-Message-State: AJIora9oo/7lPadfIHTDZpFbzHLQuM8SawvAi30b4oZ6PhrG1offCVH7
        Jju+VhY4Qr95jT1nmblZ+PUaow==
X-Google-Smtp-Source: AGRyM1t6hiie7pEhqg3xvsIsHHhFpIuSUQyQD0JXZnqL06hesjet/y04wFsLleqR34mUqH2RbK0jUQ==
X-Received: by 2002:a05:6870:f616:b0:f2:dac0:e339 with SMTP id ek22-20020a056870f61600b000f2dac0e339mr11702877oab.116.1656362425179;
        Mon, 27 Jun 2022 13:40:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c13-20020aca1c0d000000b003351dbf5e36sm5835177oic.43.2022.06.27.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:40:24 -0700 (PDT)
Date:   Mon, 27 Jun 2022 15:40:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <YroVtj4zXXcHygxD@builder.lan>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
 <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 29 Apr 17:03 CDT 2022, Bryan O'Donoghue wrote:

Adding the sound maintainers to To/Cc, please advice if you would prefer
Bryan to resubmit the patch with proper recipients.

> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.
> 
> Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Once this patch is picked up I can merge the dts change.

Regards,
Bjorn

> ---
>  sound/soc/qcom/lpass-apq8016.c | 1 +
>  sound/soc/qcom/lpass-cpu.c     | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 3efa133d1c64..abaf694ee9a3 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -293,6 +293,7 @@ static struct lpass_variant apq8016_data = {
>  
>  static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
>  	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
> +	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index e6846ad2b5fa..53f9bf6581d3 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1102,6 +1102,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  	if (!match || !match->data)
>  		return -EINVAL;
>  
> +	if (of_device_is_compatible(dev->of_node, "qcom,lpass-cpu-apq8016")) {
> +		dev_warn(dev, "%s compatible is deprecated\n",
> +			 match->compatible);
> +	}
> +
>  	drvdata->variant = (struct lpass_variant *)match->data;
>  	variant = drvdata->variant;
>  
> -- 
> 2.35.1
> 
