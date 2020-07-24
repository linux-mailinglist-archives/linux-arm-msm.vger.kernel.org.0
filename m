Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1D722C147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 10:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgGXIwH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 04:52:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:36820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbgGXIwH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 04:52:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D4C2206EB;
        Fri, 24 Jul 2020 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595580727;
        bh=5CMLOYH9rqGnyzsf6PNFcCbSam1UM0LIppKL8dTKrpg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=livVGLPWbD8Z3xQNNSbi/57/V9VWEjUjmt/ICPcxnIQBxT3f9y3rzl6DYXZXRw53M
         LUcJuC8IDJg3d29dzdiQ+Y6QJbwERUulWbsqSByp2rAzmjody734VRVwpYdxQa5jAY
         fhSYRMdLbXzS1KRtKTjqslzEja62qxXhfsioSFPE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709135251.643-2-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca> <20200709135251.643-2-jonathan@marek.ca>
Subject: Re: [PATCH v3 01/14] clk: qcom: gcc: fix sm8150 GPU and NPU clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Fri, 24 Jul 2020 01:52:06 -0700
Message-ID: <159558072654.3847286.3474867436730591942@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-07-09 06:52:32)
> Fix the parents and set BRANCH_HALT_SKIP. From the downstream driver it
> should be a 500us delay and not skip, however this matches what was done
> for other clocks that had 500us delay in downstream.
>=20
> Fixes: f73a4230d5bb ("clk: qcom: gcc: Add GPU and NPU clocks for SM8150")
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
