Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5803CA216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 18:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhGOQSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 12:18:49 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:39564 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGOQSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 12:18:49 -0400
Received: by mail-io1-f43.google.com with SMTP id h6so1087013iok.6;
        Thu, 15 Jul 2021 09:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jUDmLjLx44inn7GkSdcgZZrpwVMC3pPvjJgP4EG0irE=;
        b=aZbMjul8dUEE27ptMfiKcU3RPUjNkOaZGnTdV61j6Ml6OhmpXkhYYND2rH43fYeUbx
         qsPYQjcw43HkZReLT3ykRPbaAEyFu96D5h3S7XbcGB9v2wqODIcUVhyf/Oz86EQF21J3
         6w8hxNSz9w1D5aaVnY2aovhsdbRstZeT35kF3ZBmwUNZAL3zECxqaq67iuFt5WTZGTr1
         w0F7/NsmUP9Y0D6YXr0ng5jYv5wlLdfgvQerwJ3Om+CoTrC8mdf9EvSpgCx1D+70dg/0
         wlr64SghfRq0kY1+3WsGk3pakOoDDbPnLW/16T4KtUkE/jF/Rl4peFmui2lC3QIiS+5r
         3Nrw==
X-Gm-Message-State: AOAM530DGMvrYbvgNBEGsPTkk+wTnOTPUO3O1bjUJgiatwifm+4P/cKL
        OZJ4+yu5imKxBNv6X3d1dA==
X-Google-Smtp-Source: ABdhPJzgSNDzEpajPwyYVdmwZNKLRk/Ow3I2k8uXERDje9G99WLFAKwYa0KNhqKw17f9dLvNj3eHBw==
X-Received: by 2002:a5d:858b:: with SMTP id f11mr3781911ioj.156.1626365755913;
        Thu, 15 Jul 2021 09:15:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d5sm3321100ilf.55.2021.07.15.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 09:15:54 -0700 (PDT)
Received: (nullmailer pid 1176275 invoked by uid 1000);
        Thu, 15 Jul 2021 16:15:53 -0000
Date:   Thu, 15 Jul 2021 10:15:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/8] dt-bindings: display: msm: dsi-controller-main:
 restore assigned-clocks
Message-ID: <20210715161553.GA1176219@robh.at.kernel.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
 <20210709210729.953114-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709210729.953114-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Jul 2021 00:07:22 +0300, Dmitry Baryshkov wrote:
> Restore the assgined-clocks and assigned-clock-parents properties that
> were lost during the txt -> YAML conversion.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
