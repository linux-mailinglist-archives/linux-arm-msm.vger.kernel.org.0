Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CA52DDD20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 03:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732638AbgLRCzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 21:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732318AbgLRCzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 21:55:14 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EDBC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:54:34 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id be12so634584plb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GwED+zkYeoip+RZibjgPn/mm0NWtqDJz8jS6yQF5rtQ=;
        b=Fjz026Fj+U+yopuLKa45dVwvE/dvan9ptbFl1JEDmh73VydkBs3d9049RmEvb5SjFm
         lHP98SA3NwDtndnopUn4/776YqRPA1ZWq6W6c9HA0M22XPPT8KPuko4N9GZfGUtSBr5J
         +LY36YGJDF7XpjjHObtWawr2j+5Vv5xuaegfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GwED+zkYeoip+RZibjgPn/mm0NWtqDJz8jS6yQF5rtQ=;
        b=TBqSZCGmUeMitUnyhY7tDyoq/vdoClLZEF2MyZwQ4xk5tjTsTs4a7MF5CGcIl/w9Nd
         U/zUkbjL7dsKCrjmVGIUe8nNs3QlSHQvyMYCM/aGGZZCXYNkiOK2OwaIOZVJK0W5M7zV
         GJ38ZZqUohIChZc6EqWCGiHQbBuZMtI9WErD+XFRIhg2hb4wCGRqHcnaNPiZjpgcFaPo
         LFHVYPBUC11pwvYpUTkPtDh5kCFN2E53ZjrLPspo+FxBciCDrF24JnUAEyj6Vy2Q2l4/
         lKkhMUiBO2Dqe+Xde5/hepVWhULSKXd07EfjmJcoMhXj0PjaxNv17pxOfIyfSVaQ63sH
         pqrg==
X-Gm-Message-State: AOAM5334ZTQ2NN08+ZYsgn96KEVo0zRGvMSoV8+95h8EnH2YTHTKEvru
        FzXcPdevWUnfzLswtBbbTgBQGA==
X-Google-Smtp-Source: ABdhPJy/B+rPaUdHI8pBnouZyK0jvxnhdNkswCz1agyWTg/Di2JurWpyCScgEsiAmXNZh0Hyv1Ex2w==
X-Received: by 2002:a17:90a:f194:: with SMTP id bv20mr2195451pjb.11.1608260074306;
        Thu, 17 Dec 2020 18:54:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l197sm7099056pfd.97.2020.12.17.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 18:54:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201217142842.v3.4.I666b37646de9652cef438ac7c2c6c2053367fc6b@changeid>
References: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid> <20201217142842.v3.4.I666b37646de9652cef438ac7c2c6c2053367fc6b@changeid>
Subject: Re: [PATCH v3 4/4] spi: spi-geni-qcom: Print an error when we timeout setting the CS
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     msavaliy@qti.qualcomm.com, akashast@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Thu, 17 Dec 2020 18:54:32 -0800
Message-ID: <160826007235.1580929.15942404538098977025@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-17 14:29:14)
> If we're using geni to manage the chip select line (don't do it--use a
> GPIO!) and we happen to get a timeout waiting for the chip select
> command to be completed, no errors are printed even though things
> might not be in the best shape.  Let's add a print.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
