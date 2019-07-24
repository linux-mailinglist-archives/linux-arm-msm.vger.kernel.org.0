Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FA873146
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 16:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfGXOLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 10:11:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42638 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbfGXOLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 10:11:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id t132so21295150pgb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=yf08E+49qJAyoxiq4Pp3i3pHItoQTgkz38vEqql7VE0=;
        b=dpWg9Xr6L0D7Z/Ku2YJ42eQE4yvd1e82KQHr2lLRD4ftXtEpX04IVbpT+HH9YHiRTf
         gmMxS12NNdYsm8KVCb9Gb6fwt6N01iADdocH93+17UiKD01ObzlsdYaBock1ojwXxx2Q
         uS1Q86VImSm1smN8OJMXJTvKKqz9V/NLqj9K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=yf08E+49qJAyoxiq4Pp3i3pHItoQTgkz38vEqql7VE0=;
        b=uE4T9mKUazZWCZN7gdHRQWmMD3NKW72Z7S1dWiTOMlXx3n+UXsvu6skmzyVm/4p4uV
         MmadgVjPn0NEKWwURixWAS9jJwjV30EDAnZNRPygZ33qD4NxX9PEAE24v/5qTBebgdrJ
         2UVbD4wcdzQmGsWIc2usUlMrBwNU0UadsbsTnvuwM7oPPjBQPmXvnL1vu4eSyrmrdDY2
         8Fc0jVAWEtaVrdn0c7q58pSv6ViML9os1tmA6IfVkNHLCTRX3wABIUFNBmLFIWZ1lX7K
         YgLZWDQTnds5fNI8Vbq1xlMmFPwc4Qg8jpCEBZezYrADjAqMFgoIwT/Gaac41GKMs3c0
         ArkQ==
X-Gm-Message-State: APjAAAXECQ6MvZdgQKnd6NnDgTk1JJuwsPUVYh2x9e92dEHG5yuRPzYi
        eHFxnOEYQJKPzr4giQyhp37i5Gxc5So=
X-Google-Smtp-Source: APXvYqzexkRd5KbJ9v+zC2RclMHc1mgtJ7nJ19cyNya96Y2QMzMnyKVcrwRGhsiI6ZW5BlT/SegIgw==
X-Received: by 2002:a63:c64b:: with SMTP id x11mr81481881pgg.319.1563977502745;
        Wed, 24 Jul 2019 07:11:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l6sm46519081pga.72.2019.07.24.07.11.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 07:11:42 -0700 (PDT)
Message-ID: <5d38671e.1c69fb81.1f6f4.a5a1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190724044906.12007-5-vkoul@kernel.org>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-5-vkoul@kernel.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm845: remove macro from unit name
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 24 Jul 2019 07:11:41 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-23 21:49:05)
> Unit name is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>=20
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_fo=
rmat): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should no=
t have leading "0x"
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_fo=
rmat): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should no=
t have leading 0s
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

