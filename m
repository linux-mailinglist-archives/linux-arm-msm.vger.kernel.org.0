Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACCF362824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 20:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239985AbhDPS4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 14:56:31 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:60977 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239904AbhDPS4b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 14:56:31 -0400
Received: from [192.168.1.101] (abae68.neoplus.adsl.tpnet.pl [83.6.168.68])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C079C3E984;
        Fri, 16 Apr 2021 20:56:03 +0200 (CEST)
Subject: Re: [PATCH 2/2] arm64: boot: dts: qcom: sm8150: Add DMA nodes
To:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
References: <20210416133133.2067467-1-balbi@kernel.org>
 <20210416133133.2067467-3-balbi@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <0bb8e50d-9ea1-f616-6493-20fcb4e09e31@somainline.org>
Date:   Fri, 16 Apr 2021 20:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210416133133.2067467-3-balbi@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>one little note. This was for a quick test. I can either remove, keep it
>or complete with the rest of the SPIs in this same patch. Let me know

>what y'all prefer :-)


Yeah, please remove it from this one and send in a separate patch, preferably adding dmas to all the QUPs :)


Aaand since I already asked you to re-send, you might as well fix up the properties order under the nodes (compatible first, then reg, with #dma-cells somewhere at the bottom) and the unit name (should be "dma-controller@...").


Konrad


