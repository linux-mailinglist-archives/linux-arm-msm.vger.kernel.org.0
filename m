Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0229D2C3689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 03:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgKYCFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 21:05:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbgKYCFy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 21:05:54 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00E362067D;
        Wed, 25 Nov 2020 02:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606269954;
        bh=kW5ukZ+4XieOrj46zD/jIyOr6boy+rCZW7xgzBGe2c4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oJOu74+DecM/01avMUTCuX57S/ltJTnA/Lz5zCj818jNWFf16nVmM8iFzV2d9gwQ0
         8N6XwIDI8zZrr6Bl4ObCcqYhCoAZk1lDYUqEwVeBPhQAJBIciIHQqNJeowl3w1eqRZ
         fO4n9Vhmiuq1zdDFLdfz66TScKxg3+inSBi8kngE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119155233.3974286-5-thara.gopinath@linaro.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org> <20201119155233.3974286-5-thara.gopinath@linaro.org>
Subject: Re: [Patch v2 4/6] drivers: crypto: qce: Fix SHA result buffer corruption issues.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Thara Gopinath <thara.gopinath@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 24 Nov 2020 18:05:52 -0800
Message-ID: <160626995264.2717324.12789219183680216256@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Thara Gopinath (2020-11-19 07:52:31)
> Partial hash was being copied into the final result buffer without the
> entire message block processed. Depending on how the end user processes
> this result buffer, errors vary from result buffer corruption to result
> buffer poisoing. Fix this issue by ensuring that only the final hash value
> is copied into the result buffer.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---

Any Fixes tag?
