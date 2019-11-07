Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C466F3A9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfKGVlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:41:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:55330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVlt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:41:49 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AB352085B;
        Thu,  7 Nov 2019 21:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573162909;
        bh=NwRi7F5b4m0DvtR2YffIsKlEZhmuESH2Eg49UTiEZ2Q=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ON3NIgyiZPJrPDwxF9YPsDbH0617vMoRjOpXZkaKVHxxLVkcDvjVQGtcLK8zC5awt
         ztalc+7m2hwiFYm5vBTKPz+81sXJxu0JPcDp8txJgAWkywnkBOt6ER/UEONTXxqGDe
         IJkpBcP5VxyJ5oBH0xw9kwhGqaqUxNfrpnfMNVo8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191107192136.5880-1-jeffrey.l.hugo@gmail.com>
References: <20191107192136.5880-1-jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] clk: qcom: Enumerate clocks and reset needed to boot the 8998 modem
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:41:48 -0800
Message-Id: <20191107214149.2AB352085B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-07 11:21:36)
> We need to control five additional clocks and a reset inorder to boot the
> modem on msm8998.  If we can boot the modem, we have a place to run the
> wlan firmware and get wifi up and running.
>=20
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

