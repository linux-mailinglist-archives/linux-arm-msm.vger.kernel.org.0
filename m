Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87325348266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 20:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238083AbhCXT71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 15:59:27 -0400
Received: from mail-il1-f180.google.com ([209.85.166.180]:39555 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbhCXT66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 15:58:58 -0400
Received: by mail-il1-f180.google.com with SMTP id y17so138917ila.6;
        Wed, 24 Mar 2021 12:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GpCo3IcBQxKypw+sopIjeowZKLjnxLfCAm7E3MjkcwU=;
        b=PIw9AKTvzVTizAyfQCqDHbppR90WbV6nAf4pFMuafg/s9aMx4E+ayEcUoqesqpYs7P
         mfPaD/BzMTkQSy2KCp0drjz27Xm3ukFWIULVUyWQcI54bczRMSR8X+DEdl0A0bYkc6F9
         iZZlfnyjULXoMQM6D/bXa+TKzz0Vx37FR8gPEDasFiLE28sXNdGoz4au2PKUK0WknPYd
         CtxyntbM4eb/Tdo3o9FYUWg5Sxkja16cHLAVaWFa3SV2GRmKN5lqwrQ9pmqb3G5xVDkL
         UzHd54VqiN3xgSbROATrZTEdn8Btb6soe6Ja80rwsp9M7aIqS8GGLESeUiMkVhdUH3BD
         CLPQ==
X-Gm-Message-State: AOAM533iSKZqglWqnH3JN0Ap0iPl4lSwCXnKx85FwJi3FeOnLpeIQjpv
        DBbhUIpScWmjQsJGa4iw7A==
X-Google-Smtp-Source: ABdhPJwuHwuYqlKiAKQaCtWWN9OC67sZtR0+TRfT7M4eIvcf2rvt2nbJgLzkTu9Ht9xMFjHaUA0+Rg==
X-Received: by 2002:a05:6e02:15c7:: with SMTP id q7mr4089063ilu.228.1616615937819;
        Wed, 24 Mar 2021 12:58:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 23sm1587941iog.45.2021.03.24.12.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:58:57 -0700 (PDT)
Received: (nullmailer pid 3526356 invoked by uid 1000);
        Wed, 24 Mar 2021 19:58:54 -0000
Date:   Wed, 24 Mar 2021 13:58:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, airlied@linux.ie, dt@kernel.org,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: msm: Couple of spelling fixes
Message-ID: <20210324195854.GA3526276@robh.at.kernel.org>
References: <20210320192553.29922-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320192553.29922-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 21 Mar 2021 00:55:53 +0530, Bhaskar Chowdhury wrote:
> 
> s/Subsytem/Subsystem/
> s/contoller/controller/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
