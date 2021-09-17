Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401D9410005
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 21:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344871AbhIQTvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 15:51:47 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:37430 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344136AbhIQTuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 15:50:23 -0400
Received: by mail-oi1-f181.google.com with SMTP id w206so3843246oiw.4;
        Fri, 17 Sep 2021 12:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xGHfkBmCX+cabCgwJzE1GoXOM5ZjXhTPooMilPDxY1w=;
        b=7Np92BGvswGj53AZ5Q/w9Ccc0NsVYc8UVGw2FVALI/RTopqoqWks1rMtIeXsXekSZz
         CNpxNDbkChXBMBnrQan6CYGTKeABJ1qkVc/agkWYTovTj609edmxHeEfVpID4y5gfJ8N
         kN5+JVftLomDp7J25dzOLoIoKwGm06slO5V+QF4FqoieK7Gym0AzyzttghtaB1XmHv6F
         Vp54Ec85zzhnHOGQth0DN9GyM0VQyhbm0L7zbqzFHbsvx98h+Hky0DroHqx5/Orx4kfy
         XlYh8EPSfpwqGq3rgwaLhJoVJK3p7NCQiaFKSakqO+XPOoLM+SUIwWvek/U8JRuQDEeH
         x6gg==
X-Gm-Message-State: AOAM532qX+Ss3vuk1E2PxywuwtzQp8wJjiwam1GczkJ7uhdejLs/D7zJ
        BbsHDYZSDdZZpvLWV9LWBw==
X-Google-Smtp-Source: ABdhPJzPJyTqmjummysD6C+96af6/zW94Nv+tzIzWHch8LJF7YF+5KdlPoAJJ/d9ysm6jTrt2IgKBg==
X-Received: by 2002:a05:6808:13c8:: with SMTP id d8mr5244808oiw.104.1631908140581;
        Fri, 17 Sep 2021 12:49:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t6sm701841ots.55.2021.09.17.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 12:48:59 -0700 (PDT)
Received: (nullmailer pid 2025329 invoked by uid 1000);
        Fri, 17 Sep 2021 19:48:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     msavaliy@qti.qualcomm.com, dianders@chromium.org,
        skakit@codeaurora.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        mka@chromium.org, Rob Herring <robh+dt@kernel.org>,
        rnayak@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <1631872087-24416-2-git-send-email-rajpat@codeaurora.org>
References: <1631872087-24416-1-git-send-email-rajpat@codeaurora.org> <1631872087-24416-2-git-send-email-rajpat@codeaurora.org>
Subject: Re: [PATCH V8 1/8] dt-bindings: spi: Add sc7280 support
Date:   Fri, 17 Sep 2021 14:48:54 -0500
Message-Id: <1631908134.308709.2025327.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 15:18:00 +0530, Rajesh Patil wrote:
> Add compatible for sc7280 SoC.
> 
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
> Changes in V8:
>  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
> 
>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1529304

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

