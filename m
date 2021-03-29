Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BA734D837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 21:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhC2T3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 15:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhC2T2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 15:28:38 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23D5C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id w8so6495590pjf.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+4cOVQ7+6L15zdo+E6zQB02I2bt0ll5FGJ5itLhgQnU=;
        b=ltyydm9yPLka+76TM3QCQVBtQlyeAGA4FTX4smC0ATrzMpkebPV1Qnh9VrUC5JwPQH
         yOqQT/iSfJLSXqmuvTk5tTefgGyR6LIEz/s7ddXqv6F5iiYaW5E1M9jXx3OQ50XbFN3c
         a5/bmx4GhNs4E0uKSUZTtTFKMaKVYirEqriFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+4cOVQ7+6L15zdo+E6zQB02I2bt0ll5FGJ5itLhgQnU=;
        b=m9nBf+2DwjB1r9ViMs2mYa/R7qEgTmpNlDuNB+UrZ8VWbLAtXW5GnUATbFBkowDdA2
         N6v7hJSDiWvbKNJlTz5MT4X1uc3+G+CUfGRD5L9Yfpd52wvjiGNHKhK7pUYA7f/RTwGO
         zdFYzQ09kQClJQ0q5Uugu2a/4jYOLHxWP2XZxsNB9rokKwae/DdOXryxZ8yjQ3hhbHdm
         PoDvvozGNFxT5tQMksPj8DT5SCdfQdAcLKFEl6xV0NHe8mFT6WANzFm48PTX/E9TZYnf
         upoxkzB+3n8TbHSD1Q7y8gpFzCTIBorcAwTaHJoYoyoWs404nk6yMuzfHvXNVcXJLjbW
         XVHA==
X-Gm-Message-State: AOAM531WZBe4EfJDCGViVE/sAMMij9voifTFsP5cUJvEm/PMhjXeIzgR
        mk/GK/Qr7o+hq2gJPsrArAmoDw==
X-Google-Smtp-Source: ABdhPJx/4WH6fT1bN3OEwPuIpi0aEf2C6F7i8hpe8iRyxUdnZJchCoJBOeBSK6mRVIgduqkaUwXMLA==
X-Received: by 2002:a17:902:7407:b029:e4:9b2c:528b with SMTP id g7-20020a1709027407b02900e49b2c528bmr30412589pll.6.1617046117481;
        Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
        by smtp.gmail.com with ESMTPSA id y7sm295588pja.25.2021.03.29.12.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org> <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: msm/disp: add compatibles for sm8150/sm8250 display
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 12:28:35 -0700
Message-ID: <161704611572.3012082.10802339085569147003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-29 05:00:49)
> From: Jonathan Marek <jonathan@marek.ca>
>=20
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Acked-by: Rob Herring <robh@kernel.org>
> [DB: split dt-bindings into separate patch]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

This will conflict with the yaml changes to this file that are also in
flight.
