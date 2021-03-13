Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D2633A178
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 22:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhCMViN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 16:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234842AbhCMViC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 16:38:02 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D9BC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 13:38:01 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so12821992pjv.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=D5btgCEZUmgIPQRKWA8dZ9wp3QKg5y/ecj2VeuDS+OY=;
        b=mqZrEl/54DmdlC1FpfrqemeaHINIvzznaVvJpH6BSpGyGe82N8HQzb70zH9645fp3e
         /9tamjjLl9Pe7R34G0T1/rAqnPlENsMeGVrw865MvHew5Ht9H8LTR0+h0z13LWD0tLfb
         Hn/6684hmPEjsth2EJEir13kCUOEVHjZW9/Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=D5btgCEZUmgIPQRKWA8dZ9wp3QKg5y/ecj2VeuDS+OY=;
        b=HH4bAApMgx8YhMZyW8PKS9ewEViLMPGAL4baLK9yUZupKRJW392NPP4SCBpS8XD5Ao
         CNb+CBLpFV1+m6w7R0tzZV66y83sz7Ef9b5aLi5LZ3dKNTsJS1dFZfSxDGkiwShkaY2z
         kSdPUwyhLj8jWVydTC6w5O9qxwJ5zBH7GvFXYVV4SQXioxR+nZcsO2f/pozs4VPfEJjQ
         jpTnWcCSMX3ZgJnXautsYiLD2d19XMM5+jzsrno1dwvKDigodNAJjnBuZWgrjhOBdebt
         KRZias61JElpcYXRlfEXR3QxT/B0ckLlQxtYsARjWyIsiud7qujBpsVe4yL+8S3Cu+zk
         5bCQ==
X-Gm-Message-State: AOAM532Z7SRyPFHOjEwl7wLq+NJOvEyY4XjqVR7lMHvLb1HfJiCwewgL
        3BdH9FG4R15mTRRKCnmbnydtXQ==
X-Google-Smtp-Source: ABdhPJyk93fDg26EXtcirmwmh6IT8OGjmokLzAFIQGVEIn0OCzwMi4BbAjf6eIviRbKm3lgWhxHAyQ==
X-Received: by 2002:a17:90a:c207:: with SMTP id e7mr5238147pjt.188.1615671481530;
        Sat, 13 Mar 2021 13:38:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id a1sm8851870pff.156.2021.03.13.13.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 13:38:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615269111-25559-5-git-send-email-sibis@codeaurora.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org> <1615269111-25559-5-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 4/6] dt-bindings: reset: pdc: Add PDC Global bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org
Date:   Sat, 13 Mar 2021 13:37:59 -0800
Message-ID: <161567147973.1478170.8098632597789819554@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-03-08 21:51:49)
> Add PDC Global reset controller bindings for SC7280 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml | 4 ++++
>  include/dt-bindings/reset/qcom,sdm845-pdc.h                  | 2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml=
 b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
> index d7d8cec9419f..831ea8d5d83f 100644
> --- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
> +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
> @@ -21,6 +21,10 @@ properties:
>            - const: "qcom,sc7180-pdc-global"
>            - const: "qcom,sdm845-pdc-global"
> =20
> +      - description: on SC7280 SoCs the following compatibles must be sp=
ecified
> +        items:
> +          - const: "qcom,sc7280-pdc-global"

Somehow this one can drop sdm845-pdc-global but aoss-cc can't?

> +
>        - description: on SDM845 SoCs the following compatibles must be sp=
ecified
>          items:
>            - const: "qcom,sdm845-pdc-global"
