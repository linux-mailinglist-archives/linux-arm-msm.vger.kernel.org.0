Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF4C85949
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbfHHEai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:30:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbfHHEah (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:30:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7B4821743;
        Thu,  8 Aug 2019 04:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238637;
        bh=nvwF2+KdwyI4UGYj21vt+3CtbNYbMYbMetlaZyjLv9Q=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=CuZ7jZ5I1b09LZ3RJqahGY37J/jDB/G9iKwBXE6H8TXeIBV6Aw/1Ve9zPL5CuS0cT
         g31YE6XSarWUfRzojGDICko+DRkOMRGWkYI+eL/jUKF1IgsvO5KM4zt6Mb7yRf4sSY
         Jvzi9RyIr9jpEWFQ0LMVYgM6obWepPoVoq1cnbws=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722074348.29582-4-vkoul@kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org> <20190722074348.29582-4-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 3/5] clk: qcom: clk-alpha-pll: Add support for Trion PLLs
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:30:35 -0700
Message-Id: <20190808043036.D7B4821743@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 00:43:46)
> From: Deepak Katragadda <dkatraga@codeaurora.org>
>=20
> Add programming sequence support for managing the Trion
> PLLs.
>=20
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up
>         use upstream way of specifying PLLs]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

