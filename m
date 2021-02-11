Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A904B319452
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbhBKUWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:22:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231519AbhBKUVs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:21:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03F7064E15;
        Thu, 11 Feb 2021 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074867;
        bh=+ezscL82kC+sF5oBCWvm/y5wTjuztcTpGzTi8MIkJA4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R6FqRVOJb0mbENi3QqCZyg67PBDLF9WhNhZ2JwwHfTnxbN+q1/L2pItIDy3BZHMPs
         jwZofN3lGisnBeTs2lCsKWNj3VSxGROUYvRn/AcQ26Ky4zswpLYEHZ8D97fonJCdCk
         AlUuPDsyDL8aEmQxwbmNklx1HlKipEEBkJVxplzGnU0XV2ZvcmiB99Bg1Af+F5C/w5
         +HZXgAG0+6NI2uS0bDTi41RbNYkEcD4GBHpRviV5NOIw5LAFbsKjUu54rwx6gon5bv
         3SWGwAxVSNXwYDFu4rjZylepsBLLEwH23ZrcpxIwUuzQ8pDXZVeCKsXBB/8cUkosb4
         GIqLXyadOU89g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-9-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-9-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 8/9] clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:21:05 -0800
Message-ID: <161307486584.1254594.2836723713349998743@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:16)
> The GPUCC manages the clocks for the Adreno GPU found on the
> SDM630, SDM636, SDM660 SoCs.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
