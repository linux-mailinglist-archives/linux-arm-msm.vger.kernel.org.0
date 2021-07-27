Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FF03D8219
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 23:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhG0VsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 17:48:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231668AbhG0VsW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 17:48:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67EE360F6E;
        Tue, 27 Jul 2021 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627422501;
        bh=8LKEBG4jsItD6+/7Ls5h/7i/KgXlhXEjlYmjO6GKFn0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=awTMMMgiprVIwRJpypdqfSFF5DawWhWP7PgkTE/RiL7F2Ihrl7bYEYvV1rtVw4JJq
         1zEmSZjN3IjV4VcCa7K5lpij0cF9VwcOyaeXj7A7TNPWKUyLHLIkkH+/l2yszkQ7HQ
         ABwaY/zcPpft7eWlUNxzGuYy3UISm/6IHXundpZcQgiMGERzVMyNTuCppVzgtY8QjI
         NupROoKGbjPBTKZoUA1pyICFR8mzz1mANRQ5jnRZUNrG85xXBv4be2sW5CEvRoLwPF
         gX5o+KTu/s10RiZezGsJrXLPk/wwNYAw9xMvDAGvF2tiXMmexBxa7YWkwjV8gZg3qj
         YlPa5Fg+da1iA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629102624.194378-3-martin.botka@somainline.org>
References: <20210629102624.194378-1-martin.botka@somainline.org> <20210629102624.194378-3-martin.botka@somainline.org>
Subject: Re: [RESEND PATCH v2 2/3] dt-bindings: clk: qcom: smd-rpm: Document SM6125 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Date:   Tue, 27 Jul 2021 14:48:20 -0700
Message-ID: <162742250022.2368309.6386650243971693584@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-06-29 03:26:22)
> Document the newly added compatible for sm6125 rpmcc.
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Applied to clk-next
