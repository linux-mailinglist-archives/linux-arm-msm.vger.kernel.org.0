Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E86490D4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2019 08:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfHQGOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Aug 2019 02:14:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36915 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfHQGOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Aug 2019 02:14:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id 129so4223455pfa.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2019 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=rtrt6LI0kB9Ic333TWUlAKHRv4Q2jYrB/26Rv0snh/E=;
        b=bDT/QN6cxlVrIY718QCMopmCxupc4zbElQJoF19VhRged6LQpfFYwm69Fvt/N96DBe
         Xe+3a++GYRrHwT3iCyEsZLIrt57nm46uh4bQuQg92232w8Mrgvp8ZEQW9eCH1K1zW08S
         DU7+kgLUaoXHPhpRsljeBIcy84zb54zzGzIe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=rtrt6LI0kB9Ic333TWUlAKHRv4Q2jYrB/26Rv0snh/E=;
        b=T3QzLt0ipo1CHogRT3KKrMHZjQxw5UQwziKBX7qIkrQWMiz5nUuQhYYXrLL3pyxsWx
         UBbIV0YD8kQEFwHHvixSbLai5bnQKUJev6HdTifywqN6PXJ/MZlSNVWdcfWmDcZFv7Am
         6gvk+xp8F5vauImrGhwWY6xOo8TG1h0KeVhPVonSkAlkYP0KGrDFoUupMkn5+t5Kj66L
         RC/bqkZ5WuZ0p+5um/5AFZv30q8COVjVentEIBDJXlf37wTr5G/RhJTYNizrhbqXTQ5+
         JgOHu3J4TfqE5r+MFS5XaeLrnaQz7Bmyu0UXo7fS53ITcNXMgNF//l5m7seQLxf41+9b
         b3Cw==
X-Gm-Message-State: APjAAAXUHbgDNLUX22xZkF2LwhoiiWg9Qvyy8cFqfVk5t587FKbHbhdG
        bAidjCq34sSEtM+j0fjFZYfZz+BeuQAVDw==
X-Google-Smtp-Source: APXvYqy6fACf9rLZ9XVYhUtfzGxg+iUKJz3wFEDMst7bInlXADMiIls0FrVXsaO0pvxu6z3GAjazGg==
X-Received: by 2002:a63:460c:: with SMTP id t12mr10639473pga.69.1566022455934;
        Fri, 16 Aug 2019 23:14:15 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id cx22sm5709533pjb.25.2019.08.16.23.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 23:14:14 -0700 (PDT)
Message-ID: <5d579b36.1c69fb81.85eba.ff51@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190725104144.22924-11-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org> <20190725104144.22924-11-niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 10/14] dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, vireshk@kernel.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 23:14:13 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2019-07-25 03:41:38)
> +       cpr@b018000 {
> +               compatible =3D "qcom,qcs404-cpr", "qcom,cpr";
> +               reg =3D <0x0b018000 0x1000>;
> +               interrupts =3D <0 15 IRQ_TYPE_EDGE_RISING>;
> +               clocks =3D <&xo_board>;
> +               clock-names =3D "ref";
> +               vdd-apc-supply =3D <&pms405_s3>;
> +               #power-domain-cells =3D <0>;
> +               operating-points-v2 =3D <&cpr_opp_table>;
> +               acc-syscon =3D <&tcsr>;
> +
> +               nvmem-cells =3D <&cpr_efuse_quot_offset1>,
> +                       <&cpr_efuse_quot_offset2>,
> +                       <&cpr_efuse_quot_offset3>,
> +                       <&cpr_efuse_init_voltage1>,
> +                       <&cpr_efuse_init_voltage2>,
> +                       <&cpr_efuse_init_voltage3>,
> +                       <&cpr_efuse_quot1>,
> +                       <&cpr_efuse_quot2>,
> +                       <&cpr_efuse_quot3>,
> +                       <&cpr_efuse_ring1>,
> +                       <&cpr_efuse_ring2>,
> +                       <&cpr_efuse_ring3>,
> +                       <&cpr_efuse_revision>;
> +               nvmem-cell-names =3D "cpr_quotient_offset1",
> +                       "cpr_quotient_offset2",
> +                       "cpr_quotient_offset3",
> +                       "cpr_init_voltage1",
> +                       "cpr_init_voltage2",
> +                       "cpr_init_voltage3",
> +                       "cpr_quotient1",
> +                       "cpr_quotient2",
> +                       "cpr_quotient3",
> +                       "cpr_ring_osc1",
> +                       "cpr_ring_osc2",
> +                       "cpr_ring_osc3",
> +                       "cpr_fuse_revision";
> +
> +               qcom,cpr-timer-delay-us =3D <5000>;
> +               qcom,cpr-timer-cons-up =3D <0>;
> +               qcom,cpr-timer-cons-down =3D <2>;
> +               qcom,cpr-up-threshold =3D <1>;
> +               qcom,cpr-down-threshold =3D <3>;
> +               qcom,cpr-idle-clocks =3D <15>;
> +               qcom,cpr-gcnt-us =3D <1>;
> +               qcom,vdd-apc-step-up-limit =3D <1>;
> +               qcom,vdd-apc-step-down-limit =3D <1>;

Are any of these qcom,* properties going to change for a particular SoC?
They look like SoC config data that should just go into the driver and
change based on the SoC compatible string.

