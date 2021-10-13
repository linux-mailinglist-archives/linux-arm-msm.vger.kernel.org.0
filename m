Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DD342CA46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238920AbhJMTp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238885AbhJMTp2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:45:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 600EA610E8;
        Wed, 13 Oct 2021 19:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634154204;
        bh=oU4jrvu7wy8A2LbRWXTakbUZnUkNW3ptYdDsrVcDDSM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VmODA/lNOxphX+WUFCqSCeyXqVrHH+v2wDMERbUZHL7HLXXXMisZUpohNtYF3XHNS
         Lo3VNyUAF/xIs294L4tECdrM/dDIt1wfrbVC5OzIA9vG/wUZ76wBzEfHSppHm5NLWC
         fTGRV6H4sKjU8rC5Ima8o7XT/7/1grDmcCTOG3INDl4YcikeVRAsdaXpLcd9AWjkMc
         WqQoKR8IhRUqNQjnGq2ufgSRDV9//bfN8k8O6VAVyKyx6g4+/hATAvflVDd+6akyIO
         cFdJ/xpjHJN4mXzM0hlj51A69HRVtM3Tm+UdHx+G7P3oOct/IvaWophNFPBTZxPO+u
         HxmrF/evu/hMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210917030434.19859-4-shawn.guo@linaro.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org> <20210917030434.19859-4-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: smd-rpm: Add QCM2290 RPM clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 13 Oct 2021 12:43:23 -0700
Message-ID: <163415420318.936110.13931605415868184677@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-16 20:04:34)
> Add support for RPM-managed clocks on the QCM2290 platform.
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
