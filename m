Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EC2131659
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 17:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgAFQzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 11:55:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:48544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgAFQzq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 11:55:46 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 484402072E;
        Mon,  6 Jan 2020 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578329745;
        bh=r/gL3xL0bP+hz0aZoUX/RJVh/m700l8OJ/DXqxnkKQw=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=rxoHZA8XR4MjGJthBCiv4gJ7EmKp7bqDTzao7EHDqrTQDNu5ZusIbXyAZ8Kg2+cgu
         0D9wOTBK6CeX4Rlmcp2PsxFtb53a4NfdrVxT8T1Qfi3vnubz67wUXE9iCNhABYTK8v
         pEiCKvDI+eivtZJ/3zJMFMau40LNQXSaMv7DmkFc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200106080546.3192125-2-bjorn.andersson@linaro.org>
References: <20200106080546.3192125-1-bjorn.andersson@linaro.org> <20200106080546.3192125-2-bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 06 Jan 2020 08:55:44 -0800
Message-Id: <20200106165545.484402072E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-01-06 00:05:45)
> The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
> SoC. Update the definition of these clocks to allow this to be wired up
> to the appropriate clock source.
>=20
> Retain "xo" as the global named parent to make the change a nop in the
> event that DT doesn't carry the necessary clocks definition.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

