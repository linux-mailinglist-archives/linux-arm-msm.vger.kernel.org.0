Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786EF4D3E85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Mar 2022 02:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbiCJBCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 20:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiCJBCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 20:02:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB56911B5DE;
        Wed,  9 Mar 2022 17:01:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75F95B81EA0;
        Thu, 10 Mar 2022 01:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5BFC340EE;
        Thu, 10 Mar 2022 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646874067;
        bh=6UEIgVOw8k+OrqS4J+lLdn3tPa3K3WVN7d7NXfC7aSg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=URGAioaF5PsegKj1xAeHmGbWrg0p+Q0EkJwQxmu6SuiWpwOygqhcQm0AH64PxYDSl
         MkiJuZS7KNNilzZyAfPEh+8b4g2Nf/NKSxawV1kkeIiC3N89Yk3SSPYG7cg8lA5/X5
         XnELM424Osz/DCwqbqOwGEI22qsOk0/o0DbKND0FGWnmVOvBr+6Gap6+lSQfbx7DUP
         BF/idcFwu34RhIRgdVtNScb/anzOLdmpYkR2XrGTB5cfHjKoeHvyXYH2wtOVM43w4J
         JajJGlrvlExddbvzHa6xjScBH1Qvei+zMu0B45moQ2dO/snGgFnjTcmkIquwNY9mSN
         YZ98DLQ5kweCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228120334.997058-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org> <20220228120334.997058-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 3/8] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 09 Mar 2022 17:01:05 -0800
User-Agent: alot/0.10
Message-Id: <20220310010107.1F5BFC340EE@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-02-28 04:03:34)
> After merging lucid and trion pll functions in commit 0b01489475c6
> ("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
> the function clk_trion_pll_configure() is left with an old description
> header, which results in a W=3D2 compile time warning, fix it.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
