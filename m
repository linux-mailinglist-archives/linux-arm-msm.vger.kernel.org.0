Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80501313D2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhBHSVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:21:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:53234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235442AbhBHSUX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:20:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B7BB64E8C;
        Mon,  8 Feb 2021 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808381;
        bh=zp2OvUj0R2CpyTAUWQqwz6Nvpy4j4Nrdb3mtrzETs2U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dvogAf6yKSON+ICvholnG+kIuPQb2QhXBY37gIuBx8CB4PqVJuXAQ76TBVl/7yE1T
         EhG+mftF0OSaoqupVQSjUNCczAfyUcrq3SYh0f4rM28hF1QQHZZWyEvuAITwkUJRDG
         6D8N0Y2ZfO0NkOgK9J8zFdyFPZguhECrwI5UXrH1Ya5YuclbDJSi070dE8xlvcEE7f
         HYN3Iei2ntzFLchyubViVC3RSXTUEHFry0Z0MSaBlx2dV/0F8qjxmVQ1Rr0GdqeOQz
         Kn8Pv67eNwGL4d0Sgpm9BF1zqBYsHv6xlzFHJ2/M17dnKHSulK5cSgDccjcF539glW
         K6lEomDzSCtFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-5-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-5-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 04/11] clk: qcom: gcc-msm8998: Add missing hmss_gpll0_clk_src clock
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
Date:   Mon, 08 Feb 2021 10:19:40 -0800
Message-ID: <161280838002.76967.11430085158522291073@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:52)
> To achieve CPR-Hardened functionality this clock must be on: add it
> in order to be able to get it managed by the CPR3 driver.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
