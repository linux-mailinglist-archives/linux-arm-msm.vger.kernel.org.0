Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471023E0878
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 21:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhHDTGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 15:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhHDTGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 15:06:49 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB56C061799
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 12:06:36 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id r16-20020a0568304190b02904f26cead745so2225818otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RqsWb0Ldu47aOgLTaZq0UGUWgi+Ky2bzWR3XR33Ca/g=;
        b=JMu2DMHU46kEAaW1jaZDVDTeRBvRYDS7xDAdJavHlaRY9SwlYzbba4Tb8F5RyluTYe
         X+cnKYMhaFwB+YD+XFQ8VtH69EyN6xu2mT3REiN2mAS9InpuCxhBSZEWnLk1MiUKsM2I
         dkWPyFriMkcgD9/oWwu5NLp1vBEbzawbxGzn1Wxnh5iqmSs2lt8WDavdXAYa6/Lx2iXp
         y+/PKHjAThxwWdvzl3F4of0jAFTuM2jbgyCSstZiscnbTil8BLGooWc1Ra9uUKIEAAIy
         rZLIdPaSplOhblhcJvGx7axfuE92Hl2GwrCb6IexwoKP+2zPH+A12BQUk+SD5y7Dnk9w
         /q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RqsWb0Ldu47aOgLTaZq0UGUWgi+Ky2bzWR3XR33Ca/g=;
        b=UQ0GHoisT6EvALaHSfKU6OpkqodOgRGYzszLtafbRBukvfYafWv4MexVGwQruFb146
         4d82Ey8WD18pexyD4rXFPgMraZ/+RhzqvGteV+9tuCSzlmTS36qAm4U1nVhzATJCwuAR
         C9xauncbIlE5bBPx0uhcbjLAQZHYSeQVqTFPMpK+5YzD9B3xdo7D7vkuqntxtkLuZW35
         d+H6lxgz5DyFiKVdPizkT5lTRU2UGMTwsSvoIYMF6+vrtVgrF8R2OHvUzdTCx8z2LPx7
         mlyjHJOzbsl/IVgjtXPD6AZeLwkStV71JbJhzlDAhYb7OI74O5WSzFpF+oQZUvcXU7A1
         NO6w==
X-Gm-Message-State: AOAM531ZjmQjEtYovFq/fxmsIGLerF5UcTvJoqLFApwtSSQCvcO1QyeP
        kiXN1YDTgA+hGDxPjc2tV3F4fA==
X-Google-Smtp-Source: ABdhPJy9KjmaK5WOueEU509KVqOnHnKEw/3YJzdgqClzjgzl+3tKChYYIK1IILUAH0GxRMrRrRQbvQ==
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr886349otp.304.1628103996036;
        Wed, 04 Aug 2021 12:06:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w35sm530115ott.80.2021.08.04.12.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 12:06:35 -0700 (PDT)
Date:   Wed, 4 Aug 2021 14:06:33 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        manivannan.sadhasivam@linaro.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>
Subject: Re: [PATCH v4 2/2] soc: qcom: aoss: Add debugfs entry
Message-ID: <YQrlOctFXBL4DP+Q@builder.lan>
References: <1623237532-20829-1-git-send-email-sibis@codeaurora.org>
 <1623237532-20829-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623237532-20829-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Jun 06:18 CDT 2021, Sibi Sankar wrote:

> From: Deepak Kumar Singh <deesin@codeaurora.org>
> 
> It can be useful to control the different power states of various
> parts of hardware for device testing. Add a debugfs node for qmp so
> messages can be sent to aoss for debugging and testing purposes.
> 

I thought I replied to this patch, but can't find the reply...

> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index e8f48760bac8..998ee7605eb2 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -4,6 +4,7 @@
>   */
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/mailbox_client.h>
> @@ -89,6 +90,9 @@ struct qmp {
>  	struct clk_hw qdss_clk;
>  	struct genpd_onecell_data pd_data;
>  	struct qmp_cooling_device *cooling_devs;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *debugfs_file;
> +#endif /* CONFIG_DEBUG_FS */
>  };
>  
>  struct qmp_pd {
> @@ -575,6 +579,32 @@ void qmp_put(struct qmp *qmp)
>  }
>  EXPORT_SYMBOL(qmp_put);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static ssize_t aoss_dbg_write(struct file *file, const char __user *userstr,
> +			      size_t len, loff_t *pos)
> +{
> +	struct qmp *qmp = file->private_data;
> +	char buf[QMP_MSG_LEN] = {};
> +	int ret;
> +
> +	if (!len || len >= QMP_MSG_LEN)
> +		return len;
> +
> +	ret  = copy_from_user(buf, userstr, len);
> +	if (ret)
> +		return len;
> +
> +	ret = qmp_send(qmp, buf, QMP_MSG_LEN);
> +
> +	return ret ? ret : len;
> +}
> +
> +static const struct file_operations aoss_dbg_fops = {
> +	.open = simple_open,
> +	.write = aoss_dbg_write,
> +};
> +#endif /* CONFIG_DEBUG_FS */
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -632,6 +662,11 @@ static int qmp_probe(struct platform_device *pdev)
>  
>  	atomic_set(&qmp->orphan, 0);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	qmp->debugfs_file = debugfs_create_file("aoss_send_message", 0220, NULL,
> +						qmp, &aoss_dbg_fops);
> +#endif /* CONFIG_DEBUG_FS */

You shouldn't need the guards, debugfs_create_file() is stubbed if
CONFIG_DEBUG_FS isn't set, so it's better to just rely on that.

Regards,
Bjorn

> +
>  	return 0;
>  
>  err_remove_qdss_clk:
> @@ -649,6 +684,10 @@ static int qmp_remove(struct platform_device *pdev)
>  {
>  	struct qmp *qmp = platform_get_drvdata(pdev);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	debugfs_remove(qmp->debugfs_file);
> +#endif /* CONFIG_DEBUG_FS */
> +
>  	qmp_qdss_clk_remove(qmp);
>  	qmp_pd_remove(qmp);
>  	qmp_cooling_devices_remove(qmp);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
