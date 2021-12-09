Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCF246E3DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhLIIQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:16:15 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:40732 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbhLIIQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:16:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C8264B823C5;
        Thu,  9 Dec 2021 08:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76622C004DD;
        Thu,  9 Dec 2021 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037559;
        bh=TpaVzPxU55vxCFTda3eDMwmj07XaiRMTdlgxcODFIZw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FhrCawgKr846Sk7NBX1vfHNSE9ldXJjGToL1j0Y5vb1mOjEClIEghYWbbTm6icu9R
         hghUfQlnMulaXsYWOPPxzZrjompjqZo7GuQIBymiYASZv30iaZlLd/S2DIf7Irpuxf
         IVnJWgRTyV6P4sHXSneO09rSBw3ryNgyeTMxRezXI0AXN4XV6CpMBBNpgJws+OSqpv
         GN5TLmE/6rBMB3slHi/mNTwQ8Q29mxkDG6aPsRyX6/3xjmYip3ibghghwH/jzaoVOo
         cY5kdO26RPvzwn/fdbZse/Uh6pS9J8LEVAUj5JyIstvlzwuvY8G3xNo/89/h2WklK7
         m4JeucwFyWchA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-10-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-10-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 09/11] clk: qcom: gcc-msm8996: move clock parent tables down
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:12:38 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209081239.76622C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:28)
> Move clock parent tables down, after the GPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
