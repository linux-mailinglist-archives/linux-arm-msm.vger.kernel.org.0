Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF37854DA04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 07:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358723AbiFPFvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 01:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiFPFvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 01:51:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CDF5B8A9;
        Wed, 15 Jun 2022 22:51:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 996AFB8216D;
        Thu, 16 Jun 2022 05:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC4EC34114;
        Thu, 16 Jun 2022 05:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655358679;
        bh=3cRGekhZ4eepikaWRbIBgfRwpMpeolZTt3TwFRIuzQM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d9YHhkh6bBC8GM9dQIm2Gk7SzIZeWmgWRmmzx3VHWkOL1eXkcHri6OM+SK7pZuPFq
         6H7FlfawR/pH4p/FstfFJZT/m+3rootnTf8meMKjDN3WhAbteInO9lE7vgAKVzefYf
         yE8YCLqB1TaafWxMjuCr0fHt6uDBVOKwAscn9x7u4TjhDCv2Q74vApIpWC/xwCfE/6
         Sw1hcApcv7t/mZG3qSIhARRqdrgp3/jZwC4SXn3ZchgUm3xtnLj6Ag6aNudLvvz6qr
         GA0ZEGs8a0fkQBGhRrKLwmHRcAaW9uCv/hZUDg0MjjtKdZC2RQainpqK/B1IHq6sfK
         qA/EoKUdliqYA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220603080058.2251809-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org> <20220603080058.2251809-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 15 Jun 2022 22:51:17 -0700
User-Agent: alot/0.10
Message-Id: <20220616055119.3BC4EC34114@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-03 01:00:58)
> Unify all exported PLL clock configuration functions and data structures
> as GPL symbols.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
