Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D783C2F23D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 01:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403770AbhALA0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 19:26:03 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:44415 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404137AbhAKXib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 18:38:31 -0500
Received: by mail-ot1-f44.google.com with SMTP id r9so553291otk.11;
        Mon, 11 Jan 2021 15:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9s5Q5x35iMmb8mRRkeqa901ka66QlLDIEbKbIA8D9iQ=;
        b=FLvOtbe5yX0OkeJ+Uv+kuKSgByrojEM18jEC5uKLMV+csmilOslrZMBfGAyY2d2ona
         YaC2gTxHXZfotWtOIhaMw23umw6Tmtb06NfAMGR1h2JDQ7+hnJ9Wsp7B2ykxnBjhX2pu
         k4/XFJ4PVM2bykrDNsShJUfV8VYFG+pqWWY5hgpv/MOQ6JNOBl+VuCMyThF+Vi0oBpeu
         UKr4TxxJOEBJ1Eoobo8qSoLfMn9zDA//E1yWoQ9LPl8dUWl3dTdZyi2uKYBAFYMigtWq
         AZOlrMu8pXGjou9ra6T48NWBc/pzRBLz+KpmnCxzGcYcyCJgY6KLof4r7gJxSgdz9jA0
         V9XQ==
X-Gm-Message-State: AOAM532gRjmj6ADxwMewjHmEvEJctMHDeqRWUjgdHGVHRxS7YfWTNACQ
        8HlGPtHNv8FPhPBeseoL9g==
X-Google-Smtp-Source: ABdhPJyQMGlXniemdA078EsVaBrrRNlRHILOkRlvB83XJYriNIGEICcAlXfBbgOLBk1iv0TFKYN0Vw==
X-Received: by 2002:a9d:e91:: with SMTP id 17mr976906otj.237.1610408270503;
        Mon, 11 Jan 2021 15:37:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n5sm295459oif.27.2021.01.11.15.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 15:37:49 -0800 (PST)
Received: (nullmailer pid 3267061 invoked by uid 1000);
        Mon, 11 Jan 2021 23:37:48 -0000
Date:   Mon, 11 Jan 2021 17:37:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add SM8350 GCC clock bindings
Message-ID: <20210111233748.GA3267006@robh.at.kernel.org>
References: <20210105154645.217998-1-vkoul@kernel.org>
 <20210105154645.217998-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105154645.217998-4-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 05 Jan 2021 21:16:44 +0530, Vinod Koul wrote:
> Add device tree bindings for global clock controller on SM8350 SoCs.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/clock/qcom,gcc-sm8350.yaml       |  96 +++++++
>  include/dt-bindings/clock/qcom,gcc-sm8350.h   | 261 ++++++++++++++++++
>  2 files changed, 357 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
