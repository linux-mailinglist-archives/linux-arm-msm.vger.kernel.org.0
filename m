Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C88B261B15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 20:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731347AbgIHSna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 14:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgIHSmO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 14:42:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9501C061573
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 11:42:14 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id z19so9542857pfn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=JKtiywr7+fjeVER30WU5i+E72d6lfY9W4GWcx21Jgb8=;
        b=f2fD5pVmpsnDpq+srq+r2lnCbNJJR80fVasFaY9lpjHHU0c58mCDL9B6ng3gzFBLYT
         eADBy99c9rrDaeJ3AcnnVAOSBLH1yZF28V4bKx3cCQdYjr5LLg7zlZmYubAFh73mq9H1
         w4lmNNA/lMWopy8w4n2cGWwg/NeQYncP0hnsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=JKtiywr7+fjeVER30WU5i+E72d6lfY9W4GWcx21Jgb8=;
        b=Q82rTaKImS+OStDP+CAv160dd7D81mYQRub42Ec3X96nGPICpe8yyzsDhOo55+oSlj
         3dQTWT2why58bqc/qm7IaPP4qV7mqLILQVzyWtcjZ9GPpc4nZvL7ZspX8MuTOIovocU9
         uGvevKbtVZM5eDFWDNY2ktq33+GiF9PCtD1ykcbbRH4xFtpaWkvcxOFeLCf4/41DH7Ko
         uUGhohQeU8xCt0iBytX5GjQD/ZUp7F6WRwp0mf67mjsv1yVh2JssG1dA9iT41aFoiBxZ
         qdbcR6wXctvT6F+E+Y9+H3GsadDDxJeUlAGNHZ6z4SYG3xHjKIf6StQG0yhJWvzl2yZd
         sGrg==
X-Gm-Message-State: AOAM5326YrAC82DLIUAe3RJf5pyLXmaE9r10n84r2tJf0P/O/AHBxGbP
        /GUrg/VogAqw5/IX4KNsQpr2pA==
X-Google-Smtp-Source: ABdhPJyt1eVQnuCuk4L6IVMa/HQgw45+PS9gTYAZnn5KPjOouxmwZbRHZweN2ayo6qGEOQZeb5kTtA==
X-Received: by 2002:a63:4810:: with SMTP id v16mr98444pga.374.1599590534338;
        Tue, 08 Sep 2020 11:42:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y4sm127196pfq.215.2020.09.08.11.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 11:42:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <990b9edf-055d-6ecf-ee39-5a252b4c8859@marek.ca>
References: <20200902230215.3452712-1-swboyd@chromium.org> <20200902230215.3452712-8-swboyd@chromium.org> <990b9edf-055d-6ecf-ee39-5a252b4c8859@marek.ca>
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP combo phy
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
To:     Jonathan Marek <jonathan@marek.ca>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Tue, 08 Sep 2020 11:42:09 -0700
Message-ID: <159959052954.454335.18265741930513449396@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-03 16:26:39)
> On 9/2/20 7:02 PM, Stephen Boyd wrote:
>=20
> > +static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
> > +{
[...]
> > +     writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> > +     writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> > +     writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> > +
> > +     writel(0x20, qphy->serdes + QSERDES_COM_RESETSM_CNTRL);
>=20
> Should be QSERDES_V3_COM_RESETSM_CNTRL and not=20
> QSERDES_COM_RESETSM_CNTRL, which is for older PHY versions.
>=20

Thanks! Fixed it.
