Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D550396BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 22:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729768AbfFGUV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 16:21:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729482AbfFGUV0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 16:21:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F636208C0;
        Fri,  7 Jun 2019 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559938886;
        bh=EBCQYgzNEKimkxETwU8oqVDKo2dwf09ur7oFXlMXMQI=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=lYh7XNuD17N7d33DleObIW39T2y/0f+vCXSlGZPpygQLI6xhHf4jA5jWcB1WsVijL
         HgaFYgE6E0C9AdwHMsrvwpz6siKU0jw+WS7eHfQ+gkmbiPJtrg/YPRncGIugycWXtK
         O2X2iLeYxg9QQqx3dAHaqQrTbYBk4Xqrw2loOUvU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190606015937.2337-1-jeffrey.l.hugo@gmail.com>
References: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com> <20190606015937.2337-1-jeffrey.l.hugo@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Document gpucc for msm8998
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 13:21:25 -0700
Message-Id: <20190607202126.2F636208C0@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-06-05 18:59:37)
> The GPU for msm8998 has its own clock controller.  Document it.
>=20
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

