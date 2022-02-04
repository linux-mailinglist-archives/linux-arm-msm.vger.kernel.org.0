Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6644AA447
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Feb 2022 00:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378116AbiBDXYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 18:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378111AbiBDXYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 18:24:11 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338DCDFC13F5
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 15:24:10 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a25so10549261lji.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 15:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PWiV2lZPQ1oxzDX5VhhR5BQlTQiYhsaOquNchxEhcpM=;
        b=LXXH32DRyRkZ2SH8g70/SM1ESMqww78Q7SXYek7faDMSuvQpX760255hBe3DbOyoVE
         qQagX/fXgdVheORiYdjZvIF0SDycV+PcS29zmfusipjtXsKdb52NdNlTOVCW9lJ/xOHG
         0HrHzBkGAPdAJmGD1vjP5iBnaFj0W57Yf6X08HEkpkCWhGNUx7RL9f65EkBTJpvHAf50
         c6GlmhX/6AWDhS4yVipviPP/IxtlhNwXRMGGfJ0lTpBRsEfrdLTcP/F6rw8jSlS7DsKm
         a7CnieDPChxEl9KPbLZREjrOwQpPxQEjPQpDnFVZePtG2ZIIITokLpv/AqCWp/q8wxsQ
         Yfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PWiV2lZPQ1oxzDX5VhhR5BQlTQiYhsaOquNchxEhcpM=;
        b=Js+yMTksOdKkHGjKqV6KMGuYEgJxpP8lXKl14DGISCbmqyxX8K7t/IrxFAcNW4oaOW
         Zw+acdHXKxiY8lqck72uKge6a/DLl0hnn7JB6FzACZte51wEkk2J4rg1IKIPQykOadSW
         9O2TOBVhz91Lp+E79mkOM4z+9n1NnpmD8icGb7eIiiDk0XUDWbGB3RnAi0R/CdZyfM26
         8T/MOXPA2uEwEbyHIQjxiX71LOBgZkJ7yhcyqKnbAZvkRMJ1rFoBgBQW+bb2GEe456Xm
         avo1QdNLxcY71iCMjUJG2MHedkGnN0jyvJWjmSyEL/rI/ECiUuzUUyyPI/rlB+Cxme/l
         uGqw==
X-Gm-Message-State: AOAM5325U/uGNbOmgEQUeaom3T+2CMgb6/zbrdI7cu3dy6z8zSD6EUYk
        4p6eeOR8SaJoLAoqbKJyN7dnuA==
X-Google-Smtp-Source: ABdhPJx78N6lXrVt6A+yfFC45t9w5aHFz7UGqNQ05qJbChN5qJQnCE+YKswDgrqEagqCZzXyxIPkIw==
X-Received: by 2002:a2e:bc29:: with SMTP id b41mr848522ljf.42.1644017048533;
        Fri, 04 Feb 2022 15:24:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w3sm491709lft.161.2022.02.04.15.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 15:24:08 -0800 (PST)
Message-ID: <f13e4fda-1dbb-5e48-35fc-ce0e87cde861@linaro.org>
Date:   Sat, 5 Feb 2022 02:24:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/12] drm/msm/dpu: add the writeback connector layer
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org, daniel@ffwll.ch,
        markyacoub@chromium.org, quic_jesszhan@quicinc.com
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-10-git-send-email-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-10-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Introduce the dpu_writeback module which serves as the
> interface between dpu operations and the drm_writeback.
> 
> This module manages the connector related operations for
> dpu writeback.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                  |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 71 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 27 ++++++++++
>   3 files changed, 99 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 3abaf84..05a8515 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -74,6 +74,7 @@ msm-y := \
>   	disp/dpu1/dpu_plane.o \
>   	disp/dpu1/dpu_rm.o \
>   	disp/dpu1/dpu_vbif.o \
> +	disp/dpu1/dpu_writeback.o \
>   	disp/msm_disp_snapshot.o \
>   	disp/msm_disp_snapshot_util.o \
>   	msm_atomic.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> new file mode 100644
> index 0000000..7b61fad
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "dpu_writeback.h"
> +
> +static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +			dev->mode_config.max_height);
> +}
> +
> +static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	if (!job->fb)
> +		return 0;
> +
> +	dpu_encoder_prepare_wb_job(connector->encoder, job);
> +
> +	return 0;
> +}
> +
> +static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	if (!job->fb)
> +		return;
> +
> +	dpu_encoder_cleanup_wb_job(connector->encoder, job);
> +}
> +
> +static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
> +	.get_modes = dpu_wb_conn_get_modes,
> +	.prepare_writeback_job = dpu_wb_conn_prepare_job,
> +	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
> +};
> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const struct drm_encoder_helper_funcs *enc_helper_funcs, const u32 *format_list,
> +		u32 num_formats)

the enc_helper_funcs is always dpu_encoder_helper_funcs here. And 
enc->helper_private is already initalized. You can drop the argument.

> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct dpu_wb_connector *dpu_wb_conn;
> +	int rc = 0;
> +
> +	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
> +	dpu_wb_conn->base.base = &dpu_wb_conn->connector;
> +	dpu_wb_conn->base.encoder = enc;
> +
> +	drm_connector_helper_add(dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> +
> +	rc = drm_writeback_connector_init(dev, &dpu_wb_conn->base,
> +			&dpu_wb_conn_funcs, enc_helper_funcs,
> +			format_list, num_formats);
> +
> +	priv->connectors[priv->num_connectors++] = dpu_wb_conn->base.base;
> +
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> new file mode 100644
> index 0000000..206ce5e
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_WRITEBACK_H
> +#define _DPU_WRITEBACK_H
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_writeback.h>
> +
> +#include "msm_drv.h"
> +#include "dpu_kms.h"
> +#include "dpu_encoder_phys.h"
> +
> +struct dpu_wb_connector {
> +	struct drm_connector connector;
> +	struct drm_writeback_connector base;
> +};
> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const struct drm_encoder_helper_funcs *enc_helper_funcs,
> +		const u32 *format_list, u32 num_formats);
> +
> +#endif /*_DPU_WRITEBACK_H */


-- 
With best wishes
Dmitry
