Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF22275BEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIWPdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:33:08 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:36688 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWPdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:33:08 -0400
Received: by mail-il1-f194.google.com with SMTP id t12so19850ilh.3;
        Wed, 23 Sep 2020 08:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5w8Uvn8McZjjgkjEWVA++4pmoYoDvxFECyptYJKqC0=;
        b=PlKl991zxVPtbGs6ziDNBBVamf2KZfJSINqcekd3Txcs80qyr4U4sNFBCj3Tno5NMR
         JWtTTLOm4EuXky/gRlXVXd9xkMOU3YIMP8B14nBqjlaHanXCXw3m49m/ydYEfMYgHQ6r
         roQxB2sI3fdFZULBNf1qEC7QSlxa17x/WHltq+GgAgdmXfMjmkt7Q42uctfOtnNgbl1N
         pZZF+sXcvjKQyjGuOVJ7WR5R6DMCn+cI4CY0RDHu9y+fT7uOsmVn2YiiMyUY9TgqH/k1
         mIMLXS+EAdey9NZmi1IhpZmz37YxpmQcyV74JvWUvCVub2OzS4sRN9kEkA4tgwKKPbGq
         IyEw==
X-Gm-Message-State: AOAM5309p4UYStuBRBzgMLC+wHtdCb3BXvEbjG42faVbx5pPZSt3SBSy
        osSneRHvw3oZMI1HBcLFmQ==
X-Google-Smtp-Source: ABdhPJxbVblo1SqKfxuo6P8z/VT/DbqU+Fmlgz8qI7+aeXmQ6bBTgFNGVWwbrry3rmmdgnLCi0iZyg==
X-Received: by 2002:a05:6e02:13ae:: with SMTP id h14mr319531ilo.208.1600875187319;
        Wed, 23 Sep 2020 08:33:07 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a23sm79204ioc.54.2020.09.23.08.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:33:06 -0700 (PDT)
Received: (nullmailer pid 787842 invoked by uid 1000);
        Wed, 23 Sep 2020 15:33:05 -0000
Date:   Wed, 23 Sep 2020 09:33:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 02/10] dt-bindings: power: rpmpd: Add MSM8916 RPM power
 domains
Message-ID: <20200923153305.GA787788@bogus>
References: <20200916104135.25085-1-stephan@gerhold.net>
 <20200916104135.25085-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916104135.25085-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Sep 2020 12:41:27 +0200, Stephan Gerhold wrote:
> MSM8916 has two RPM power domains: VDDCX and VDDMX.
> Add the device tree bindings to manage them through rpmpd.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 7 +++++++
>  2 files changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
