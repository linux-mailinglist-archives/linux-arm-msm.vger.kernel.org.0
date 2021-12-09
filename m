Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B0546E3BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhLIILs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhLIILs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:11:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44125C061746;
        Thu,  9 Dec 2021 00:08:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F104B8235F;
        Thu,  9 Dec 2021 08:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2643C004DD;
        Thu,  9 Dec 2021 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037292;
        bh=zzRthVBZy7jtugBiHwLyEbFpl9EjNzzTtDDRw3uMwZw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WDh2ZzoVTU6Ix82z9w4Vai+kXnKnBpKXBfqt8SttJs3yvMMzf+tLxXxDYy9Nv71S3
         RtSm8gvTd3SppPaU1PFpRLGjB/kRflWHZ0J9ObYlR/NNRdekuC9gODDoL2GJqupUXS
         9KKRZSSSc2fFa01fq+OkKyK+RkzyvJ257g/GKXVKvyxzv7/xfDFLFjIoOPXQ1TjRYq
         aj/N41RBC6uwZkHShPokobYj8aTKLw2O92UMN/9wPndVnGs8hh2HPHH3wWiY4rR+Qr
         +Pg/KEqkt6HLNakpI2f5BgUmzDkFyizM81NUmGWl5AYWPSwNeX0CxGc60Tz/9RLLUJ
         yVVYeCRZ5LbLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-3-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 02/11] clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:08:11 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209080812.B2643C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:21)
> If all parents are specified as clk_hw, we can use parent_hws instead of
> parent_data.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
