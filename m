Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711D02B30EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 22:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKNVLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 16:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:37658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNVLx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 16:11:53 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0257522384;
        Sat, 14 Nov 2020 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605388313;
        bh=1Q9KjVq9hTB0vzxOeA6iOyT4dgFMrRUr3fO6ce+d/5w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UxCopOFvZZBmuX7adzbrM9SRgfWs5B06x2It9+MBz/NlwcYVP7vBxpd2MLBst3b6R
         Gixfur142nXjLYf95uQ9q/9wYbtKj9Z+VYAavbz9v8UrPLxmg0x+uWLSR8449ejuTT
         5huJqB9ZvOpVcfq0hELt0QTNb5vAGmmK1WNltdSU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201023131925.334864-6-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org> <20201023131925.334864-6-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: handle MMCX power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Sat, 14 Nov 2020 13:11:51 -0800
Message-ID: <160538831174.60232.12022368603603764199@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-23 06:19:25)
> On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
> This power domain is expressed as mmcx-supply regulator property. Use
> this regulator as MDSS_GDSC supply.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
