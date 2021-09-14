Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2E040B9B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhINVO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:14:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233927AbhINVO1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:14:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1E9B610D1;
        Tue, 14 Sep 2021 21:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631653989;
        bh=HwYpxQ7sN5n2PdiyK4p8MenarwP3iXMeNHSZvB3qwTE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PIZ0M48sn7IloX1B83xjJSzuxXyCHE7WMSgonvXeSZond9u+JSZvSIvviVAYrfnT/
         AX7i0qfN3ropTTlT8wXNBG3+Zcqgu8dD+hT0PL6UGIYIDa0wV/UkDYuMdtv67EJVFR
         uCX/P1ckOdI9RHueUF3w9DUy1h17Oz0X37VD5KtMx25DFUS9fyH7rt1ksID8sg/fpy
         hYxvqqleS6c9XnJ+S1753zTE1joUfEhdh/Ewp/+wim0OrqLNBgOb+ehyZ8YvJ1tEGI
         Itnid96IsJv5yTBTyXyu7NyDni1DVNhqx9NJPdvNaCTs65SrV39Dw9ue4So1jORfkA
         rZJy6DGqGduOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829204822.289829-3-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org> <20210829204822.289829-3-marijn.suijten@somainline.org>
Subject: Re: [PATCH 2/4] clk: qcom: gpucc-sdm660: Use ARRAY_SIZE for num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:13:08 -0700
Message-ID: <163165398865.763609.4450929296020429904@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-29 13:48:20)
> Where possible, use ARRAY_SIZE to determine the number of parents in
> clk_parent_data, instead of hardcoding it.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
