Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA0957F37A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 08:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiGXGnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 02:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiGXGnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 02:43:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D4213FBB;
        Sat, 23 Jul 2022 23:43:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51B1DB80D54;
        Sun, 24 Jul 2022 06:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04BBC3411E;
        Sun, 24 Jul 2022 06:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658644991;
        bh=tZxegO6ur8PlTGS1UjePWsxcvunt/rCsD/1qlVekkqk=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=Ny6c3LHAPRRIJjcTiyT/vOx3b/ufPjWY0gyHx4cQ4MnjUaJll6Qr1sIQ0N08j7yQb
         tl8F0iesRjc8KkKc3lkKU6UVQ5sZv2w4MW8aASusLabIhtKhTtUZlcBsTYiCYtFQTk
         w/A0UVqcmCxbYpPUzHVnCd7IuKSGVzYc1dweXJN9qh2zQGzNt+uRjvjbqxQ08JaclY
         ynO36/VsnO5kh0a1scBmpxGOdqFfefRIDUic/pbyF/bpa1cl04lkLTzhChtpvbEis+
         enpCq+Z1cw98Co9ise5trl16GsXin9T4L2HJTSy+NTDbQ/7uiYUl3+hmv/F6HJ+X34
         P0lToPvWKCCOA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <833fa178-22fc-c47c-a7b8-2444de3bf9cc@somainline.org>
References: <833fa178-22fc-c47c-a7b8-2444de3bf9cc@somainline.org>
Subject: Re: Increasing the maximum message size
From:   Stephen Boyd <sboyd@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Sat, 23 Jul 2022 23:43:09 -0700
User-Agent: alot/0.10
Message-Id: <20220724064311.D04BBC3411E@smtp.kernel.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2022-07-23 04:44:32)
> Hi,
>=20
> when sending new clock drivers for Qualcomm SoCs I've been repeatedly
> getting a bounce with a reason of "too long (>100000 characters)". The
> drivers are pretty big for one email, for example gcc-sc8280xp.c has
> 201071 chars, but it only makes sense to add them big-as-they-are,
> because there are simply so many clocks, each of which needs to be
> defined as a struct with its properties set correctly.

Maybe it's time to collapse the structs into macro definitions.
Probably a decade ago I expanded the macros that we had because we kept
modifying the struct members while settling on something that described
the clks. Now it doesn't seem very useful to do that because the structs
almost never change. Certainly the struct members aren't changing
rapidly. I'd start with a macro for branches, rcgs, and plls and see how
small it can become. Hopefully there aren't many parameters to the macro
so that it is still somewhat readable.
