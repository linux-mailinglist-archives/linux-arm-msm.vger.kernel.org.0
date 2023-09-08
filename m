Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37F47985BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 12:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243019AbjIHKXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Sep 2023 06:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237865AbjIHKXb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Sep 2023 06:23:31 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551852102
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Sep 2023 03:22:49 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso19946395e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Sep 2023 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694168505; x=1694773305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGKutJdZsbDY+j0tC9Ud+tQUH75ZqrFDy+qTzRCsDiQ=;
        b=uSGz+TR11GSkMOtxn0+Qz3hKKvdcNkhhl56FaZ3I5yPSo03lEX9K8Ar34ZBN166QIo
         ulLGQcEMAeDubNDGF2ILciYL8/UVZultp6/mHa4JkAGuC+TrPIPr52J1IpsRYGuH0x/i
         NKdCkgxR+pKta1XepCORUqd6c/SqirDc5mx/lYPWWzw2P/BuRJVcgBanoIPgZ3dRpjaj
         yXlBsCpUGdm+/yDYMpdB61yUVNU9mIAHlJDKDRLDGuzk+EIY1Rqm6I/N7g8CSI4c0nMY
         bLMA9AhzqgTYwbnaB9aZnnPnws5isDxuoSqU2X8t9aBe+Hl94hFcOLOwq1wPr1yHRsEi
         P4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694168505; x=1694773305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGKutJdZsbDY+j0tC9Ud+tQUH75ZqrFDy+qTzRCsDiQ=;
        b=LkhspvnG4W6gNSZPV0Lwiebc+mB1blgudIJIXhv9t49er8TU9udCSWko/FTYcDjZ23
         M2qGy6KIVg7Teqqh0n30DCctS38j5CptTHKH0th39csBRhmEeZpSVxyLmerNJOyaS+CL
         JzG+FOls9PQNbrWtw+D0ciIZjO0JueYmP8qPvLG6B9cklO90NygaRqg6eJmhe0tyNntg
         glXL3BiDDJgMdAtArf1ptkqc7gyGgydmvaKIM0D3dGlRaw3aS0E+ELF0uFAdO+RCuDCs
         50RNCAwPEiyLSR4ox22c3gSrOycmk+qHezEB8brfT20aMgSjWGkGB0PzLt/k+p18zKoh
         Bz4w==
X-Gm-Message-State: AOJu0Yz+kjC/WjFtptNuhXOlbJWM5gzRUBwEvs3vZfepycTo3vMWZGtX
        3c4Sf+KUXSvfFggjzVKvQX9mlw==
X-Google-Smtp-Source: AGHT+IECgkclnm+59EP14mqGW2HzdLSOVxH9WqxcgryCYH3PeeMU8zh13M+eiRKiRihhCpvguv63XQ==
X-Received: by 2002:a1c:6a17:0:b0:3fb:a0fc:1ba1 with SMTP id f23-20020a1c6a17000000b003fba0fc1ba1mr1785817wmc.35.1694168504741;
        Fri, 08 Sep 2023 03:21:44 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003fe0a0e03fcsm4795994wmm.12.2023.09.08.03.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 03:21:44 -0700 (PDT)
Message-ID: <c9570c8e-c9a5-43f5-8b69-d5c38d214061@linaro.org>
Date:   Fri, 8 Sep 2023 11:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] media: qcom: camss: Move vfe_disable into a
 common routine where applicable
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
 <20230907164410.36651-16-bryan.odonoghue@linaro.org>
 <8b424303-09c9-4270-abfd-4f209f5c41e0@linaro.org>
 <41d1e364-40a4-48b2-97ef-6c76d238002e@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <41d1e364-40a4-48b2-97ef-6c76d238002e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2023 11:04, Konrad Dybcio wrote:
> On 8.09.2023 12:02, Konrad Dybcio wrote:
>> On 7.09.2023 18:44, Bryan O'Donoghue wrote:
>>> We can move vfe_disable() into a common routine in the core VFE file
>>> provided we make wm_stop() a VFE specific callback.
>>>
>>> The callback is required to capture the case where VFE 17x currently isn't
>>> VC enabled where as VFE 480 is.
>>>
>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Konrad
> Actually there's
> 
> ret = vfe_reset(vfe);
> 
> return ret;
> 
> 
> which could just be
> 
> return vfe_reset(vfe);
> 
> 
> Konrad

On purpose.

I prefer the ret = ; return ret; pattern since it makes it easier / less 
work to

ret = fn();
if (ret)
     goto error;

error:
     return ret;

---
bod
