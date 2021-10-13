Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF2B42CA35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhJMTlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:41:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbhJMTlz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:41:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E91B61165;
        Wed, 13 Oct 2021 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634153991;
        bh=6epsTg07ATMwEAGruLlhAv5ThpWv7ygnl+uu8P+9thI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W4GWgYR7mUp31GMq8eqWozlzIiojK/djw1SyO4lyg6m9JkS6aEiZXxci3UkzU6M1f
         3D77ktIk7YLGcxg9TL/EhjccBZLbYMFRQDKXEZZa75YnxNITJ7ap0N9I2pmLZMpQpg
         g/DSxu9YIQwul0S+u6f3LlILiVfLjCmfhdPr39f86r96sKZIExrgo2j3r42S/ndGMc
         3Z9codgH7w8SgOhHhi+v+lypSjNMZwSTE8tfiNuMe0luSVAztaxPD3gAHJmBxl5wG7
         Nnu2OTarq45/iA5qvdTxBPWJXJEjy6HOP74NMas8m/A3QrGwmzWYVYEJpLo9poqMlU
         YaW2WaGD/qG2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210919023308.24498-2-shawn.guo@linaro.org>
References: <20210919023308.24498-1-shawn.guo@linaro.org> <20210919023308.24498-2-shawn.guo@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 13 Oct 2021 12:39:50 -0700
Message-ID: <163415399009.936110.1065420118297108993@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-18 19:33:07)
> It adds device tree bindings for QCM2290 Global Clock Controller.
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
