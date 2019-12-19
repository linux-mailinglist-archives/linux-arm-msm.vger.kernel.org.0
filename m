Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3F0125B0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfLSF50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:57:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:51554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSF50 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:57:26 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A0692146E;
        Thu, 19 Dec 2019 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735045;
        bh=Db1YRJ5NvZADqGz55AvbfCgZAKFs1AzpFlLxGLs5vps=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=drd1vCtFmAbaOaM9hCC4TrrXJZWvi5o6Ny+8LJYWrRpP+pMMcPZfs9SFCfYxBrB3i
         CXjOiYR72zbSnOIFUJx3HJdB7CrLtkepR+oenK1fDrDHMlAI8+dtz7K9l/Vb9JvreL
         FtQ1EZd/cV/ZYzc1Kq5pPLBiZ99EmMo5mVWb20oU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576595987-10043-1-git-send-email-jhugo@codeaurora.org>
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org> <1576595987-10043-1-git-send-email-jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v11 1/4] dt-bindings: clock: Document external clocks for MSM8998 gcc
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:57:24 -0800
Message-Id: <20191219055725.4A0692146E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 07:19:47)
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
>=20
> For 7180 and 8150, the hardware always exists, so no clocks are truly
> optional.  Therefore, simplify the binding by removing the min/max
> qualifiers to clocks.  Also, fixup an example so that dt_binding_check
> passes.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

