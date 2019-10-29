Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96439E8CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390347AbfJ2Qmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:42:51 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44665 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390363AbfJ2Qmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:42:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id q16so7655675pll.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=p5JENRi61p6FfIKLToCEWBnTnw72ln8j+S6FSdAy8fk=;
        b=J0+nxacpl6SmKgNn1IsGF0PdMApgkS2BdZFpnIiAWq+gfqIYAi47n/cZ6GR8EpgYrF
         XvJ+I7JP/c0xMTnlUh7c5nkFvpSXkhL+ovXsR8WngY8PHrofQWRe46lItk/fbSGL/uqP
         tZHoA83mEwyXauv+RY7762k20LhlasI9t4yow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=p5JENRi61p6FfIKLToCEWBnTnw72ln8j+S6FSdAy8fk=;
        b=VDp7op2qyOtRw4d0KkHBC73pLkaEx9IBDz5EVCfsCz1xftA4YGtyIHqi/lw/2WISKP
         DghaZPWWcaYtYjuv6Kv/9J4YvyPJOfkrteE1fPYeDBeGDRbLuRpn1acbuyyLs0qVZjYz
         6oG+8oQCAVa0YNUidknA/Rk+HCOC44dFnn7y8OfJqlJYz+C7GN/GfSeadmFbr90oz0bO
         rzC4nqBv9T44c5RZ+9sQgHxxim8lckldAPzVfZqgxHZJW75n508eXY5KjNkF6MYlxmIA
         yOf0hBsgOONUl9HN+F+mjRceBl6Kk6xU0czYMejq6vvYxTe1jM0cebutIL2WSnA23OJB
         1ysA==
X-Gm-Message-State: APjAAAWRh8cIgKTYTSNBWWGZKmx5HfYyDUAblu/D49yq9TkNHcQN7Xq9
        bqoN05EyGppQkwjIugbyAiuXTQ==
X-Google-Smtp-Source: APXvYqzkCLD5iZZUvrSjFxekz3qpSbYQw3UVBjzRar26W9EodRAAr/ewVcoqj20yXUk1E9l1xrS2lA==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr5295755plo.88.1572367370834;
        Tue, 29 Oct 2019 09:42:50 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 65sm13037391pfv.50.2019.10.29.09.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:42:49 -0700 (PDT)
Message-ID: <5db86c09.1c69fb81.3981b.b748@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191023090219.15603-4-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-4-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 03/11] dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
User-Agent: alot/0.8.1
Date:   Tue, 29 Oct 2019 09:42:49 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-10-23 02:02:11)
> Add the soc specific compatible for sc7180 smmu-500
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Docum=
entation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3ba7567..347869807cf2 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -30,6 +30,7 @@ conditions.
>                    Qcom SoCs implementing "arm,mmu-500" must also include,
>                    as below, SoC-specific compatibles:
>                    "qcom,sdm845-smmu-500", "arm,mmu-500"
> +                  "qcom,sc7180-smmu-500", "arm,mmu-500"

Please sort.

