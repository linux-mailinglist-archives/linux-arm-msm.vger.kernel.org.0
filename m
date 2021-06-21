Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD7F3AF53F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 20:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhFUSnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 14:43:47 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:57961 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhFUSno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 14:43:44 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 66A261F893;
        Mon, 21 Jun 2021 20:41:27 +0200 (CEST)
Subject: Re: [PATCH net-next 2/6] net: ipa: inter-EE interrupts aren't always
 available
To:     Alex Elder <elder@linaro.org>, davem@davemloft.net, kuba@kernel.org
Cc:     robh+dt@kernel.org, jamipkettunen@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210621175627.238474-1-elder@linaro.org>
 <20210621175627.238474-3-elder@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <0f1f2f7f-b858-8367-b85c-b76964898fcc@somainline.org>
Date:   Mon, 21 Jun 2021 20:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210621175627.238474-3-elder@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 21/06/21 19:56, Alex Elder ha scritto:
> The GSI inter-EE interrupts are not supported prior to IPA v3.5.
> Don't attempt to initialize them in gsi_irq_setup() for hardware
> that does not support them.
> 
> Originally proposed by AngeloGioacchino Del Regno.
> 
> Link: https://lore.kernel.org/netdev/20210211175015.200772-4-angelogioacchino.delregno@somainline.org
> Signed-off-by: Alex Elder <elder@linaro.org>

Acked-by: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@somainline.org>
