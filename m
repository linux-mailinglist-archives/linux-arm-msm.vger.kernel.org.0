Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D10C2F37A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 18:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbhALRui (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 12:50:38 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:51053 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbhALRui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 12:50:38 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5D1791F9F3;
        Tue, 12 Jan 2021 18:49:54 +0100 (CET)
Subject: Re: [PATCH 5/7] regulator: qcom-labibb: Implement short-circuit and
 over-current IRQs
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
 <20210109132921.140932-6-angelogioacchino.delregno@somainline.org>
 <20210111135745.GC4728@sirena.org.uk>
 <6dee36e4-fc78-c21b-daf8-120ee44535a3@somainline.org>
 <8115a574-ad43-d3c6-70d4-28c8a2f4a5f6@somainline.org>
 <09d70d24-5d0d-f1cd-d99e-5c213c8ea98c@somainline.org>
 <20210112172919.GD4646@sirena.org.uk>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <e872bc39-a941-d552-5145-49f40d6fa657@somainline.org>
Date:   Tue, 12 Jan 2021 18:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112172919.GD4646@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 12/01/21 18:29, Mark Brown ha scritto:
> On Mon, Jan 11, 2021 at 10:06:18PM +0100, AngeloGioacchino Del Regno wrote:
> 
>> ...which was already a requirement before I touched it.
>> Now, this leaves two options here:
>> 1. Keep the of_get_irq way, or
>> 2. Move the interrupts, change the documentation (currently, only
>> pmi8998.dtsi) and also fix pmi8998.dtsi to reflect the new changes.
> 
>> I am asking before proceeding because I know that changing a schema that is
>> already set sometimes gets "negated".
> 
> Well, if the binding isn't actually used changing it is a possibility.
> If we keep the current binding you can still continue to use
> of_get_irq() even from within the probe function, you know the name of
> the node it's supposed to be in so you don't need to iterate or anything
> to get it so not really any reason to use the callback.
> 

I had understood that you didn't want to see of_* functions used in the 
driver, that's why I was hesitant about the first one.

I would be more for keeping the binding (that, by the way, is not really 
used, the interrupts weren't implemented at all in the driver before me 
doing that) for just one reason, which I'm going to explain with "sort 
of" pseudocode (just to be shorter):

EXAMPLE 1:
labibb {
     interrupts = <0 0>, <1 0>, <2 0>, <3 0>;
     interrupt-names = "lab-sc", "lab-ocp", "ibb-sc", "ibb-ocp";
     lab { };
     ibb { };
};

for (i = 0; i < max_vregs; i++) {
     short_circuit = platform_get_irq(pdev, i * 2);
     overcurrent = platform_get_irq(pdev, ((i * 2) + 1));
}

EXAMPLE 2:

snprintf strings for {lab,ibb}_{shortcircuit,overcurrent}, use 
platform_get_irq_byname
(pdev, blah);

EXAMPLE 3:
labibb {

     lab {
       interrupts = <0 0>, <1 0>;


       interrupt-names = "sc", "ocp";

     };

     ibb {

       interrupts = <2 0>, <3 0>;


       interrupt-names = "sc", "ocp";


     };

};



for (i = 0; i < max_vregs; i++) {

     short_circuit = of_irq_get_byname(node, "sc");

     overcurrent = of_irq_get_byname(node, "ocp");

}


First of all, in the *EXAMPLE 1*, we may be declaring interrupts for 
both LAB and IBB, but actually disabling one of the two regulators: in 
this specific case (I have no idea why anyone would want to do that, but 
evaluating all the cases anyway) the human readability would be way 
lower, in my opinion, as that'd add a possible layer of confusion.
Also, I don't really like having to preallocate an array of chars and 
snprintf names here and there (EXAMPLE 2) on the fly: in my eyes, it 
looks a bit of a mess, but that's a highly personal opinion, many may 
disagree.

In *EXAMPLE 3* everything looks more human readable and, in some way, 
less error-prone, as we can just use two fixed strings and that's it, 
without multiplying this and adding that.


I would go for keeping the current binding for the aforementioned 
reasons. Before I go on sending a V2, I would like to know your opinion.
Do you agree?

Thanks,
-- Angelo
