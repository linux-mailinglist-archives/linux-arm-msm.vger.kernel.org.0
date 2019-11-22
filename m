Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE98F1079D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 22:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKVVKp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 16:10:45 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54442 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVVKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 16:10:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id x26so8620545wmk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 13:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=pPhsnSH3nxPXeIqxL+4HqjbYwWteqaf0lm5i420fGio=;
        b=dxIbQ0FDD6MvsKJDshOkIFWxi5Uo2rZG2gF6wayWi+Wn25wurIoOleWQgpG14zJxxU
         o58qa2GHq7h/TjYyEdnovONa6Z8KC98Yta02QPYelHis/bFwfCbzpN5tTkGEL3pPjKed
         d3yDTFSr9bE8qPDnSqyHhvA0o9ygYxYZi3FMcxqLCSd3Hufc6cFqjJBcYwMx73FzeUH/
         8ee5yz6aqSM+wSuLHvEo96o1oM0Zs5/YnMzdQLlMYAOkECwAj7GoT3TAVik7maxOYHu8
         AvRoO74JLBSzDfmyy8RW2lWnUVOhdKIzUg4jyOuulke/Lo9ftnAYMui3thyYzkC78Cpx
         siMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pPhsnSH3nxPXeIqxL+4HqjbYwWteqaf0lm5i420fGio=;
        b=MYWWVuefrzE6bkALhhfhLLditSgYz3/VKbjeni0NIWCgt7j+emHwIWh0idXDq5tr14
         6XRwEJZQfbsDcNBOyK312kcu0ndQJ+/+qUd08vX/ZrWz5SBOEFykVsOKjRGem12KQcCF
         8oIwzGsgBrzWDJ2Y8mf4cJZpdLaRQtg7NHaF6JhA6BxNGRkhz2TNv97uECv/vG7jr9kp
         o/JqTtVdgMY79r/XABN2wEvEManCNatmYrCU13eGzwFUNyX8b71O9wgbdxWk3EBFoUSX
         GXFyTFpU0JaWx0PDQvXJFZnin+18qn+p0QgD/7GrsFBbzsNKM6Vg+uM9hrLxyuC8j+PX
         72qA==
X-Gm-Message-State: APjAAAUicQ5JfHr4V9UIa3NMTG8v0ID0WNV2GOZm2OST4wUeVWoUQL4t
        45kG1hAqUCqJMmOXGdXjz5Ek1g==
X-Google-Smtp-Source: APXvYqz0PxIAgoOL7pxxIotIUSnqptPZj21kwFC/Nm5LZ4sgRAZJJGXgh10z4Cl154JEp+YA/ZpZHA==
X-Received: by 2002:a7b:c7d6:: with SMTP id z22mr7185736wmk.136.1574457043123;
        Fri, 22 Nov 2019 13:10:43 -0800 (PST)
Received: from macbook.djakov.com ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id 72sm9188182wrl.73.2019.11.22.13.10.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 13:10:42 -0800 (PST)
Subject: Re: [PATCH v3 3/3] interconnect: Add basic tracepoints
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-pm@vger.kernel.org, mingo@redhat.com,
        bjorn.andersson@linaro.org, vincent.guittot@linaro.org,
        daidavid1@codeaurora.org, okukatla@codeaurora.org,
        evgreen@chromium.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191122152712.19105-1-georgi.djakov@linaro.org>
 <20191122152712.19105-4-georgi.djakov@linaro.org>
 <20191122120746.62027203@oasis.local.home>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <da40050f-dbc5-e95f-29bb-edaa6ae565dc@linaro.org>
Date:   Fri, 22 Nov 2019 23:10:39 +0200
MIME-Version: 1.0
In-Reply-To: <20191122120746.62027203@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steven,

On 22.11.19 19:07, Steven Rostedt wrote:
> On Fri, 22 Nov 2019 17:27:12 +0200
> Georgi Djakov <georgi.djakov@linaro.org> wrote:
>> index 28f2ab0824d5..725029ae7a2c 100644
>> --- a/drivers/interconnect/Makefile
>> +++ b/drivers/interconnect/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>> +CFLAGS_core.o				:= -I$(src)
>>  icc-core-objs				:= core.o
>>  
>>  obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
>> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
>> index 1ddad8ef3cf0..b218a2609f6b 100644
>> --- a/drivers/interconnect/core.c
>> +++ b/drivers/interconnect/core.c
>> @@ -19,6 +19,9 @@
>>  #include <linux/of.h>
>>  #include <linux/overflow.h>
>>  
>> +#define CREATE_TRACE_POINTS
>> +#include "trace.h"
>> +
> 
> You may want to move this below the include of internal.h, as you don't
> want CREATE_TRACE_POINTS defined when including any other header, or it
> can cause issues if that header has some tracepoint header inside it.
> 
> It may not be the case now, but could cause for headaches in the
> future, if other headers get included in internal.h.
> 
>>  #include "internal.h"
>>  
>>  static DEFINE_IDR(icc_idr);
>> @@ -435,6 +438,8 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
>>  
>>  		/* aggregate requests for this node */
>>  		aggregate_requests(node);
>> +
>> +		trace_icc_set_bw(path, node, i, avg_bw, peak_bw);
>>  	}
>>  
>>  	ret = apply_constraints(path);
>> @@ -453,6 +458,8 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
>>  
>>  	mutex_unlock(&icc_lock);
>>  
>> +	trace_icc_set_bw_end(path, ret);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(icc_set_bw);
>> diff --git a/drivers/interconnect/trace.h b/drivers/interconnect/trace.h
>> new file mode 100644
>> index 000000000000..d2421bf7b389
>> --- /dev/null
>> +++ b/drivers/interconnect/trace.h
>> @@ -0,0 +1,90 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Interconnect framework tracepoints
>> + * Copyright (c) 2019, Linaro Ltd.
>> + * Author: Georgi Djakov <georgi.djakov@linaro.org>
>> + */
>> +
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM interconnect
>> +
>> +#if !defined(_TRACE_INTERCONNECT_H) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _TRACE_INTERCONNECT_H
>> +
>> +#include <linux/interconnect.h>
>> +#include <linux/tracepoint.h>
>> +
>> +#include "internal.h"
> 
> And you include it here too, perhaps it is best not to have it here,
> and then just have it before trace.h is called?

Sure! Thanks a lot for reviewing!

BR,
Georgi

> 
> The rest looks good. Besides the comments above:
> 
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> -- Steve
