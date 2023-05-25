Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C796E71049B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 06:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbjEYEzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 00:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239101AbjEYExd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 00:53:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F3A1718;
        Wed, 24 May 2023 21:51:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6739864210;
        Thu, 25 May 2023 04:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BF9C4339E;
        Thu, 25 May 2023 04:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990299;
        bh=TiYXFha0y0SkSE8BfE7qy1j6+jU4E8TyT4vtyCRDZYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JCyMmfqEEcyDchbnJj2tn/Btm9a/pdqhit10DgRyZ8A+RkZG6hfckSSxg1le7tR/p
         S+R1rlh3RnMmw8bjOIDOu7Us5WFFtbvNE4o8z6UDeOfWcJaPHQ+TcQIHTr880PS6Wb
         fw7UtBmejltRMMEZYinS2lE7TktYLiJSteZ2e5evIWXF/Ex7tdZGH50i6WWCtE4wIG
         bFgdBX/WUr1FyoyL6lSwY/a6KngJv6ZYPLZttjoDFzp4oaR25GdbdT1O3A7P9dZCu4
         kvk0yUlOtdl+1Qf63JJhLtsk+Emzx9EPgUlNA4/Wd069wFscP1MYJLTlXm3TzgtEh7
         LEXOg8C152qNw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom-apq8060: Fix regulator node names
Date:   Wed, 24 May 2023 21:54:19 -0700
Message-Id: <168499048183.3998961.954244735419569878.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414135747.34994-1-linus.walleij@linaro.org>
References: <20230414135747.34994-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Apr 2023 15:57:47 +0200, Linus Walleij wrote:
> commit 04715461abf7 altered the node names in a DTSI file
> used by qcom-apq8060-dragonboard.dts breaking the board.
> Align the node names in the DTS file and the board boots
> again.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom-apq8060: Fix regulator node names
      commit: 8b9ca2f3ea456cd37dc3e1ccfac3c2b02384640a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
