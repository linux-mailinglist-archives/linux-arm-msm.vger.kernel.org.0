Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0094747679F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 02:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhLPB62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 20:58:28 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33610 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhLPB62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 20:58:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3BD0CB8226F;
        Thu, 16 Dec 2021 01:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8662C36AE0;
        Thu, 16 Dec 2021 01:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639619906;
        bh=lMPrp7luTDh7Q2f13X6B4VyWxo8Cwn3X9X/oPuxUdlg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kFv7d25BF0TsrWzBYvojpTi7CmLTDfouRd+kFqDxVKXSuetpNeGwOBSRO/RO3NPY/
         IU8YeuUFJzDCxnzAp1kSnqufEuxmthhNDLQjBi/oIn3BDOXrOndTormvuMc4MqfMhi
         RBkj3ZK2pqYHYhsilQjLLMDaCUjQRjVkoInZ4nZ4qKC1iWf1IsdCAuNKF2fsvqcmQb
         SFZAMmYQMyOv2cpxZ+dIZ13G0SXmL7+Mcwe9ampGWnvnKpecEmZfd/r3pjJAYbT77e
         oABFqdZdrKHdDpxqk+AxUqNJtHZUCNCA+YqrbyEGCP+0ISon+3Cu/6WF7KfRYgyw0U
         3CiAl7r5WReaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215193704.2821775-11-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org> <20211215193704.2821775-11-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 10/16] clk: qcom: camcc-sdm845: convert to parent_hws/_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 15 Dec 2021 17:58:24 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216015825.E8662C36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 11:36:58)
> Convert the clock driver to specify parent hws/data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
