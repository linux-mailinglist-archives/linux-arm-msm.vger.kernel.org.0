Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B052940199E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 12:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241751AbhIFKTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 06:19:01 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:44697 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241736AbhIFKTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 06:19:00 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B86491F8A3;
        Mon,  6 Sep 2021 12:17:52 +0200 (CEST)
Date:   Mon, 6 Sep 2021 12:17:51 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] clk: qcom: gcc-msm8994: Modernize the driver
Message-ID: <20210906101751.nskjnpn6mxctzjx5@Marijn-Arch-PC.localdomain>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
 <20210904183014.43528-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904183014.43528-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-04 20:30:06, Konrad Dybcio wrote:
> Switch to the newer-style parent_data and remove the hardcoded
> xo clock.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Though we'll probably end up on the same fallback discussions as for the
other qcom boards.  In this case it looks like mentioning we're
intentionally breaking anyone who doesn't update their DT in parallel
with the kernel should be enough, too.
