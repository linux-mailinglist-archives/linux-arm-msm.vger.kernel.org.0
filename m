Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A56313B72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 18:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbhBHRsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 12:48:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:43006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234943AbhBHRrm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 12:47:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16F0D64E84;
        Mon,  8 Feb 2021 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806373;
        bh=cyOfe2Tc7iDBnDU7qWLSa0lEuh9Z71XnWOatj1qySFE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iEIl9OsvxJxC0vWFVF/y/RtEPhekCiA1k7Qif54vh4fRzxI0+GhM6ecn+iacpcePQ
         +7i5D1oVIyr3vq+CKFFe/JzazspiNErPzKtdGwXrRk6q/NhfYeHWi9EMqw0983XWF/
         4Rp7SN+Ce+99nHSf3ZEtgZ9CKx+Pz1v2w9QwDatjZIkRVzwg8ufiT3mYxZuZHTtn9T
         e3HcY6P4UVIRnkbKScPgufexVpJtTvKekQDuHcfZ2Yr2dzS+O9g4ndgit+s0xo383J
         LpIMds4PAwepuSMUS9VVGLiwCrtqh+rA+HZIuVGszYK3/x9VA7e6Eqh+c5i+ph8b98
         Ci8BCeDVQsY2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 0/5] Add APCS support for SDX55
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 09:46:11 -0800
Message-ID: <161280637168.76967.9168707371952675235@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2021-01-17 20:11:51)
> Changes in v2:
>=20
> * Modified the max_register value as per the SDX55 IPC offset in mailbox
>   driver.
>=20
> Manivannan Sadhasivam (5):
>   dt-bindings: mailbox: Add binding for SDX55 APCS
>   mailbox: qcom: Add support for SDX55 APCS IPC

I think I can apply the clk patches to clk tree without the mailbox
patches, right?

>   dt-bindings: clock: Add Qualcomm A7 PLL binding
>   clk: qcom: Add A7 PLL support
>   clk: qcom: Add SDX55 APCS clock controller support
>
