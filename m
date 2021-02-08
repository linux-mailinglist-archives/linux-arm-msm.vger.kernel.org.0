Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06123313CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhBHSIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:08:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:49426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235433AbhBHSGU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:06:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E295E64E28;
        Mon,  8 Feb 2021 18:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807421;
        bh=JZdxUcOWu9vahAOsRFebqPGKpmCbs2B9OAoZdfRyQk0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sR24RKh4zMSgclcrxj1F1+KmbYJ25wrGqBezsTAXxrMDLv/6DZ2NjrP6R3Uz22/Cn
         IYMXLFrj0YcFrg1V9ilmbZHrzTKCb8OBAD2gl22uRlvNvNi26DcFYcqFJ/hRhGX1bM
         zJ/NGsKdmkY+DDtRBqyAP8tc6y091SpxXVUquZBYw/W+PjMSxPPsqlBh9M9/ImuvNQ
         Z3/loEfBmDWSVmVxkXKjS++T+vbjW9yaXEpsi1SHRdQgHCwF09ZPTj75aCf3eA8IFM
         Uk5TxTNmGl07aEdkZ+MF0UKqqKoFxeuQsev+4aiQpwoGx1C2a/QlWk/cSq7LyXTeUE
         TQcTTaPaU3E1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126043155.1847823-1-bjorn.andersson@linaro.org>
References: <20210126043155.1847823-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add SC8180x GCC binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 08 Feb 2021 10:03:39 -0800
Message-ID: <161280741945.76967.14600728107858917834@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-01-25 20:31:54)
> Add devicetree binding for the global clock controller found in the
> Qualcomm SC8180x platform.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
