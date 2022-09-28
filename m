Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29135EE6DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 22:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbiI1Uxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 16:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiI1Uxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 16:53:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2592714E;
        Wed, 28 Sep 2022 13:53:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 602CCB82205;
        Wed, 28 Sep 2022 20:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0740CC433B5;
        Wed, 28 Sep 2022 20:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664398421;
        bh=ocFBmEiwZMRP7w+7fMfISRMoKTm7UBOQU5qR7s5Rmuo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k54kgPcXtivmQY4T31/OWA57l84e+fyBWESkWISW1rwRdAGp7C38bnZNgThTBCunQ
         Pl1N0QYUWSKXTuWoDmxeR8Te7/gwapDrvoZ7mZk8/mW1VcHlctX2uE28mZQUl0Ft0P
         CWpn2IkbRp5uPEmRwhtIyx3lI/Tko4KgVeyJ26Vg4rLdXD3+YTkKUy/92ECXszn4hU
         9Jf7Se7yS0Ul7YOlJ2BMzBdgnin6uJ4tVj9h6uQaxaHUa/ZBzQo3HsXIZ8x0QPsDQ8
         DAs1aSbLtL0mH8H/mYoyXHI04y+PBzLuVX7OIfJ4e0B6Z58ExTlLLDbTE8zbABiqrR
         H88GDad92KG7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <50374fb8-563f-6433-12c9-8ff77fa38e83@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org> <20220928145958.376288-4-dmitry.baryshkov@linaro.org> <50374fb8-563f-6433-12c9-8ff77fa38e83@linaro.org>
Subject: Re: [PATCH 03/11] clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 28 Sep 2022 13:53:39 -0700
User-Agent: alot/0.10
Message-Id: <20220928205341.0740CC433B5@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Neil Armstrong (2022-09-28 08:23:14)
> On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> > Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> > adding/removing entries to/from parent_data easy and errorproof.
> >=20
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Please trim replies so I don't have to scroll down to the bottom to find
out a single tag was added.
