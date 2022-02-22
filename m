Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473D44C0414
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 22:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbiBVVuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 16:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiBVVuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 16:50:04 -0500
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B5E41FB0;
        Tue, 22 Feb 2022 13:49:38 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id x6-20020a4a4106000000b003193022319cso19613428ooa.4;
        Tue, 22 Feb 2022 13:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ebwfl2eVC7RMG7TrRM62AKX6vi1kQ80HjW8V9xOBqJU=;
        b=Ypy9FnlWRpeVYg0dWWGRyBK7DT4M4xe4LP4wUO8dXiyHPJvkD853gczRAm8kAbDMIh
         k6H7h2Gjz00IKIkFptm6Hdluu1llNd3ce1kIp+6dja7cJjMS0GjFFKoxmtODCAU1n+hu
         ycjv+rxzs6Vz5fKbpPmyPsTxg2K34lVIJsK2cxPQI0R1mLoECwSncMwkFQF/JxIBc7Ky
         uAR6UabT+174X0IKZc1ZB9D3YIbwDkrBz1iuliijRphHI8g/h4u6jMVQg6jQxQQHK9uJ
         BlSNA6jvtPbQkP/9Gswh1QTSq4C6sc/zwHlJOBpqTou10dueZQsFDyc++JcWrRyP9gKv
         /NeQ==
X-Gm-Message-State: AOAM5323f1lsfjmuuyKZNGI9kpO0slsx6KggvYazrhsz9isbmUvZcDb7
        00gsMBgkHYwzCWR285/XhA==
X-Google-Smtp-Source: ABdhPJxB8cT0SXmsf75AE57wSFwspy0iLoY6gC+c1PVenxqa73yKtWDGjBo+zNh2nmJog+nWTPzFhg==
X-Received: by 2002:a05:6870:961a:b0:d2:858c:ea4 with SMTP id d26-20020a056870961a00b000d2858c0ea4mr2609588oaq.186.1645566577595;
        Tue, 22 Feb 2022 13:49:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id er36sm3094947oab.9.2022.02.22.13.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 13:49:36 -0800 (PST)
Received: (nullmailer pid 3648870 invoked by uid 1000);
        Tue, 22 Feb 2022 21:49:36 -0000
Date:   Tue, 22 Feb 2022 15:49:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     robdclark@gmail.com, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v3 2/2] dt-bindings: msm: disp: add yaml schemas for
 QCM2290 DPU bindings
Message-ID: <YhVacAAFoPxC8S4q@robh.at.kernel.org>
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
 <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Feb 2022 16:29:07 +0100, Loic Poulain wrote:
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
>  v3: no change (resent with reviewed-by + freedreno list)
> 
>  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
