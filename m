Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3837E3E2104
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhHFBal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:30:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232952AbhHFBal (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:30:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EE60611C5;
        Fri,  6 Aug 2021 01:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628213426;
        bh=VueE0N1HHyLb+K1T8h/EDAPYxc4WaJrx+C35OWibFGM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q+g0aS+ALPAN6g6E6f2ThlUQ0MXgAAcS+XhLfxntZFVa/HNEV91AjTnqoYjYVVeAW
         Z63scJDJUWu7F4j0swfB8S7QnGIrL9055vix+edK4SclJvE2DXRuBFISelEuGKIkbW
         HM27Tu2EzQC59Qzwo23ZVUfJjhGAStAX2gQBR4FhG0O0Pr7Hnkmd58sI0h5SdCsVS8
         Z9T63YyYPDhjx3Klcxa3WJBpzlvABxkuU3Be02cQSKIgmZHfYWgnay6D+KgO8D+aEq
         czCYfCy7teNEQV8jOScCYhPIL4/vrKzRT8haS0XZklw+JcAl2gfhFU6q3JVI7B3BNO
         Q9dlU8ZO3Whmg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210730215924.733350-2-martin.botka@somainline.org>
References: <20210730215924.733350-1-martin.botka@somainline.org> <20210730215924.733350-2-martin.botka@somainline.org>
Subject: Re: [PATCH V3 1/1] clk: qcom: smd: Add support for SM6125 rpm clocks
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
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Date:   Thu, 05 Aug 2021 18:30:23 -0700
Message-ID: <162821342389.19113.11902911217960333755@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-07-30 14:59:24)
> Add rpm smd clocks, PMIC and bus clocks which are required on SM6125
> for clients to vote on.
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Applied to clk-next
