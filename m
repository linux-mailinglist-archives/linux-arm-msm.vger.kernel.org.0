Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F951D951B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 13:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgESLSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 07:18:51 -0400
Received: from h2.fbrelay.privateemail.com ([131.153.2.43]:59734 "EHLO
        h2.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbgESLSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 07:18:51 -0400
Received: from MTA-06-4.privateemail.com (mta-06.privateemail.com [68.65.122.16])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 102638009C;
        Tue, 19 May 2020 07:18:50 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
        by MTA-06.privateemail.com (Postfix) with ESMTP id 79E5860043;
        Tue, 19 May 2020 07:18:47 -0400 (EDT)
Received: from casper (unknown [10.20.151.210])
        by MTA-06.privateemail.com (Postfix) with ESMTPA id 0B1B76003F;
        Tue, 19 May 2020 11:18:46 +0000 (UTC)
Date:   Tue, 19 May 2020 04:18:46 -0700
From:   Eli Riggs <eli@rje.li>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add initial sm6125 SoC support
Message-ID: <20200519041846.3892747b@casper>
In-Reply-To: <20200519060848.GB2165@builder.lan>
References: <20200517115410.3374-1-eli@rje.li>
 <20200517115410.3374-2-eli@rje.li>
 <20200519060848.GB2165@builder.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 May 2020 23:08:48 -0700
Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> Please use dual GPL/BSD license for dts files, if you can.

Unfortunately the downstream tree I ported has a GPL-2-only header.

> [...review]

OK

> Given that you won't get very far without GCC and e.g.  pinctrl
> driver I would prefer to see some patches for those as well, to
> ensure that this will be able to go beyond basic UART.

Cleaning up my gcc and clk-smd-rpm drivers now, as well as another
patchset for pm6125, qusb2-phy, dwc3, and sdhci. TLMM in the vague
future.

Eli
