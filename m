Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC66121A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 20:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfLPTfV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 14:35:21 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35390 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfLPTfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 14:35:21 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so2315123plt.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 11:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=zyf5oqIBC4otO0TD/aAKD2B0cXiPBUfjLdMtf1EP18U=;
        b=fD2NoFnjxGFSTYc9JB2rdjm5W2cJCsvuN331lqeALXlrVqI9Kab6FoixmzhZsPnV4F
         0oLidyk97L8Y/gBuyeKt4h+/IdJbFP1Z8xAC8SFHRZsBViH+ShyzlVyS2hwIf/7YWFNM
         qIh1bQRzBxFIMFaEHGZcuHBFxjH4BjGrBSqTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=zyf5oqIBC4otO0TD/aAKD2B0cXiPBUfjLdMtf1EP18U=;
        b=mNInCOGkMHe8uwzrpErJf47DKWMuEnFbyzMkRSHTpgko9Tofs11fCSNFFCY/iLt3aj
         swpbq1N86cnd0WLNjO+wtVane/Jl0ggmSVNmwVhY4RRkJnlP4PpRHeDgIiYbNtXogJfa
         KmehZL+Ux6rL8ltTiYc+lzSvC5Yxwc3vdi44VbVAAXflkd216KJ29hYLFYpmyuOYtRWJ
         hQP+ZhHZO/3kNLEK5cosKPOJE27WK2iftBw6HAk3PRGHlnCVD8G5JLi3FpwGVDK1N+He
         cFL/eR1vTQEq8t7ydw3Wlwysn79SJ36UxgCmngTMhXo6tV82XwNQn8O3pIw4HT9fzqr/
         JV9g==
X-Gm-Message-State: APjAAAXogqnLz5PoJWbtopaHKqvEMLm6addDLYDpZeablQjUEBAu0vsY
        93iWwPMOfIY+PNfNr2WwEVaiYQ==
X-Google-Smtp-Source: APXvYqyviP4AYpq091Bvfn20j4LGQVIn39RgQpNuNLHQhQ9Q2u7Np+YFHk/5q8zyKt58XN+P7TaNAQ==
X-Received: by 2002:a17:902:7c13:: with SMTP id x19mr18277088pll.236.1576524920196;
        Mon, 16 Dec 2019 11:35:20 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i4sm260898pjw.28.2019.12.16.11.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 11:35:19 -0800 (PST)
Message-ID: <5df7dc77.1c69fb81.9e37f.16a5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191216115531.17573-2-sibis@codeaurora.org>
References: <20191216115531.17573-1-sibis@codeaurora.org> <20191216115531.17573-2-sibis@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Convert rpmpd bindings to yaml
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 11:35:18 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-12-16 03:55:30)
> Convert RPM/RPMH power-domain bindings to yaml.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One nitpick below!

> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> new file mode 100644
> index 0000000000000..4aebf024e4427
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/qcom,rpmpd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm RPM/RPMh Power domains
> +
> +maintainers:
> +  - Rajendra Nayak <rnayak@codeaurora.org>
> +
> +description:
> +  For RPM/RPMh Power domains, we communicate a performance state to RPM/=
RPMh
> +  which then translates it into a corresponding voltage on a rail

Add a full-stop here to make it a true sentence?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8976-rpmpd
> +      - qcom,msm8996-rpmpd
> +      - qcom,msm8998-rpmpd
> +      - qcom,qcs404-rpmpd
> +      - qcom,sc7180-rpmhpd
> +      - qcom,sdm845-rpmhpd
> +      - qcom,sm8150-rpmhpd
> +
