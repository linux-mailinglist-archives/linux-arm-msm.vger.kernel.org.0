Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E80E3FF354
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 20:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243944AbhIBSmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 14:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42085 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241887AbhIBSmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 14:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630608063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bj1YZCOICCuWhBGeiWp2KDW8cxmxWvm+507OpITl/f8=;
        b=i3Q0mECxGd2NdWzq6oZ1wNm1mNzoSPQLGlhYDz179t/wl/zBQeOkhBq1iyKWEsuUxe+AIH
        eS/2lROe2WSiH5coDCelKkaL3ES7rBvEua+7yTE+T/vEybm27f0nW6TD8zX238etaNnYzr
        a07g8X5GvUN8TGUEcJJvpVgR+QoRPmU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-5XtVSgBwOaWZpJVfh3avIg-1; Thu, 02 Sep 2021 14:41:02 -0400
X-MC-Unique: 5XtVSgBwOaWZpJVfh3avIg-1
Received: by mail-qk1-f197.google.com with SMTP id d202-20020a3768d3000000b003d30722c98fso3272230qkc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 11:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=Bj1YZCOICCuWhBGeiWp2KDW8cxmxWvm+507OpITl/f8=;
        b=eyxZgx5/xoa/7qcH9WuCOMFPPDof8WL9KjleY9IAlbtJz0/oMOiu+yODlDOuH8RFfK
         Csyl4CPdESxWC/f7ZstKhsAeWo5tVJlZZbg7vJsjhckFem5PYx1aGI7B7s+KydqWpT6M
         DcwntuC+23DE+D2fpv4cZxfAbR89CuAffwYbFmLoMHftZqj5kCNfS/en9MiLxKPzl10O
         00uwqqbpZAvYKLAtWVjhFeMURMknmBqN3Vyk1IKZkCpdBEK5MutgiSXn+tqFgJKSYDoH
         GRNqmGpxNK9yKE/Qt3mb5icQj8/KKUALH9RbvDtM247e/2OY1P5QMdHi10Q3OkxVGIlU
         1nLg==
X-Gm-Message-State: AOAM532uPKiSLnjFF70fVnVEzMigkz8j+U4bJDkJxxSkq+Z3wUKW+5nn
        g21xz9uvka/KITSb/jjy4LC4ObDPP2OTJaDieGUQptNzS909AzzJT0tTHJCkSWgCZVxBgEs3JFG
        vqcqT++/hN3he5JHBQjAZN/Zv1w==
X-Received: by 2002:ac8:7ef6:: with SMTP id r22mr4422749qtc.158.1630608061641;
        Thu, 02 Sep 2021 11:41:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzER9U7aKRPWcbQbf6Y4ZH5pTc8T3UJYAdtuN5uesnicOA+1yjnC5jy8JOV95bM70GmgFDNcw==
X-Received: by 2002:ac8:7ef6:: with SMTP id r22mr4422741qtc.158.1630608061430;
        Thu, 02 Sep 2021 11:41:01 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id p22sm1995353qkj.16.2021.09.02.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 11:41:00 -0700 (PDT)
Message-ID: <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable
From:   Lyude Paul <lyude@redhat.com>
To:     cgel.zte@gmail.com, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        airlied@redhat.com, laurent.pinchart@ideasonboard.com,
        chi.minghao@zte.com.cn, treding@nvidia.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Date:   Thu, 02 Sep 2021 14:40:59 -0400
In-Reply-To: <20210831115127.18236-1-chi.minghao@zte.com.cn>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this?

On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
> From: Chi Minghao <chi.minghao@zte.com.cn>
> 
> Fix the following coccicheck REVIEW:
> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..3610e26e62fa 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
> *ctrl)
>  int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>                 struct drm_connector *connector, struct edid **edid)
>  {
> -       int ret = 0;
> -
>         mutex_lock(&ctrl->dev_mutex);
>  
>         if (ctrl->edid) {
> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>         }
>  unlock_ret:
>         mutex_unlock(&ctrl->dev_mutex);
> -       return ret;
> +       return 0;
>  }
>  
>  int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

