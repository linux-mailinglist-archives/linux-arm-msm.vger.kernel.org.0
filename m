Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558CB413D52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 00:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhIUWHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 18:07:54 -0400
Received: from mail-oo1-f53.google.com ([209.85.161.53]:33743 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbhIUWHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 18:07:54 -0400
Received: by mail-oo1-f53.google.com with SMTP id i26-20020a4ad09a000000b002a9d58c24f5so215114oor.0;
        Tue, 21 Sep 2021 15:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xHhRIIUIVe4BU6tEKxwGDGNrL6FdBJkZsrqzx4paFoE=;
        b=rru0OyINCKJAhDlf6olNTnZKG3ONdgsq2qxQ68Oodlkjtl6lCGwZPHz+JImY6QfOnk
         bbYnqVI5hf6gtvoPsk2Qrw5ewFfy2OKYu58pxfUqKKHT92QoWHZFOJQf6S97aMuDiRIo
         Cfyps2XVBFGE8V0cgmtnERkBKxkJi1bB58X9JOVOAjARcWMmVch5kd2JK5wRK0ODhdmm
         R2IRHn9rrTUjqo5qF4b5cDesv9HIKudlcNBo99dGaJ+jCHQ1vxM/Ot+GwfDgBEHr2R6G
         G0IGBBjP6LzR70ChPwk3P1jvTAoYOoq9nnSVgjab1blUl3ASafLjzzJRO+z+DMB2y+M2
         aumA==
X-Gm-Message-State: AOAM530Q3+tuV+YCjdKVa54yPmRzCYTT9hTP4nlQJRhdL5qkGflH0PBz
        +t2sTG0281uCSE7GO/PREg==
X-Google-Smtp-Source: ABdhPJz1OlHnb1z8d/iGF75Z//cODBXSLGoe9UgvjAteyP20z1WWFJn/YfB7tooGgBbiXfc0yc3Kfg==
X-Received: by 2002:a4a:d883:: with SMTP id b3mr10818052oov.82.1632261985086;
        Tue, 21 Sep 2021 15:06:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 21sm77039oix.1.2021.09.21.15.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 15:06:24 -0700 (PDT)
Received: (nullmailer pid 3382395 invoked by uid 1000);
        Tue, 21 Sep 2021 22:06:22 -0000
Date:   Tue, 21 Sep 2021 17:06:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     rjw@rjwysocki.net, sidgup@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        mka@chromium.org, swboyd@chromium.org, devicetree@vger.kernel.org,
        dianders@chromium.org, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-arm-msm@vger.kernel.org, ulf.hansson@linaro.org
Subject: Re: [PATCH v7 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 property
Message-ID: <YUpXXjpM4kwH0pTC@robh.at.kernel.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
 <1631800770-371-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631800770-371-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sep 2021 19:29:19 +0530, Sibi Sankar wrote:
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
> 
> Due to the current broken load state implementation, we can afford the
> binding breakage that ensues and the remoteproc functionality will remain
> the same when using newer kernels with older dtbs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> v7:
>  * Set "qcom,qmp" property to false for unsupported devices. [Rob]
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 54 ++++++++++------------
>  1 file changed, 24 insertions(+), 30 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
