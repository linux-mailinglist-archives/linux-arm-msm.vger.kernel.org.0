Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779D8432803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 21:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhJRT6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 15:58:00 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:43775 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhJRT6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 15:58:00 -0400
Received: by mail-oi1-f177.google.com with SMTP id o4so1316747oia.10;
        Mon, 18 Oct 2021 12:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PSCQKyOmWJlnzwEps4nY9i2BIUDSjYMrlj3m/fawA+U=;
        b=kqYAbsu8gzqQas8X9277Hmx/NEEaAYo1HQ5itnBuJtMlT7cb/aKjjCPJRsXi91XTtq
         S+4QE10m6Pub4K1cvcg9TDqRL5PIx5Q2Bskx+RD46HFe9T/857rFyYQXFEgLce5YtqRl
         gf+WckWS+Oaxnstmlzvt1YAZoao3j8CIlpxzPbpS7a84vefmU6jg2ReDDrVn9jtDlW+h
         8yk2JrVcqQ9Dp8PYlCpZvEQMhw9OIUDbqlgUYaaZk1Ck+ViCqg1sGARg2XN9d3im+ajN
         kVK/h6yTgmtIK78CflUPR2Mli+QR5qIMIhdKQnbPCOQZamrdsomzUjtsrg5fikNzGUly
         5G2A==
X-Gm-Message-State: AOAM533yvZgb4UmT49paLRAuV1rIAArnhreYUZIFwCDSRtF+sAv81K3l
        vORFgvABvTjyUonQ6YvGMA==
X-Google-Smtp-Source: ABdhPJwWYlUYPfByC8b9Pgrq0I0WnyHbprLb6tyFM5Mk7fdqQS3boJddgvFi4VwaMAAZB7NoeatJ0Q==
X-Received: by 2002:aca:a80c:: with SMTP id r12mr766920oie.88.1634586948625;
        Mon, 18 Oct 2021 12:55:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w93sm3173998otb.78.2021.10.18.12.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:55:47 -0700 (PDT)
Received: (nullmailer pid 2847482 invoked by uid 1000);
        Mon, 18 Oct 2021 19:55:46 -0000
Date:   Mon, 18 Oct 2021 14:55:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: arm: cpus: Add Kryo 570 CPUs
Message-ID: <YW3RQihKQUne3abw@robh.at.kernel.org>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
 <20211007212444.328034-9-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007212444.328034-9-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 07 Oct 2021 23:24:35 +0200, Luca Weiss wrote:
> Document Kryo 570 CPUs found in Qualcomm Snapdragon 750G (SM7225).
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
