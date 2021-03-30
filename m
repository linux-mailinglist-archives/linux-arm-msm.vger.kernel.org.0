Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF50734DF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC3DtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhC3Dsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:48:39 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DFDC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:48:39 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso14320816oti.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZaWpeqY25MeDhtAts3m3c7ZDqv8GKc5eM14JLBJ3UhM=;
        b=aria6U2aOK6GNQcIMqfIxcq4rDTxMTjlMu8p5Gj0XcnZDv6UluWjUciozLsMrU6ilw
         U0HikIaK3NQMBUMW2/fCPa22dSCeaj/KcZcvtJrrzr/wzbj/KLS6Y+EFEXuOgX4YdmRA
         W/B9dGHzbRfo+bIYqx7XluDewImcQRnP44+uPb/sUcYm1+yhiLzRlS1a/SP/xFzBVgMV
         OtWLSXViZyg6VOX4f2rxhInfbe8ohYLkH0W2NjJVcveY85UaUbf+Bp7ZaBvFpPRRD6DM
         JwZFPCWY2XNXrET4EUcAt/5+faX6oJDyHe65d/wNbwkkGLuszr1ZRFVf0McjW3NSQpUu
         jVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZaWpeqY25MeDhtAts3m3c7ZDqv8GKc5eM14JLBJ3UhM=;
        b=YWxCMuQXbTjjQ2jSBZ/xAUDLyjap1TzzuTAZy6bsPPsmQTbZ9TXBFwmGr6u20pRJdB
         UNH77lj0BEQINP5hK19eXd1frhskZ97JHXdQvB9tMRzv9uviuvoviKRk0mpZyIeqqIX0
         aQ8RPMfW0uOtVKoAkg12oMgqYPw9dq+NeCjJSTBvxg73AvIIJg4XNnbpQegp/xyqTnbq
         aqvLtM4VMJrSww98+n9D4qioeGJOepDMMnnX0t03Zyot41Ah9qPMaKi2BOcofnHKisup
         zgi4gEiUCAVUtz0Xmh3rkSWixaTu/wZl57ybC9pIUJJwDoQzzqniiaCcjzOCm7dCcUbo
         SnzA==
X-Gm-Message-State: AOAM5320TBYaN7eraqn+8rdXAIDh5D9enRtYgGB7ku3IKJHDTAiP4C/j
        lU/45MnLaUi5Jqhhp6+nJ1OR9g==
X-Google-Smtp-Source: ABdhPJxSE5litT1P7lJr0s8y9tEBHQh2kQ64l0iMcjvplDaeF9Eb9bMTzeSINA+qu1qZDc4bknkFkg==
X-Received: by 2002:a9d:6e09:: with SMTP id e9mr25522900otr.195.1617076118577;
        Mon, 29 Mar 2021 20:48:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w10sm4791878oth.7.2021.03.29.20.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:48:37 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:48:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>, daniel.lezcano@linaro.org
Cc:     agross@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: qcom-tsens: Add compatible
 for sm8350
Message-ID: <YGKflK/Ey16UDYT7@builder.lan>
References: <20210324124308.1265626-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324124308.1265626-1-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 24 Mar 07:43 CDT 2021, Robert Foss wrote:

> Add tsens bindings for sm8350.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Daniel, I presume it's better that you take this patch (1/2) through
your tree. I've picked patch 2.

Regards,
Bjorn

> ---
> 
> Changes since v1:
>  - Vinod: Remove comment
> 
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 95462e071ab4..e788378eff8d 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -43,6 +43,7 @@ properties:
>                - qcom,sdm845-tsens
>                - qcom,sm8150-tsens
>                - qcom,sm8250-tsens
> +              - qcom,sm8350-tsens
>            - const: qcom,tsens-v2
>  
>    reg:
> -- 
> 2.31.0.30.g398dba342d.dirty
> 
