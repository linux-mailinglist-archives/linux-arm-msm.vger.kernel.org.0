Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3A785965
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 15:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbjHWNd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 09:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234816AbjHWNd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 09:33:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8E8E7F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 06:33:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso750339266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 06:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692797544; x=1693402344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVkiAWQf02hIjXS1/nDmuDjVF+ZUw+QGWFD4hGm2aLY=;
        b=aIDFRIbQ7V5SgLqH1ESBjTIQWXUV0Zv1y9Qj2HWdRNdDpX+J9VJY5OkeEHY3lWvF2D
         MSk2kJJtniz6HTeZbjYYjAerkV+dx2nXyqKf9sJjOYfrghgw0HCe0AprInxYZt/lIJm6
         oeoW04h7z6H6+3eJWUiv02oWdjZpqI5h0dugY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692797544; x=1693402344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVkiAWQf02hIjXS1/nDmuDjVF+ZUw+QGWFD4hGm2aLY=;
        b=LUBHwhEZQ083JR/LXcW+adcP3+vZ+YLXg2a9jwyQULqdlM1n23by/kNlu7nVBe+10r
         iBU4rzlqpgborhW7T+PqAK6dBKePZYiaMzIDPtCYSGNDq4cwvMDpf5kmdk0rds1kqWTf
         i36oWmaFssv196kuH1/G4Ka+XBuX4zuNdt8X+paDoMSS7lY2hMdnd+gbJUaG6nh96F+J
         u+tNCj05MUupO0ZF9zIgyXSHVlN3Ptw7Js1U71kP+FFpOSzElEtIJnbKF2DlrbWX3hmh
         G/NvEnN66CksPMmfVmVTxWfrnwnZzAx7jfxoSRxnyY73HKZ1OLaDyc29SgA6FxqICq81
         vLGQ==
X-Gm-Message-State: AOJu0YyEPl1tsIW/7eV9AMiZtZjBUOko4wd2jjg/iJUMzROEJXjy2MOf
        pVNt8E0nSZyKnby94iOktsdMveGWTUky57dw0Ym/90Lm
X-Google-Smtp-Source: AGHT+IHUlRaOrQdr6ul3/si9m4p10zbN5BlbJ5JLmXgFIJFjHc8E/A2NVWXezPOHdowm86rTb0OO5Q==
X-Received: by 2002:a17:906:5349:b0:9a1:e011:1a62 with SMTP id j9-20020a170906534900b009a1e0111a62mr1235550ejo.38.1692797544090;
        Wed, 23 Aug 2023 06:32:24 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id f26-20020a170906391a00b0099d798a6bb5sm9749783eje.67.2023.08.23.06.32.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 06:32:23 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so13399a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 06:32:23 -0700 (PDT)
X-Received: by 2002:a50:9f21:0:b0:525:573c:6444 with SMTP id
 b30-20020a509f21000000b00525573c6444mr288342edf.1.1692797543237; Wed, 23 Aug
 2023 06:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230823071306.131373-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230823151005.v6.2.I8f20fdfe34a2e8a38373bbd65587754b324f3dcb@changeid>
In-Reply-To: <20230823151005.v6.2.I8f20fdfe34a2e8a38373bbd65587754b324f3dcb@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Aug 2023 06:32:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKDpZkssNjPzgb62-WUaCU_Y7bqcdGDZrAgH5RFatp-A@mail.gmail.com>
Message-ID: <CAD=FV=VKDpZkssNjPzgb62-WUaCU_Y7bqcdGDZrAgH5RFatp-A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sc7180: Add sku_id and board id
 for lazor/limozeen
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 23, 2023 at 12:13=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> SKU ID 10: Lazor LTE+Wifi, no-esim (Strapped 0 X 0)
> SKU ID 15: Limozeen LTE+Wifi, TS, no esim (Strapped 1 X 0)
> SKU ID 18: Limozeen LTE+Wifi, no TS, no esim (Strapped X 0 0)
>
> Even though the "no esim" boards are strapped differently than
> ones that have an esim, the esim isn't represented in the
> device tree so the same device tree can be used for LTE w/ esim
> and LTE w/out esim.
>
> add BRD_ID(0, Z, 0) =3D 10 for new board with ALC5682i-VS
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> ---
> This patch base on patch[1] which move trogdor rt5682s bits to a fragment=
.
>
> [1] https://lore.kernel.org/r/20230816112143.1.I7227efd47e0dc42b6ff243bd2=
2aa1a3e01923220@changeid/
>
> Changes in v6:
> - commit update, add dependent patch link
> - remove unnecessary symbol
> - sort out the order of properties
>
> Changes in v5:
> - include rt5682s node for new board version 10
>
> Changes in v4:
> - combine pathc2 and patch3
>
> Changes in v3:
> - sort out the node order alphabetically
>
> Changes in v2:
> - add new entry rev9 with Parade bridge chip
> - correct newly create dts files
>
>  arch/arm64/boot/dts/qcom/Makefile             |  5 +++
>  ...sc7180-trogdor-lazor-limozeen-nots-r10.dts | 29 ++++++++++++
>  .../sc7180-trogdor-lazor-limozeen-nots-r9.dts |  6 +--
>  .../sc7180-trogdor-lazor-limozeen-r10.dts     | 45 +++++++++++++++++++
>  .../qcom/sc7180-trogdor-lazor-limozeen-r9.dts | 10 ++---
>  .../dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  | 23 ++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r10-lte.dts | 27 +++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r10.dts     | 19 ++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |  4 +-
>  .../dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |  4 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts |  4 +-
>  11 files changed, 162 insertions(+), 14 deletions(-)

It would have been fine to keep my Reviewed-by with just the minor
changes that Konrad requested, but giving it again anyway:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
