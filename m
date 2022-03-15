Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910144DA40F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 21:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbiCOUi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 16:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237765AbiCOUi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 16:38:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E71A4BFF7;
        Tue, 15 Mar 2022 13:37:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D36F360B89;
        Tue, 15 Mar 2022 20:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293D6C340FA;
        Tue, 15 Mar 2022 20:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647376633;
        bh=/b4vCj+wePpz0Cx1dk2J9m5iFlRl2HG/Zlcl7lyh6mg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZFfdMIygGk3snRixW7kHlZYa822LyySAzqVl5egAZeOAY41n95U2GgVU1oYmI/aAH
         nGqbNx0gSK8CYSZfE11yP4RY4AxW/LEaCeE/iMoesZ8cMEZUDdnLwkHScLl/fDS2a6
         +PhbEDppQ10BgJQnxvfwZyLknNfPPCAWb37oTYFXZKvD+Nv7YG5RFSRQBa/5j4dEIv
         ZqVyoc4LhwkOjbRb/o0jJ8XoVkNjX/qf1nfnr3uqo7Yf8qfKy+uUUmteZgvq7XZRZx
         OBnoXJr/7IWiZLON9VDuKmE1rpDAZAPTwQMKTa4A+vwGuKoycNHmcD3AkkxfP89dcS
         iAh8TZcbxV3Lw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220311041957.2611885-1-bjorn.andersson@linaro.org>
References: <20220311041957.2611885-1-bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v5.18
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Tue, 15 Mar 2022 13:37:11 -0700
User-Agent: alot/0.10
Message-Id: <20220315203713.293D6C340FA@smtp.kernel.org>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-03-10 20:19:57)
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac=
07:
>=20
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-5.18
>=20
> for you to fetch changes up to 6e87c8f074075e10c5352d3256879b4e6dd6cb81:
>=20
>   clk: qcom: Add display clock controller driver for SM6125 (2022-03-09 0=
8:53:30 -0600)
>=20
> ----------------------------------------------------------------

Please Cc linux-clk on pull requests.

Thanks. Pulled into clk-next
