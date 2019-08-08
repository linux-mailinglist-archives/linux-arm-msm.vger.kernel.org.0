Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0F08594B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbfHHEam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:30:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbfHHEal (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:30:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8346021743;
        Thu,  8 Aug 2019 04:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238640;
        bh=8YU0k/hTrTVzLlsKNpV+HWQXdm9XwL7LZY7JY8WkWS0=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=NOxhGQaZB8EPPfYca/OjJgRj9r0ZNNWos03Ss2WODbXPfED1BPKqnrd4u+wB35lfp
         dl8ZUpYjrrlH8oCZZl6OkI9ZX6v0dm9vqA/rsZ3EuJ+ba7l2yu+Htl/xXr/BjSVcDj
         fituFKiTwsN8JY0Xc0EOJf/kqtNiBZ/fJ4tBEmE8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722074348.29582-5-vkoul@kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org> <20190722074348.29582-5-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: Document gcc bindings for SM8150
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:30:39 -0700
Message-Id: <20190808043040.8346021743@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 00:43:47)
> From: Deepak Katragadda <dkatraga@codeaurora.org>
>=20
> Document the global clock controller found on SM8150.
>=20
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and add external clocks
>         split binding to this patch]]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

