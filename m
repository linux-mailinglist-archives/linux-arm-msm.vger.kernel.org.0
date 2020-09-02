Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD8625B093
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIBQBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:01:48 -0400
Received: from vern.gendns.com ([98.142.107.122]:43992 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgIBQBq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:01:46 -0400
X-Greylist: delayed 1456 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Sep 2020 12:01:46 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yyRr2hG0sCpKaJrgcmdtUkD7ebP0o5jhSFj3BbVNnkY=; b=nJKXAQ9tTQ7ZOwHuo+uRhTe9wb
        Ku9XOzShdKOOPlPWSCEANG6GEWBUMdaJDMTYS83nlrOfDREaCBxE8jCDCuQzC2vtP07fIn7IhKM0y
        rVChBa9HHXDzqZ1z7NGh2wJFVWC/Oyn2NkEp7h9KYv5XQrm4/3IRTAmjJ5u5A5y+CLQ87HAncPx5U
        AjMFTiQhBC0XTWoSjUOcXKkuTYKlGKz4KqYRWDvgxGrv8MhfhXqQxVs8V5PGhoZWwvKbjxKEi4SW3
        LJQEAp3PFP8+Vxh6c7fIqucOie6m3qQxei1y92ea+bsnXgD2P3HlqrGFbWWw4DK9N8b8c8tU8SOiF
        JmldU8Xw==;
Received: from [2600:1700:4830:165f::19e] (port=47966)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kDUpB-0002MF-Ky; Wed, 02 Sep 2020 11:37:25 -0400
Subject: Re: [PATCH 09/10] clk: davinci: Add missing kerneldoc
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902150348.14465-9-krzk@kernel.org>
From:   David Lechner <david@lechnology.com>
Message-ID: <9c273343-d3ef-a8e1-368e-366391d709ba@lechnology.com>
Date:   Wed, 2 Sep 2020 10:37:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902150348.14465-9-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/2/20 10:03 AM, Krzysztof Kozlowski wrote:
> Add missing kerneldoc to fix compile warning:
> 
>    drivers/clk/davinci/da8xx-cfgchip.c:578: warning: Function parameter or member 'dev' not described in 'da8xx_cfgchip_register_usb1_clk48'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

