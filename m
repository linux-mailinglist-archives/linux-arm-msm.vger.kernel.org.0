Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E13687272
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 01:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjBBAjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 19:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjBBAjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 19:39:03 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95172166FC
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 16:38:07 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k16so224206wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 16:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysJlmM9nlJAmY9FF3751KAdsw1NaojV1QEcIsHtz84g=;
        b=wlFxrwDeuRmjS6Yx5pqeXZSzZ1QwoQLFhH7gYuLp/HNtE9giqgDkoY5fZYbZ6A0XLu
         7Y/flA0JC7K5lODPYOC4tv3SjSyg6YY8ElY67+in9t8CKYGHG5iumtcpk9glngnWwavG
         U01Llmg5Lz5sp1ZIZ4xR4o8OKJdNFfOOTTNOMMqlri0pusWFXqtyBfDxZSJS5h6Vdyjz
         mhAfM8QTa8zffYvmuBLnQJRPt/llkQeBjdbrSIK+Cx52Tg5ce1YIC2hY4NHi9Y/f27fg
         WVi8uBlOooxRhpbOUVkGQhAIZP7v1ZiYq0ow896wtiNrSlmGiBsQPZoYt2YKOLIKcH0H
         tp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysJlmM9nlJAmY9FF3751KAdsw1NaojV1QEcIsHtz84g=;
        b=lH52mjTEJgQX+wlFXJ0DsSP4Hpqhe5Zwp+cDB9pH6zPldI7xfCumYKuUtG08jBM8Q0
         bU4yeY5NDqqN75aPLGMzDwYWWxI632C6A5DN9Iw0u4y4jkWS5LttdalE+WcbpCKHduen
         L7WnpLWBtEcbRJ4BlN7t6JfufQuLIZVW5JkxLUk9DwIRWRuZAno7mmb/JIMmjpkIl8XU
         vKa0IpBlZZ6vlxI2+2+mE39u/6HLtnt8zns8jBGcl6XfANwD9of19Nhf6ZJ0nO5t+Ybt
         b87/Cos5R1GIB96guAK+LGOt0q7p2MmY3ZzX0WH76d3Wyoyr867SC9iwea9wn8I1240+
         rV1A==
X-Gm-Message-State: AO0yUKUqEyJExv41/sXSaWNBvgl7RLCfveDVcc+JFTyRhvlAunmyui7z
        XJUQXo4diqmq2qEmp4zx9Cx0rw==
X-Google-Smtp-Source: AK7set8q0lFUeh/wpKIoRKCXiQhDqZfQuxvCaIKkLTDoel9Z6n2uUMIR7BuOXGLmzSzJm9o+Qc9mMQ==
X-Received: by 2002:a05:600c:16c4:b0:3dc:4b87:a570 with SMTP id l4-20020a05600c16c400b003dc4b87a570mr4122153wmn.35.1675298283300;
        Wed, 01 Feb 2023 16:38:03 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k24-20020a05600c0b5800b003cfa622a18asm3135432wmr.3.2023.02.01.16.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 16:38:02 -0800 (PST)
Message-ID: <8ffcfbf4-a146-11f8-cc86-b2c273f423c4@linaro.org>
Date:   Thu, 2 Feb 2023 00:38:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCHv4 11/12] dmapool: link blocks across pages
Content-Language: en-US
To:     Keith Busch <kbusch@kernel.org>,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc:     Keith Busch <kbusch@meta.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, willy@infradead.org, hch@lst.de,
        tonyb@cybernetics.com, akpm@linux-foundation.org,
        kernel-team@meta.com, linux-arm-msm@vger.kernel.org
References: <20230126215125.4069751-1-kbusch@meta.com>
 <20230126215125.4069751-12-kbusch@meta.com>
 <CAJB8c05HgmDqMn9KwOi2P6+s-c8zt6-oiW6gOo==CDv6=HNahQ@mail.gmail.com>
 <Y9qk13UwzpzN+Y2q@kbusch-mbp.dhcp.thefacebook.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y9qk13UwzpzN+Y2q@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 17:43, Keith Busch wrote:
> On Wed, Feb 01, 2023 at 05:42:04PM +0000, Bryan O'Donoghue wrote:
>> On Thu, Jan 26, 2023 at 9:55 PM Keith Busch <kbusch@meta.com> wrote:
>> So.
>>
>> Somehow this commit has broken USB device mode for me with the
>> Chipidea IP on msm8916 and msm8939.
>>
>> Bisecting down I find this is the inflection point
>>
>> commit ced6d06a81fb69e2f625b0c4b272b687a3789faa (HEAD -> usb-test-delete)
> 
> Thanks for the report. I'll look into this immediately.

Just to confirm if I revert that patch on the tip of my working tree USB 
device works again

Here's a dirty working tree

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/linux-next-23-02-01-msm8939-nocpr

---
bod
