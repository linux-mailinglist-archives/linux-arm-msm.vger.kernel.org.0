Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C630313D39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhBHSV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:21:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:53392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235554AbhBHSUz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:20:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACEC164E8F;
        Mon,  8 Feb 2021 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808387;
        bh=w+/GHaqj0dDxuSnxbw7GEXTX0ZDb0pRPn+5VCcjR4gE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dbaeOY3L8QZAl2qtZQaWKVa8McCQslxFAG+u8iQHEyQKDis1/y5MP/mFXBw9HgrfY
         uS2bi3dZP6rzuti6xgYIs30IUcSrIA67Y4lIJIfF6eso4Y5rk1oUW+LUSBRybYm8hb
         EaOK+xXBgsQ1xtwjyEpRfDgcpXf66lhQPSC4/AFuTJwBbKDzwNfTxaw5Jh5h4IEEEs
         tVaG0q4RD7EyiUeEivf10Ioy0a6cSW3snF/4ncEeQq+kjfRZel3WF2Fse+1G/3Boh3
         SJPJt+quqQd9wumtSu1J3ziMVfbehlG8V/HdtqiUAU/H2CCAYWlhdU0NV0K7oCu+2a
         a1Oh7LoI6pHFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:19:46 -0800
Message-ID: <161280838655.76967.11742308360689454238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:53)
> The GPU IOMMU depends on this clock and the hypervisor will crash
> the SoC if this clock gets disabled because the secure contexts
> that have been set on this IOMMU by the bootloader will become
> unaccessible (or they get reset).
> Mark this clock as critical to avoid this issue when the Adreno
> GPU is enabled.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
