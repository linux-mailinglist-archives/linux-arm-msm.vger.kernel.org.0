Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88124A5645
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiBAFUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233812AbiBAFUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:22 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C7EC061744
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:21 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id u13so15001539oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QnhScVOZkV0/ctbuGwhdncW3vy3gSDK4M3T2I35qHgA=;
        b=aCIOXWJSVBjtU7Lurs3V8N2PPPFx//hGtfHxgf8Zpiq79WLA8jDvBRhmCc32pbqm/7
         F7S/aakJdHw8pmm+l+mxI8jmbLlYBnQ8AvRF0J8flhnrOTQpL34lBV+8DkLUvZ7KYw6H
         QcAOZghsJ1HBYLg36X5cBSjLN3FzsGMkFpWovwvUckioZlrBOiuSkwLNxcMpUY/f8EBI
         HkdBEr/sk5tuld3GcjYcyiSO/qjOMxFiK8O8TEFjR2zsNkyDQNT8u+zbC5lgLBqPYHDH
         jU2CjhN7RvPHDBAMrmb0CbnBZVbAnFl2z4h96QmXbh4Cu2jyeQJEfDOlyOXWgIgNMfXc
         fILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QnhScVOZkV0/ctbuGwhdncW3vy3gSDK4M3T2I35qHgA=;
        b=YpeTQ6lQZH7pBtpBsSAes/EQCjgK05jd0LAEmeDBVNaNYHzYCARrncyX3dBR0QvkcQ
         R0huVDW8gt8sQVczde+lBSO9ZCmYya4s0C09W3GhSWstGcvC19hGv4sWiR/wsRDB0EGC
         G5R2gOHbeibZRXHEjnHjBNrT9op7X36BB4uTignDS44cr7s1Rc+IY32jSXk5gJBJM4uj
         nBaLhSC+qkz3EBk+gzCGeeBbR1pSMWqKEmEUz8eBHrDkgIX/lapXRfIGEsJ+g1CFD1vF
         VTjY8gsbG/b/4eF+O40/eQrc60vaOYlyh7Uv2BRCncig969c3JlpAW5UOQgKYoYkS20R
         kcnA==
X-Gm-Message-State: AOAM5308LLzeLIUt4VR+YDVhvoPPrMaEJpc2vAeXyD8+/wHTDJo7LJZs
        xGph8lH7uH1V24MR38Zr6KtV+A==
X-Google-Smtp-Source: ABdhPJxk4kBrVqXtPyqQc2UtVbv/r8jshZTOp5wiNiCyJV6oXJ7o2dPU1P8MUgANVbTQvrr718TZuQ==
X-Received: by 2002:aca:59d5:: with SMTP id n204mr208147oib.291.1643692821282;
        Mon, 31 Jan 2022 21:20:21 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:20 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm845: fix microphone bias properties and values
Date:   Mon, 31 Jan 2022 23:19:31 -0600
Message-Id: <164369277342.3095904.7551070239017566394.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213195105.114596-1-david@ixit.cz>
References: <20211213195105.114596-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Dec 2021 20:51:04 +0100, David Heidelberg wrote:
> replace millivolt with correct microvolt and adjust value to
> the minimal value allowed by documentation.
> 
> Found with `make qcom/sdm845-oneplus-fajita.dtb`.
> 
> Fixes:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias1-microvolt' is a required property
>         From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias2-microvolt' is a required property
>         From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias3-microvolt' is a required property
>         From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias4-microvolt' is a required property
>         From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias1-millivolt', 'qcom,micbias2-millivolt', 'qcom,micbias3-millivolt', 'qcom,micbias4-millivolt' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: fix microphone bias properties and values
      commit: 625c24460dbbc3b6c9a148c0a30f0830893fc909

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
