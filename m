Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814A354DC1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 09:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358783AbiFPHrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 03:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiFPHrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 03:47:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950A51FA70;
        Thu, 16 Jun 2022 00:47:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2361361CFA;
        Thu, 16 Jun 2022 07:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5CDC34114;
        Thu, 16 Jun 2022 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655365658;
        bh=xM9/cgON2nz3dKfwJ1LtFCCHSLfScPkXYszFLkpV8kg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bx4J7oI3WQmKlGfWmGxrNduDIjt1njPafOLoFNcFIoZPO+2ErifnDfygFRZD9SHcY
         q7+gMu2NBm01qef6UK7yhxNkoZoxw0RPvMCOB1ZFbY4agherxtMBWwo2A1USe+e3Dx
         Uw/Xarp8pKqjKHMqIPkzlhpVBzZ7xuTxZ1fWAjG0J6iqW3x5yldi1+KkRKTTbcs/9D
         F1hQxt9VDiix+sx22xuozod1mAF8dUT3+swpOCPGv2+ZbMcwGepHyKO8EYjQZcd7l8
         lGMPrfWuf0q/OvM3neRSXK3u6L2bG+4jJwtt8LuBoN0L4Jf6zbhbwCRKPNdYDFjB9k
         RSfs1i0yo8cmw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
References: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v7 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Thu, 16 Jun 2022 00:47:36 -0700
User-Agent: alot/0.10
Message-Id: <20220616074738.7E5CDC34114@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-10 03:49:09)
> The patchset adds support of a camera clock controller found on
> QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
> type of pll, its generic support is added in the series.
>=20
> Note that SM8450 ES variant has a slightly different configurtion,
> the published version is intended to support SM8450 CS SoC.
>=20
> Changes from v6 to v7:
> * rebased on top of v5.19-rc1,
> * fixed a warning in a usage example found in yaml file.

I missed this one and reviewed v6. I think most of my comments still
apply.
