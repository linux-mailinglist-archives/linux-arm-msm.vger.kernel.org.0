Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AAD54FF9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiFQV7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 17:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235162AbiFQV7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 17:59:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EA05C858;
        Fri, 17 Jun 2022 14:59:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A422CB82BAF;
        Fri, 17 Jun 2022 21:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669C9C3411D;
        Fri, 17 Jun 2022 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655503183;
        bh=zy6L7cOz31JZWfj/ndIAVYcWt3ZjgMONdHOEx5WKreQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LqaPs5HLs7nOzh4kIcKf8NRCqD7dHXJa+wgFDOcoIvL/bEeyJPfExDNWQflD+qUdO
         Dl2L4rD1Yz6k7yS2EpdOSSLcrza4mnppJwFHs9TRi14P3ssrFksjF7ExcvyOD5mCIW
         8P9eNKrZ7lNQUK833n4XNSJzjQFo//NjT49O8qhD2Mx8CN7wIJnzcbw5mTHSfBiAkc
         0+3hwqe2KZQQ2RoxvtM+UOJYVRJc3sFoCeR6xzVmPQetZSK2pViKNndW5MsbjWfZ9K
         UF86Ouc3buyKHooGNWpAGZ7VSh42nwh1Q5j2D02W6nPmx0WY90SKbjWZvzMvEXw+j6
         HLuzA0hmijK4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/6] clk: qcom: mmcc-msm8996: move clock parent tables down
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Fri, 17 Jun 2022 14:59:41 -0700
User-Agent: alot/0.10
Message-Id: <20220617215943.669C9C3411D@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 05:29:20)
> Move clock parent tables down, after the MMPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
