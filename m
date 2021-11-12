Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB61D44ECB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 19:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhKLSom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 13:44:42 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46874 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhKLSol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 13:44:41 -0500
Received: by mail-ot1-f42.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so15130870otk.13;
        Fri, 12 Nov 2021 10:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3F6SXyCRloo6OxzqpTDhbl6+ixpSYz8dOk7hS7Qeel4=;
        b=BTcMtGG6hfRU6e/sKHeKyoFcyloBN1pX9GUkf5hBQVOOornMYHnCgdFPTf+RypeDkN
         Cr/ZPc7PJLe9uYz6lunKIoTEMhuKL9JQ3kaW4iNULfm0JRdqIgk4XhwRbIRwir3wSEsA
         Nh/zwG6PtMMyiq5xk5yTFHXJuhDKabkKlilQJuYE/LZg/x0RWujiNV+rkbIRkEgU9Xwt
         lZcwuJ8G6lgHM/FB7jYadEiKOjUDweDOlDHMmLk5jTTf3BnlV8vBRjL+nvQSx8VE2u53
         GsEcY6asgWkxV4jWx07Au4OgAFLF5u3ldgv5qqPCycoA5/IcOJVldC7eyo+iQ/UXJbQ3
         jXbA==
X-Gm-Message-State: AOAM530SMT+lHluDzpNvbs9r9qsk7AImumcu2b6X8GTuIrW2R8qdAEE5
        vCXB5XCs13Zzt8UYC7DO9w==
X-Google-Smtp-Source: ABdhPJw75gjI+E4zA/pVjXbcvX2zd05O550b6n8lPTGsr9hoDtKkez0Zs0yIGc7cYGNqd71AwC1GOw==
X-Received: by 2002:a9d:61c1:: with SMTP id h1mr14213770otk.27.1636742510182;
        Fri, 12 Nov 2021 10:41:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k14sm1344702otb.50.2021.11.12.10.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 10:41:49 -0800 (PST)
Received: (nullmailer pid 3151790 invoked by uid 1000);
        Fri, 12 Nov 2021 18:41:48 -0000
Date:   Fri, 12 Nov 2021 12:41:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, sibis@codeaurora.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, swboyd@chromium.org, kuabhs@chromium.org,
        p.zabel@pengutronix.de, mpubbise@codeaurora.org, ohad@wizery.com
Subject: Re: [PATCH v8 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
Message-ID: <YY61bMGLiW+ITQHy@robh.at.kernel.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org>
 <1635860673-12146-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635860673-12146-2-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Nov 2021 19:14:31 +0530, Rakesh Pillai wrote:
> Convert Qualcomm ADSP/CDSP Remoteproc devicetree
> binding to YAML.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 ------------------
>  .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  | 161 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  | 160 ++++++++++++++++++++
>  3 files changed, 321 insertions(+), 140 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
