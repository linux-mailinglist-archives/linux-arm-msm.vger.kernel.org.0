Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACD745DD8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 16:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356022AbhKYPik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 10:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbhKYPgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 10:36:40 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E2C0613FF;
        Thu, 25 Nov 2021 07:27:01 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A3F5E3F748;
        Thu, 25 Nov 2021 16:26:53 +0100 (CET)
Subject: Re: [PATCH 3/3] dt-bindings: display: msm: Add binding for msm8998
 dpu
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, abhinavk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        devicetree@vger.kernel.org
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-3-angelogioacchino.delregno@somainline.org>
 <YTexaJuQSNazh9sn@robh.at.kernel.org>
 <d9ad36f5-1913-2cb3-d4be-125ed2d29041@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <fca60152-7f35-e38d-8a51-c9cd74e20674@somainline.org>
Date:   Thu, 25 Nov 2021 16:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d9ad36f5-1913-2cb3-d4be-125ed2d29041@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 25/11/21 12:53, Dmitry Baryshkov ha scritto:
> On 07/09/2021 21:37, Rob Herring wrote:
>> On Wed, Sep 01, 2021 at 08:11:38PM +0200, AngeloGioacchino Del Regno wrote:
>>> Add yaml binding for msm8998 dpu1 support.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@somainline.org>
>>> ---
>>>   .../bindings/display/msm/dpu-msm8998.yaml     | 220 ++++++++++++++++++
>>>   1 file changed, 220 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> new file mode 100644
>>> index 000000000000..db435342ecbf
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> @@ -0,0 +1,220 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>> +%YAML 1.2
>>> +---

<snip>

>>> +
>>> +        power-domains = <&mmcc MDSS_GDSC>;
>>> +        ranges;
>>> +        status = "disabled";
>>
>> Drop. Why disable an example?
> 
> AngeloGioacchino, could you please update and repost this patch series? I'd like to 
> get it merged.
> 

Hey Dmitry,

Sure I can!
Will update/rebase/fix as soon as I find some spare time around.

Thanks,
- Angelo
