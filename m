Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C00129CC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfLXCcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:32:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:52236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbfLXCcv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:32:51 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A3EC206D3;
        Tue, 24 Dec 2019 02:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577154770;
        bh=4whlzjOZ1PaK/dlyssukvxUhLq/v60UFxX/uNAaITl0=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=wopk+vdO0Bfig1ogmH3NegoC6kZuk8mHrDRBWb4C7eCcslfp0Nrzn7OR4XZLI7N0n
         p256hI3X7prQtZCXmrjJILt2so/6gi3WStipZh8xeeqxNgnEOAlYrScvI5v40dgi8n
         1vRNOv569DIQTPWigPZXI8ldUE/bUsHM/n/x7E04=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 0/8] Add GPU & Video Clock controller driver for SC7180
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:32:49 -0800
Message-Id: <20191224023250.5A3EC206D3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-11-15 02:04:56)
> [v2]
>  * Split Fabia code cleanup and calibration code.
>  * Few cleanups for GPU/Video CC are
>     * header file inclusion, const for pll vco table.
>     * removal of always enabled clock from gpucc.
>     * compatibles added in sorted order.
>     * move from core_initcall to subsys_initcall().
>     * cleanup clk_parent_data for clocks to be provided from DT.

Can you please resend with comments addressed?

