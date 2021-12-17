Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2491C47894C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Dec 2021 11:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbhLQK5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Dec 2021 05:57:47 -0500
Received: from guitar.tcltek.co.il ([84.110.109.230]:42678 "EHLO mx.tkos.co.il"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235032AbhLQK5r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Dec 2021 05:57:47 -0500
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 21523440636;
        Fri, 17 Dec 2021 12:57:42 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1639738662;
        bh=nXrybOou6I+bLCeC59H2ijJczueTEn33xckeQ5jyN8g=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=b9O/Dzz2ED2+nsOztjgbYw5H4tiGJSaorV1Sgux7ppPJ4+4XYA+PI+Fbn3kjOjgsE
         Vpbs9ZaTzNUPtArPSfzmXL0jzMeq5gvs4N3tP16D6A9Lq6lxeJDZqC96w0Lw9NfdxG
         MSMAMhhy6rgC1/EozbWrHICIKhEzSNbqlll4nkZ4DSXRTlw8ZDOiRZho+2l3DmqVOu
         iNvbipFgJPJ84b0y2EpG3Wvxa2gW3dj6Tkqjv+zfPq6L6FRu3d5YEYS48lXsENFfhU
         AzB7OSz8aHW7Czxo3eKQGczVztw4wUJNB5a3zx89XDyD2bZuecVXQXzLDafjJ2unAm
         EkIlQeNBsJJfQ==
References: <e7ee9012055a4ba9afcb1ffbbeda25f113f171b6.1638701145.git.baruch@tkos.co.il>
 <YbxfO8MQtWrONKvh@kroah.com>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Fix registration when
 tx-fifo-resize exists
Date:   Fri, 17 Dec 2021 12:55:38 +0200
In-reply-to: <YbxfO8MQtWrONKvh@kroah.com>
Message-ID: <87zgozlcrb.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Fri, Dec 17 2021, Greg Kroah-Hartman wrote:
> On Sun, Dec 05, 2021 at 12:45:45PM +0200, Baruch Siach wrote:
>> Commit cefdd52fa04 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
>> property by default") added the tx-fifo-resize property. But when this
>> property exists already, of_add_property() fails with -EEXIST, thus
>> breaking core registration. This regresses the IPQ6018 platform that has
>> tx-fifo-resize in its device-tree.
>> 
>> Don't fail when tx-fifo-resize exists.
>> 
>> Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
>> Cc: Wesley Cheng <wcheng@codeaurora.org>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 9abbd01028c5..bbd8e401a82c 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -667,7 +667,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>>  
>>  	prop->name = "tx-fifo-resize";
>>  	ret = of_add_property(dwc3_np, prop);
>> -	if (ret) {
>> +	if (ret && ret != -EEXIST) {
>>  		dev_err(dev, "unable to add property\n");
>>  		goto node_put;
>>  	}
>
> This commit does not apply to my tree at all.  What tree/branch did you
> make it against?

This is against v5.16-rc3. As of -rc5 commit 6a97cee39d reverted the
offending commit. So all is good now.

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
