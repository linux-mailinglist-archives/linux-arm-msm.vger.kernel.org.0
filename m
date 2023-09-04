Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C78B791709
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbjIDMYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Sep 2023 08:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350132AbjIDMYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 08:24:22 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76F21B8
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 05:24:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40078c4855fso13560855e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693830256; x=1694435056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bydKmgcfnBrn6zqy9gih0IJ/7f6bZJC6JySV7YICefw=;
        b=lh+S4vx1Gk8754X7D5VZqIy+ltY82zeu9lTLXi8LgXryAoYXfj3mnZD4ePCohJALlE
         ZRryLA9KOro48RR1yDJQMQ8jS2p+h+XE+c5tLTq5XtbXoMeD0Gas0T3UPfnQ7ekblgf2
         74TuAcdlmZd6EcGtDOYvsviJstkbLuKPFqIv1zQDK+Kc5KqyKSrkprR7yiMEe/mrqCki
         R+cTkSZZpVZd9m/RKIWAe7H28S3pVxCfSAynqzgNr1TtwEETtFEFwqf56PsCEqe+382M
         R0vvR5wto1DEZAIX0BIrAxKzE1z2MOFAl1byxSux0PhL/f68i6WNpX6XR9tzx8XIhTLh
         xJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693830256; x=1694435056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bydKmgcfnBrn6zqy9gih0IJ/7f6bZJC6JySV7YICefw=;
        b=alWtyMgRYwE2V1mybj0IgOB4WpAzYPKA6esK34SmoFvSTzhnG5Yp6KEqmkM0cuzbqw
         EtslZvomyYtcWOa8tFCFAXJ6+skz5cKyejf/gpgp0qStIbIN023E1m6jpmS8M0qorTs3
         ocrpYUxvXWKvdReLtGufpkncDekr1jE55jamnjSmNLWxfrhHyxENgjyfnf0/R58k3nBX
         a6xp/7hfMGrCx1gvn29yrmSzP9AVoSS8s6OGUPUCuIo6x1LKNa6TIRMCr1o3Oqw1Da8Z
         AmqS6VC7n7ekM8QNQH9iq70WRgH4dHoJ06D/N5+61reUlDtKYG6LlQ6WlH15AIwLmAFz
         aPqA==
X-Gm-Message-State: AOJu0YzOmiHbymSIUU4uzM4tDHNZ6BYbSNtDUbuAXxMfUQVQECeNQGc8
        ppi+9ODLj7F8lhigWO8MnWk5DA==
X-Google-Smtp-Source: AGHT+IFrAgI71dnQ3lucSmJZ8Xj8kwOpEXyGtkrEu61tDg8JukeF/cHgajTlbmEv/Kwm08lwGpV/KQ==
X-Received: by 2002:a05:600c:2241:b0:401:c436:8999 with SMTP id a1-20020a05600c224100b00401c4368999mr7474061wmm.30.1693830256171;
        Mon, 04 Sep 2023 05:24:16 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a05600c219000b003fe2a40d287sm13944384wme.1.2023.09.04.05.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 05:24:15 -0700 (PDT)
Message-ID: <d7745ece-bea1-f8f9-a1d2-0f01aa221ade@linaro.org>
Date:   Mon, 4 Sep 2023 13:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/15] media: qcom: camss: Untangle if/else spaghetti
 in camss
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-9-bryan.odonoghue@linaro.org>
 <20230828185110.GN14596@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828185110.GN14596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2023 19:51, Laurent Pinchart wrote:
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -592,15 +592,19 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>>   	csid->camss = camss;
>>   	csid->id = id;
>>   
>> -	if (camss->res->version == CAMSS_8x16) {
>> +	switch (camss->res->version) {
>> +	case CAMSS_8x16:
>>   		csid->ops = &csid_ops_4_1;
>> -	} else if (camss->res->version == CAMSS_8x96 ||
>> -		   camss->res->version == CAMSS_660) {
>> +		break;
>> +	case CAMSS_8x96:
>> +	case CAMSS_660:
>>   		csid->ops = &csid_ops_4_7;
>> -	} else if (camss->res->version == CAMSS_845 ||
>> -		   camss->res->version == CAMSS_8250) {
>> +		break;
>> +	case CAMSS_845:
>> +	case CAMSS_8250:
>>   		csid->ops = &csid_ops_gen2;
>> -	} else {
>> +		break;
>> +	default:
>>   		return -EINVAL;
> This should never happen, as adding support for a new SoC should come
> with an update for all the applicable switch/case statements. It's
> useful to let the compiler complain if someone forgets to do so, but
> with a default case, you will only see the issue at runtime. Could it be
> caught at compile time ?
> 

This can be done in fact.

https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wswitch_002denum-303

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef enum {
         MO = 0,
         LARRY,
         CURLY,
         BINGO,
}my_type;

int main (int argc, char *argv[])
{
         my_type x;
         time_t t;

         srand((unsigned) time(&t));

         x = rand() % BINGO;

         switch(x) {
         case MO:
                 printf("mo\n");
                 break;
         case LARRY:
                 printf("larry\n");
                 break;
         default:
                 printf("blargh\n");
                 break;

         }

         return 0;
}

gcc -o test test.c -Wswitch-enum
test.c: In function ‘main’:
test.c:38:9: warning: enumeration value ‘CURLY’ not handled in switch 
[-Wswitch-enum]
    38 |         switch(x) {
       |         ^~~~~~

It looks like we only enable that switch for tools though

grep -r "Wswitch-enum" *
tools/scripts/Makefile.include:EXTRA_WARNINGS += -Wswitch-enum
tools/bpf/bpftool/Makefile:CFLAGS += $(filter-out -Wswitch-enum 
-Wnested-externs,$(EXTRA_WARNINGS))

I'll still implement the code though, since if we do introduce the 
switch for the kernel it would be caught.

---
bod
