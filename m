Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6A132F571
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 22:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCEVpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 16:45:45 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:33914 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCEVpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 16:45:14 -0500
Received: by mail-oi1-f174.google.com with SMTP id x78so4145521oix.1;
        Fri, 05 Mar 2021 13:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yALU4xXZdf5UdXf3b9EgrSU2qSobCBik+Dcr+B7Cyjk=;
        b=ir1pX4fwZVI9kxrlSyawBmDjDmccZSAvBfCyO/RMIqN69lYU2mhbp1Opbs8YhVJZvS
         sZXv+I6+eECo4vB+HPxnAknr7BsUyYlj7w2kJ+uh/zDVEUCrQZyy8Jw2rXuiugTyHQh1
         BVJxL9Ic36ire08areJZIauNqiRc9/XI7MTWs573D14BTgCSMxLmeRmysJECVFomNs2J
         Z18jxd3+tDeyH6va/1dDd5eZR9CMP+TgOISJoQ6NWUWdhT2Vke67OJ8TmaVydrqHGGN0
         xT1QrSS1z8ZrrSStKLcj+jdy4pzdeYJmBgYdcYWdhbBYkoaJsVAKGWC+OAG41KuHBqar
         0bmg==
X-Gm-Message-State: AOAM531w0MXaAYiUKxydZnbcFwAINc4PXA78FdZuhQ5z5ysSTYiKnAWr
        IqxPXN77zM/xiLPuLSF1Z2cNGi6AGg==
X-Google-Smtp-Source: ABdhPJysYXHIk9eAC9NbCb/g6YwalK7R0/TAtIWVHQDZ8jqNtshjFlkItp8ZtjNkQ1tAkqSgxf7swA==
X-Received: by 2002:a05:6808:10cd:: with SMTP id s13mr8547967ois.117.1614980714097;
        Fri, 05 Mar 2021 13:45:14 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g14sm797304oon.23.2021.03.05.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:45:13 -0800 (PST)
Received: (nullmailer pid 699774 invoked by uid 1000);
        Fri, 05 Mar 2021 21:45:12 -0000
Date:   Fri, 5 Mar 2021 15:45:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        stanimir.varbanov@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: media: venus: Add sm8250 dt schema
Message-ID: <20210305214512.GA699723@robh.at.kernel.org>
References: <20210215160254.1572615-1-bryan.odonoghue@linaro.org>
 <20210215160254.1572615-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215160254.1572615-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Feb 2021 16:02:54 +0000, Bryan O'Donoghue wrote:
> Add a schema description for the venus video encoder/decoder on the sm8250.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sm8250-venus.yaml     | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
