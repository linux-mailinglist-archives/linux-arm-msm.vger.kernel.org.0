Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D343AF530
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 20:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhFUSnC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 14:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhFUSnB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 14:43:01 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AE5C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 11:40:46 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 129841F535;
        Mon, 21 Jun 2021 20:40:44 +0200 (CEST)
Subject: Re: [PATCH net-next 3/6] net: ipa: disable misc clock gating for IPA
 v3.1
To:     Alex Elder <elder@linaro.org>, davem@davemloft.net, kuba@kernel.org
Cc:     robh+dt@kernel.org, jamipkettunen@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210621175627.238474-1-elder@linaro.org>
 <20210621175627.238474-4-elder@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <fc8beed5-e1ca-330b-7db4-c1364c48f532@somainline.org>
Date:   Mon, 21 Jun 2021 20:40:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210621175627.238474-4-elder@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 21/06/21 19:56, Alex Elder ha scritto:
> For IPA v3.1, a workaround is needed to disable gating on a MISC
> clock.  I have no further explanation, but this is what the
> downstream code (msm-4.4) does.
> 
> This was suggested in a patch from AngeloGioacchino Del Regno.
> 
> Link: https://lore.kernel.org/netdev/20210211175015.200772-2-angelogioacchino.delregno@somainline.org
> Signed-off-by: Alex Elder <elder@linaro.org>

Acked-by: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@somainline.org>
