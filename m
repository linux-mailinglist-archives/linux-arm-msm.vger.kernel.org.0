Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216C32F455B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 08:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbhAMHiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 02:38:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:55608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbhAMHiV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 02:38:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 933F623333;
        Wed, 13 Jan 2021 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610523460;
        bh=MpcGYYboOi2tJWrADJe1r9lpbEVYu3S+V/Eg1nRnDOg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CEznlDy8AiWlNHIaT4FFsvFzjVIbXq5R/9w+NiWwrP4E8Wl9QRFsCfl1ozLCzwQf2
         CZmZhKmnzmBgKdxYKkaP2gD1kCO0xv0oawTv7khNGCqjYz0PN9xxonbYdXE3jtpHaU
         1pf/9GW9TOX2F/QQ+jeCecXfyT4CDIZ5EEU6eANo9zqMAiO3XlXU7bEVCvQz5LA0C+
         v4urttNeqL7g2qYCWzrL0FSkav+WaGrb7h3Sy6bbQyjjySpKj6t5gSiSJQ1FnNBK8x
         3iA65TL5KFVd00N4e8DBV7hmmoKlyy/W5sHBpitXucXHDYm3sKwdmqAmVX2sIi8G3/
         1cGrb4mxLjR4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210108113233.75418-5-manivannan.sadhasivam@linaro.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org> <20210108113233.75418-5-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 4/5] clk: qcom: Add A7 PLL support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 12 Jan 2021 23:37:39 -0800
Message-ID: <161052345929.3661239.17317391445536993997@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2021-01-08 03:32:32)
> Add support for PLL found in Qualcomm SDX55 platforms which is used to
> provide clock to the Cortex A7 CPU via a mux. This PLL can provide high
> frequency clock to the CPU above 1GHz as compared to the other sources
> like GPLL0.
>=20
> In this driver, the power domain is attached to the cpudev. This is
> required for CPUFreq functionality and there seems to be no better place
> to do other than this driver (no dedicated CPUFreq driver).
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Looks good to me.
