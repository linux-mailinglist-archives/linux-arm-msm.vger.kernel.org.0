Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE07B3FCE18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 22:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhHaUET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 16:04:19 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39470 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhHaUET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 16:04:19 -0400
Received: by mail-oi1-f177.google.com with SMTP id v2so703714oie.6;
        Tue, 31 Aug 2021 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z6oB7aiXbBqT5wZRehYWpSadkfaaC2Ve45YF7MxbMs4=;
        b=Vmwqqjtn3sS8j2139rmq3naOyMvY/5crtquyCnUlhpiHkbNBtjXt/miA7eWcgMi6lI
         PV4Jxq/iT3Yg4LQRj9BIbZpupoBjjnBrUhwRpszRuDstZRI2hwlpHECH3jIaLP13ryk8
         yCpbyAPXlG3eYfksxJURd9XA5Ig30klwasP8qvOoDr2A8oVLJSdzJ/g3TD8N+gt5dtXb
         Tpw5Hx/h83tzLytCHkrgmbgp4m2OR1GHfYuW+BGb5h63WftxW25V0DC61pcfyBy5A/Mu
         dET4RahHtrHGB8wMfdfpOcNXQSrRCUy19V8Zu6nRnj+JD3S2zi+K8J1k0T4A86mqKycg
         PC9g==
X-Gm-Message-State: AOAM531AjPEXnfobJJow5OHUrffbGJoadrUJc9foDAMQD2AwAOQKVWPm
        Ahe0omF1L1KC5TJxC9h6ABuJnHo+FQ==
X-Google-Smtp-Source: ABdhPJwAR8oaaSOYqHRZG+RINvPJyg/Is00turyC+4wRpJl4UOH+mCLhp/POIhYaT6UzCX/p6ILPYw==
X-Received: by 2002:a05:6808:bc2:: with SMTP id o2mr4645099oik.73.1630440202961;
        Tue, 31 Aug 2021 13:03:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 186sm3872719ood.39.2021.08.31.13.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:03:21 -0700 (PDT)
Received: (nullmailer pid 564842 invoked by uid 1000);
        Tue, 31 Aug 2021 20:03:20 -0000
Date:   Tue, 31 Aug 2021 15:03:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Kathiravan T <kathirav@codeaurora.org>,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add compatible for
 MSM8953 SoC
Message-ID: <YS6LCLWYWk+xha2/@robh.at.kernel.org>
References: <20210825165251.18358-1-sireeshkodali1@gmail.com>
 <20210825165943.19415-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825165943.19415-1-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Aug 2021 22:29:42 +0530, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Document compatible for MSM8953 SoC.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
