Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92D42D690D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393856AbgLJUpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:45:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:50190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404422AbgLJUpL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:45:11 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607633071;
        bh=SXi2HBbTi2Ktp+5K+01P6ZkTQWFFUTcMMxHB0SI5dyU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tzbaKAC/0VfKmJXbBMJfm7B//dwkecsebePW3cs3CJvcJpCYcWOAUXI9E+arB4zkW
         qM821r5r5rqotvfoHirW5poLR5DxH2KmvzxXyxA0xbtPCH+BsJZGvupZhN1mrl7cn+
         9hO07rIePETgnxBPy8CMBv+fpxomb/ub1alY5OxKymOsNQ+W54spTjzpeYNqJxUkx5
         oXTXhfme3rSax+3IWD86OpQIa9BXbdQTzu218a3YL+NgA9cjeeMhoF2E9w2nS1Yd/G
         1JTOg51JovErMchlLSyWcMxvZkjhtxdQw58oSxMqaKl/qAzWHTSzZ1KcXEyAUoDw+p
         7z8xjZGztNocw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201208064702.3654324-2-vkoul@kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-2-vkoul@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add RPMHCC bindings for SM8350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 12:44:29 -0800
Message-ID: <160763306956.1580929.12735191050933840872@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-07 22:46:58)
> Add bindings and update documentation for clock rpmh driver on SM8350.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
