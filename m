Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEDB1E35B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgE0CdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:33:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:41566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728066AbgE0CdC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:33:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05A4D20704;
        Wed, 27 May 2020 02:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546782;
        bh=gk+v1W3sTYJPEzW3+3ygR/9TYoYK2pJAj1PW78DaVuM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2nQt1LVAcYcVnZ9lRugFlh5sQH7zpKj709aMUZzOF3D8WtdIuSCk8otZ9/Dz0AObC
         JgDxMzmaqcob+gBBhqSqx8DMxMHB0eiBxM+EAo3kegeNBQHK16rh2dK1UU0wBDE5Or
         0/jxVUJCTjdv/WaxpFvC37MLQnMmvzs1ak4r030g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590314686-11749-6-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org> <1590314686-11749-6-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V5 5/8] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 26 May 2020 19:33:01 -0700
Message-ID: <159054678130.88029.13011652297143700687@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-24 03:04:43)
> The CPU on Qualcomm ipq6018 devices are clocked primarily by a aplha PLL
> and xo which are connected to a mux and enable block.
>=20
> Add support for the mux and enable block which feeds the CPU on ipq6018
> devices.
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
