Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F12D3E96CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 19:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhHKRZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 13:25:23 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:54058 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhHKRZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 13:25:23 -0400
Received: by mail-pj1-f47.google.com with SMTP id j1so4610956pjv.3;
        Wed, 11 Aug 2021 10:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=8ho/nE6n/CvAmoCklXP6y8CPrnF4FfT1XgorjJAH61w=;
        b=aTRIc2m4OUL7SEy/fAwhkTLMABkKxWCLTJbsepdja5dHIsWy6igxxzbqid3EjAJ0/N
         WLynskvZe3vx+wLp3zCCF9z2ZS5k57VFwOWbBn2N6MXdyKDJSUPNN04PHUvLaPct2BI2
         +Bw4Vs95h/E7YV5N42WIT/0TaJq99WDApcNZuAJbi5C+99Yo+X5yLkCZFus5S9rpML6Y
         hFEAxQSbPh4wddDecoLCQXcVO1EPKHbka3uJxH1kTqA9euYCukRJVagxuE7KziXTKYOI
         C8GLC6gSTQ11Tfbqa29GEBTEiRxcix1Ol7j/WkoEs1Stvr8AsL0KyhLnk2/x0fzAvqyy
         fh4A==
X-Gm-Message-State: AOAM5328dcUeUgV2Ijc/hXZMZrAGL2EuDGsw2VoIq+cyzcXJCJnF77Uq
        SngfbQgOyunlE1TWm3MmyQ==
X-Google-Smtp-Source: ABdhPJxol9tMfULKCUG5gFNIt8Xa+rpQZf/sGPBVP0QovLoMTnfOl9OIuDyD2UYQhq7GKQVWycOD/A==
X-Received: by 2002:a17:90a:dac4:: with SMTP id g4mr37684833pjx.233.1628702698792;
        Wed, 11 Aug 2021 10:24:58 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id k25sm62357pfa.213.2021.08.11.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 10:24:58 -0700 (PDT)
Received: (nullmailer pid 3975939 invoked by uid 1000);
        Wed, 11 Aug 2021 17:24:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     robh+dt@kernel.org, sibis@codeaurora.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mpubbise@codeaurora.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <1628618483-664-3-git-send-email-pillair@codeaurora.org>
References: <1628618483-664-1-git-send-email-pillair@codeaurora.org> <1628618483-664-3-git-send-email-pillair@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Wed, 11 Aug 2021 11:24:53 -0600
Message-Id: <1628702693.296189.3975938.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Aug 2021 23:31:22 +0530, Rakesh Pillai wrote:
> Add WPSS PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 79 ++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.example.dt.yaml: remoteproc@17300000: 'power-domain-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1515482

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

