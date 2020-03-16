Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AA91870DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732116AbgCPRGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731809AbgCPRGw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:06:52 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C3F22051A;
        Mon, 16 Mar 2020 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584378411;
        bh=y8YnBcrYokh9Z5evjYr1Y+QlYfGU/D0AiiVSEzV+ZBU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AO8g3I0lMQ7fkLvIyr0Dc82McstD3gf6hDrkasd2moH7Q/GQznLY6XNmSfCNQ7rOf
         nWuQ4l6JmoTkVpxSdk1/u5LjCWUXyqabzFowgG1cc3XkWE43cHdZ+29mL/agZv6glh
         PE8sdrCe4OkCG8thPDBZCChi9T1EL/b8bZl/rwxY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 0/3] Add GCC clock driver support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 16 Mar 2020 10:06:50 -0700
Message-ID: <158437841065.88485.7233548150714328597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The subject of this cover letter is too generic. Is it more like

	clk: qcom: sc7180: Add secure clk and more QUP frequencies

or so?

Quoting Taniya Das (2020-03-16 03:54:39)
>  [v1]
>   * Add a new frequency of 51.2MHz for QUP clock.
>   * Add support for gcc_sec_ctrl_clk_src RCG for client to be able to req=
uest
>    various frequencies.
>=20
> Taniya Das (3):
>   clk: qcom: gcc: Add support for a new frequency for SC7180
>   dt-bindings: clock: Add gcc_sec_ctrl_clk_src clock ID
>   clk: qcom: gcc: Add support for Secure control source clock

Is this for sc7180? Please indicate as such in the subject lines.

>=20
>  drivers/clk/qcom/gcc-sc7180.c               | 94 ++++++++++++++++++-----=
------
>  include/dt-bindings/clock/qcom,gcc-sc7180.h |  1 +
>  2 files changed, 59 insertions(+), 36 deletions(-)
