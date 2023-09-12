Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EBA79D867
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 20:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237275AbjILSJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 14:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237323AbjILSJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 14:09:46 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5DA10EF
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 11:09:42 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bbbda48904so99591061fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 11:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694542181; x=1695146981; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWTM0f5/i1QnClAjTECf9BeOt/psp+zCb1GGDraYASQ=;
        b=czfZb3j/SidR1NgJ7VYFOwQeFooWtDYkf5TwjrOApqlX9hDSDvzAixN3CbccRBSGvF
         9c4658dXFrpeA/FDy5TWv2NUdpIg4W6MZjwJKn+DL6/91dQ9hSFiUOI4V5jF5z5ERGKu
         k/PyAe2URtdinroS4Xh2OlZUMkBD6YLaG5n/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694542181; x=1695146981;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWTM0f5/i1QnClAjTECf9BeOt/psp+zCb1GGDraYASQ=;
        b=RvSBTox20N5tMiL9em43QNBtaJOPtr2Yz0C0wJZY7H42F5otD4SqXeDVolg0Id1dSW
         4HrYAp6KG4yF8pxdx1UQUMmBWjeixprOUPegsa+22OPdzELqg2kUUSLLlXJs79AT+i2b
         VoyxOjw7e0BD13ARTIHtLJE36BQMUjB0bOt4cEI4rw3ueun1D1rqZctCi/9H2LGIEupP
         9SlqdVHhTn52bawUVIf+Yv+bD3M+fY/XW/OhxVysc4KbBGJeLbqFTs6TnX5sqlHgqj02
         4Vxf4dtiMp0sEZBE1yLDLnqElAfuwbBBTnKAPRMTdbWPKdEcal1pC825TreqJGgSQW/2
         rCKA==
X-Gm-Message-State: AOJu0YwbAHUKEdsaHRGDbyfz1Etl8lk/kM2/+YMuGlB4UQEp9ygN24AO
        05k8hSHa5KCw8p+tHO5Hp0AbAmCXk9mrnxImtuJReQ==
X-Google-Smtp-Source: AGHT+IGqBTcsw26+laBvJf/I/isoneVHzrJJ9T+K2yk5azRK+zEfUSmcs/ggygm50ClDleB1KaELGwFCQfMOnw2KkGM=
X-Received: by 2002:a2e:9dd1:0:b0:2bc:e808:e735 with SMTP id
 x17-20020a2e9dd1000000b002bce808e735mr525680ljj.21.1694542180860; Tue, 12 Sep
 2023 11:09:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Sep 2023 11:09:40 -0700
MIME-Version: 1.0
In-Reply-To: <20230912071205.11502-1-david@ixit.cz>
References: <20230912071205.11502-1-david@ixit.cz>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 12 Sep 2023 11:09:40 -0700
Message-ID: <CAE-0n50rUnwqPqDmskdaUOYc8qUPYpNoJxwsfShgsc9ha6XuGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845: Fix PSCI power domain names
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting David Heidelberg (2023-09-12 00:12:03)
> The original commit hasn't been updated according to
> refactoring done in sdm845.dtsi.
>
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
