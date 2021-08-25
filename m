Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9833F7035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 09:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239162AbhHYHRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 03:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238606AbhHYHRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 03:17:35 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EEFDC061757;
        Wed, 25 Aug 2021 00:16:50 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id e21so33580851ejz.12;
        Wed, 25 Aug 2021 00:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lKMjc7E78IAkyfL3fZ1SzFFun5yiSkSzpm9G4CZp2i4=;
        b=tsUYQ1MJ3OHa8GPKWJqG4csvl7OhVgn7JQgX7/AtcJYu/71+oNbXYKTqnFpnKvpnvT
         KbXqnMecrQM95coLn77ICurJTAB9C5U9MF5lsJim2h8Cbx6OpIDRPF5W7e3CRrZlw3ed
         2yDsfgNZCf/DIy+BrInImDouJBl/lFVLcF3xQKLRTSmoYgmsqJ2ZpJnpKmZATysZmutF
         tAQ8bBQ4ig5c9mMQenVaajWYEAdlTCC1Gw8/uKLVPUTtxwN1lXDeolTJ4mhE1K2X7HXe
         AbhcoHT2u0Oxq1ZW3OX4g4DArRzKZgMvoIjCtZAZmPnNJqi8ZzNBmmNFcf/GCiYICape
         fOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lKMjc7E78IAkyfL3fZ1SzFFun5yiSkSzpm9G4CZp2i4=;
        b=j4dsTglAUSN6+wl4c1hNyXvdcHWzRv1JI6vq/Wz9G1bHIgwHUlTR4EGupPJba6k3E9
         GwzLOzwk2hYA1KbzTNFCee9YwqT3sNc918UnnnSVrGVHip7ONgF/h749aFKTYpcXlKM+
         Sr3MiU8mVSv6Nf+pxr+YciFxsiiCzj1E7qGEG/JkERsYLj9vIyArBXFxXGNaqjUOhTwE
         FsPjM1NlSVjkR4Cx+rDbIww9uKq82Da+OKNwYMMeLFfrKgoQi7QWPrZ/9CNahXzORWUF
         HsLYMyTAYVaQQYQ0W8h6rNzl1ecokNcfU4RLkG1PsViLZRxzsG2lqmqy9I+zrHNOpUla
         NEaQ==
X-Gm-Message-State: AOAM531+j6anwkIJEIc3SLMW339RRoLRyCaQTlJVHlJxhfc0C5oDL1VY
        +whgrt+Kgz7f+QQmceQ5P5U=
X-Google-Smtp-Source: ABdhPJyYYegy/t9WzmeIlTQF2cHB70Xg1WUlnBzFZ5ciMJk8kzVXPXF7ARETWir+tHKpBRbRSOOOKQ==
X-Received: by 2002:a17:906:3bc3:: with SMTP id v3mr44854819ejf.482.1629875808907;
        Wed, 25 Aug 2021 00:16:48 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:b36a:4b43:c293:3ba2? ([2001:981:6fec:1:b36a:4b43:c293:3ba2])
        by smtp.gmail.com with ESMTPSA id q5sm13205341edt.50.2021.08.25.00.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 00:16:48 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
To:     Felipe Balbi <balbi@kernel.org>, Ferry Toth <ftoth@exalondelft.nl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
References: <20210824201433.11385-1-ftoth@exalondelft.nl>
 <87v93u5au9.fsf@kernel.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <51212e46-a7c0-7d32-a711-0a865e816d33@gmail.com>
Date:   Wed, 25 Aug 2021 09:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v93u5au9.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
Op 25-08-2021 om 07:53 schreef Felipe Balbi:
> 
> Ferry Toth <ftoth@exalondelft.nl> writes:
> 
>> This reverts commit e89bb4288378b85c82212b60dc98ecda6b3d3a70.
>>
>> The commit is part of a series with commit
>> 24f779dac8f3efb9629adc0e486914d93dc45517 causing a BUG on dwc3
>> hardware, at least on Intel Merrifield platform when configured
>> through configfs:
>> BUG: kernel NULL pointer dereference, address: 0000000000000008
>> ...
>> RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
>> ...
>> Call Trace:
>>   dwc3_remove_requests.constprop.0+0x12f/0x170
>>   __dwc3_gadget_ep_disable+0x7a/0x160
>>   dwc3_gadget_ep_disable+0x3d/0xd0
>>   usb_ep_disable+0x1c/0x70
>>   u_audio_stop_capture+0x79/0x120 [u_audio]
>>   afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>   composite_setup+0x224/0x1b90 [libcomposite]
>>
>> Pavel's suggestion to add
>> `echo "adaptive" > functions/uac2.usb0/c_sync` to the configfs script
>> resolves the issue.
>> Thinh suggests "the crash is probably because of f_uac2 prematurely
>> freeing feedback request before its completion. usb_ep_dequeue() is
>> asynchronous. dwc2() may treat it as a synchronous call so you didn't
>> get a crash."
>>
>> Revert as this is a regression and the kernel shouldn't crash depending
>> on configuration parameters.
>>
>> Reported-by: Ferry Toth <fntoth@gmail.com>
> 
> this should be Signed-off-by ;-)
> 
Indeed. It probably was until I re-worded the commit text.

Will resend tonight v2.
