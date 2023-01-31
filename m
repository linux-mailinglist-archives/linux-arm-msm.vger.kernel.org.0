Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAB468382F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 21:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjAaU7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 15:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbjAaU7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 15:59:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4D040DE;
        Tue, 31 Jan 2023 12:59:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 358F761708;
        Tue, 31 Jan 2023 20:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD8AC433EF;
        Tue, 31 Jan 2023 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675198773;
        bh=lKNkdaHS12BqYEBiuf1N69cfFnQ2rTJmQrnnYck9JT8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gdHRAMRuEAeWWO2oMfvbJ36rQgu5JZB1E9zqo2bkvgOwvjIpi5Wys6hAtpTX9ZnHy
         k9OEdb26mgdZXr6ziRYLbsPN5vb89Pecw7GGI0dWr7LZy+OEzDkzVM52OXqEVag2GR
         pwrScD3cUgx9GLHlnCZ77rVZ1ZLyTfCpHefcoMRLy9Zj9TYoEboT6D2FcMoKk8hPYU
         MskPxmXiQxbgMvodVnHOusavfnmsI26BAvsFDtwcIXMV6B+ac0q0KmPr5LFSKnVgXX
         kALCxqZ5pXMyPxSypDnDfzOnJa981a9wMqeYiCuCgoc+McH0YERWrqqvd/nXSjpOju
         /wg9BWdsNThOw==
Message-ID: <d04a457c762b7204823e0dc60f4a5862.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
References: <20230131092432.122711-1-dmitry.baryshkov@linaro.org> <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Tue, 31 Jan 2023 12:59:31 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-31 01:24:32)
> The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
> registering the GDSC (writing the value 0x2 by default). This will
> override the setting done in the driver's probe function.
>=20
> Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
> function.
>=20
> Fixes: 453361cdd757 ("clk: qcom: Add graphics clock controller driver for=
 SDM845")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the _val postfix

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
