Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B95C381C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 01:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbfFFX14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 19:27:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfFFX14 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 19:27:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74BEA20868;
        Thu,  6 Jun 2019 23:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559863675;
        bh=aDqQSyLEoE7+qz5HYsCNTyea4GH8QKSPFYvRN+IMVbQ=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=OEw+s0veVjwUDi/HDf6kiO25Wr/i59rM9zzqMXawnSNCsRsEhV99OH/fHUY6Y+8Df
         kaPwuPXFK6UzsSmXaTUETOGZsRQGMJGCmWgvJvacX3jRqty1qDECUh0nzxrfvXWp/y
         gEHFbIScm8iCdvZYW/990QEwBGdd9hOLo2122Pmo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190528164740.38593-1-jeffrey.l.hugo@gmail.com>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com> <20190528164740.38593-1-jeffrey.l.hugo@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Document gpucc for msm8998
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 16:27:54 -0700
Message-Id: <20190606232755.74BEA20868@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-05-28 09:47:40)
> The GPU for msm8998 has its own clock controller.  Document it.
>=20
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

