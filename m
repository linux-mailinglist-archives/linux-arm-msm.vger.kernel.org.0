Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE95434286
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 02:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhJTAYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 20:24:53 -0400
Received: from ixit.cz ([94.230.151.217]:54190 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhJTAYx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 20:24:53 -0400
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id C559520064;
        Wed, 20 Oct 2021 02:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634689358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qzn7S1wEwOJ+diOSw+M+FMkCSN4i7amr9OpVpFa1ZHc=;
        b=HS5AR4oYDHGOYoL8iEHmWm1RyjcKEjnCiM2Eue9n2ky7mOI96/NQU+Y+nRJKavkzzYiI0N
        oJG5S5tuBj1ZPkVLAAhyhPzvMhFMa4xPwI8rehfzOOc76eJS+Vd+BFs3DfhGSNf5Lkl2kg
        4Qxmjagc5AKyebnqx9fqPZeb8+1QrKY=
Date:   Wed, 20 Oct 2021 02:21:03 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: arm: qcom, change vendor-prefix lge to lg
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <4B291R.7J8TGCG15J0P1@ixit.cz>
In-Reply-To: <YW84IrUDwslDCiDs@robh.at.kernel.org>
References: <20211008225157.51287-1-david@ixit.cz>
        <YW84IrUDwslDCiDs@robh.at.kernel.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Right, sent new patch "dt-bindings: arm: qcom: Nexus 4 was build by LG, 
not Asus"
Thanks
David

On Tue, Oct 19 2021 at 16:26:58 -0500, Rob Herring <robh@kernel.org> 
wrote:
> On Sat, Oct 09, 2021 at 12:51:57AM +0200, David Heidelberg wrote:
>>  lge never existed, use correct lg vendor-prefix
>>  other lge -> lg conversions are comming in different series
> 
> Doesn't match the change: asus -> lg
> 
>> 
>>  Fixes: 9304af37d07b ("dt-bindings: arm: qcom, add missing devices")
>> 
>>  Signed-off-by: David Heidelberg <david@ixit.cz>
>>  ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom.yaml
>>  index 239c02b6cbf6..b0b4f9d72935 100644
>>  --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>  +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>  @@ -101,8 +101,8 @@ properties:
>> 
>>         - items:
>>             - enum:
>>  -              - asus,nexus4-mako
>>                 - asus,nexus7-flo
>>  +              - lg,nexus4-mako
>>                 - sony,xperia-yuga
>>                 - qcom,apq8064-cm-qs600
>>                 - qcom,apq8064-ifc6410
>>  --
>>  2.33.0
>> 
>> 


