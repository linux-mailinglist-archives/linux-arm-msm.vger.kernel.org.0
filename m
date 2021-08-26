Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C4F3F8E4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243440AbhHZS5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:57:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243375AbhHZS5l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:57:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D603961037;
        Thu, 26 Aug 2021 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630004213;
        bh=w4Uab4AooAYn0N9kq1geOud3mJ+cZq68EOwvt0u2rQo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mnwhPIb9BXNGirjTKiFTcKNebA5vOZ+gV1j/kpiFHadoBWBJrLeszaECJOSWVjUaB
         JxBqJtUPRCpKdeNU4YyGLqsHDKErd0nlPm0QJOHv5xXFpCVO+7SA3qwZ3mrzSzK3zx
         KIkF6/4OJjyI4WnEE3z3uGF4Uh3cS2ySmLt/1j/3dx9P2IHO/1LewRfY759HDBq82V
         TJU2NBxr8la5Dk31hnM5Ui7gt3Ngs1iXEXxOVGgC1G1zbg9jegVUAqV8ZPo+W5VHY0
         enrmfgnKL7zOU4QJlDudK9eeD+P2DuVjExZCgJCAF8DTzCpYJLyWvb/V0inXJxBUGA
         sxn1DpBXsM/NA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <IPvVnyRWbHuQFswiFz0W08Kj1dKoH55ddQVyIIPhMJw@cp7-web-043.plabs.ch>
References: <IPvVnyRWbHuQFswiFz0W08Kj1dKoH55ddQVyIIPhMJw@cp7-web-043.plabs.ch>
Subject: Re: [PATCH RESEND 2/2] clk: qcom: Add Global Clock Controller driver for MSM8953
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>,
        bjorn.andersson@linaro.org
Date:   Thu, 26 Aug 2021 11:56:52 -0700
Message-ID: <163000421272.1317818.15533893617596305776@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sireesh Kodali (2021-08-05 02:06:57)
> From: Vladimir Lypak <junak.pub@gmail.com>
>=20
> This driver provides clocks, resets and power domains for MSM8953
> and compatible SoCs: APQ8053, SDM450, SDA450, SDM632, SDA632.
>=20
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---

Applied to clk-next
