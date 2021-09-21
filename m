Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CCF413839
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 19:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhIURYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 13:24:48 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37812 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhIURYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 13:24:48 -0400
Received: by mail-ot1-f41.google.com with SMTP id w64-20020a9d3646000000b0054716b40005so8296180otb.4;
        Tue, 21 Sep 2021 10:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TInCVzT1Y5DqaOfHosB2a0AmzFNyCCHKf4FA7HEEoBI=;
        b=B4sfQvP/5IkUZmjs/7e+ahC+LTw44lKSi6FS3512N6cyecOGZnjllDmZ3UkRK/aavy
         01uIc3APXWuRYj2DRafOeJQ18czuQckivAupzid6xCuk2w9grq1Y5Z4bLRYWIjMcoc3q
         NOtduJOx4GeQ/fmq0kJntB/uwpRS88Tw1MvvgF0hWs4bUScsKWJFymAnYiI2Z3um7z4N
         K+Nu835/7vDV5XUlTI00z8WV6icWmVx9DrCtxl+eVFRyI9cvJtAVqOLTTMSXlyWwjvdB
         hkRyW5sHWhjJA6GKN+3a8Wilu33WYvSVRKPN/4X03v9pkHG76r+tnhN84Y+mmkt40HFH
         7img==
X-Gm-Message-State: AOAM530g+Lvf3SJp2pDuewWchsQ3Ulu01xZcQqoiuu6DzGzH3ITGvkEx
        gDg5mV1K0zwMFicMLeYUaw==
X-Google-Smtp-Source: ABdhPJwaiE8fmgxpMQQEBciL5K8p5iQ8xiqGGXd6hGBCxeHLwMaWXbMhlFINjBhkFbCqUr/cK+TmNg==
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr5725027ots.358.1632244999097;
        Tue, 21 Sep 2021 10:23:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q8sm2336054ood.4.2021.09.21.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:23:17 -0700 (PDT)
Received: (nullmailer pid 2989055 invoked by uid 1000);
        Tue, 21 Sep 2021 17:23:16 -0000
Date:   Tue, 21 Sep 2021 12:23:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb/qcom,dwc3: add ipq4019 compatible
Message-ID: <YUoVBCicBEmRYerL@robh.at.kernel.org>
References: <20210908193329.87992-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908193329.87992-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 Sep 2021 21:33:28 +0200, David Heidelberg wrote:
> Prequisite for getting rid of another warnings when building ipq4019.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
