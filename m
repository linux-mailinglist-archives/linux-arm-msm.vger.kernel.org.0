Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A58F326791
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 20:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhBZTxg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 14:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhBZTxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 14:53:33 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4BFC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:52:53 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id ba1so5873125plb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yGC/fPoA7uCT4tF2xhuGcbvT+oQRTFhGhmSwGZxAfro=;
        b=mTTWJO/DAhPcEBnft6C1945Jqg+P0LjGLnJrvGAtJN4WbUl9voskW5x0y/+wR61Qv0
         dPb7eICWbGwQzQwwCpnncUu/IR/B5E/CqlXWTX9Kq1Iq4hDyn8EwAdIMISVc/IE256d2
         1uId2nzsgg5mSZJ3fUgT1Pq5oiRKQ8Zp/GDvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yGC/fPoA7uCT4tF2xhuGcbvT+oQRTFhGhmSwGZxAfro=;
        b=tj2s+YTznE29KWq6Zi1G8jysP4vqU57aH5UVPpNQ0wkvPz3o92SCg2avMxxvuNj2ov
         JIGQX4exNTjDYEofo+I5PoF2A91+qRSPD5vSjeOa6V3e/pltVfasaJ3cM8hzaWcKYDY8
         zA1tOF3+i/0Z4ZmM9h8wcnle//RXfNFLc06bvC27sn0SqDTBHztdQLkkmQBywL2GkhMy
         BP9MfN7lnatiwpA5gsEqqB53w12o2gAnt6/PawWOEF1tGy98s2L/OyMsiRgD3KerEQ9u
         tU1TEl+tB6grd1Xk4bAY6By5errvJvYazavlDuYUqbtGd3SbNsr9ifbxAe9T7fpkwJtt
         +ZVw==
X-Gm-Message-State: AOAM531gq9++q3gLrRVKf9zr6TWkX/pc1xH6lIeYKMb6JWJLqK9gcXpW
        tbV6SnWNi/1RoSWw96yS79oxfZsZh+rkVQ==
X-Google-Smtp-Source: ABdhPJy6CfEU3iHZuyrAFbWpIzB82Gm88/OSeIdh+cUqEZAgbDMt5r7mhI8w/ErVifo593LYeaUvJw==
X-Received: by 2002:a17:902:be06:b029:e3:7031:bef with SMTP id r6-20020a170902be06b02900e370310befmr4683712pls.19.1614369172652;
        Fri, 26 Feb 2021 11:52:52 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e8bb:5726:f58b:4e37])
        by smtp.gmail.com with ESMTPSA id h2sm9499439pgd.32.2021.02.26.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:52:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613127000-3015-3-git-send-email-mkrishn@codeaurora.org>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org> <1613127000-3015-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v12 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 26 Feb 2021 11:52:50 -0800
Message-ID: <161436917071.1254594.11997781648093137127@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-12 02:49:59)
> Add YAML schema for the device tree bindings for DSI PHY.
>=20
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>=20
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
>=20
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
> ---
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 85 ++++++++++++++++=
+++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         | 83 ++++++++++++++++=
++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         | 88 ++++++++++++++++=
++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         | 84 ++++++++++++++++=
+++++

Aren't these bindings largely the same modulo the compatible string? Can
we either combine them into one document or use a common binding base
that is imported into the different nanometer phy binding docs? Look at
Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml for how
this was done for the qcom pinctrl binding.

From a quick glance, the compatible string and the supply name is
different. Otherwise it's the same? Please combine them together.

>  4 files changed, 340 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-28nm.yaml
>
