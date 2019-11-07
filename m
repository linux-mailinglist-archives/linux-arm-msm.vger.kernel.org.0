Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C7DF3A70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfKGVYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:24:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVYK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:24:10 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58CA82087E;
        Thu,  7 Nov 2019 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161849;
        bh=2MmroB04zpXo62z6bb7yuOe+M23UIVWKuBZY4t/a88s=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=aRotv79uKIzWDg6R4j280WHwnO9rJ7BC0Bzgod2V6p0zanOzac/ItzkXS4Ov9Y6TT
         iMFQ72NolHkj0wVQlMfCYJk6qV+jKifShbUSA1t6E8dN6Ux8KhTbC94vmRVN5yOLNA
         dzem+BHh6ubb+9cNhvrffB3LGGtDOjjdrC/A/1aU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572371299-16774-3-git-send-email-tdas@codeaurora.org>
References: <1572371299-16774-1-git-send-email-tdas@codeaurora.org> <1572371299-16774-3-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: Introduce RPMHCC bindings for SC7180
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:24:08 -0800
Message-Id: <20191107212409.58CA82087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-29 10:48:18)
> Add compatible for SC7180 RPMHCC.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next + fixed the sort.

