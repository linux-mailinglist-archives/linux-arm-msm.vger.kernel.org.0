Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67B15F01FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 02:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiI3A4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 20:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiI3A4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 20:56:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D354115A0D;
        Thu, 29 Sep 2022 17:56:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B6A2B80D8B;
        Fri, 30 Sep 2022 00:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D79FC433D6;
        Fri, 30 Sep 2022 00:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664499369;
        bh=g6rkz3RIaOilCZhlixcS0haE9FoSoSH5hsZdpPW9BtA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UwDUxTkV48fQXo1vQUjHDqLiAnJrhd6r9C/cSa8kjn5BmMru0mBnPqB6wXqPxY59/
         ZbestpUFZnk1baSsb+44XHRyF6M4YMVT/Ob49rLhn9PK4VBh1i4UJX6f5Au2Q9hXRP
         3idej2kyfyQuM2/60QhB3Im8GRQmHiY0w67Ay3aAOP6n29YoI/rTbRZRdDy9rh0WBH
         1FYwi9dOSXxKyNpAGopCV4FlYeVZaRs4eK5iaMnzL0wb2o7O8fSCNhCZAPX5Qw76po
         6+IMwg14TPFcwtnZyw5ppgyIF2jBloZr1Dtfai/1vGjvDt80L6wR1DrwRhNX2qp4fj
         QnvAAS3um+4vg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220916061740.87167-2-dmitry.baryshkov@linaro.org>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org> <20220916061740.87167-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 1/3] clk: asm9260: use parent index to link the reference clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 29 Sep 2022 17:56:07 -0700
User-Agent: alot/0.10
Message-Id: <20220930005609.1D79FC433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-09-15 23:17:38)
> Rewrite clk-asm9260 to use parent index to use the reference clock.
> During this rework two helpers are added:
>=20
> - clk_hw_register_mux_table_parent_data() to supplement
>   clk_hw_register_mux_table() but using parent_data instead of
>   parent_names
>=20
> - clk_hw_register_fixed_rate_parent_accuracy() to be used instead of
>   directly calling __clk_hw_register_fixed_rate(). The later function is
>   an internal API, which is better not to be called directly.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
