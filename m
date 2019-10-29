Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A16E8CEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390547AbfJ2QlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:41:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43101 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390543AbfJ2QlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:41:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id 3so9955676pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=LNxWM58ZrMRqhvJjmqyuwJjKcprn+LP2a5RPcX5BSTQ=;
        b=Bc/L5ksmmwMT+AV2TqfmTo8usjNX1/zYqzyxZaZ8rElettpFJdxKI9qyzPJ+qM+WN0
         IbohgiOJ2hj++SJH9te7RKZVz8DTuLaenbmG1sSDyeD/9tWJJkBoAxbJjK/+W0eZ8mMK
         StMHUCzc7rfK6ie/FdDKRDpgPUf7cyyF7NPso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=LNxWM58ZrMRqhvJjmqyuwJjKcprn+LP2a5RPcX5BSTQ=;
        b=hIZtI5VtZNNVnChCY5RqyoIGVvcvyVLIPJeqwzT6SrgsoO/Y85Ou8uspu54TV2Z4ZP
         h5V884TnwQXrpiiGOt1WrjDrPaHZrvtP9rMFr7RTEzzZ7DCM/C77dHEu7OkYDDc+wDdJ
         VZSpQG9AB+MnrVVDwHrxCtXykZzUE9TTC9pBWtaz2XhoqnjijLwG4mR1HoHGpMvGycnO
         hsFEAve7ZjEECEl/DN/M+e3A97jBOuRhgyTwi10AnCoMS6vrI/ppvrtvj+XDQf/pHR81
         CHl23685n+EweaDorI43SyAjbSWuHsZSOOohe2q6aCZBa3MDDwKE999/Fu+RLSKOQAk4
         jTDg==
X-Gm-Message-State: APjAAAX6Tz5FeAvXh1hvk0yhn/WpnLpJ+FBYuJ6njtoA2zpTCQt//4o6
        nTGc4pkrWTvRened5CJMHX6rqw==
X-Google-Smtp-Source: APXvYqy1MoKp6KuXydX7v5P5VKqYMVnerZ/CHnsraqUoZ+67iYNsXlmTCHa8d28nPUw+lzw6EGcJcQ==
X-Received: by 2002:a62:58c3:: with SMTP id m186mr28080725pfb.147.1572367282720;
        Tue, 29 Oct 2019 09:41:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y36sm13376512pgk.66.2019.10.29.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:41:21 -0700 (PDT)
Message-ID: <5db86bb1.1c69fb81.dc254.ec0b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191023090219.15603-8-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-8-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 29 Oct 2019 09:41:20 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-10-23 02:02:15)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 04808a07d7da..6584ac6e6c7b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -224,6 +224,25 @@
>                         };
>                 };
> =20
> +               spmi_bus: spmi@c440000 {
> +                       compatible =3D "qcom,spmi-pmic-arb";
> +                       reg =3D <0 0xc440000 0 0x1100>,

Please pad out the registers to 8 numbers. See sdm845.

> +                             <0 0xc600000 0 0x2000000>,
> +                             <0 0xe600000 0 0x100000>,
> +                             <0 0xe700000 0 0xa0000>,
> +                             <0 0xc40a000 0 0x26000>;
> +                       reg-names =3D "core", "chnls", "obsrvr", "intr", =
"cnfg";
> +                       interrupt-names =3D "periph_irq";
> +                       interrupts-extended =3D <&pdc 1 IRQ_TYPE_LEVEL_HI=
GH>;

This is different than sdm845. I guess pdc is working?

> +                       qcom,ee =3D <0>;
> +                       qcom,channel =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
> +                       cell-index =3D <0>;
> +               };
> +
