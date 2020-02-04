Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963C3151FE9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgBDRsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:48:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:45086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727527AbgBDRsE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:48:04 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FC0E20674;
        Tue,  4 Feb 2020 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580838483;
        bh=lLk0HQRqXI2cqN0QUU8/A6q7IGy7LN4gQziie9o/oOA=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=d+z/vgiV2QM29YUmzuW1+6EmnZiMBm4v57lavjqYRllZf6X349juGE4uIErR5GRJ5
         vcSK/VhSQw76g7nQZ3NMnlIyYptzxajSNpcDcFoL6Au+wXV5OtkHnLIRbUCvMnT8Iu
         jFwQuY/7x7wJb04cqKRhi0Dv4PqoG/XIskP4lnxo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203103049.v4.6.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.6.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
Subject: Re: [PATCH v4 06/15] clk: qcom: Use ARRAY_SIZE in dispcc-sc7180 for parent clocks
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
Date:   Tue, 04 Feb 2020 09:48:02 -0800
Message-Id: <20200204174803.8FC0E20674@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:39)
> It's nicer to use ARRAY_SIZE instead of hardcoding.  Had we always
> been doing this it would have prevented a previous bug.  See commit
> 74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next

