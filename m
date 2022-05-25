Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F3E533732
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 09:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236707AbiEYHQB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 03:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242858AbiEYHQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 03:16:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4195712AE6;
        Wed, 25 May 2022 00:15:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59F186174D;
        Wed, 25 May 2022 07:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B467CC385B8;
        Wed, 25 May 2022 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653462956;
        bh=RXMykJGS/2JzKZK5GKmBLKtiLNk5ITFtnsXy+ogPa1A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V0GurQPCsP0TEBqN6KJ6m887PlXT69Jww0f9hRiv8Nkscx4fW1bOk+Y8xHP+w2IKX
         FrRriiVQU3SOA/UULRxAD+4gCgP9kft+d9xA/37Kz+fcaOfQNtFPjparj7TyBD5sXt
         bbOYykKW8DUkc1AMpq4wrtK9QMtRWrNj+njlWMysDvPLbS6Nk4KvZsBt4gcPnFRBFm
         cvyCcccrPzr56wBMp2jIuMf1p4MzZBZlmrlfgJLaWzf3QfDdZ1Tr6x4c1EnDVm2x2g
         8yXabBvRUGprHWLnPFHVCRNG5ByGLjlnYD0mdlNeliB4R0vZMlydnSHdYc5DBGetWT
         UNmHsidQaBZHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523145632.42086-1-bjorn.andersson@linaro.org>
References: <20220523145632.42086-1-bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v5.19
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Taniya Das <tdas@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org
Date:   Wed, 25 May 2022 00:15:54 -0700
User-Agent: alot/0.10
Message-Id: <20220525071556.B467CC385B8@smtp.kernel.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-05-23 07:56:32)
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc=
17:
>=20
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-5.19
>=20
> for you to fetch changes up to 703db1f5da1e3a62b84356a29c150efa24a2377d:
>=20
>   clk: qcom: rcg2: Cache CFG register updates for parked RCGs (2022-05-19=
 16:42:30 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
