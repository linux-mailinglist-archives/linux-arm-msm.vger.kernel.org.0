Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF5D42E585
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhJOA6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:58:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231284AbhJOA6B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:58:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CEC661040;
        Fri, 15 Oct 2021 00:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259356;
        bh=wMlahXiUDNQBtJmbNpzwQYFwpHz7Az3V0eEF8vMs6fE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zn7oxEObqZGIPfBTJKRkav9MnaUyd8mckhNxbO+gbO89kd43qT2BquaUdC86MC1Xh
         T9KF9iDdGX8LSIau36EKuxKx/cM+9VnAQqHC5clEEzSQ0/g620fmxiDYpQ0t4fh1fE
         BbLerXavjnIsGAmamPUpFGfO0QOeE5LJ9HVDuEuJrFJrA7Ojc9dqXeZ76jirgCye+B
         Eb5qnw3qLIMpNXX9fXlSJq537yaQId35H4e94Bm5UTeoefxJlAKVdATBcSElkeBDMn
         8A4ULJ9uu/aBfFb2hl6qKE7YMPNU+tRgOwWXumRWMuDobF9tjXE44yCtreF9XCN3/N
         dddsbvZgjruGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829154757.784699-2-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 1/8] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 14 Oct 2021 17:55:54 -0700
Message-ID: <163425935491.1688384.8282610839807892378@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-08-29 08:47:50)
> On sm8250 dispcc requires MMCX power domain to be powered up before
> clock controller's registers become available. For now sm8250 was using
> external regulator driven by the power domain to describe this
> relationship. Switch into specifying power-domain and required opp-state
> directly.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
