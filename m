Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C18E351FFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 21:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbhDATi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 15:38:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:39654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235189AbhDATiZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 15:38:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C6D960725;
        Thu,  1 Apr 2021 19:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617305905;
        bh=QdvxlxtMyb8x4i3wfiSD/hvhgbhy1KUxJGkoBoITRYo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gnkLU6buTian4CFVNSThr4NT7undfX+NSRwwaommL7PS+DE5P5HMuOqr2gc0lBX/9
         G6+CTcAGLpx8Vd1ypcfs3taGmcGdZxjS89dzJupVNLWS6PYxCsu4G/g1paWc/ojraP
         uqHdXDGTbo4/XiJs+5CuObzsJpvxZHReBtrNMBD0T63Jcb/WcUfeqcs0NtQjjVlmjZ
         k1RI17sY7ZBNjMd48t3AADbInmlqLNn2bOtBatK2U7i0vY/xPO8VZWpLoDIBT+FB55
         ARY0eNrkxHBuwdV7bcJ7AkqmAcVzdYN7z+R4P9cO3N8zUeoRmvmQX9g8l+lr0hJWlc
         HIyid5fgq+X1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3947caa6-71fb-371c-cf8e-78348435c830@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org> <20210313021919.435332-9-konrad.dybcio@somainline.org> <20210324171117.GA3260515@robh.at.kernel.org> <3947caa6-71fb-371c-cf8e-78348435c830@somainline.org>
Subject: Re: [PATCH 9/9] clk: qcom: gcc-msm8994: Add a quirk for a different SDCC configuration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>
Date:   Thu, 01 Apr 2021 12:38:24 -0700
Message-ID: <161730590437.2260335.9611290766189379085@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-03-24 10:12:34)
>=20
> On 24.03.2021 18:11, Rob Herring wrote:
> > On Sat, Mar 13, 2021 at 03:19:18AM +0100, Konrad Dybcio wrote:
> >> Some devices come with a different SDCC clock configuration,
> >> account for that.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >> ---
> >>  .../bindings/clock/qcom,gcc-msm8994.yaml         |  4 ++++
> >>  drivers/clk/qcom/gcc-msm8994.c                   | 16 ++++++++++++++++
> >>  2 files changed, 20 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.=
yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> >> index f8067fb1bbd6..9db0800a4ee4 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> >> @@ -49,6 +49,10 @@ properties:
> >>      description:
> >>        Protected clock specifier list as per common clock binding.
> >> =20
> >> +  qcom,sdcc2-clk-src-40mhz:
> >> +    description: SDCC2_APPS clock source runs at 40MHz.
> >> +    type: boolean
> > Why don't you have some input clock you can get the rate from?
>=20
>=20
> This is a SONY-custom hardware change and that's as much information as I=
 can get. Schematics are not available and it's solely based on the downstr=
eam kernel source.
>=20

Presumably we can add the extra frequencies to the frequency plan array
and not need this extra property in DT. The consumer driver should be
able to pick the correct frequency.
