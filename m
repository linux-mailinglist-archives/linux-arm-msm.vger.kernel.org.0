Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB1AAD81D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 13:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404317AbfIILmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 07:42:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731079AbfIILmH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 07:42:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1355218AF;
        Mon,  9 Sep 2019 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568029326;
        bh=OSd+26KN7KVITwbT1qAgzFrfa0uIHcqZKR5y9ZZZ24k=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=FyFLZxTPmdFfsPk3VBsgWPeU6OpDYZMEfTlKTsDIpGkkML2QplChBpGjE2/UIJZm0
         LQweZeN96uFQ3fVOgYBcHImmfV4gB12y/2cv7zPonGW4vGovhmKcXZDTUGzj9GDfk2
         ofm72bmdNQy7GARdA9+tYbwlNQogrrAU34fjFjTM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826173120.2971-3-vkoul@kernel.org>
References: <20190826173120.2971-1-vkoul@kernel.org> <20190826173120.2971-3-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 04:42:05 -0700
Message-Id: <20190909114206.B1355218AF@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-26 10:31:18)
> Convert the rpmh clock driver to use the new parent data scheme by
> specifying the parent data for board clock.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

