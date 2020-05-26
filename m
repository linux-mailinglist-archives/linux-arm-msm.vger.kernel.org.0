Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686401E33A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 01:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgEZX1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 19:27:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgEZX1a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 19:27:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77A6A206F1;
        Tue, 26 May 2020 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590535650;
        bh=9wFwMEDpELxNkJ7Vbh64tnSugngTTm31jnVLmWURg0c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZMruLDUYlIUhatgskVHCGOJFcz9mfQf7RdD2AcOVbNBy1tVAzY2PpujrNfKk8kxrQ
         pGMBkNZ1t1Zj027uic4gyotB4X8dkHTKSbGwc/y/CzMfmlGm7AuoeHxo2kf3rd3bI8
         1hAWKMvNH4aKeD7ye6QL2d1h1hFl1pE50t3Qn/Vg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200523040947.31946-1-jonathan@marek.ca>
References: <20200523040947.31946-1-jonathan@marek.ca>
Subject: Re: [PATCH] clk: qcom: sm8250 gcc depends on QCOM_GDSC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 26 May 2020 16:27:29 -0700
Message-ID: <159053564977.88029.4985972878621402819@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-05-22 21:09:47)
> The driver will always fail to probe without QCOM_GDSC, so select it.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-fixes
