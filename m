Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0BB42CD83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhJMWMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:12:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230312AbhJMWMa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0042161130;
        Wed, 13 Oct 2021 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163027;
        bh=pbGIzeH7lr0l+cXXI6HRhGSu+27o+zz6WsxR9ZHGpWE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ct8fGDqC8FA92VTSNl0TN/09lhE3k+BITN0tPtH1hXw1SKlTnwM9HDCtMWhCSlfV+
         M+eFr2gyybJoLgf3zoqdJE0qSVRfR76Y+Y2CGJnGxpZtbf1BmDp+vmv91tbKHV6Jws
         IcaEfhE4OJI+bw8/7FWfARS6AVphbvJaEHY4sYugT646SUWSDhgEl6bvsGAUWgfpF4
         WKsIjrB9lM9NIV1RGsNcVxFQk1sJ05NRzMmIYkT2piJg2/EV2PxWVdH3A4YT8k73b/
         az+SR1usOd2RGpvsQaiZG0P3P90qZrtRz6KUYM1rLO8IeqetM64DeNUc2rTL/3yvjN
         Un8U9ujm4CBTw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-9-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-9-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 9/9] clk: qcom: gcc-msm8994: Use ARRAY_SIZE() for num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:10:25 -0700
Message-ID: <163416302578.936110.13535057184944225764@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:42)
> Don't rely on the programmer to enter the name of array elements, since t=
he
> computer can compute it with much less chance of making a mistake.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
