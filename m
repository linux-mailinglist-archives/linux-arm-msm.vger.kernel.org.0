Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9764B313D5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbhBHSYI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:24:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235527AbhBHSWn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:22:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 866E964E87;
        Mon,  8 Feb 2021 18:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808522;
        bh=EO83n/wj15OvM55uRBxb+vXmPcyQn4uZJdwuzwhmyeQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ceS6QjlGz12MfU/ryugdPsP+QjNBELHYr3Hx8hdxpXwl5yJVhy10ipYYSE6sxezxK
         2rVIbvz4dlzQiDIm2AV+YApyjvksyRW2uYWLEfaz+iMKbmFwMEZ/KcEV7LdMr77EaR
         z95fpwnuPIkR2hiszHq3P6FOlWwP9+FG27EJmzPo7G574zgwZPtYfsm2U2EF8plROm
         cxEjC4A5Xyw1Tn3aT/ExX84iki9iVGZCkvfjwzboZ6BLKtf6faMXNaUhqkDKkuwE6U
         HsPF7+aPkUoa4OYp0GEV5QTd9RhtPeyrMlKpKHj65KHAZd1DZxVa1CdFwu19N/mt44
         IK7hOvlksoNEA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-10-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-10-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 09/11] clk: qcom: mmcc-msm8998: Set bimc_smmu_gdsc always on
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
Date:   Mon, 08 Feb 2021 10:22:01 -0800
Message-ID: <161280852103.76967.6165783606297241763@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:57)
> This GDSC enables (or cuts!) power to the Multimedia Subsystem IOMMU
> (mmss smmu), which has bootloader pre-set secure contexts.
> In the event of a complete power loss, the secure contexts will be
> reset and the hypervisor will crash the SoC.
>=20
> To prevent this, and get a working multimedia subsystem, set this
> GDSC as always on.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
