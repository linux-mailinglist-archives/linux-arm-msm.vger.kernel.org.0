Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABAD13DFAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 17:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgAPQMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 11:12:23 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39928 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgAPQMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 11:12:21 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so19731484wrt.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2020 08:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ajindHD6YKAeKs/ZzBtR9DvEx9x1vi4mqA6C232qYvQ=;
        b=FS766fJXgkwMdUfnkiI6wXw8eZ3oL1tMozAgrCSQOkFUb2nDzoL4kBSxcemQmjjTEi
         1d/F/FUzI3teEb0TqLMAJv4W5QdQ/Z9FNb82PxHCq6VsvyuAo9YJsvinW/gS4yBxbRTM
         Lq0U+OzTsEP08lbuURSJOyzFFeb26RRRUQxoanJSN+yNPwV96VfVfICZLXKMy3v2/g/k
         NPJuz9B5Mo5OrfDmsx8P5hRPYEZF3wXL6FUavFGKd4LBRdO073kQm5ZOn8x+4Kv/AC5h
         su5MPJde9cLLys78ZrMKseOS9vvLCBb3Z5pLniGSBvwnMLm1f9Wif4YzglSptMFuvmuC
         G0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ajindHD6YKAeKs/ZzBtR9DvEx9x1vi4mqA6C232qYvQ=;
        b=blxoGI2RzvCMIcQIEvEoUfU105/0KunoQSj3gF1yxyuxqhXze84umUDc3+bSwadZAS
         TSm0I8TQE7qC/sr5sOWpAR0OnoIL6zpBkrCVLtSnm3r6TbT3cVsyKENg5jEqwsGaBuHI
         rrnfUPJzHuvcuo8tjtLOXAIiAAoCzPS2vVLrKEscZcyTLMJWB2MULWSe+TZ3Zgcza0j+
         zlvwLTmTCLoCh1tMrVJZCIbmFsLbq7CxN+4QzbceNI921UDp1Tb4qu84uLnw8TmhAG1T
         MEljk/Q1uA9kH7Ao6OMIdRyX6Rvklo8AwllVWGAbW65ma4T4y4AoIhDU5RuoKLZ/ArGc
         WRng==
X-Gm-Message-State: APjAAAUA6ZzLCW1D71FK+ij6b4J7yvdirFlG5SL9UjYklPEwyJo7fFCq
        KArPYoFM3V7wHnRkIpU7uQ6ocd1tPjo=
X-Google-Smtp-Source: APXvYqwWRKtuISaCTL+ScX1YRZZ7sv+xBMRG3zNlLHX45zIFBpHomUDUZ2Mzma98iCWYTR2yYnslDA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr333093wrb.409.1579191138796;
        Thu, 16 Jan 2020 08:12:18 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id n8sm29823680wrx.42.2020.01.16.08.12.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 08:12:18 -0800 (PST)
Subject: Re: [PATCH v2] nvmem: add QTI SDAM driver
To:     Shyam Kumar Thella <sthella@codeaurora.org>
Cc:     Anirudh Ghayal <aghayal@codeaurora.org>, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1577098347-32526-1-git-send-email-sthella@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c5f024ec-c73a-63ac-f677-9b6178f16b95@linaro.org>
Date:   Thu, 16 Jan 2020 16:12:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1577098347-32526-1-git-send-email-sthella@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23/12/2019 10:52, Shyam Kumar Thella wrote:
> From: Anirudh Ghayal <aghayal@codeaurora.org>
> 
> QTI SDAM driver allows PMIC peripherals to access the shared memory
> that is available on QTI PMICs.
> 
> Use subsys_initcall as PMIC SDAM NV memory is accessed by multiple PMIC
> drivers (charger, fuel guage) to store/restore data across reboots
> required during their initialization.
> 
> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>

Applied Thanks,

--srini
