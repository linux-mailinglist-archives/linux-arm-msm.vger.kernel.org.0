Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC6654FF9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243885AbiFQV7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 17:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244217AbiFQV7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 17:59:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33515D1BC;
        Fri, 17 Jun 2022 14:59:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0611D620C8;
        Fri, 17 Jun 2022 21:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55995C3411B;
        Fri, 17 Jun 2022 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655503150;
        bh=28MIC8K+jnNzeFwd7wGJI7dGjMfzCZd+nWqs4JPMsIw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OpjZNsdkV9SoDgiFTmwtc1SmIIyxkIDDkViobO4/GtXQqmVDqY9I20Y1WzsfG+kq2
         cfXokcV6ZyHdskQMJmRLg53vcESooOZnyRc7pHnrP4kNhi2qDJnq6BZM/iersBMJd6
         Hs18wndXKHyK4G5a8tNrztH2w0rL2EvOZK7jXycHsPqDav4EILqrACFLesM6tdpLTM
         g8SYCok368XXJfwk3OGzbFh1YwLa6/BJpPtzt2Ao6IvfN0UNhRD5ZQ2ntJXpR7B85Y
         D3SU9y3TmByAEl4PkOVvRpm3BTPa5FoD7isCqZMWUPIWvRh9vEfxhmF2Ibx1py497J
         fZUt1FCcqO8cw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/6] clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Fri, 17 Jun 2022 14:59:08 -0700
User-Agent: alot/0.10
Message-Id: <20220617215910.55995C3411B@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 05:29:19)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
