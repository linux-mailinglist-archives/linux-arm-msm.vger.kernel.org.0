Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7A614E6C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 02:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgAaBGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 20:06:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:37398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727648AbgAaBGz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 20:06:55 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3336320678;
        Fri, 31 Jan 2020 01:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580432814;
        bh=jsJEjfvvosoNzF+1nP8nbj7092fwdtBhOz2X+N5rSYc=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=EAVQXk1uO5WynQ7Wtd1arSl2mIu7+KTMUvTyGUtP+CBTahefWsrjBU/w5+WVG5pbJ
         6oeJf0VKlrt/bX9mb5sNu4yXZTeLRu/m8+rnihFdYrPqyT+y1zbbhNQrvRbDOAHQvT
         kM55lR9ogO4s8yk5mrgvNveWr+uooWYXRl/S1ipM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH 01/17] clk: sunxi: sunxi-ng: convert to devm_platform_ioremap_resource
To:     Eugeniy.Paltsev@synopsys.com, Yangtao Li <tiny.windzz@gmail.com>,
        afaerber@suse.de, agross@kernel.org, aisheng.dong@nxp.com,
        allison@lohutok.net, chunhui.dai@mediatek.com,
        cw00.choi@samsung.com, daniel.baluta@nxp.com, dinguyen@kernel.org,
        emilio@elopez.com.ar, festevam@gmail.com, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, heiko@sntech.de, jcmvbkbc@gmail.com,
        john@phrozen.org, jonathanh@nvidia.com, kernel@pengutronix.de,
        kgene@kernel.org, krzk@kernel.org, kstewart@linuxfoundation.org,
        linux-imx@nxp.com, manivannan.sadhasivam@linaro.org,
        matthias.bgg@gmail.com, miquel.raynal@bootlin.com,
        mripard@kernel.org, mturquette@baylibre.com, nsekhar@ti.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, rfontana@redhat.com,
        robh@kernel.org, s.hauer@pengutronix.de, s.nawrocki@samsung.com,
        shawnguo@kernel.org, swinslow@gmail.com, t-kristo@ti.com,
        tglx@linutronix.de, thierry.reding@gmail.com,
        tomasz.figa@gmail.com, wangyan.wang@mediatek.com,
        weiyongjun1@huawei.com, wens@csie.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Yangtao Li <tiny.windzz@gmail.com>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 17:06:53 -0800
Message-Id: <20200131010654.3336320678@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Yangtao Li (2019-12-09 11:57:33)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Please add a cover letter, resend this series picking up any acks and
dropping any patches that were rejected by maintainers of the drivers.
There was significant discussion on one patch that was rejected, so I'll
only pick up patches for the next cycle that are acked/reviewed-by
relevant folks.

