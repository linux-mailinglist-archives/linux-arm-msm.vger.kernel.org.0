Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B3C2A759E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732805AbgKECkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:40:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:54484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKECkp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:40:45 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3429A20756;
        Thu,  5 Nov 2020 02:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604544044;
        bh=MuagMXnz/L30k9Er1hEYit6MyS1Bwfa+/UL/LXLWylE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=poAjbLQCjJ2v4FDS/d/CI2igYuUBdytoVk61H0Dl/RybVOa0CiwHWYoQUiavIlNXp
         /i1QAhaxYMUyTXEi92Vb+7Z9MwB8gWWuUn+hF7ND42Xx0+IoT+Wq5AcOTcpyYd+67L
         FRkuDM18UBd1nLLa/4lFYV2wj1BsN7kWVNTf9zQ8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org> <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v3 1/4] dt-bindings: clock: Add support for LPASS Audio Clock Controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 04 Nov 2020 18:40:42 -0800
Message-ID: <160454404282.3965362.6930155221021872646@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-10-26 05:02:18)
> Audio Clock controller is a block inside LPASS which controls
> 2 Glitch free muxes to LPASS codec Macros.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
