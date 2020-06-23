Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D3F204708
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 04:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgFWCBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 22:01:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727033AbgFWCBo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 22:01:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDCB72075A;
        Tue, 23 Jun 2020 02:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592877704;
        bh=DVCwmDI7SriaJLrzMvjHQG+18xyE1s32Rh7MNaMftfQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WXGtryveaBYOKb8Big8mps4OtMnFJdyd9izZRULrJwBEFMSxFX8RpeCwagGht43GW
         LX8/gePOf2sLmwsnC3QQr/avg43GyXvsZ4BRhzrQS4ZXLoOupNyw1igSZ10Dw6f0kL
         M0NVwHdtPHwbH60vMn3lSg9Eo2PBymlxaLQIKX/Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200613072745.1249003-2-vincent.knecht@mailoo.org>
References: <20200613072745.1249003-1-vincent.knecht@mailoo.org> <20200613072745.1249003-2-vincent.knecht@mailoo.org>
Subject: Re: [PATCH v4 1/4] clk: qcom: smd: Add support for MSM8936 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konradybcio@gmail.com, Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Date:   Mon, 22 Jun 2020 19:01:43 -0700
Message-ID: <159287770331.62212.336675204157113224@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vincent Knecht (2020-06-13 00:27:42)
> Add missing definition of rpm clk for msm8936 soc (also used by msm8939)
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Applied to clk-next
