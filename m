Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503AD130696
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2020 08:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgAEH0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jan 2020 02:26:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:47304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAEH0W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jan 2020 02:26:22 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F2F2218AC;
        Sun,  5 Jan 2020 07:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578209181;
        bh=nNZvChz/fgZRliYiIL/0LI4ZJTTS1UAXpf49HzjAsyA=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=RYn5T50KB7TUaW8Wgcfi+pQ964xi9e2LIjuTqP/BGvqo9Ue1iNhtWRFyJAsLivVTX
         cF8nJVDp3vETI/IB6qClPIPzKK3LFcrX6E9AAV/RgdCuSUX+Duw6TMbXLOVMoM7jib
         CoZcsKotawPUmSszun7dh1evp9EeHRV33yz2vuAU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1577428714-17766-5-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org> <1577428714-17766-5-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock bindings
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:26:20 -0800
Message-Id: <20200105072621.5F2F2218AC@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-12-26 22:38:32)
> The VIDEOCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

