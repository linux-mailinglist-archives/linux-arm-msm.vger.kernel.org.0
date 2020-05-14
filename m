Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CF01D4016
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 23:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgENVbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 17:31:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgENVbj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 17:31:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F03DF2065D;
        Thu, 14 May 2020 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589491899;
        bh=k7TtCoEeuLkGH34nBpkUYgHUJWbus9eVDn+Uybg9KPk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ztp8Wqkc/EHoWW4ozsx0XTdgIuDee2TcdnQeFokRPBinPcFGXUwjSAM2t8dt+R0bB
         YMa6q4TJG9y5HytWxZ/axOhJ/kiHzjrWgjJw7Fl+SCJLlXGL/8gcgHXBVemMsOSK34
         6Ip7tcuHTt8yPiLA4gWuAwZmmSDmolSwYRPRx5sg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200512115023.2856617-2-bryan.odonoghue@linaro.org>
References: <20200512115023.2856617-1-bryan.odonoghue@linaro.org> <20200512115023.2856617-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 1/2] clk: qcom: Add DT bindings for MSM8939 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        vincent.knecht@mailoo.org, konradybcio@gmail.com,
        bryan.odonoghue@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Thu, 14 May 2020 14:31:38 -0700
Message-ID: <158949189827.215346.16562450992275804503@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-05-12 04:50:22)
> Add compatible strings and the include files for the MSM8939 GCC.
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Applied to clk-next
