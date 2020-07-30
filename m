Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB5923339F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 15:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgG3N5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 09:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgG3N5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 09:57:36 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C34C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 06:57:36 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id 2so21506259qkf.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=swB4gM5/Sd34+RuLXe4ebGLoqKKPMlJrxzDtJ86OY8o=;
        b=ElJmz2ZYVZwbLk/3G64W4s/3aJGLxePkXOtMUKp0atmEd4+v8cnbJbC3GS1fxeMKXb
         RO0SxPF8d2cy2PqimJ+cI0MM4Umk4mHoHUyzINy/3fhrqK5ikEv/4MxDWTEBeowS6ROl
         b6CfyD/bZkLZnpUIkqED3RJwQC5vkGSJin0RctcQFE57iW8XDlgQlVbNt1mJ9AABAlI2
         AT0Ac4QBita8mYG51kmHbZXIe3UUOvZKvPQk4gBTcy+Jc2jmvrw06dXQPX3aMeIv8ZiH
         b4yxobYO9/y9T1BUjqEz9HoEB9tPYD/+2CNStQpALXdf3lWzNV8X+ON5KqFx3czETx+M
         5LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=swB4gM5/Sd34+RuLXe4ebGLoqKKPMlJrxzDtJ86OY8o=;
        b=jDK5VDxLZqSIuJYpQtTp3uQMGai+h990rN5ZtRg12iG37Ubiia1JtXC7DgjMyfzBJB
         fnMtgB/q5aBX4HazAM9MLDOwBjBiy3C/9L2erYP5KL/xPFMCUK+UPosNiJGb8y+a9O/O
         CmxIdtCYkDJ5KiAhL+lQu0VsOoUWqnIzL6IF5aXr796yOECECJSRGUkic1JpX9YQKTe6
         lBb0w6lgrI5rSvfbNfosb27Q2qnsinl4ugMTcpRUzJrEnZgMR3CSuPA745v64vVLc/q7
         2h8lJ3FG04CQU/bYbMlC0ix28Dldud4R6gLdMGnq4rLAuGef575yRMckeBSKi9W7NAD/
         VASQ==
X-Gm-Message-State: AOAM5339S/ux68VMaglJZUHRBNNtWIsqTCVPZHFyzzM7AtJIQC6ih169
        A4CnavUkxPZS6tkJlDjuMqCocg==
X-Google-Smtp-Source: ABdhPJzPkHLNJBZVdH8dOzQCTNrpkJEAuR+3sHOQnsQ2ETHZ0yd/YXNBy4jXja0jaOUk3UBJBgCKDQ==
X-Received: by 2002:a37:6644:: with SMTP id a65mr37224452qkc.4.1596117455468;
        Thu, 30 Jul 2020 06:57:35 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id x29sm4824919qtx.74.2020.07.30.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 06:57:34 -0700 (PDT)
Message-ID: <8d287abcc4e2e86b5eaeca5a97b57004be8f6669.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/6] Add new controls for CQ and Frame-skip
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>
Date:   Thu, 30 Jul 2020 09:57:33 -0400
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le mardi 21 juillet 2020 à 10:45 +0300, Stanimir Varbanov a écrit :
> Hello,
> 
> Here is v2 with following changes:
> 
>  * 3/6 Added references for VBV size and h264 CPB size - requested by Nicolas

Thanks for this enhancement. No more comments on the doc from me.

>  * 4/6 Fixed compile warning
> 
> Previous version can be found at [1].
> 
> regards,
> Stan
> 
> [1] https://lkml.org/lkml/2020/7/20/619
> 
> Maheshwar Ajja (1):
>   media: v4l2-ctrls: Add encoder constant quality control
> 
> Stanimir Varbanov (5):
>   venus: venc: Add support for constant quality control
>   media: v4l2-ctrl: Add frame-skip std encoder control
>   venus: venc: Add support for frame-skip mode v4l2 control
>   media: s5p-mfc: Use standard frame skip mode control
>   media: docs: Deprecate mfc frame skip control
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 53 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  2 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c  | 37 ++++++++++++-
>  .../media/platform/qcom/venus/hfi_helper.h    | 10 +++-
>  drivers/media/platform/qcom/venus/venc.c      | 20 +++++--
>  .../media/platform/qcom/venus/venc_ctrls.c    | 18 ++++++-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 12 +++++
>  include/uapi/linux/v4l2-controls.h            |  8 +++
>  9 files changed, 160 insertions(+), 6 deletions(-)
> 

