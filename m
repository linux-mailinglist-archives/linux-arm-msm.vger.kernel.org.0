Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5713554FFA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 00:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236107AbiFQWBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 18:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiFQWBG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 18:01:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1225D1A4;
        Fri, 17 Jun 2022 15:01:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 890B3620D4;
        Fri, 17 Jun 2022 22:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FE2C3411B;
        Fri, 17 Jun 2022 22:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655503265;
        bh=bQ1dAF1qDYgdOmo3nkb3devawGGSEo3xA0fInJTp/dE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t1Lk9DPBiIrL5eCYJsqv2Kq6TmmblafzeqT0m1VRmp8DnkDmP6POXAZ0LdlC85Peo
         Wlm0aXlEfWAJCUWCWMj9oiDjLmczVU0vixzqEsUFJrBDfrvM5JJYN4oyUgpOYfUCdp
         UKStAI9tqQSffmVstSKpkLOW7iPXcF2SbiXytmA1zoToCs2nNBQzPn+QkS8P1BGG9p
         sMnLokPtREh9YndjqeH5b9IlxRwKXWQSM/ZztFs+/YDBnbzIlEgESJK0XocsuZDU73
         vApNlnD+TATQtjkr1mZBhEEVqxAyQnTADtp2SkY4otXPfITfiBSEU5KpaFpSMPcEi3
         jdDskS7f/F/cw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Fri, 17 Jun 2022 15:01:03 -0700
User-Agent: alot/0.10
Message-Id: <20220617220104.E0FE2C3411B@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 05:29:21)
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Any reason to not move directly to DT index numbers instead of string
names?

Anyway,

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
