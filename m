Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B89185F99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 20:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgCOTit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Mar 2020 15:38:49 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:39625 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728822AbgCOTit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Mar 2020 15:38:49 -0400
Received: by mail-vk1-f194.google.com with SMTP id t129so4257146vkg.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2020 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3r4/BvkXpJFWjW4Dm8u+4gw7YjX6yojUcnevi1e7c+I=;
        b=XwpMgfGTAdDtlhQO/YyoLhfNXwLMPvXTGSKSJ3/yqwas/b7Ta+cQ2wnTzDLHjT5AuA
         is0tUAKR6jiW1Cp5bh7DfL57FcgLB+1uO7sUhAvKy4ebM7qf38EiZHoE25LYF+13WKXO
         UTog8wXTqLa6AS9Bcxq9qNZwzuGSYiMRLGQ47LcjF6wwY498/AUO6+Q7BFxvs1m1/AMG
         bRUdL4CTsbH92OFprdSeYcOMRQljBtzwNgAHkoWt5fplEmNq9lKf1gBvYX5n+9g7QUlN
         WIcYJPwR4J1PG631fhwjnINaNXQOAXCFMpJiRrfgYBnaMeUqN3+L5RpB21LPVEEkQQ47
         TPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3r4/BvkXpJFWjW4Dm8u+4gw7YjX6yojUcnevi1e7c+I=;
        b=PrcXgadPM3yG3rPwyDni6QR/926NDtLGBy/QQLTOxHrDLPtxAyWS+YhLiq1M9yZ5XR
         F7vlAXfTSjgkLKrpldVfE2jDNrIL6uyZ85+yhkDJqMMvIzdstjV7KWdSZspAMLEUmuzg
         fdoWHdlTSrX3U4YkwP3zeJF4icTnKqbR4nT/1+Vf3UQ6D0tVcsfhMdIhwUtWzrc5D/0M
         yDbPT/tfqY/cSlxKN0Gs7MVSLxWI1C/qeCME5pPfmOgpjI5lu4rNEMJJiBHT1TTVh64H
         HWoWzKufB/BV91yfahA1wI2ynWGPwyDrAGdIJav9kYYQ31kA1Hwl06TPc0hAlsjfZgyo
         anNw==
X-Gm-Message-State: ANhLgQ0maviwnWNgSnIum8H6smGfmG7onCfGgkS4V1RLbc8irMg9cPcu
        7xOZdEr7YuQ3c5DWA2KApk8985zewJX/ncUzgqmS1Q==
X-Google-Smtp-Source: ADFU+vukkt95spIbn7oU3hsXT2PRPErWHGLPhTFw57L5X+fXp8Nt6v07e839vlcZH6eMP2Skvw+cvfE3msIzvNj+PKk=
X-Received: by 2002:a1f:e004:: with SMTP id x4mr15188225vkg.79.1584301126800;
 Sun, 15 Mar 2020 12:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200313214552.845-1-robh@kernel.org> <20200313214552.845-2-robh@kernel.org>
In-Reply-To: <20200313214552.845-2-robh@kernel.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 16 Mar 2020 01:08:35 +0530
Message-ID: <CAHLCerMDNXEr_1JHrdM_3rMFaJJK009E1v4JPJhLSu1dgVKJLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: qcom-tsens: Remove redundant 'maxItems'
To:     Rob Herring <robh@kernel.org>
Cc:     Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 14, 2020 at 3:15 AM Rob Herring <robh@kernel.org> wrote:
>
> There's no need to specify 'maxItems' with the same value as the number
> of entries in 'items'. A meta-schema update will catch future cases.

Thanks Rob.

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Amit Kucheria <amit.kucheria@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index c0ed030d0960..62b97a6d9b65 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -43,7 +43,6 @@ properties:
>            - const: qcom,tsens-v2
>
>    reg:
> -    maxItems: 2
>      items:
>        - description: TM registers
>        - description: SROT registers
> --
> 2.20.1
>
