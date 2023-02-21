Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3847469E891
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 20:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjBUTus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 14:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjBUTur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 14:50:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEE22886E;
        Tue, 21 Feb 2023 11:50:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A94D66119B;
        Tue, 21 Feb 2023 19:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0640AC433D2;
        Tue, 21 Feb 2023 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677009046;
        bh=4pFYujkIIj3nZDzFEzqRviEyB6tqYrIhzxjyaw31c1A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=btqnOAsdn15Ts55Nxw2aJcJ4iRHC39TSlbwWQLpJjBSkVjxC7xn200fmYaXCKZqUG
         wFrKuwO1A6wJpI09iFNNWcnfcMyYoEu1oACj99f8pdfxRVNhKiXIHejgqbwkhJFoCf
         RmGWzUtZ8lxXPwghQ1sviRF5tZbVKwW0krPjGpMmtMXBwsnnzmkNjJbUhLAG+Amm72
         EHGE4rbGYpKJQv3QUk4mJOXcVF4PcAAxNMRs6YoDOg55NzajefbXowWSSJ5A4ROQ2p
         +DjUhy0px2vdrEh/T80R1ESRbcEdQCi4JDTz1B97UmlxS38exyG4maVn8kA0v1GE1w
         UR8+Ih2w8e31A==
Message-ID: <e62613b331da617d53515998a2c967d1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230219045318.564342-1-andersson@kernel.org>
References: <20230219045318.564342-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Tue, 21 Feb 2023 11:50:43 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2023-02-18 20:53:18)
> clk_disable_unused() is altered, to not consider clocks which comes from
> a provider with sync_state defined. This makes it possible for
> individual clock drivers to invoke this process once all clients has
> been probed, avoiding the need for booting many systems with
> clk_ignore_unused.
> This is then enabled for SDM845 and SC8280XP clock controllers.

This needs to be reverted. I'm not going to pull this until then.

>=20
> Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
> clock controller, SM8550 TCSR and display clock controller, SM6350 clock
> controller, nd MSM8996 CBF and APCS clock controllers is introduced..
>=20
[...]
>=20
> Bjorn Andersson (5):
>       Merge tag '1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.co=
m' into clk-for-6.3
>       Merge branch '20230104093450.3150578-2-abel.vesa@linaro.org' into c=
lk-for-6.3
>       clk: qcom: Remove need for clk_ignore_unused on sc8280xp
>       Merge branch '20230103-topic-sm8550-upstream-dispcc-v3-1-8a03d348c5=
72@linaro.org' into clk-for-6.3
>       Merge branch '20230112204446.30236-2-quic_molvera@quicinc.com' into=
 HEAD

When you make merges, please describe what they're for and put that in
the commit text. Also, reword things like 'into HEAD'.
