Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBD8313CFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbhBHSQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:16:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:51930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235359AbhBHSOO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:14:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA9ED64E7D;
        Mon,  8 Feb 2021 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808013;
        bh=dPBkjvNRtXo3vLy/glXXaEKxVV63qiN+B/qh3+7ycHk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eG+bZShHLmvS1AivyvPmOBw8Hw4o+59clogneOC/Ezi3yG60TeZfpB0XKxDvIo4wI
         Kt5gN4d1XFRRdes95cK7cP+O1uXhcZb1Ip3Q31EAQ+dlw1a5H7BqCZykbU0hsKOcW3
         xXVhR4/kVVkylD9U5HO8UX/hlycTgfQrCJNa7icpLAwBOU3E7Fe3q1b4l/hkDbldXj
         guBGHBm+A9m2VxkNStliHnr9qVWtHy3JFTazsm85r7qpb6onYRUyYwKxYAI19EfGNx
         RO9cnoWTWB6M0b1sZBiMi/XrIySbDIFfFPCEtPVaA2zMqnges0s8NadI5TekQqevWi
         jWlbctYB9BIiA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210204150120.1521959-4-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org> <20210204150120.1521959-4-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 10:13:32 -0800
Message-ID: <161280801249.76967.7940544166022286635@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2021-02-04 07:01:19)
> This patch adds the missing video_cc_mvs0_clk entry to
> videocc-sm8250 replicating in upstream the explicit entry for this clock =
in
> downstream.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
