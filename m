Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA400313D28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbhBHSVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:21:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:53142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235464AbhBHSUA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:20:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11FC664E88;
        Mon,  8 Feb 2021 18:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808360;
        bh=JbW4/B6LffMOOiVbZhFO9PVW8s2WJtTH2AQ7WONjIWs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JCldFz8nXtXKUtPPlWgiKsBT7c0SX4pHA2uV+L8Pi9OUm+IdtK7FF39GtJTt4TBPJ
         75lBjU98hS2mYaCxvtmsCWKOFBKg5yp7EDFNxgEF8SnFHYU0frN149xdj588DyBYAY
         gVKghFTnovT9K+xvyeCnMohUvVDd/GDr/Ldr5GSjXwevyb2nHnFo94IeLARqbGfVnE
         JzjuQAwn466CAT/iguoQnA++LjDuShPrdq2PWa1ZqD9yj7h8RTrd+9jphii3QVINVL
         KMis+1VZHwVRwxUngecA2g+D87LYl0YVrv4lhaQdhTWRAEKBlBjoTD/ZPTKHPbIWJt
         1c52lxhh1x77A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-4-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-4-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: clock: gcc-msm8998: Add HMSS_GPLL0_CLK_SRC definition
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
Date:   Mon, 08 Feb 2021 10:19:18 -0800
Message-ID: <161280835883.76967.17829314283140226037@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:51)
> Add new clock definition to gcc-msm8998 dt-bindings
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
