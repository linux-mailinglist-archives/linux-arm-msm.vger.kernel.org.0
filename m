Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6211914BFA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 19:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgA1S0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 13:26:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:55144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgA1S0Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 13:26:25 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B435B20716;
        Tue, 28 Jan 2020 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580235984;
        bh=9ewcN2O5qMb8PXgwQCNtPCHOqHJ2hu7wTnO6mYD83Bo=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=tONrKzXYOyHaEZJhUhd6sC98+LKTUspFPj0ZXCVqVMCQ7v5uqKrThgHjjVxJ/SvT5
         MDROXNhVdZDml8NtiqJiSdm7CVhKoL1YkGrvvc6UV8PgQy5pp9iufVQJObZqpXA0U8
         bYWSTYBCIAzy6/gkuKOwYive1CSSy7IQxlH5K3h8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200122134639.11735-1-dafna.hirschfeld@collabora.com>
References: <20200122134639.11735-1-dafna.hirschfeld@collabora.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-binding: fix compilation error of the example in qcom,gcc.yaml
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com
User-Agent: alot/0.8.1
Date:   Tue, 28 Jan 2020 10:26:23 -0800
Message-Id: <20200128182624.B435B20716@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dafna Hirschfeld (2020-01-22 05:46:39)
> Running `make dt_binging_check`, gives the error:
>=20
> DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
> Error: Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.2=
8-29 syntax error
> FATAL ERROR: Unable to parse input tree
>=20
> This is because the last example uses the macro RPM_SMD_XO_CLK_SRC which
> is defined in qcom,rpmcc.h but the include of this header is missing.
> Add the include to fix the error.
>=20
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---

Applied to clk-next

