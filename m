Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CF9399022
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhFBQjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:39:41 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:38843 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhFBQjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:39:40 -0400
Received: by mail-oi1-f173.google.com with SMTP id z3so3246652oib.5;
        Wed, 02 Jun 2021 09:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gXM+8pMIgFiy/+LLPCeVybsT1QR+jHzA8tbf9AdsUc0=;
        b=t8t/nRciYgRqsHm1798xNyYefgv7ozmEeTuYDMo5w3tHkgfQjTU0t4m93OLIDWPJjD
         jcPdql6WNk6pncr+rVKSqqrj0WC2kwSc9ZV6nibPy9re1wg76rETQo+S5Wqytru/sfjo
         yg1GIUk0gdzCWpcrwnjUjt5B7gR1Hnvztta0mkn003FTSI8CC8jxavzEWFfpbL6OLcgc
         QashGftIMIFPVpNBCdvwkKP34IuhQ4OZIo+ZTW9YCf+6DhiZrKaUTvxGPYK9WIiXD51h
         jaTkqecsKKX3XJj1nr9P129AjVVidGRPffT4mJbyP9wETGxisPXXq7gA8dwJ9/K0f6B5
         j1OQ==
X-Gm-Message-State: AOAM533tnClYZ/abFuVtsyfWwPhQJI+OVzIkbNpZ1mXBSrxqERzkGw4h
        RCyTk3RgPQ7R4K4nhXTdBQ==
X-Google-Smtp-Source: ABdhPJwXv6Jn2RFRBK1OtgSwBJ+SYYLPTGtTgl9F7neb2wsxWgBLoylCpJ6v/9oELfAgF8YlwHquWw==
X-Received: by 2002:aca:e156:: with SMTP id y83mr22247604oig.155.1622651863434;
        Wed, 02 Jun 2021 09:37:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f2sm68701ooj.22.2021.06.02.09.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:37:42 -0700 (PDT)
Received: (nullmailer pid 3525412 invoked by uid 1000);
        Wed, 02 Jun 2021 16:37:40 -0000
Date:   Wed, 2 Jun 2021 11:37:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     mark.rutland@arm.com, andy.gross@linaro.org,
        stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org, devicetree@vger.kernel.org,
        david.brown@linaro.org
Subject: Re: [PATCH v3] dt-bindings: media: venus: Add sc7280 dt schema
Message-ID: <20210602163740.GA3521753@robh.at.kernel.org>
References: <1622646392-27141-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622646392-27141-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 02 Jun 2021 20:36:32 +0530, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../bindings/media/qcom,sc7280-venus.yaml          | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 

Assuming the dependent header is merged first,

Reviewed-by: Rob Herring <robh@kernel.org>
