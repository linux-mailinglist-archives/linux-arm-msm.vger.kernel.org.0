Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD4BF5AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 23:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfKHWit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 17:38:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:45670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729951AbfKHWit (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 17:38:49 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 809D2214DA;
        Fri,  8 Nov 2019 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573252728;
        bh=q5ddcpbQAV8kWIXrfRoAoH0vcn/bLDyCiaCPqaa6UZs=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=kdAn1PQ/9teLHbfKI/977LJ4iN0nhpB5bmgjTpw2zp2vb48ecQY7NXUHGNNLrpWFF
         dcNqYh3f0Q2wRbkR2j/rVQtV8tvDe3yRUq0BrSmcikhIxOThY37S4gP1/IkZKTWH9Z
         b+HuATAM8lIRkLMQw+chg0OY9TJy9srA12bIDx9c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573247518-19801-1-git-send-email-jhugo@codeaurora.org>
References: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org> <1573247518-19801-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v7 1/6] dt-bindings: clock: Document external clocks for MSM8998 gcc
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 14:38:47 -0800
Message-Id: <20191108223848.809D2214DA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-08 13:11:58)
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---

Cool thanks. I'll wait for Rob to review.

