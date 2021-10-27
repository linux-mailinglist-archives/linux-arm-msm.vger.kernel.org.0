Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A99843C4F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 10:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbhJ0IZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 04:25:05 -0400
Received: from ixit.cz ([94.230.151.217]:53606 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236550AbhJ0IZE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 04:25:04 -0400
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 9035720064;
        Wed, 27 Oct 2021 10:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635322956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hSWxFx5H3u7VkFxWrskfDzG37Qm/SgrsmKEi2GSvllg=;
        b=tdq+tPMYciG8TbHbeeFjH8BrtqjBswRKJe9zDbjF3pMsPdTrndWT0foAd4ApVprRkwpMaY
        m8k1+AhAwC/UjibgHgjAjtL3hTuYP0nmvVTyuD5nJhBPUNiyUEdllCbnGNcSqDAesoUQvd
        c08yO/Xry+4rm1l/vZ3SCqL/FNfCpDs=
Date:   Wed, 27 Oct 2021 10:22:29 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6] dt-bindings: drm/msm/gpu: convert to YAML
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>
Message-Id: <H9NM1R.O70ALO0PAFVF@ixit.cz>
In-Reply-To: <YW17J03XTvJgfBfj@robh.at.kernel.org>
References: <20211017144350.70295-1-david@ixit.cz>
        <YW17J03XTvJgfBfj@robh.at.kernel.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Rob,

can this patch can go in?

Thank you
David


On Mon, Oct 18 2021 at 08:48:23 -0500, Rob Herring <robh@kernel.org> 
wrote:
> On Sun, 17 Oct 2021 16:43:50 +0200, David Heidelberg wrote:
>>  Conversion of text binding for Adreno GPU to the YAML format.
>> 
>>  Signed-off-by: David Heidelberg <david@ixit.cz>
>>  ---
>>  v2:
>>    - added compatbile description from Rob Clark
>>    - dropped reg description
>>    - reg numbers increased to 3 (since we also have uncommon cx_dbgc)
>>    - specified interconnect-names items range
>>    - defined zap-shader as an object and added it's properties
>>    - enforce 0 clocks for Andreno >= 6xx since it's defined in GMU 
>> node
>> 
>>  v3:
>>   - fix patterns (add backslash before dot)
>>   - add additional clocks
>>   - adreno@ -> gpu@
>>   - add few const and change enum to anyOf
>>   - added clock & clock-names placeholder in non-conditional part
>>   (description)
>> 
>>  v4:
>>   - clock & clock-names - true,false instead maxItems
>>   - impl. #stream-id-cells, nvmem-cell-names, nvmem-cells
>>   - dropped requirement on firmware-name in zap_shader
>> 
>>  v5:
>>   - maxOtems -> maxItems typo fix
>> 
>>  v6:
>>   - enum -> const to fix ordering
>>   - opp-table is object
>>   - spacing
>>   - drop undocumented and unused #stream-id-cells
>> 
>>   .../devicetree/bindings/display/msm/gpu.txt   | 157 ----------
>>   .../devicetree/bindings/display/msm/gpu.yaml  | 288 
>> ++++++++++++++++++
>>   2 files changed, 288 insertions(+), 157 deletions(-)
>>   delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/gpu.txt
>>   create mode 100644 
>> Documentation/devicetree/bindings/display/msm/gpu.yaml
>> 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>


