Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E0254FFA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 00:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244217AbiFQWCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 18:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242164AbiFQWCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 18:02:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABE15DA41;
        Fri, 17 Jun 2022 15:02:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6657620CE;
        Fri, 17 Jun 2022 22:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C07C3411B;
        Fri, 17 Jun 2022 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655503331;
        bh=72pXmZ6V0+wVJEHfPORA/Kru3cDr3Nbp2x3i6u7zZL8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m/LKrwFU7xZb1M/hMSLHCdK1DSaatM2ic8c0qOUeAJVUp3dwsj8oqug18t/CtZTt0
         SaimzNxh00c4fmipONyiHHovVIO0S9LdVcT/dkwuHCKtRxZqUIoLVFeZZG1en4ISL7
         QXVkrYZXlcuzg65a0W5TjQai68T3Jk0Eo1qO6T0xpCOB1QerrxHL4bDaOzQPN83khJ
         BZ7M0iaWeLS/3Lv8a0AnhoDmNqEFaBz0RQN1rKnOJkzVp4R91O4wZs4oZNr8/UQHOS
         B2QXLqxkmN/vyAcByAaZyYJFDEaE/SzobnZVofQBtV8JI7feO1Q8TEyjSU8I1tTMav
         dkRH8baQd9nTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC device node
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Fri, 17 Jun 2022 15:02:09 -0700
User-Agent: alot/0.10
Message-Id: <20220617220211.28C07C3411B@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 05:29:22)
> As we are converting this platform to use DT clock bindings, add clocks
> and clock-names properties to the MMCC device tree node.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
