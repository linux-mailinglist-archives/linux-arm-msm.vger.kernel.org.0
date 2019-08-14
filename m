Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560558DB68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbfHNRZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:25:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729547AbfHNRF7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:05:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB1F52084D;
        Wed, 14 Aug 2019 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802358;
        bh=SUSCWt4xADsQMaH8+atQZsd7pBSYIKD5PVgyeC0Sc7E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F3QEhYWRy8PZBbWJ9+3RRUXDylL5Jpml3gB5zrbcuc36EuLCXGqosdX3Z1f2CPIYR
         BJtvqinnV/8D6Rd6T8nxleFg1Euqa98S5FYLIDYqsKpy9TmmSRQajcJKb81TEhtRYK
         PXLmc4KeIkeKESHHjQbzl+95are40ZUT9I/CscLo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-10-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-10-vkoul@kernel.org>
Subject: Re: [PATCH 09/22] arm64: dts: qcom: pm8150b: Add Base DTS file
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:05:57 -0700
Message-Id: <20190814170557.DB1F52084D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:59)
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/=
qcom/pm8150b.dtsi
> new file mode 100644
> index 000000000000..c0a678b0f159
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +       pm8150@2 {

pmic.

> +               compatible =3D "qcom,spmi-pmic";
> +               reg =3D <0x2 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +
> +       qcom,pm8150@3 {

pmic. Funny this one has qcom, prefix!

> +               compatible =3D"qcom,spmi-pmic";
> +               reg =3D <0x3 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +};
> --=20
> 2.20.1
>=20
