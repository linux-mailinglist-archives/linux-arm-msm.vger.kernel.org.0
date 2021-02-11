Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE49031945C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhBKUW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:22:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:46442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhBKUWp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:22:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2C6060238;
        Thu, 11 Feb 2021 20:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074924;
        bh=UrvcE2lj85NlywIZvmXxFHTXwnJADqWlvkn2813E6AM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oRZKh4NouHCR9wslVjSEdmi6T+qOV0i0Av4mwNpdAlh1DCVmZ1jnjwtahakjgcKQZ
         h8bH1gTR3wESHbGDkYQyZfy2n0rf40oNlwwi+JMy0sD4OzXsH6eUCAFXy2M+eF5s37
         fLKLF9eGVgkosCNF29gvSH6Bt3PUxY5lGJ/w+HQhWZCqiINTkZfMsbQaleHbBtb0Hv
         kAesh/XqY410BTEA+9HcYHwDUxtMOJKBgyV3TleZ0B6RoKwabPV4xoDE9zeNIDE00b
         uP/hl0sL1LvGuvcGiU2VPiDvUBp4j/Kb3QmhsSmh8FtpyIi6QOTu0j9121ePijcfk0
         02KiklzoRyEYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210210161649.431741-1-vkoul@kernel.org>
References: <20210210161649.431741-1-vkoul@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-sm8350: add gdsc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 11 Feb 2021 12:22:03 -0800
Message-ID: <161307492343.1254594.17777628991790358745@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2021-02-10 08:16:49)
> Add the GDSC found in GCC for SM8350 SoC
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
