Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2087151042
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 20:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgBCT1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 14:27:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:49302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgBCT1p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 14:27:45 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 701982080D;
        Mon,  3 Feb 2020 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580758064;
        bh=OeOjjlrDJsexINpj9LNgFIWpebvdSE75SdU8RInKyx0=;
        h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
        b=Gw3vYtw+E0WcIktjLCFxFG63EPrDzg3u9RFnB9D0MIdWsQ0EkZ4EtFc9uzEVZAzQM
         eXnnaH6gIAWYqvGv7A+yp1B3ZzaxipbTgXD3y26sQENWoJK46VwG7Fekm0MXNuDzI9
         r1K0Def9526I2sD0eATq1cAg2wuKh7A0Svc08a1g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203094843.v3.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
References: <20200203094843.v3.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: clk: qcom: Fix self-validation, split, and clean cruft
Cc:     tdas@codeaurora.org, anusharao@codeaurora.org,
        sivaprak@codeaurora.org, sricharan@codeaurora.org,
        jhugo@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 11:27:43 -0800
Message-Id: <20200203192744.701982080D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 09:49:43)
> The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> because it required a property to be either (3 entries big),
> (3 entries big), or (7 entries big), but not more than one of those
> things.  That didn't make a ton of sense.
>=20
> This patch splits all of the exceptional device trees (AKA those that
> would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> cleans up some cruft found while doing that.
>=20
> After this lands, this worked for me atop clk-next with just the known
> error about msm8998:
>   for f in \
>     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
>       ARCH=3Darm64 make dtbs_check DT_SCHEMA_FILES=3D$f; \
>   done
>=20
> I then picked this patch atop linux-next (next-20200129) and ran:
>   # Delete broken yaml:
>   rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
>   ARCH=3Darm64 make dt_binding_check | grep 'clock/qcom'
> ...and that didn't seem to indicate problems.
>=20
> Arbitrary decisions made (yell if you want changed):
> - Left all the older devices (where clocks / clock-names weren't
>   specified) in a single file.
> - Didn't make clocks "required" for msm8996 but left them as listed.
>   This seems a little weird but it matches the old binding.
>=20
> Misc cleanups as part of this patch:
> - Fixed schema id to not have "bindings/" as per Rob [1].
> - Listed include files as per Stephen.
> - sm8150 was claimed to be same set of clocks as sc7180, but driver
>   and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.
> - In "apq8064", "#thermal-sensor-cells" was missing the "#".
> - Got rid of "|" at the end of top description since spacing doesn't
>   matter.
> - Changed indentation to consistently 2 spaces (it was 3 in some
>   places).
> - Added period at the end of protected-clocks description.
> - No space before ":".
> - Updated sc7180/sm8150 example to use the 'qcom,rpmh.h' include.
> - Updated sc7180/sm8150 example to use larger address/size cells as
>   per reality.
> - Updated sc7180/sm8150 example to point to the sleep_clk rather than
>   <0>.
> - Made it so that gcc-ipq8074 didn't require #power-domain-cells since
>   actual dts didn't have it and I got no hits from:
>     git grep _GDSC include/dt-bindings/clock/qcom,gcc-ipq8074.h
> - Made it so that gcc-qcs404 didn't require #power-domain-cells since
>   actual dts didn't have it and I got no hits from:
>     git grep _GDSC include/dt-bindings/clock/qcom,gcc-qcs404.h
>=20
> Noticed, but not done in this patch (volunteers needed):
> - Add "aud_ref_clk" to sm8150 bindings / dts even though I found a
>   reference to it in "gcc-sm8150.c".
> - Fix node name in actual ipq8074 to be "clock-controller" (it's gcc).
> - Since the example doesn't need phandes to exist, in msm8998 could
>   just make up places providing some of the clocks currently bogused
>   out with <0>.
> - On msm8998 clocks are listed as required but current dts doesn't
>   have them.
>=20
> [1] https://lore.kernel.org/r/CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-P=
ZniVny7w@mail.gmail.com
>=20
> Fixes: ab91f72e018a ("clk: qcom: gcc-msm8996: Fix parent for CLKREF clock=
s")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

