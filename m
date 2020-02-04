Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D89FB151FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgBDRrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:47:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:44878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbgBDRrj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:47:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF79420674;
        Tue,  4 Feb 2020 17:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580838459;
        bh=Q0xu3XjP+haTlsJNS1uvrXz5OMZCOkeRq+FvEvAXb9I=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=HCTQojWxnRW6BF7ghGVv3drsMg2aAv+S+W5ChG7MKQitHPubQtAVtginYrVHOuTvV
         FjyYLLOsW0tk8eqrB4INNDgriN/EHrCuvkyf9ZJeWtir677C4pcaKnPRAW4GVJ1EzG
         7Vkui1tEgOiRdUyu6ki5s792GOnlPPflganqLP7I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203103049.v4.4.Ia3706a5d5add72e88dbff60fd13ec06bf7a2fd48@changeid>
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.4.Ia3706a5d5add72e88dbff60fd13ec06bf7a2fd48@changeid>
Subject: Re: [PATCH v4 04/15] clk: qcom: Get rid of fallback global names for dispcc-sc7180
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
Date:   Tue, 04 Feb 2020 09:47:38 -0800
Message-Id: <20200204174738.DF79420674@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:37)
> In the new world input clocks should be matched by ".fw_name".  sc7180
> is new enough that no backward compatibility use of global names
> should be needed.  Remove it.
>=20
> With a proper device tree and downstream display patches I have
> verified booting a sc7180 up and seeing the display after this patch.
>=20
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for =
SC7180")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next

