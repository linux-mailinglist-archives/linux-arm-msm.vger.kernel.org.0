Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804CE46E467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbhLIIm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235056AbhLIIly (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:41:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658C5C061A72;
        Thu,  9 Dec 2021 00:37:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2ECF5B8235A;
        Thu,  9 Dec 2021 08:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFC1C004DD;
        Thu,  9 Dec 2021 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639039062;
        bh=XxZL0ybk61ShxSfQB95pxm6KRPkoppC6iIlakxPZjvw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qNr4l6qg6msjRvQWgw+6j2M4XLrDDK67MzEYEDUBR5JnaPa7Hmu4btHWSG1/s3vr1
         PCypRH4qii6H1N3erizk1xASl0SE+rWxFB92YX2zQ6y42er3LzSBOxyYEBKP3/5clb
         dZeXTJog1T4NxAv9/6Y45QIE0eVImV5WXOZe/gOZT9VXWaDdx3a/svdehTT3iCeF4v
         hPa5ENi1PWalrTtN2dWwClnnl5RcsGaLwIJhItXjE1OkJiqV29JS2yJY8B3LUPbP7C
         9KNtz5jk3bp7Z4CkFwxli8xDogGlnyEW7iKzxfJoDVXvYujjxuUggzVuhFyoSDjfsG
         G0rJW0+CxQ0jg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org> <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:37:41 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209083742.CEFC1C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-07 18:22:10)
> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> was enabled by the bootloader, part it to the TCXO clock source.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
