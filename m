Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF62407331
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 00:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhIJWFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 18:05:39 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:44857 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhIJWFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 18:05:38 -0400
Received: by mail-ot1-f51.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so4190370otg.11;
        Fri, 10 Sep 2021 15:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkHTS49iipztUh1vQR77+AagPqEuPWOB0Lr1u4zmbh0=;
        b=EI8pjmYlNqpf6rLlSiSuXMzwi/Z8b/KognvmHxxlmQUF1EGIzE8fAoFe3Thfc7k0h4
         B52jCHA8vKr3XD2k3lYGnX2dFhkxtKUIkoR7NzYtALT0thAG8cX25ctNYrX3/axjZI90
         5iqkJ5wPHETBG+rj9kIcEmbTAX5G1F3sNFP8tarIjj8Zm2GEJBvOf1clcylvQH+6+ocE
         IkKF3IQ+HEzlXsZDI5tMKWetLyr6KOQ2sZa2XzcVIFLg0Pq7i7uw6FId8nXaNz5zMRl7
         cKu1SOynTeX9tOE6+91uYCcpdPGwE4stTTw4vDx5MQQRVv6mD2uydKL+QW0NVbFIR2+A
         JlXw==
X-Gm-Message-State: AOAM531xsJ3hcz62zL5VZnZe7uAZvedpqAUyTBxKtpQNADb9kEvgd4kg
        h25WQFULIG3acABWuEAkHg==
X-Google-Smtp-Source: ABdhPJxk4HXxAM91kIV80yySCehMGaFW3CDFDV5aHTPieFKbrgctcWAya/bmgIqALeen03UUougSGA==
X-Received: by 2002:a9d:6046:: with SMTP id v6mr6627489otj.234.1631311466616;
        Fri, 10 Sep 2021 15:04:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v19sm1557901oic.31.2021.09.10.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 15:04:26 -0700 (PDT)
Received: (nullmailer pid 3456962 invoked by uid 1000);
        Fri, 10 Sep 2021 22:04:25 -0000
Date:   Fri, 10 Sep 2021 17:04:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] [v2] dt-bindings: arm/msm/qcom,idle-state convert to
 YAML
Message-ID: <YTvWaRCswQs9Mt6L@robh.at.kernel.org>
References: <20210908171453.53259-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908171453.53259-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 08, 2021 at 07:14:53PM +0200, David Heidelberg wrote:
> Switched maintainer from Lina to Bjorn.
> 
> Doesn't fix:
> ```
> idle-states: 'spc' does not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
> ```
> from colliding arm/idle-states.yaml .

Your options are:

- Drop this and add your node names and compatible strings to 
idle-states.yaml. A variation of this is change the QCom node names 
in dts files to match. Those look like the only real differences.

- Extract the common idle state node properties to a common schema to 
reference from both schemas.

I'd lean towards option 1 unless there are other variations of 
idle-state nodes that also need option 2.

Rob
