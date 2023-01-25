Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A660E67BF40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbjAYVwu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:52:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbjAYVwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:52:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48088F9;
        Wed, 25 Jan 2023 13:52:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D771A61630;
        Wed, 25 Jan 2023 21:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36352C433EF;
        Wed, 25 Jan 2023 21:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683519;
        bh=TY4o5dagrbt61V4TZEvK9mdCX8mT/FTVOwkVa5yQQ7Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RYLep0pUvHjElHOQPuG2CZnoFBga4UYAheYEFLZyJ1wIEAB0pkNzLFZJsMNsjhnRA
         yW/2Yduk339IVXJ4rjN8Qt8W+TOVebpxutuOr+beiwY9JkCmSIoAQRxVJWSyDWGibi
         G9cPtrRj+eFE6Pi0doxvIqWzDpzsRHnuDa6Xi+4fxdx7bVKuvcWoQLPOPK5siqNymJ
         HlIEghEiyZFIMjuWUKEiERe8OM8INnWopTrsVLIRfNpk8yLAgLOattOAZ6fFiZPsuY
         IsVHMllAYu55YC67AvY1VCBc16RimagW/ufb2hdjB4EHaaKqvnHgBAFv73CoM4FcAi
         pBsm+SKJrUNPQ==
Message-ID: <7c194442b1b68027fe98976358386aa6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-12-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-12-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 11/12] clk: qcom: mmcc-apq8084: use parent_hws/_data instead of parent_names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:51:57 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:04:01)
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
>=20
> Note, the system names for xo clocks were changed from "xo" to
> "xo_board" to follow the example of other platforms. This switches the
> clocks to use DT-provided "xo_board" clock instead of manually
> registered "xo" clock and allows us to drop qcom_cc_register_board_clk()
> call from the driver at some point.
>=20
> In the same way change the looked up system "sleep_clk_src" clock to
> "sleep_clk", which is registered from DT.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
