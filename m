Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53366F3AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfKGVoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:44:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:56446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVoB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:44:01 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C0C12166E;
        Thu,  7 Nov 2019 21:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573163041;
        bh=ogDmmVJdhHcqMKGnCV3ieEKxbdnDkVZcDWMpMM+zo/w=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=mbRoCj3ZIZBuBNE+n47AQzvThDe7Gwlgb0WQXascyDi8gAwtfuIEazb9f+lSL4+Fl
         Eo+7Mk5HrhCHp/Oy6/pVQGLp54OrvoOFhUm7QhRHoNmB3HnjlUpOW0OkX1tzBP5hnk
         yCN6u5gj0wYB1c4heRTQgOWWLQUv/s8jqB1iseZg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031185733.15553-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com> <20191031185733.15553-1-jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v5 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:44:00 -0800
Message-Id: <20191107214401.1C0C12166E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-31 11:57:33)
> The GPUCC manages the clocks for the Adreno GPU found on MSM8998.
>=20
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

