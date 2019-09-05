Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B855A9CB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 10:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732460AbfIEIPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 04:15:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55811 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730912AbfIEIPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 04:15:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id g207so1604251wmg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=10aGnknD8IVEjfbOX2J03d8KjnX6yhuxq2udar1p34k=;
        b=k76jOrRn/KqtgyfYiCm9Ukk2P3wGLbhaWHDEQR0fjgSahxgrv783qMr08DQCvvoFHb
         dFWrX/vqeJYe0lMt90mMjPIVomNPc2EEGH7Qyela16mLtoeq5MFuuWSCD23Ka7njLGpD
         vogzkJ1kEvAkU+Do4oDdoxU4CqoNBABMxFgcr1iKAItorlnA6vClv4aaRagvvUM+PvWT
         uPkPn7DgrbzAtzYn3CqhC/gNo2rC7GcL0nBRJIOpyRbeZskpX0VxoXCs1sxNNJt55gxb
         0w3aZ6dYg1SgwHESDCL8DQyDPhMN6vvRMAuoGDg8Mnd1mJwz+mNfCaIwtCl0SbbNi09a
         uKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10aGnknD8IVEjfbOX2J03d8KjnX6yhuxq2udar1p34k=;
        b=lWTTOtyUISGNEm45PXPMJx6wtfjWMSbD1AFfz4JHjXtICv00HAgbOnvYnsAj8XSLkj
         fWoytZnfwgISCXG5K7saDF6avvi7KdZD9B0/ULIBvLmhaagCaTpm8U7lGr1iK1mRc6+0
         RmVdCaOCIP7FBRGBQITyALt1axlDzPH8lBKiwA5ApfKSF+iPZVDgkZ6D6Oj0/JNnGCBh
         DzjdcsyyHky763Vvd0ZvQaK/rIWPVlWtECpjmVDO2sKGANZXlJj1ofrf7bn3Ecri5cb2
         QALXWNr5n2wJRJxp3fx8sS+UEwZATfx4GL1uQkRgNd+0icUOzklsE1iq0G+2bfLX9N25
         uwjg==
X-Gm-Message-State: APjAAAWQl5U1naDZb9WBD/cudTIHMntCZyjXJr+k5kjXIDASmTB1cBMC
        6qNMDU0cJKoUIz2/Dm7vwAX+Cg==
X-Google-Smtp-Source: APXvYqwrO6C9MyodFbqDZysM24MlqavSlQNIAbuArfba4cg0pHZov957s+oST5S0PxX0HKLaEDgF4w==
X-Received: by 2002:a1c:a383:: with SMTP id m125mr1870964wme.57.1567671342179;
        Thu, 05 Sep 2019 01:15:42 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id q124sm2858526wma.5.2019.09.05.01.15.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 01:15:41 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] misc: fastrpc: free dma buf scatter list
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Chopra <mak.chopra@codeaurora.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
 <20190829092926.12037-6-srinivas.kandagatla@linaro.org>
 <5d70991c.1c69fb81.c0590.2f13@mx.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0b530a6a-a788-4a45-38f1-41b85a814afd@linaro.org>
Date:   Thu, 5 Sep 2019 09:15:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d70991c.1c69fb81.c0590.2f13@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/09/2019 06:11, Stephen Boyd wrote:
> Quoting Srinivas Kandagatla (2019-08-29 02:29:26)
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index eee2bb398947..47ae84afac2e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -550,6 +550,7 @@ static void fastrpc_dma_buf_detatch(struct dma_buf *dmabuf,
> 
> Is the function really called buf_detatch? Is it supposed to be
> buf_detach?

Thanks Stephen, for you keen observation on the spelling, I will send a 
patch to fix that!

Looks like I inherited that from drivers/staging/android/ion/ion.c

--srini

> 
>>          mutex_lock(&buffer->lock);
>>          list_del(&a->node);
>>          mutex_unlock(&buffer->lock);
>> +       sg_free_table(&a->sgt);
>>          kfree(a);
