Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62684416928
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 03:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243705AbhIXBCT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 21:02:19 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:41920 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243678AbhIXBCS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 21:02:18 -0400
Received: by mail-ot1-f52.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso10999451ota.8;
        Thu, 23 Sep 2021 18:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1TJzWuj8+bzZyndMFx8jWebrZeVJyh9b45P01OYgrS0=;
        b=a6oyX5d0Hnn3N8vk5AFBGXZQd8V/H+zY7v/zjLTGoMHqDOFAtqA9r/WglvrYx+AUnl
         3RArUfTPtRq861De5YO1zxZWf59wAVAd0JZWGmG68ZtZ0WWC+TdPBxVjs1fVwd2UjHMV
         CsBzcB2GJsInKG5zMt8fG1x4srOsrIDxGVUFu9qD9Ngmc+0n8Qfh2akQyVezVRPKwjTs
         +Wa6r9okNZ3otoR1O+AyJh/krimZZbWRWvBePjrLtstPDFEIxHBOmpC/XA3HZm2ZUaTX
         41UlP6JJiCvif2meSbd6OgB8sygaSEhfWdPdonEGoHsKK/IRHN9or/+Hg2ITODewxpSu
         pYlA==
X-Gm-Message-State: AOAM5309/AK8ns8k+qN3ldBwFoXfGcUguV1v/gF9xor+bFU528SToV2I
        FTDH3fo0pzHSPatv77woQw==
X-Google-Smtp-Source: ABdhPJy6eZWrOh3pu2S52LgzkkluFsXiIOwPaK+twomhoKwxx8iDuMQGB6Skfx8n3hZ7uN4MzzzDMw==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr1429613otv.67.1632445245965;
        Thu, 23 Sep 2021 18:00:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l28sm1739449oof.30.2021.09.23.18.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 18:00:45 -0700 (PDT)
Received: (nullmailer pid 3849035 invoked by uid 1000);
        Fri, 24 Sep 2021 01:00:44 -0000
Date:   Thu, 23 Sep 2021 20:00:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     devicetree@vger.kernel.org, rnayak@codeaurora.org,
        skakit@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        mka@chromium.org, saiprakash.ranjan@codeaurora.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, msavaliy@qti.qualcomm.com, dianders@chromium.org
Subject: Re: [PATCH V10 1/8] dt-bindings: spi: Add sc7280 support
Message-ID: <YU0jPOsvzUbEPShy@robh.at.kernel.org>
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
 <1632399378-12229-2-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632399378-12229-2-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Sep 2021 17:46:11 +0530, Rajesh Patil wrote:
> Add compatible for sc7280 SoC.
> 
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Change in V10:
>  - As per Stephen's comments,
>    sorted compatible names in alphabet order
> 
> Changes in V9:
>  - No changes
> 
> Changes in V8:
>  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
> 
>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
