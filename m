Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BAE54D9F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 07:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358467AbiFPFrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 01:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358367AbiFPFru (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 01:47:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C13C12A86;
        Wed, 15 Jun 2022 22:47:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57182618E5;
        Thu, 16 Jun 2022 05:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C42C34114;
        Thu, 16 Jun 2022 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655358467;
        bh=ZttEY2NvSb7x5/Up3/3pUh3L+VgpnfAoXr6u8ygjARc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nRJ7YQXI5sPkOR8vBBT73zJX3izwBjg1XoYWBKCFtr3rEwU1oJo4TCRODUas3gy0k
         ls4BNqAe+yH7N+Fu9POQZFsfBeUJeViqFYfq6KDq04vFw7GF7gvqpztcpReeAvQxNd
         XjQ7UvXQu/TdZ8b6O6w/8vWz6aAP/4mmnA1S/y0EGxJvm3azRDfnHfEIjwtIKfrAWR
         4NFQjldHDC5ZLb6UnpDnKS4eSeON8sA9XhLf+biyIJfRwtW0kp7kzybNK6aNNpY1Nr
         rFwAeUiQh163fTFJahurKz3dxvmT6ymgOXmwdYZl6iXarAnI81tmKORyUREvHXZiWG
         Hcuoci0LMx8IQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220603080103.2251847-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org> <20220603080103.2251847-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 6/7] clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 15 Jun 2022 22:47:45 -0700
User-Agent: alot/0.10
Message-Id: <20220616054747.B5C42C34114@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-03 01:01:03)
> The change adds and exports Rivian EVO PLL configuration and control
> functions to clock controller drivers.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
