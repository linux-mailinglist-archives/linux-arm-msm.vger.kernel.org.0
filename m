Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDAF313B6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 18:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbhBHRsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 12:48:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:43140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhBHRrm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 12:47:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6928264E28;
        Mon,  8 Feb 2021 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806414;
        bh=q1qoN3JC7vDaQ1nU80hOXJB7/TZ5Zx7ZiefsFE6D+y4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k7Pl2d5b7vG0ujSPVm3REcJtg9ivlWJc63ywKNw2hXPYuIIPcs7o9nbDdOiir+8uk
         Beyjm2WAibIvDU1fy9WW8IiQI/Q2HDwukiBwzOutj/BMW5aJPxfmP4FlmomeXCiHJH
         w68XoX9NTJoGJaPk0hGo5M1B9yr3v3Rz6L4p5pUNyUJ5c3zxaCT/PaEUFgM68Dv06q
         1jahDqFPc5HLpUoltNXZk4sSNgR7fQDwzMz31oKbPev6QTHb4F6/2LWV21fQsYlREH
         E+Rk8C3w2ERHidf/eaWcBtIjE0nTzOi9VYJxYHG5anDO5WxmEqa+0GQJW3VqWM1y4t
         TCTAcoj7O/m2w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210118041156.50016-4-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org> <20210118041156.50016-4-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 09:46:53 -0800
Message-ID: <161280641307.76967.2250055755142713206@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2021-01-17 20:11:54)
> Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
> platforms like SDX55.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
