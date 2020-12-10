Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28F52D4FCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgLJAfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:35:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:56006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728740AbgLJAfA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:35:00 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560459;
        bh=PDywoq0SwBaZtbjjJeN87FvqLAhtGk7Y1iBuXeV1lg0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I5jC2RA+40BxWa8gmeoPm8B7DOfFRIf/Ly5ptY6OkJN97KizSv+NUV2+lwREqZsak
         NkYESk+wgrJeqr8Wtr/7crfqwyVqKeGuueM3ruUMfhPh0QGFdGPCvL+fsQ8FbqbmiN
         PY4aMX3SU0qMw33hS83dzbJgNwbWsD137Om/oRcJaY9eyBFZ33EfNvR257xSRGfgLn
         a+B0tyYOr4vniUgFheg9wFNkDEc69b5rJQ4udDkmSiYKPFu32lQb7kNTbGXjsQQJ2c
         njb6NmrqZFicOUan1/7IV+tZW5FOtOSsJvAcI+db+PmRUDKDBewjXIMEyLzdBpCxIz
         0bZQypM8+AmDw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-6-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-6-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 5/6] dt-bindings: clock: Add GDSC in SDX55 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:34:18 -0800
Message-ID: <160756045835.1580929.1362529049352724788@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:43)
> Add GDSC instances in SDX55 GCC block.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
