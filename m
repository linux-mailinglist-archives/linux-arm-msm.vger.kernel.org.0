Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D123611D8E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 22:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730966AbfLLV4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 16:56:37 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38971 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730880AbfLLV4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 16:56:36 -0500
Received: by mail-pl1-f194.google.com with SMTP id o9so146837plk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 13:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:to:subject:user-agent:date;
        bh=Y/oDdJ9vaWTmHiBd0BBwMYbpseDwIlnPRcsdk/YIhLw=;
        b=RubV1aPPV5MwZZB/p/A8BudPeStmQcqRDXmYeQ8QKYBpnAMHf0K7SV3hzoDQ/r6oZ+
         IbedmlCILDuARAk4qRlr21vSCi9GxzU/l4/lctCO8uVEY2XQFbV0NQh/yEe87bK5mSQm
         ysYWhI1tp91fz7Jkq4CMTDU9khX/1ZTUZ4ROE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:to:subject
         :user-agent:date;
        bh=Y/oDdJ9vaWTmHiBd0BBwMYbpseDwIlnPRcsdk/YIhLw=;
        b=Ho1+2p0DKMrlZ1ruyLnVioT+g65YZjHYdacqJarfzUPdNErK+NYNl8WD9qk8jjUVmb
         V0icKjC6LqeCxxfTUZmvsFHMYf5qIAQ9N/BTk+PaE0n/uiy+Q52qFRxrls3rxOl2IRCv
         GvL24dWe/nVKjTmX7apAuPQxhiuuxjgsccVhGaOWrkrLbpdg4horwKPrMpnMOzrxBzI7
         VxFIlqawPlDEhRtui8xgrYh2o/3142ITPBM8ThB/+dcRaWHIlZQhCJMdbl9eRwVTRT7a
         Edm0gNf1w/rg21HQX1SibqZVrnHO15erWHEs4Jn7q+uZeNj3ZFyBHgJ6Tl05CPcazlxU
         bMYA==
X-Gm-Message-State: APjAAAXh8l+zVs42fyx6uduV4jceLFCy6XrTxuks/BFBtCYonZqHDbwJ
        ziHTmx3KfaB3hVGKv83KX2tY7Q==
X-Google-Smtp-Source: APXvYqz81olZWLtTn67DezSPYTgvw0RojAmwLUKcy3D/XaEdu4BjmslxBAyek/pCmP7dI15yJs9fDg==
X-Received: by 2002:a17:902:8ecc:: with SMTP id x12mr11900974plo.286.1576187796085;
        Thu, 12 Dec 2019 13:56:36 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p16sm7888003pgi.50.2019.12.12.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 13:56:35 -0800 (PST)
Message-ID: <5df2b793.1c69fb81.2d816.4046@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191212113540.3.Ia530e4065ca81f55ac8f89a400f6a0a084ff6712@changeid>
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.3.Ia530e4065ca81f55ac8f89a400f6a0a084ff6712@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc7180: Add "#clock-cells" property to usb_1_ssphy
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 13:56:34 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2019-12-12 11:35:39)
> Running "dtbs_check" yells:
>   '#clock-cells' is a dependency of 'clock-output-names'
>=20
> ...and sure enough the bindings say we should have "#clock-cells".
> Add it.
>=20
> Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Good catch!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

