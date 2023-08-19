Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0709D781A3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Aug 2023 16:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbjHSO41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Aug 2023 10:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbjHSO40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Aug 2023 10:56:26 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9533527D11
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Aug 2023 07:56:23 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so1117316f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Aug 2023 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692456982; x=1693061782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxRSmeCuLOS6YzS9MfIa//5eeOBZqb48nHjyrxA8WzI=;
        b=En6nC4fqO+PskFjOAQuLEZB9JXv0/OMn1PDfdnvvOE8BGR65hcqMco+8e5bNKer2Z4
         l+VQHp612JIYRx44HxZg9UxVP7d+t1xLjkG6sVxwi3C4cr2corh3a7zzGDVLB85MwcvV
         bYzrOCOSW2ZGgx+E27VM6eEy4tqrO/SSkRvpJmu35+TcME7fZuMyKmmRTVHc7t+VLXNc
         4HrQK6npihtpaLB7Tgg4G+h+2EP37aAjL8m3Turw0P8Km4FJouX6jopr2kpBYYcYmxA/
         YyS59fWkV0gP9ZcMfqsqVkRSnEP64r8KF2qsoP8jwbM7ypH5sPVFv6ee5DPWlwohbWoz
         QdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692456982; x=1693061782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxRSmeCuLOS6YzS9MfIa//5eeOBZqb48nHjyrxA8WzI=;
        b=aEj6L2pmttgcV71YEs3WNxGUM4DnhdfjO6aM85vJh35mHfPiy9d5H/I2U5X3YtOkG2
         G/Modif+JceZn9zcdMJovVsScSZhaYqGex1yM5pdaP5rjGq1DyaWTCQqk1dZ2eRjwG6q
         utOxxm8zjzmgAxRub9sE+KnU+V2unjTCJ5mpcQ8vXkdGitJLHWxl2T2uMMKXaEj9w2dK
         WLRq6+yFcAqIRkAhC4N+HbDAggXVUo0pcbq6ajsLZrylttYARp9kQKyLTay8p1QY1ZDb
         VdNNMrP3GocApRslVCWA9W0N1az4+8mk/78guhIJAPUuN62UgcXMQJPEuu4O1R75sBmb
         5HsA==
X-Gm-Message-State: AOJu0YxU3uS36Yh0etI53ArSBj6SR18VdwPENkitf37mv4Ny600f7hRI
        U6HSy70GitO1gdTs5u2jdbELDcvJP/MUMEM+8zk=
X-Google-Smtp-Source: AGHT+IFgpAq5xIx0P9Bwca/UOggFEiVzYoL5V61sehqVLAzYQiNhsac9R636xuw4V4Uhu/R0GjHoKA==
X-Received: by 2002:adf:ef91:0:b0:318:f7a:e3c8 with SMTP id d17-20020adfef91000000b003180f7ae3c8mr1551475wro.57.1692456981957;
        Sat, 19 Aug 2023 07:56:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k12-20020adfe3cc000000b0031ad5470f89sm6485519wrm.18.2023.08.19.07.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 07:56:21 -0700 (PDT)
Message-ID: <d4418b5c-9302-072a-0629-e7161c79fb62@linaro.org>
Date:   Sat, 19 Aug 2023 15:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/13] media: qcom: camss: Use >= CAMSS_SDM845 for
 vfe_get/vfe_put
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
 <20230817143812.677554-8-bryan.odonoghue@linaro.org>
 <f1a8e7db-ce26-4bdc-beb6-00ae4f0baa78@linaro.org>
 <4d14de78-16a9-4720-9422-b684f261df01@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4d14de78-16a9-4720-9422-b684f261df01@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/08/2023 13:29, Konrad Dybcio wrote:
> On 18.08.2023 14:28, Konrad Dybcio wrote:
>> On 17.08.2023 16:38, Bryan O'Donoghue wrote:
>>>  From sdm845 onwards we need to ensure the VFE is powered on prior to
>>> switching on the CSID.
>>>
>>> Alternatively we could model up the GDSCs and clocks the CSID needs
>>> without the VFE but, there's a real question of the legitimacy of such a
>>> use-case.
>>>
>>> For now drawing a line at sdm845 and switching on the associated VFEs is
>>> a perfectly valid thing to do.
>>>
>>> Rather than continually extend out this clause for at least two new SoCs
>>> with this same model - making the vfe_get/vfe_put path start to look
>>> like spaghetti we can simply test for >= sdm845 here.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>> Using >= here is veeery arbitrary and depends on the next person
>> adding a SoC in chronological, or used-tech-chronological order
>> correctly.. Not a fan!
> 
> Perhaps some sort of a compatible-bound flag would be better suited
> 
> Konrad

I take the point.

I'll look at a macro or a helper function

if (csid_within_vfe(version)) {}

That way there's just one source of truth and the chronology is irrelevant.

---
bod
