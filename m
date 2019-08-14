Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 514FB8D8B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfHNRBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:01:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:50586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727558AbfHNRBt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:01:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56D1320644;
        Wed, 14 Aug 2019 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802108;
        bh=bw1OD498idiV2ItGD5//8JJa45SmzXMwqWChBDsdsQY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X4UBMKZMzRICneyZMtrN4cEempPQ8nD3Wx3Xz12XSmNOuSp0q85Q9NjJtVpT7ABW5
         ux8UzONsaGnrFKFNhasZqPEMWIkSbIoNiFxW7RbEkd3won27TiJAtYjSgZX4VSlFbs
         dkB7vA5H1LObdXsIuEhMwVIUG7E/o8vWI6NHsQ8w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-6-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-6-vkoul@kernel.org>
Subject: Re: [PATCH 05/22] arm64: dts: qcom: sm8150: Add spmi node
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:01:47 -0700
Message-Id: <20190814170148.56D1320644@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:55)
> Add SPMI node which is used for spmi_bus
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Squash?

