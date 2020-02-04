Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00811151FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgBDRsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:48:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:45528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbgBDRsj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:48:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E371720674;
        Tue,  4 Feb 2020 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580838519;
        bh=jcus+T/8+cKZfnbYK+lDrSjM8cn61TU+amRCc4w1Q64=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=wPSutMdZlUO5ZamIkljesF74uWmiFYBBmYVqu/KAQ3f5UWmv9R8bzsIT5tw5lv/jW
         rSb94hW92NUNTFJbm3Uwu0bMsxj+hhIYn5x+jBbe1ksiYb/FYw0qkI1k2CQlee1p67
         dKCuqSzzO0imlMeXkB9zA7Jgx/aV0aiTwxKXf6aQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203103049.v4.10.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.10.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
Subject: Re: [PATCH v4 10/15] clk: qcom: Use ARRAY_SIZE in gpucc-sc7180 for parent clocks
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 04 Feb 2020 09:48:38 -0800
Message-Id: <20200204174838.E371720674@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:43)
> It's nicer to use ARRAY_SIZE instead of hardcoding.  Had we always
> been doing this it would have prevented a previous bug.  See commit
> 74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next

