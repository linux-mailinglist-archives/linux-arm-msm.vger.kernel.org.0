Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3AE42E590
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhJOA6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:58:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234679AbhJOA6N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:58:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A60661040;
        Fri, 15 Oct 2021 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259367;
        bh=1TeURgC4SqmDwcng1kj0G66g/GtfdRjM8v7Hk8FfM88=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ChMqIDp693TStRzxiit9prPKH0eI5hmF73lKvJrF1+gAH5m+fXahi/7EvRzmsX71v
         6THSxqM1ZM1cu7Jxy4IBJvkkd1siljdJOklwS0vEwHPefpwrnFAxPZvRReQp1wfbQa
         3YMQUvwInJeW633Yxe4kJP4/RXfZy+XPwGUAbviIs2Mf9+oE7tgNJnddFMmeKoAk4z
         oNuLHZ8r122Vj1TtRVDCNbRjvrf1hBX/KSyXJmlwT5Pt/qbSoW7Vou4XrXn/jZj7Tv
         BJRfvhDmVY7V6xqD8SgO5/oXMbpxqpUDULuTJQvyspEFqQraszmOuf5hVjSxMFt4xb
         +Cix2SG+k3cjQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829154757.784699-4-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 3/8] clk: qcom: dispcc-sm8250: use runtime PM for the clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 14 Oct 2021 17:56:06 -0700
Message-ID: <163425936616.1688384.396232146401347154@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-08-29 08:47:52)
> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Use runtime PM calls to make sure that required power domain is
> powered on while we access clock controller's registers.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
