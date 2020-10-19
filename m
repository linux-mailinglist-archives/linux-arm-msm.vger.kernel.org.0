Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099F7293170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 00:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbgJSWmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 18:42:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbgJSWmF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 18:42:05 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F9C0223FD;
        Mon, 19 Oct 2020 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603147325;
        bh=2rbAkKu9iooocuDeAFbUAaUJTkq1ypEHmoR9qL+Cdik=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AgYiUynWfcw0wfcYRHs+bdtzObmOS9b56k/Rc6LUdrSwribgiLRKQv4B2coDspwrL
         gdjoRseLp59TpE7Sgqn7iCXnlWx6wfB5MdOcj5keQ+fmlkVbEMaSkJDUbIXh9QXKdQ
         nSOB50C3r7+agPapwMxN19UYVrT+gieiRQEqcHQY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/4] clk: qcom : add sm8250 LPASS GFM drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Mon, 19 Oct 2020 15:42:03 -0700
Message-ID: <160314732379.884498.15569172477533491589@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-10-16 07:12:37)
> This patchset adds support for GFM Muxes found in LPASS
> (Low Power Audio SubSystem) IP in Audio Clock Controller
> and Always ON clock controller.
>=20
> Clocks derived from these muxes are consumed by LPASS Digital Codec.
> Currently the driver for Audio and Always ON clock controller only
> supports GFM Muxes, however it should be easy to add more clock
> support when required
>=20
> Changes since v2:
> - updated Kconfig text and help as suggested by Stephen
> - removed unnecessary header file include
> - use fw_name instead of name for parents
> - use devm_platform_ioremap_resource
>=20
> verified dt_binding_check to pass on linux master,

Which linux master? Can you try on linux-next?
