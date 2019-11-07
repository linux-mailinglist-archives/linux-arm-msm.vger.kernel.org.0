Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86FCEF3A6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfKGVYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:24:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:49074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVYA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:24:00 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7A1E2087E;
        Thu,  7 Nov 2019 21:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161839;
        bh=pvXocrqUgH96Z+Rmo4Ydj7s0WmQQdDWbyVAmMp9sxLs=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=Q+cCBu5AHdKSErrHd9CejJV4jS8HOILFKRusRloOj7iA+MBoK4qzT/Q8koqM0UXH5
         F5AcYeqfGYToSlbYZ/I52d0adSvQiJU2WXadLp7CxwgVPEWJi+AjPZnHL/xLB6Ezf8
         E3Uv7+B/vNykwVWW5bai5MxurLBnJ/4mnd/spWNw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572371299-16774-2-git-send-email-tdas@codeaurora.org>
References: <1572371299-16774-1-git-send-email-tdas@codeaurora.org> <1572371299-16774-2-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM RPMHCC clock bindings
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:23:58 -0800
Message-Id: <20191107212359.A7A1E2087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-29 10:48:17)
> The RPMHCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

