Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2AE32FD73
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 22:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhCFVVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 16:21:52 -0500
Received: from mail-pj1-f52.google.com ([209.85.216.52]:35452 "EHLO
        mail-pj1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhCFVVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 16:21:20 -0500
Received: by mail-pj1-f52.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so985985pjb.0;
        Sat, 06 Mar 2021 13:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oE8/H+17+VYxYQJsbsJgHOaOqqJcSzYEpJhT9aUW4Wk=;
        b=VUW9aLJIQ0mHxgvsVzCaA4RfsqCs/eU7a0rp3mSzs3ovQ3ag9jYHFrA/8U1rmx+AYr
         /df5u46WpZVJH9h3fyFJ4TaKbUj5xhi3xLGv+NmpXea1Cl20eXR3YNOmyLPwLHLBecSB
         CxhQxeVR24R4lQqC4mkR36/7gydDN7wJLtzyRV56ecEzbmTgpoGC5zZXeJ4+iYx1Btvx
         XeFIZXgy3xlUQ494zeOT7wgxX1sSfTQH2tm9UOrYaUoVu/75aUBS9b+XQz5St5nXYnrs
         kARhCUCOqrnN48zJvmKvFcZo2pQ8hQRmoNdM4qB6OzlqyT7l9d0Gn3Z94wvwMqZfppWY
         kM6A==
X-Gm-Message-State: AOAM533uOVZA32XreJSRMnErrOi6nvS5oJGCgRW7xB19mJRZPTZJVRr9
        cWpexQtoAy1jQZiK8TUzEw==
X-Google-Smtp-Source: ABdhPJyjbxJiBDeI1a36BvVCwxfCflZXDDF+C9sjJqIXcHLtC2q+XC1bnuAg/EhQbQjN2GNnb7rJ0A==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id p7-20020a1709026b87b02900dc340218afmr14564526plk.29.1615065680035;
        Sat, 06 Mar 2021 13:21:20 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id z29sm6236428pfr.114.2021.03.06.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 13:21:19 -0800 (PST)
Received: (nullmailer pid 1232802 invoked by uid 1000);
        Sat, 06 Mar 2021 21:21:13 -0000
Date:   Sat, 6 Mar 2021 14:21:13 -0700
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        martin.botka@somainline.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: pmic-mpp: Add missing dt-bindings mpp
 function defs
Message-ID: <20210306212113.GA1232748@robh.at.kernel.org>
References: <20210225213605.117201-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225213605.117201-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 22:36:04 +0100, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> The pinctrl-spmi-mpp driver supports setting more mpp functions
> than the ones defined in the dt-bindings header, specifically,
> digital, analog and sink.
> 
> To follow the current way of specifying the function config
> in Device-Tree, add the missing three definitions in the
> appropriate dt-bindings header as:
> GPIO_MPP_FUNC_{DIGITAL,ANALOG,SINK}.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  include/dt-bindings/pinctrl/qcom,pmic-mpp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
