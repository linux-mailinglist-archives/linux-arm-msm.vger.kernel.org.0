Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2545411F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhKQGtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:49:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:57368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhKQGtJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:49:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A8161BD3;
        Wed, 17 Nov 2021 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637131571;
        bh=y2OiJMPQRyc+lScL3rg3mfbNG2sQH2Dbv4lfz+zJFpI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VDflQugwP/UdxV6VvW6jdFnDGTrIvWCG2qT4ibSrctcea/+iU8mqdtlw/JDibgUoZ
         BwE7WL7XfJf3WOnd7dPz4z7iRs7yJL4llHkzEbfRpp+kzIakbLJ9QhShz6UFSS4Y8P
         hy9o2/tMp+QdL8jVNoXz7HGUS5h4pH6C6bIl3h4pn+Lkn/IonAaR7JFkp7MAz5WJXH
         8zFmUweL5imMoCtR1aLoqZQyJNeE5c+XoTCqdCNm5AFY7XdD9NgLcjfGDywntI2fiJ
         JcGI3fEdfiZcemij0uEBgbcw8V5PUonZDoTtC9Hk34pI/vhTrI/5zw2ed8GtltmfUE
         tzQFD/NtBl8Ag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211103234410.1352424-1-bjorn.andersson@linaro.org>
References: <20211103234410.1352424-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Introduce Qualcomm eDP PHY binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Date:   Tue, 16 Nov 2021 22:46:09 -0800
User-Agent: alot/0.9.1
Message-Id: <20211117064610.D7A8161BD3@mail.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-11-03 16:44:09)
> Introduce a binding for the eDP PHY hardware block found in several
> different Qualcomm platforms.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
