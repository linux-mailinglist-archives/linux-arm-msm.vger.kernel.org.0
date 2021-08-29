Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658A83FADA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 20:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhH2SI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 14:08:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:44544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232927AbhH2SI4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 14:08:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1D7A60ED4;
        Sun, 29 Aug 2021 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630260483;
        bh=KPAQinMx3ezIBjmro4mBpyem8leoYO+pxREtXKJmt4I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=maIvZJChiJDYIH9W1i4GksLuMPkh+03Jd0UPqtiGq80ybPVjiYM5x/vTCpGh57K4g
         FZSJ4pIFOrwY5wFpSgrexUKpLAVfVjC2lLJ2cr9Bu7jOZYW4mpyA18MqwUH0MwNEBX
         Fa50HbbAbnZOSPz0U3noALALNUFTI0i3urO6CDo56+9dfQz2l4AlJEpS4A7ZTkkv+k
         Ug4WCt2o0cPlF2qKfftaW2oslxAdOuLoa494c18Z6IaD68HP/ELR9cAr8YEV0uc3lE
         fbXqCFrVdk8ZVyXg0z4MEh71JpNxVdtW4Z0RdmV5tIZnDRo1Z2o7kNGY30enycwLTk
         b13BuH8IXGvIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <786ebd3c-0596-1090-760d-b75751fcb505@somainline.org>
References: <20210609145523.467090-1-konrad.dybcio@somainline.org> <786ebd3c-0596-1090-760d-b75751fcb505@somainline.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 29 Aug 2021 11:08:02 -0700
Message-ID: <163026048249.2676726.2106086525271489846@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-29 07:09:38)
>=20
> On 09.06.2021 16:55, Konrad Dybcio wrote:
> > Add documentation for the MSM8994 GCC driver.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > ---
> >  .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ms=
m8994.yaml
>=20
>=20
> Since the MMCC got merged, could this series also be reviewed?
>=20

I don't see it in my queue anymore. Resend?
