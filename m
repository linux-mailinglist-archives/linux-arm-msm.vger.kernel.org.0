Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1DB8D8B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfHNRBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:01:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727558AbfHNRBX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:01:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0C5A2063F;
        Wed, 14 Aug 2019 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802082;
        bh=VSGGBst5dnydZSxYL2jHi0DPHM7isNsrBEpU9GkOw0o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Dwy+czKRSoJE8WKiNtAs8XYjlXyd5XSGveq7OtulToBo5cGwYj31tAs06gfFs20/G
         CrFaJuNVOY/OYxSBu3FKeV9Ismqul7nvz53n3eOxFpI2Pd2wjrKDsvIF9KqdeXniWe
         GOYkwwFGM/LrsdSP8HlTrQ/epfN0z+cZx2oDPxSM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-5-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-5-vkoul@kernel.org>
Subject: Re: [PATCH 04/22] arm64: dts: qcom: sm8150-mtp: add tlmm reserved range
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:01:21 -0700
Message-Id: <20190814170122.B0C5A2063F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:54)
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Squash?

>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
