Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6610F28D7E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgJNBRi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:17:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:39800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbgJNBRh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:17:37 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 631CA207DE;
        Wed, 14 Oct 2020 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602638257;
        bh=DGwwaDjRONw1vRk8sCxLEyL8Us/VuRZ2FKkcgXBpkEc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PgYdLzc5LH5QXgScXEjzH+PXffGDry0PFgjGPjnnbjrFDWMB3ML+Gx/ik7AtkO0RP
         v1g8P4PNDb4sWZjCQRPI+JKwoBqIykka+EfCjRhEU42DymNX5omdxxnrKvr9RsKyzx
         4pbUfSTSp0y0Alq4vEojisQibugKx98LVLk8eGS8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923160635.28370-4-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca> <20200923160635.28370-4-jonathan@marek.ca>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: add SM8250 QCOM video clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:17:36 -0700
Message-ID: <160263825622.310579.10803774895140610357@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:06:29)
> Add device tree bindings for video clock controller for SM8250 SoCs.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
