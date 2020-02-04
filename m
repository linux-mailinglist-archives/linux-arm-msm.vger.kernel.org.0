Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23E21513B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgBDAjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:39:45 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42064 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgBDAjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:39:44 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so8508859pfz.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=aY+PkOZvhDkr1IoLpMvufUwCSEjSEtUTCkMrzIaPtMo=;
        b=OXbh3xD9TSmengwKoH7bMzEMxTwmrX2ayW/CIY39z2bvXE3XS/dbykz7iB9oegCRVM
         orhJjtWromvx4gHPOdCplJFFoIyAzNy9rs5it0phG8yPrfjvrn2nvfbfeRFwiw0guHLe
         KGmobwApJCvLuTqFUiACsJuFjlhixO36LVCvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=aY+PkOZvhDkr1IoLpMvufUwCSEjSEtUTCkMrzIaPtMo=;
        b=KC78wiCFSU62/iF1O5jmwDbXQuMZNQJGKuf1BRtkVixCTxw4Qy9oID2GFzQpSiS/Iq
         KwGmd+R+DFiUNE0PxEQqqEZuJGLPQ07LX2CuagQiA2W/ujYegfzxBB5hUWDhgHnbhHbM
         9UUAWKSSRHaqYack2/xfHwSxB8LgTfknGXawD0I5DBF3tGvoX4Gb0WxVfq0pjZNaGt8k
         50PUBpcbyuvWcDuj5ScblXpY2n/STTwCqBi361+XgBR3KyeZ/x0yaUEOrgx1IkKVAawy
         gDA2qrTyEAOJiESUn18xVLUuTgLeT92rE9PAJ4Y+rfdzDKPEPxBRcZgugJzhFha+ZY/1
         Cq/A==
X-Gm-Message-State: APjAAAWxlcUm2V+X7IzjYvEMgJHYnUAbHHbQSZRrnc06ZrHBV178aVX5
        ZEGVYma2DZ4dptrXGaAd9pey2Q==
X-Google-Smtp-Source: APXvYqwpBeAZ7tUjUr6bFDrm4kqCYRIGAoKoisn6oW50rp2ZtSptT7JfRmJEgX6dr6AeyrNNSTuHaw==
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr27399143pfr.95.1580776782670;
        Mon, 03 Feb 2020 16:39:42 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y127sm16375426pfg.22.2020.02.03.16.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:39:42 -0800 (PST)
Message-ID: <5e38bd4e.1c69fb81.4702f.d53b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-3-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-3-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and SC7180
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:39:41 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:53)
> Add compatibles for generic QUSB2 V2 phy which can be used for
> sdm845 and sc7180.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

