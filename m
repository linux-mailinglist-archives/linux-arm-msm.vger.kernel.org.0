Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25876D0DBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 20:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbjC3S3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 14:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjC3S3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 14:29:41 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF0E2133
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 11:29:40 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id z17so10407867vsf.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680200978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1mfsAVkmxLwhRt7IlI3jhuOesEA4D6U7D/dfayN2QA=;
        b=MOGm1VqeuelvWydwOeZe7j2bl24u03Ml/sqnQ8wtHhI7luYrcx6XexkPdh1+XGg8X7
         ebLwoFTfM/YVgVdz4rJU3ROd5aWIFR/AJTdDWu93BwzxoFkP87H022wHHMwUQF4HNJg8
         +A9AYY77V/W0EWSlFW9hCGnTSnAmvXHGEn4/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680200978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1mfsAVkmxLwhRt7IlI3jhuOesEA4D6U7D/dfayN2QA=;
        b=Emki+r7zWXFNvMp/hBsOCpY8KTkkWu/aEp6sN5zIp4bXD4Z6FjXKFdggJefNu56R0y
         ZeVUP6k0843DG5CY96nTD50dpJF/FyLSt3j6fqZDbOgLAbjQxq3+cFivHin6tMAUChps
         LtTMRLBvi/dC0EGeYbSGAt7wAfcg0K948rI/4QTmLo14Nxsq1eSVGTrkeBOlYdS9H3qL
         ZqFHXL5zbvX6KTKyU2qlYrdzZMiXhk1+KF0Iw+d3e0a/qzXvaEopgNjX9hvkNhW3Pu9Q
         t96ZZMBlS6gpL9roQ2ifI/9H941t5PdSHQud9Nrl9Bn2C335BnvQHXokhcqsuxBu0AY7
         89CQ==
X-Gm-Message-State: AAQBX9dPR+txz6gW23cnDm/xA+0AZFOAvGsQQZAyxqlZwZN4+MlDfq7t
        FFyLXXheEa9d712Ys5yDadCiVUWS4JRUM2+sKfM=
X-Google-Smtp-Source: AKy350ZqRtrb0WC0Od0ijmrKbuu4TPmDkfxlZSGvfP+4MqQm3bDoGBm3IUM4/qnvfGWFpNNGN8PzMw==
X-Received: by 2002:a67:f40e:0:b0:426:4c6f:5cb with SMTP id p14-20020a67f40e000000b004264c6f05cbmr9617854vsn.31.1680200978265;
        Thu, 30 Mar 2023 11:29:38 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id p3-20020a056102200300b00426a410371asm1847945vsr.10.2023.03.30.11.29.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 11:29:37 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id h15so17091255vsh.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 11:29:37 -0700 (PDT)
X-Received: by 2002:a67:d493:0:b0:426:a319:a226 with SMTP id
 g19-20020a67d493000000b00426a319a226mr9101769vsj.7.1680200976855; Thu, 30 Mar
 2023 11:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230324195555.3921170-1-markyacoub@google.com> <20230324195555.3921170-9-markyacoub@google.com>
In-Reply-To: <20230324195555.3921170-9-markyacoub@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Mar 2023 11:29:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wq8Z+rf++08fyYvsBUqdWX23qoUSOBBR5nP=hBUk2mzA@mail.gmail.com>
Message-ID: <CAD=FV=Wq8Z+rf++08fyYvsBUqdWX23qoUSOBBR5nP=hBUk2mzA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] dt-bindings: msm/dp: Add bindings for HDCP registers
To:     Mark Yacoub <markyacoub@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, seanpaul@chromium.org,
        suraj.kandpal@intel.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 24, 2023 at 12:56=E2=80=AFPM Mark Yacoub <markyacoub@chromium.o=
rg> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Add the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> ---
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v4.5:
> -Remove maxItems from reg (Rob)
> -Remove leading zeros in example (Rob)
> Changes in v5:
> -None
> Changes in v6:
> -Rebased: modify minItems instead of adding it as new line.
> Changes in v7:
> -Revert the change to minItems
> -Added the maxItems to Reg
>
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
