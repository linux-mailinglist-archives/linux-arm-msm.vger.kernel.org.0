Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19F6449C59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 20:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237179AbhKHT1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 14:27:08 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:45771 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbhKHT1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 14:27:07 -0500
Received: by mail-oi1-f169.google.com with SMTP id u2so29234357oiu.12;
        Mon, 08 Nov 2021 11:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FM8llzobihkoUvOXHFQ+hNZP7IbHJCuot18xvdjx4Uw=;
        b=q1ROFL8Bi0wwliuSt2Rnb0vDmsrmLBT2tFHtRqZbQGixf34JuQc6xKCXVcgbE6Wb4l
         hEHG0KuWsWpca5OjBJI4Hs6sHf5wEYP4tKGvM0fgrtJntONjS84e7axHY6qqdBSdUtTk
         bAovG9bsMgTSCaQ9Mt4wC4MDCnDGFU0Fm11VRvpGjBXOkPSBuhHT572Nwd5tHCnLuZOa
         mGd1nAW/jJUDJZX68s02s4gJLwTGXs0/KLiZGDYhnc2yo629pvTMKTG7PnSPIj6/u2S8
         mCLHj8Rgc+m9YM+7kK5Yo/nJGSJScaYucR83sgF+d/cXoZnbg181zyDY0xcEA520yfiS
         EjBQ==
X-Gm-Message-State: AOAM530AQo5p13SitvFf2e0ofkdt0sE87hA6mjUvLO45G7k01h2M3K4Q
        503HxMmTGFSGaxSL13nDPw==
X-Google-Smtp-Source: ABdhPJwLcVMvMA46V9aGpbnxBj9mUGc+Iq2bgyEPo6tq8LWI3pWH7Z3VJA6ldrFp/+Ga0Ti+MB2jmQ==
X-Received: by 2002:aca:e083:: with SMTP id x125mr620983oig.106.1636399462691;
        Mon, 08 Nov 2021 11:24:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j10sm1389435ooq.5.2021.11.08.11.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 11:24:22 -0800 (PST)
Received: (nullmailer pid 4063603 invoked by uid 1000);
        Mon, 08 Nov 2021 19:24:21 -0000
Date:   Mon, 8 Nov 2021 13:24:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     ~okias/devicetree@lists.sr.ht,
        Manu Gautam <mgautam@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,dwc3: add binding for IPQ4019
 and IPQ8064
Message-ID: <YYl5ZZBkBUxe5TCN@robh.at.kernel.org>
References: <20211029103340.26828-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029103340.26828-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Oct 2021 12:33:38 +0200, David Heidelberg wrote:
> Add compatible string for Qualcomm IPQ4019 and IPQ8064 SoC.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
