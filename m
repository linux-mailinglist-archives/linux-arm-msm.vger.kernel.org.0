Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DD967BEFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236376AbjAYVrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236219AbjAYVra (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:47:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB9B5D914;
        Wed, 25 Jan 2023 13:46:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D4DC61698;
        Wed, 25 Jan 2023 21:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A3EC4339B;
        Wed, 25 Jan 2023 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683182;
        bh=zZ1I+g37SnkykOpCfGGiqZt08/+0r7+dh9tgYDsffKs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ImRv1Yxa77LFRvEBOOmOZXHVPmDNzg7FkeHi0LHnHXVfgYVRNQVvgWdpX+g5Fe8ju
         rDrbBI0rl/Wvjbuwnfc2CV7zsZbw4xae84iHi9Nyn5JsZN1BQlDXt/i40owc7lFRBa
         YW0wgDnkY8JTqEXTkS9judrteNIUMK0jyHj3rss5f6TfxEhdCYAlNbF3HKfz2E6Lsq
         NJWXV165olFN61EAhCVBE9n0nWXtQjpYhySKEahSZ45Z2ADsQGbHSCV+uMZNQ8XDIE
         RUzzQ16yzFXaXWiHQ3aYCw6wT+xbTvYCmtXo6hCihp5xF8EMyI3tXkFGGtWYZNfxKs
         kyz9STLwQLtaA==
Message-ID: <9b7443768c8e0640be411a401385b1ff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-6-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-6-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 05/12] clk: qcom: gcc-apq8084: move PLL clocks up
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
Date:   Wed, 25 Jan 2023 13:46:19 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:55)
> Move PLL clock declarations up, before clock parent tables, so that we
> can use pll hw clock fields in the next commit.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
