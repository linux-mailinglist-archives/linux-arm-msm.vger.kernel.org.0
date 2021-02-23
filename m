Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2703322671
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhBWHiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhBWHiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:38:21 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7680EC061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:37:41 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id o6so1292315pjf.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=u2B3IIIwkE3tgEdHTrqZs1u7oe4Q82f/4lKWEp4CuHk=;
        b=YG/IfjbXpTPsLkY//1Oq66u1FSpP8z6m6pLikJX/OBt2hLZFSnbhCOwKPzH9kHYpWk
         8Lulk03729p0ljUjIArcVFp7KKXyYs5PDtqmigRavM4Lef5Gna0DHqRvpFys+SBZzHJh
         UnqdD9exrv2WshbPxk0NU2X6/gg7Qv8Xuzltw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=u2B3IIIwkE3tgEdHTrqZs1u7oe4Q82f/4lKWEp4CuHk=;
        b=S42rNiBfirROkZKQe2f6LcZpKPxcYlNTUR5tfmVosinOGAlB4B+Sk6nnl4vjqcW5qs
         /OKScMV+xmVT1es6bQyVHSeCIy4SfJamiOQNqa+L7DVzRuTGqE79l25YZtlWDF2hTlTn
         gz1J/cdy2EA3omQ4ULa5HkRU/OnCUtTytM2RYAFX9h0a2Jb0zqeFuPhuuHlU26dyrVwP
         M/VkHHOg3GhPd70/ho0t1f0GolE/C7mTCMUhikDp9tPTZJg3uaSdOfwoq/LepbF3RST/
         3j5fCQkrSknH1xDtJzPbmMz4XG7skIuY+UpJ1m7wUv3qqUKtFL+tEX202Jr6eNdPv9of
         IE/A==
X-Gm-Message-State: AOAM530xKmJGUiB49cj6BN+TWQGih1sd8pr9tv9DPMLBeQQR8cXqTGvr
        B7cCgQT6pGAHF/HT3MJagACFazPBLNb9nA==
X-Google-Smtp-Source: ABdhPJwq6E7Y5lLL0pkr+fRs1hZCScUZO3u6xiQIT8tahHLwG7WQlsyJtQniukFlG4b2jpQGya0PYA==
X-Received: by 2002:a17:902:68:b029:e3:c8ea:a562 with SMTP id 95-20020a1709020068b02900e3c8eaa562mr18463103pla.23.1614065860847;
        Mon, 22 Feb 2021 23:37:40 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id 25sm22560084pfh.199.2021.02.22.23.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:37:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-4-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-4-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 03/13] arm64: dts: sc7280: Add basic dts/dtsi files for SC7280 soc
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:37:38 -0800
Message-ID: <161406585892.1254594.9748953968478715173@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:40)
> Add initial device tree support for the SC7280 SoC and the IDP
> boards based on this SoC
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7280-idp.dts
> new file mode 100644
> index 0000000..428f863
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * sc7280 IDP board device tree source

Is it capitalized or not capitalized for SC?

> + *
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7280.dtsi"
> +
> +/ {
> +       model =3D "Qualcomm Technologies, Inc. SC7280 IDP platform";

Because it is capitalized here.
