Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A83FA1A1A26
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 04:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgDHC40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 22:56:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35923 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgDHC40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 22:56:26 -0400
Received: by mail-pf1-f194.google.com with SMTP id n10so1749126pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=C19SyW6s9ABaVcA96MgZ/z86+FrD+QX9SGhdUhVzpt4=;
        b=KZgnzElg6MCmjBX4mGgfKinaj7t+v/aV02z80ncSG8PxUBjzX8osIGF/f2dvYj1g8q
         qJPltNSCAVYAm7+AZ+kGjBJ4p3+vGibNA+Cs+ci4ZcxqKdTCJP2ul6676KCl8SM862yq
         KUq5o4+M56r068nRKzqYPTKKbNz6lL2TPGK3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=C19SyW6s9ABaVcA96MgZ/z86+FrD+QX9SGhdUhVzpt4=;
        b=UdssC7dxTbMhUUBN5qto6VV+d4ZT3BeQWjMZFfiVdtxmnYvhHNjp+wEp6saRWAS2IU
         gFscYd1jkpBiZr7DaTB/8GFhyoGe5bUSOq04p597MFJzFKJOOjLqAXkYGYGFxIwIz/fC
         qTmM/iCN67u05Kmj7Br2OzVLVarKurvibOHENuRFEi86dO1XZF3+3TwGx50ATGuNOUKl
         ybYYWVEccujTspd85P8illl0WQkzbLkO5t9m0MEutyWVDgj0ZJiNDqx1P9pa4FFAoq3A
         EiO+BcrBpiwNMMlP63n4abj8+ALu0WJ0KwOhE4jrgJ7mH5SiE+2ara5Wp8gpn3IPDBY5
         I6mQ==
X-Gm-Message-State: AGi0PuZx8ww03OzPmyFYCWAkRlhRqeHRJyhRM5Z83slMoNlOsuRhwE17
        egWE5P/kjWri2J7gBp5EvhFEkg==
X-Google-Smtp-Source: APiQypIDODO01vVtGZfqvyLcC30QAn+V1wKdyLppdB6LkQtNbXFqACB4TCOhjyHrMWZHXdoaBN1JBw==
X-Received: by 2002:a65:62ce:: with SMTP id m14mr4936916pgv.174.1586314585701;
        Tue, 07 Apr 2020 19:56:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i187sm15200635pfg.33.2020.04.07.19.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 19:56:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200402234455.75061-1-john.stultz@linaro.org>
References: <20200402223723.7150-1-john.stultz@linaro.org> <20200402234455.75061-1-john.stultz@linaro.org>
Subject: Re: [PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Date:   Tue, 07 Apr 2020 19:56:23 -0700
Message-ID: <158631458374.216820.17829557619378130779@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting John Stultz (2020-04-02 16:44:55)
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>=20
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Might be worth it sending it outside of this thread in case it's missed.
