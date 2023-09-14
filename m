Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73147A11F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 01:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjINXkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 19:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjINXkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 19:40:06 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6322707
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:40:02 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so3406374a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694734799; x=1695339599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20RRzKZLtjTRYGrIOvHQDuGLhkZQtE0VsAgSgkickKw=;
        b=X3CqtgTg0BVcErNIMvmip/NxebPAVSTPbKyEMTgqALGxsvBtuDQESi9FAJa6dIfY0Q
         /VRn3aYWxrUaqLvZO4t6/x3RkK743XEt3HYWHBxnTb4yIFhhC8ux+73J1UQc6/lypTKH
         NnQmN0p4ZXhk4ovLxlxm3sxZDqj505tq76wS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694734799; x=1695339599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20RRzKZLtjTRYGrIOvHQDuGLhkZQtE0VsAgSgkickKw=;
        b=OgpJ+ou7jjKNGibO6fTskAn8kdPbx6r0VDsIB3sPNyQOpCqLL9Fd4Ji5PN7zNy+UTD
         1Fx/l3zpkWxf8zyEGChNMPajYxYUgUQ2tsiAVyoNVZwSjgcL8mm5zbZBM71m2UVX9MsF
         WHiD+vXt3qb4pvzzpLhzgsNRTK3gNIPCKocIf4AJYujjY+UeV23AVQofEyaC5379HKbb
         UBDwPwLYgEJEvmqNmjAjEdWG6+airjzwHNRpuH17E74MBAPPV1zQ+XEHxlQ3lWG4yR9J
         e4l6SwbjWsTXH3XjTHyimLCBt/6kqj+NiR99d7JDI4H1Iqbm5d1HXXf8ryhsqiWTUwo2
         PO/w==
X-Gm-Message-State: AOJu0Yxhl1DKRxZbG+YLytDczPT+svUpB0ro//7jNXfEscdFY993e1hN
        +nh0UA8PmbSyxat3OuYKuDQcMI9SBfqog+dZa/yuMg==
X-Google-Smtp-Source: AGHT+IGNwctpncNUNHs2rrhBxQeClALrYBADyjeHXpBfOlEBgKGUDisPMmwk0aTM23laDAgLKfwvbw==
X-Received: by 2002:aa7:c913:0:b0:525:8124:20fe with SMTP id b19-20020aa7c913000000b00525812420femr99392edt.18.1694734799588;
        Thu, 14 Sep 2023 16:39:59 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id ec3-20020a0564020d4300b005304967df18sm851034edb.45.2023.09.14.16.39.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 16:39:59 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso15365e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:39:58 -0700 (PDT)
X-Received: by 2002:a05:600c:22d4:b0:3fe:ef25:8b86 with SMTP id
 20-20020a05600c22d400b003feef258b86mr64827wmg.4.1694734798662; Thu, 14 Sep
 2023 16:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230823071306.131373-1-sheng-liang.pan@quanta.corp-partner.google.com>
In-Reply-To: <20230823071306.131373-1-sheng-liang.pan@quanta.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Sep 2023 16:39:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUW+9F-gUV57bBYMn0wgM4Axr9MM5X8kBXoDekJo3AfA@mail.gmail.com>
Message-ID: <CAD=FV=XUW+9F-gUV57bBYMn0wgM4Axr9MM5X8kBXoDekJo3AfA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add no-esim sku for sc7180-lazor family and new
 board version for audio codec ALC5682i-VS
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, Aug 23, 2023 at 12:13=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
>
>
> Changes in v6:
> - commit update, add dependent patch link
> - remove unnecessary symbol
> - sort out the order of properties
>
> Changes in v5:
> - rebased on patch moving rt5682s to a fragment
>
> Changes in v4:
> - combine pathc2 and patch3
>
> Changes in v3:
> - correct corresponding of new board and new sku
> - sort out the node order alphabetically
>
> Changes in v2:
> - add new entry rev9 with Parade bridge chip
> - correct newly create dts files
>
> Sheng-Liang Pan (2):
>   dt-bindings: arm: qcom: add sc7180-lazor board bindings
>   arm64: dts: qcom: sc7180: Add sku_id and board id for lazor/limozeen
>
>  .../devicetree/bindings/arm/qcom.yaml         | 31 +++++++++++++
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
>  12 files changed, 193 insertions(+), 14 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozee=
n-nots-r10.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozee=
n-r10.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.=
dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte=
.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dts

This patch series would also be keen to get landed. As mentioned in
the dts commit, it depends on the other patch I just pinged, AKA:

https://lore.kernel.org/r/20230816112143.1.I7227efd47e0dc42b6ff243bd22aa1a3=
e01923220@changeid

If there is something outstanding that needs to be changed, please yell! :-=
)

-Doug
