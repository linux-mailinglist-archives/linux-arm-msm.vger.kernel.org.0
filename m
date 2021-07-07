Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409B63BF1C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 23:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhGGV5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 17:57:35 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:59808 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229956AbhGGV5e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 17:57:34 -0400
X-Greylist: delayed 1225 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Jul 2021 17:57:34 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1625693659; bh=uVLcTeTi9/NfOuP9ILJQsYxEqwD0GlA+5zKs0YR3vDs=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:MIME-Version:Content-Transfer-Encoding;
        b=GBs/uke5gFPa3oWiTA5V8ZpviZkGRbFONX446DC/mbnkmTb4FRhjaJfuOYKRjeWO2
         qdIqc0V0kS5Z/Gcrv3H0dX67MHm1JEONUlEHCeLe9MZFivCo02jyvgaVEsyuzYkTux
         xggDGGp2vaf57eGmwGROAiq42abvoR/0ZELUSHME=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Wed,  7 Jul 2021 23:34:19 +0200 (CEST)
X-EA-Auth: qxLiGfzMY0iYof9pXOFmNbfz6GyxS7hNbOM3VyP6p733skERCuG09izmvGam57+QvZ4haxsk1duhgCuDrjM8Xc8+jmwl2xUr6Ig6lz2usSo=
Message-ID: <c780e9df1b2f1eef6af1c9a10662f5a1952a1fae.camel@mailoo.org>
Subject: Re: [PATCH v2 0/4] Add MSM8939 APCS/A53PLL clock support
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Shawn Guo <shawn.guo@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 07 Jul 2021 23:34:19 +0200
In-Reply-To: <20210704024032.11559-1-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le dimanche 04 juillet 2021 =C3=A0 10:40 +0800, Shawn Guo a =C3=A9crit=C2=
=A0:
> This series adds MSM8939 APCS/A53PLL clock support.=C2=A0 Most outstandin=
g
> thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
> (little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect=
)
> respectively.
>=20
> Changes for v2:
> - Reword the commit log of first patch as suggested by Stephen.
> - Drop 'clock-output-names' bindings and use @unit-address to get unique
> =C2=A0 a53pll/mux clock names.
> - Use 'operating-points-v2' bindings to pass frequency table via OPP, so
> =C2=A0 that we can use one single compatible for all 3 MSM8939 a53pll.
>=20
> Shawn Guo (4):
> =C2=A0 clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
> =C2=A0 clk: qcom: a53pll/mux: Use unique clock name
> =C2=A0 dt-bindings: clock: Update qcom,a53pll bindings for MSM8939 suppor=
t
> =C2=A0 clk: qcom: a53-pll: Add MSM8939 a53pll support
>=20
> =C2=A0.../bindings/clock/qcom,a53pll.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +
> =C2=A0drivers/clk/qcom/a53-pll.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 68 ++++++++++++++++++-
> =C2=A0drivers/clk/qcom/apcs-msm8916.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++-
> =C2=A03 files changed, 76 insertions(+), 5 deletions(-)

Hello,

would you have a msm8939 dtsi/dts reference file working with all recent
contributions for this SoC ?
We the msm8939-focused PostmarketOS gang would be happy to boot our devices
and test patches but we're not able to boot anything more recent that 5.9..=
.




