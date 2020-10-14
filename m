Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C7A28D865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 04:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgJNCRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 22:17:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:59318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJNCRg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 22:17:36 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 735DC21775;
        Wed, 14 Oct 2020 02:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602641856;
        bh=rLwlc9SDThYtlcLphUcJMxKphFxSe5mBZQCEIABZVJI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FCILaO9ga6M9nnBglW0ZOrhjcBGSGGvEPvtXgFFQDgZNjW3uYOw0r4PewU9u8Ugym
         Zk43Yam9dsap96Z/l2lBjf3LTyrc5FXro4qlrywNs2q+xwDTAqvcFdWhPY93j2cVtL
         GH7KnWUuNFHeatgFaiI1ONgCC2og6OgrJF3NKJKw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201005225914.315852-2-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org> <20201005225914.315852-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: qcom,dispcc: document power domain bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Oct 2020 19:17:35 -0700
Message-ID: <160264185528.310579.14541322701061808038@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-05 15:59:12)
> @@ -97,5 +108,22 @@ examples:
>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;
> +      /* this is a part of sm8250 setup the power domain example */

What does this comment mean?

> +      power-domains =3D <&rpmhpd SDM845_CX>;
> +      power-domain-names =3D "mmcx";
> +      required-opps =3D <&rpmhpd_opp_low_svs>;
> +    };
