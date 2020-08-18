Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBDC248B84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgHRQZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbgHRQZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:25:26 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FF3C061342
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:25:26 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id d14so18775200qke.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dvxwZaj3STU+XBzbFZF4Eo4TNJffoa7xZkZ37kAZh9I=;
        b=xslbahmqP51ElTDl7YH8n7I/5v/fdUIQKZAxFp5WFFkqdcuE0gaERIY67/WRha0FNV
         ptlf1L5zLewfnNfx2DiOsBQFOjSExO8ZJ8yR9+VtUlJOIReXgjvWsqItLG5B+HcacB69
         y17gU2T+PVT+8L3UtgnN1F3EBQPOClg90xL/iPXsCGp/YEuePAoTxsYZhYWSwLxrh50x
         U3ESkz+/fMyiaBLvZe6OpFcOIeK6a7CjalNrWPovTv+K59V+fz+nSsgl6WrKwvYqnxyg
         sTIJIRi6+M3bfZtIsYxbuTmOzErTsapDxDZqIjbdKRYdxbIQznvT1HFU92bCPXCITQV8
         /W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dvxwZaj3STU+XBzbFZF4Eo4TNJffoa7xZkZ37kAZh9I=;
        b=SyyqIKv2ITqTgqFIBd9zaCPI1KqYLyDSmXsDRU1NXrKuy5h7FoF1oU6jGYC6DwcrA+
         yxx8eB300xeyr0iEi6URLfZiW4N8xgPsb6ox2cTcZRTmju08nSb+hyNQsQXoOWjU1ey9
         R89adoS3iE/qAHAnGtctwWO+YS5gmONpciTc0/RJaPrI/HDuMLm77rZDfCvAM//lPVym
         iK60uDc5pYmN5tmeQfvlRxAYzGVRKee/nTq0piMSZUvsJkGzfzjLgppWkvz2tPIxU6sN
         F+/94kQSmIGD/ORpTLS4paZkYs2z6KyKv8h4l2i+tovmgmt4TQ7mzD/EoUEkWNKpmicn
         UDtQ==
X-Gm-Message-State: AOAM530hEJ4DURNUoMeOBNHEfKMLbHHVxlQHtvWN1WwOuTg59pxi/wLi
        SVNw+U0aSgwAmTnxgW9gFnQRUw==
X-Google-Smtp-Source: ABdhPJzlUlvP2CjCftbRUYw1ctpF8qKO1bKnDTaWq5BCBWte2qKx4QUPmdS2Sdg92ObSIJbWoEZzhg==
X-Received: by 2002:a05:620a:24c9:: with SMTP id m9mr17643293qkn.487.1597767924233;
        Tue, 18 Aug 2020 09:25:24 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id x3sm21157489qkx.3.2020.08.18.09.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 09:25:23 -0700 (PDT)
Subject: Re: [PATCH] regulator: set of_node for qcom vbus regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" 
        <linux-kernel@vger.kernel.org>
References: <20200818160649.19585-1-jonathan@marek.ca>
 <20200818162124.GD5337@sirena.org.uk>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <bf77f8f9-9fbb-bb4a-c905-cfc2ccdd1e81@marek.ca>
Date:   Tue, 18 Aug 2020 12:25:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200818162124.GD5337@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/18/20 12:21 PM, Mark Brown wrote:
> On Tue, Aug 18, 2020 at 12:06:49PM -0400, Jonathan Marek wrote:
>> This allows the regulator to be found by devm_regulator_get().
>>
>> Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
>> ---
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it.  For details on what Signed-off-by means and why it's important
> please see Documentation/process/submitting-patches.rst.
> 

Sorry, my mistake. Resent the patch with SOB added.
