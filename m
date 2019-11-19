Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE73102BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 19:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbfKSSu4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 13:50:56 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40438 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfKSSuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 13:50:55 -0500
Received: by mail-pg1-f194.google.com with SMTP id e17so4430555pgd.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=h3SuHWJ4z/KaTwFaWseZogIbcFeN0SoE6l1nIp4DGz8=;
        b=Ybxac2plgQ4VLa1bcLRooTRMs4gS/2rpYOUfte7cqw4WfXcLVlygbrLWZE4szcMrRY
         nupnHxN5/sf0hkxBdlRUnm7kMWfZnSSjmYkAX11/J2erMxPewefLZ4a+xxPAhK0yjLrf
         1UleWcAFqV2b5RCbgbIKLsa0g0OljDOJqjeQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=h3SuHWJ4z/KaTwFaWseZogIbcFeN0SoE6l1nIp4DGz8=;
        b=hcsOTT1ZQ4TCwXK+i7Vgknmuo6MPe50/QUtUlBFX6wVzo/idh/s9BSPIXW4yezB1Ez
         RFi0sqZ2hg7AiEX/a3A0/UB4a7Au3fYfR0r9RlZ2DO4/PXUzH6sz2w9U63y+1cD18+LF
         xBE6fkzouUy8kGQNT1OvNf2ZuSksAtYtoQo3XHgbk7zGqaUFr4KpG6Aim6yg7JUCrwVC
         PkcJxtEiivyWh9p1MgPx0enBCLOvxViMQrM7R1H82abUgQr8XrMjf/YmN61nS8GpuIDw
         gh1EfCrgVlYE3GHfVH60Z9I+z/UadonLYZ/J6pDMBwG4NtWCk5+zl9DtC/iTossXYUTW
         bS8w==
X-Gm-Message-State: APjAAAX7tv/1GOQJOkFUJYeeUQoCmyej1Imd2Jc563weqPmBo/duDky0
        B8LI6udeKs1sU0QushbQuW/Nhg==
X-Google-Smtp-Source: APXvYqyt4fFZBx9WmiKhI9FW3nECOBxo8vbsKkGfI9j6QIB1BmtDWvG7MajWu0meAk9l8J/+5x+1+A==
X-Received: by 2002:a63:4519:: with SMTP id s25mr7199212pga.240.1574189455042;
        Tue, 19 Nov 2019 10:50:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b18sm15722571pgh.60.2019.11.19.10.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:50:54 -0800 (PST)
Message-ID: <5dd4398e.1c69fb81.fb48b.b3bd@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99aa17-22b1062e-9922-40e4-ae7e-8b91210bb12c-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99aa17-22b1062e-9922-40e4-ae7e-8b91210bb12c-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 2/6] dt-bindings: power: Add rpmh power-domain bindings for SM8150
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:50:53 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:07)
> Add RPMH power-domain bindings for the SM8150 family of SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  .../devicetree/bindings/power/qcom,rpmpd.txt       |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h             | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Doc=
umentation/devicetree/bindings/power/qcom,rpmpd.txt
> index bc75bf49cdaea..f3bbaa4aef297 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -10,6 +10,7 @@ Required Properties:
>         * qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of =
SoC
>         * qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
>         * qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of =
SoC
> +       * qcom,sm8150-rpmhpd: RPMh Power domain for the sm8150 family of =
SoC

Can you convert this binding to YAML? Would help us validate DTS files
in the future.

>   - #power-domain-cells: number of cells in Power domain specifier
>         must be 1.
>   - operating-points-v2: Phandle to the OPP table for the Power domain.
