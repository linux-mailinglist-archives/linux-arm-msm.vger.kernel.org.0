Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB4D2E2CC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Dec 2020 01:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgLZAwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Dec 2020 19:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgLZAwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Dec 2020 19:52:30 -0500
X-Greylist: delayed 132647 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Dec 2020 16:51:34 PST
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3057AC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Dec 2020 16:51:34 -0800 (PST)
Received: from [192.168.1.101] (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7CDF71F98B;
        Sat, 26 Dec 2020 01:51:28 +0100 (CET)
Subject: Re: [PATCH 1/7] clk: qcom: clk-alpha-pll: Add support for Stromer
 PLLs
To:     Varadarajan Narayanan <varada@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, nsekar@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sricharan@codeaurora.org
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-2-git-send-email-varada@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <51544129-a04e-16a2-64e5-e004ea19bf8c@somainline.org>
Date:   Sat, 26 Dec 2020 01:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1601270140-4306-2-git-send-email-varada@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, are you going to resubmit this patch? Looks like MDM9607 uses Stromer PLL for its CPU clocks and could benefit from it.


Konrad

