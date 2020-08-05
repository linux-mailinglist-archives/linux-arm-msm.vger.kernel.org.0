Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E27E23C55C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 07:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgHEF55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 01:57:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:52564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgHEF54 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 01:57:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EEF620842;
        Wed,  5 Aug 2020 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596607076;
        bh=W3zsNCyLc3NTNHewwLrfUIfnFDZpKr8OqNLqG8AP0Ys=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1Rl+zU653VymMhQ8798hNVYe+Lfw3LQXU/j2WIDZrg68wyYuoDYq5WuRk5nmzsN96
         +xGNUYl77jfH4KoMdSz45Mlp1FRfKhEHS7m+2UYwOY3j2tQovgp9pG5PDF3g/ADYMi
         yc4tAatwZUujzjtr91r1kqz+NiZYqgtxKkwqSf+4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200804004523.7964-2-wcheng@codeaurora.org>
References: <20200804004523.7964-1-wcheng@codeaurora.org> <20200804004523.7964-2-wcheng@codeaurora.org>
Subject: Re: [PATCH v7 1/4] usb: typec: Add QCOM PMIC typec detection driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, robh+dt@kernel.org
Date:   Tue, 04 Aug 2020 22:57:55 -0700
Message-ID: <159660707513.1360974.15430336687566945227@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-08-03 17:45:20)
> The QCOM SPMI typec driver handles the role and orientation detection, and
> notifies client drivers using the USB role switch framework.   It registe=
rs
> as a typec port, so orientation can be communicated using the typec switch
> APIs.  The driver also attains a handle to the VBUS output regulator, so =
it
> can enable/disable the VBUS source when acting as a host/device.
>=20
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
