Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37AF280A79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 00:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733297AbgJAWsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 18:48:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgJAWsQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 18:48:16 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80D1F2074B;
        Thu,  1 Oct 2020 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601592496;
        bh=7nhZm4Z57rJlixmBtfhqpW/9+gIJ5bjUhbfuvWxZj3E=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=AdRFLXuu8QFIO6i8U8Rmhf2bMPqqVuOwob2NMhQQf4nbhVUTm6JtZqsuDyq3z7UPQ
         DAx79W7Ko3TAV1Ri8CiR+kR1eVe79o8EUbi6OPjh9F+nCLZdPhCvc8s21Ewm4NUqPT
         zJJW3ppT1A/bKFGyJxTftCosN9VOPlCf6IoLH7+s=
Date:   Thu, 01 Oct 2020 23:47:16 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Nisha Kumari <nishakumari@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20200930162602.18583-1-rikard.falkeborn@gmail.com>
References: <20200930162602.18583-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] regulator: qcom: labibb: Constify static structs
Message-Id: <160159243691.44970.9154350525275171802.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Sep 2020 18:26:02 +0200, Rikard Falkeborn wrote:
> The only usage of qcom_labibb_ops is to assign it to the ops field in
> the regulator_desc struct, which is a const pointer. The only usage of
> pmi8998_lab_desc and pmi8998_ibb_desc is to assign their address to the
> desc field in the labibb_regulator_data struct which can be made const,
> since it is only copied into the desc field in the
> labbibb_regulator_data struct. This struct is modified, but that's a
> copy of the static one. Make them const to allow the compiler to put
> them in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom: labibb: Constify static structs
      commit: e6f5ff17ca96456deceef94cf2577012a9df737f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
