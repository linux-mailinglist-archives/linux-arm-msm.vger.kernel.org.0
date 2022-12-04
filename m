Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9281641F48
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 20:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiLDTZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 14:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiLDTZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 14:25:43 -0500
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BC410B48;
        Sun,  4 Dec 2022 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1670181910; bh=BN4Yxoc6WAoOrqgGgqUNWiyWrjKRRO9S8lDVUGEoGR4=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:Content-Transfer-Encoding:MIME-Version;
        b=Z69X3WLgn3qvQtuXy50cHO5De6/oEbalrOEhgZRqmW3n8y01ROM8sSBvkcMqOCW3r
         DPi1m9iA0AzG3AG1v2ox95T4Bkxu1pvaV9kwNrpi8wX9jxPWPUIE8fU1OL9jYMubC8
         fHkRP/08v6L7zeQFLNQkdi8DcGKbe+JBIRM6ni+o=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Sun,  4 Dec 2022 20:25:10 +0100 (CET)
X-EA-Auth: /kXLJbkaOaSWqX87hlMC1d+ptdkDlK8r8EcVv7CAEcpjg7ovQn5c8MlNYcwabDXqszjvD4qWa+RZdevdgaCAXPEsQviTSNc8rAs9scPBbLU=
Message-ID: <b0d37b049ebedd5e04f69d505afb36ab6f0a1492.camel@mailoo.org>
Subject: Re: [PATCH v2 08/15] thermal/drivers/tsens: Drop single-cell code
 for msm8939
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Date:   Sun, 04 Dec 2022 20:25:07 +0100
In-Reply-To: <2186df0393c6cf4dab88772aceed7202090f5a1d.camel@mailoo.org>
References: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
         <20221204055909.1351895-9-dmitry.baryshkov@linaro.org>
         <2186df0393c6cf4dab88772aceed7202090f5a1d.camel@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le dimanche 04 d=C3=A9cembre 2022 =C3=A0 19:42 +0100, Vincent Knecht a =C3=
=A9crit=C2=A0:
> Le dimanche 04 d=C3=A9cembre 2022 =C3=A0 07:59 +0200, Dmitry Baryshkov a =
=C3=A9crit=C2=A0:
> > There is no dtsi file for msm8939 in the kernel sources. Drop the
> > compatibility with unofficial dtsi and remove support for handling the
> > single-cell calibration data on msm8939.
>=20
> Could one invoke a "msm8916-like exemption" here ?

Ignore that, guess we'll just have to implement it like there:
https://lore.kernel.org/linux-arm-msm/20221204055909.1351895-9-dmitry.barys=
hkov@linaro.org/T/#m19cffb13114b6f4f153058e3e7a1943251acaf81

> Also, msm8939.dtsi was submitted once [1],
> and if helps we could send a v2 this month...
>=20
> [1] https://lore.kernel.org/linux-arm-msm/20220419010903.3109514-1-bryan.=
odonoghue@linaro.org/

Offer still stands, the current community one is here:
https://github.com/msm8916-mainline/linux/blob/msm8916/6.1-rc7/arch/arm64/b=
oot/dts/qcom/msm8939.dtsi



