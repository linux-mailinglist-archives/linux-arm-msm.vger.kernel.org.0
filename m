Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B01477314
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 14:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhLPN1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 08:27:25 -0500
Received: from guitar.tcltek.co.il ([84.110.109.230]:41618 "EHLO mx.tkos.co.il"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231685AbhLPN1Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 08:27:24 -0500
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id B9D09440850;
        Thu, 16 Dec 2021 15:27:18 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1639661239;
        bh=GGW4oMJYRC69vd45cdk19A3Rm8Gj9iXkt/iwHmF4JMM=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=lFkI0wVB3mBSuyWFka5umb5saMwVEhgbRH2CNfMTvaCPOeXIGbqjnUhdsz2tGEC1D
         Hbw4FbG7DYyGFH0MmlchCZogWVsCdlJYsBsbr82lE1T05Sch8JMsO5ARV8oWqS4ces
         ZAKxPJ40YEbmprw/XKzCRNFOmE3tvI7j7KN0Hjlux0fR7u73hzdWN2aoiNNgqjgTSz
         DCPc3AqSRvTOuRHshKCB7TkITKyRBgVs8nZEtVUF0NkhZAe+/Xvj1KvK6nB8QMDxnb
         C6cu+ST/6KwlqtImTEy8TMkO1qBMZIdgvLWJcZ4XJ50Dy6LWFkwPhUsBKiQm19C0Jt
         Y+tPVqe1usIRA==
References: <8a744cfd96aff5754bfdcf7298d208ddca5b319a.1638862030.git.baruch@tkos.co.il>
 <281f0532-2f3b-362a-5df6-d9cbe302606a@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Fix gpio-ranges property
Date:   Thu, 16 Dec 2021 14:11:32 +0200
In-reply-to: <281f0532-2f3b-362a-5df6-d9cbe302606a@gmail.com>
Message-ID: <874k78n0hz.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Florian,

On Wed, Dec 15 2021, Florian Fainelli wrote:
> On 12/6/21 11:27 PM, Baruch Siach wrote:
>> There must be three parameters in gpio-ranges property. Fixes this not
>> very helpful error message:
>> 
>>   OF: /soc/pinctrl@1000000: (null) = 3 found 3
>> 
>> Fixes: 1e8277854b49 ("arm64: dts: Add ipq6018 SoC and CP01 board support")
>> Cc: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> 
>> The error message was improved in commit af3be70a321 ("of: Improve
>> of_phandle_iterator_next() error message"), but there is evidently some
>> more room for improvement. As I don't really understand the code, I
>> added the commit author and the DT list to Cc.
>
> In the commit message you find what the error message was and then
> became which tells you which property was used to determine the cell
> size, and what count was obtained instead.
>
> In your particular case here however, since the proper was with the
> 'gpio-ranges' property and there is no property that indicates the cell
> size AFAICT, it might been more helpful to revert back to the old
> message maybe?

Thanks for taking a look. A few comment below.

> So maybe something like which is hopefully the best of
> both worlds:
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 372a177f3b80..63bff37bf035 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1378,9 +1378,13 @@ int of_phandle_iterator_next(struct
> of_phandle_iterator *it)
>                  * property data length
>                  */
>                 if (it->cur + count > it->list_end) {
> -                       pr_err("%pOF: %s = %d found %d\n",
> -                              it->parent, it->cells_name,
> -                              count, it->cell_count);
> +                       if (it->cells_name)
> +                               pr_err("%pOF: %s = %d found %d\n",
> +                                       it->parent, it->cells_name,
> +                                       count, it->cell_count);

Thinking about it, shouldn't we have 'it->list_end - it->cur' instead of
it->cell_count here? This change produces:

  OF: /soc/pinctrl@1000000: (null) = 3 found 2

which looks more correct. This is not related to my original issue,
though it might have helped me back then.

> +                       else
> +                               pr_err("%pOF: arguments longer than
> property\n",
> +                                      it->parent);
>                         goto err;
>                 }
>         }

I think that the best aid would have been the property name. But as far
as I can see struct of_phandle_iterator does not preserve the list_name
parameter of of_phandle_iterator_init().

Second best would probably be the phandle name, that is
of_node_full_name(it->node). It is a little confusing in this case
because it->node is the same as it->parent.

What do you think?

baruch

>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index 6a22bb5f42f4..a717fc17523d 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -220,7 +220,7 @@ tlmm: pinctrl@1000000 {
>>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>>  			gpio-controller;
>>  			#gpio-cells = <2>;
>> -			gpio-ranges = <&tlmm 0 80>;
>> +			gpio-ranges = <&tlmm 0 0 80>;
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>>  
>> 


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
