Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0D747C7B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 20:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237573AbhLUTo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 14:44:29 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]:33448 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237568AbhLUTo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 14:44:29 -0500
Received: by mail-qk1-f172.google.com with SMTP id de30so171283qkb.0;
        Tue, 21 Dec 2021 11:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kT48lpqWCfL9rtQgTligwbkbp7zGx1u+c/Dnu7t+Ay0=;
        b=VBf8eccpVtNUFZTmLunPXdpGTzZi8ZMpqnZcSdCyQ3fHlhJP0A52mrsZuwjY61cSOd
         gMNih6J9TQZcEAspyub3ZrFzpM2wj2HqWcuYLoRzkhkrbBPGYFNmuL+AFstEZ65OP7nk
         Q8DcK0VMDgFr52NHZ8GWOCtk8O57KEGL2mVTXNn1K+FQ+v1f+TF3+ROXWnbWMcPE/asN
         AFVPpCYZaAaqc6IiNhFIw8v/x+H1YAg/7+9VNywtAaovRo7Wjr2m3i7UdkD+DRaWKSaN
         MnITUUDSHHC7atcakfLenmj/IDhM8gUyygJ2/qnHvkdNcSQ5a0tlvJVxTOP/pFOLvedx
         gWkw==
X-Gm-Message-State: AOAM530beFTKTPymlucGvyCg3Pc9Di9HyrKJrPwNM9XB8n1lMLfEQJaN
        ITTyLrepMc7pEWF0mpJOk0ThrCu3ux7m
X-Google-Smtp-Source: ABdhPJxqdIaktpTd72O6NgXzM3WlR2PqU1zQB1jSqtKD9GX2qDQfpgS7BR6Qb/UirjN6Mbx0SblKPw==
X-Received: by 2002:a05:620a:21c2:: with SMTP id h2mr3180673qka.387.1640115868474;
        Tue, 21 Dec 2021 11:44:28 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id bq43sm14634996qkb.32.2021.12.21.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:44:27 -0800 (PST)
Received: (nullmailer pid 1629912 invoked by uid 1000);
        Tue, 21 Dec 2021 19:44:26 -0000
Date:   Tue, 21 Dec 2021 15:44:26 -0400
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org, agross@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC
 bindings
Message-ID: <YcIumqE45jFHCWtL@robh.at.kernel.org>
References: <1639763060-24524-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639763060-24524-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Dec 2021 18:44:19 +0100, Loic Poulain wrote:
> Add device tree bindings for display clock controller on QCM2290 SoCs.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  v2: no change
>  v3: Include dt-bindings header (qcom,dispcc-qcm2290.h) in that commit
>  v4: Dual license for qcom dt related binding/header
> 
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,dispcc-qcm2290.h    | 34 +++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-qcm2290.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
