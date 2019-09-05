Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA4BAAD5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 22:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391709AbfIEUuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 16:50:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44239 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404109AbfIEUuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 16:50:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id 30so4260179wrk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 13:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Avg8QM6aPfWwX5AoBSBFNIlTtI2x7nEGXCQk3lEb/fc=;
        b=EojOhlSjiJk8y6EJeNppFrahboogV9SnwNJf0VVPvj9yW7Vq17+tZV1p3tUjYh/zzn
         eQ9R5aIm8Pqf/LEcARwdoX6n0VD2ghT8SwLkb3axshTZ5X2u1d17r2IMg5ucPfiraQFj
         /I0RSEMx5k/paxbsKQ28uPeRkRjbW+5qDU+2IKnTr0NP71dqHorDFBF04ebs4ogFj5pR
         sa42t8sSaxPjB2pmqKJpUcm6gvM4EDtdwESfWjL/xPyr66Tff8rszZyTJ9R8ia9vWAcl
         9OnLStXajERrE2mIAJut0X5KTQK3F8fyYJP9E6YsREIMWXzF7CyrQtYmToM52YC08TFm
         HIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Avg8QM6aPfWwX5AoBSBFNIlTtI2x7nEGXCQk3lEb/fc=;
        b=HEHqEEBlY9XhziJluQppnupwlmunBcR4SpP1QPk8L/GDBvc+hCwZmwQlqaPs6gGhyQ
         x4Z1YsvNOEhnU7oQoiyfmZ9uq1iRoLx5ZxeVpplZ90Vc70dCNYZhNFb0kGsn7ShFKSMZ
         jjI55SOG/nKNSbGiEjiIaZfPCB+eEjQUcVcoWC/I9PiRKFiM19vmZzVmakpk6Dr9e+60
         0vbjXIe7E/V1b7VXd+Mn58NP65XXc6FWWX/ieIciqM8//3KROfWQQwsDHuMe2oTBtQRc
         /IKboy76xKvy46w7PIs5lBgD9F4irU84PAV8c1MJ8k0uG/2b9nIfGBmoO3EIXBzu2LBD
         gdMw==
X-Gm-Message-State: APjAAAX0z8mc9U8/JqA68CDDLg069EQAO2wNIuVlr6QeLkh4IC/BETB7
        HPHbKprH4NPZjzCEDk1Ue2SQQA==
X-Google-Smtp-Source: APXvYqwi/+00SHE3kxRqKt+uOC1fnKiZKCYTRd+lO9y4jlGHsH2+knmmV2EW7SfCJPj5yMwzkXM97g==
X-Received: by 2002:adf:dc0f:: with SMTP id t15mr4596106wri.258.1567716620556;
        Thu, 05 Sep 2019 13:50:20 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id k6sm5932699wrg.0.2019.09.05.13.50.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 13:50:19 -0700 (PDT)
Subject: Re: [PATCH v3] watchdog: qcom: support pre-timeout when the bark irq
 is available
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        wim@linux-watchdog.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190905182419.26539-1-jorge.ramirez-ortiz@linaro.org>
 <20190905183456.GA29500@roeck-us.net>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <97c57a8a-545e-f5de-0756-e8ce054aa036@linaro.org>
Date:   Thu, 5 Sep 2019 22:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905183456.GA29500@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/5/19 20:34, Guenter Roeck wrote:
> On Thu, Sep 05, 2019 at 08:24:19PM +0200, Jorge Ramirez-Ortiz wrote:
>> Use the bark interrupt as the pre-timeout notifier whenever this
>> interrupt is available.
>>
>> By default, the pretimeout notification shall occur one second earlier
>> than the timeout.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Can you please give people time to reply before flooding the mailing list
> with revisions ? This is getting annoying quite rapidly. I am going to
> reply to v2, as I had started on that already (and to the one without
> subject before).

yes, sorry about it. it is not frequent that someone gives a review so
quickly though so I thought I had time to sneak in some reworks - thanks
and apologies again.

I am about to send v4 addressing the issues you raised.

> 
> Guenter
> .
> 

