Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8A0AD822
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 13:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732023AbfIILmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 07:42:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731079AbfIILmO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 07:42:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD029218AF;
        Mon,  9 Sep 2019 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568029334;
        bh=iE6bBlphMDt8VYPBoCY960ciYTVjNe4jpZVcvdhskPs=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=jQSlV1D4P4bv7VcX5RD4JpjttrbfUT9hnY4THmy01r6w92V1Wu6XnwsxzfkBwCZVD
         P84fIH23SevtENdYdiF2sNSRtn6ZuhtVQ+COvV/Ee4afQqZLM2EGPfLxxvmQbsC0jA
         qPRppd9EH7ssBQkuWYoVAHnVOZ8t8yzac0LKKtSQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826173120.2971-4-vkoul@kernel.org>
References: <20190826173120.2971-1-vkoul@kernel.org> <20190826173120.2971-4-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: Document SM8150 rpmh-clock compatible
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 04:42:13 -0700
Message-Id: <20190909114213.DD029218AF@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-26 10:31:19)
> Document the SM8150 rpmh-clock compatible for rpmh clock controller
> found on SM8150 platforms.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

