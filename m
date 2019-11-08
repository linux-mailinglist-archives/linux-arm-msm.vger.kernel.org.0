Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53589F5B39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 23:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfKHWor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 17:44:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:48044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbfKHWoq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 17:44:46 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A84A214DA;
        Fri,  8 Nov 2019 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573253086;
        bh=0JpyT1oR1DRBl90GHocBPT9cD2Z11tatxZbUO5P88ww=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=qPGRbi//oK2wdOL/h8BqqfGD20OLrQ9MQx+UrlTamwFKbAJEr9iv5V4ya/JO3UNmN
         L/lQ03+bZQvfOL6r5d9KqI7hXsJgoXFs+6PCY2Pb0o4OKPCXo8ULXRdkrf8JKx+cRW
         qaB0bif8KooAMNi1NS0lLfp0umKV86SUA1xvGSro=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573247677-20965-1-git-send-email-jhugo@codeaurora.org>
References: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org> <1573247677-20965-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v7 5/6] clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 14:44:45 -0800
Message-Id: <20191108224446.3A84A214DA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-08 13:14:37)
> Add a driver for the multimedia clock controller found on MSM8998
> based devices. This should allow most multimedia device drivers
> to probe and control their clocks.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Driver looks good.

Can you resend with minor fixes to binding and not include dts changes
in the series? I can then apply the whole series once Rob acks/reviews
the binding updates.

