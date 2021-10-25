Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4597043A523
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbhJYU6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbhJYU6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:58:04 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A542AC061348
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:55:41 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e4so15119090wrc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/F+PYzHsO5aqOW+C55ObkoMjfLBJMSXkRVXYJO4Yd3M=;
        b=kodlkyottSVRTWBOfFTJEucWrdDw69evvjPDqUaHDPOAGwMwFlHDbXtWydvi27rCaW
         oZko5yvMKZwWFgYWrxY+Yl7eUiMvvhJdoofyu2V7A2YO0ERho1jBK4TBh1YlGLRALF5F
         t0RwDHqfLsCD+jWv/ORenA5UeYvGfDuRLQ7AWO8Bzo5L4sV4ksckzux2P66wpK+0I0D6
         sFMXL3OyShA2LOHDev2z/jpKFcvpAEuhJJie55QOMtpPM3pf43TMF2AU1A4JdFOV5zZ/
         sQvylxADIxrWFHx5uKylNhkCFEGH6LUYjkOZxMauFAiyDjuY+NsZz+zcZ0CkuZ0muMdN
         tL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/F+PYzHsO5aqOW+C55ObkoMjfLBJMSXkRVXYJO4Yd3M=;
        b=BOF86nj2zzXfrvwya10cCZmARmx9JIQG0phRbu2xjAhDWSD0d3vXKxaYmottitNDLm
         pP+5ybRF3nw74vLu4wgrm3FhYKsB7oLdmAb9zh+kM3YmpkRXJG9iw5zJOoAbExoxUAnX
         F85aKbGk05aR9pHH3PQCVCScipyA4CCXoFOOxytrPDAa7YgtpaQhvuatC0x/TDOsp04H
         gHYeURNhf8nIMWkqDEeS20Spj8gxcKoQUlpKG1fFBJeWn7VXOmqcfLGN1GtV6AAm/KO5
         djaOfuEUzDi47qwrL5i/66cnwVkueb/gjKmoHnz+g2661lTBfyZO5rB/Emlgag9cp2KB
         ypPQ==
X-Gm-Message-State: AOAM533p8uUJUTEudqB1q8n+jn4bAVKNLRbeqm0i5b99qWAAYPLOoRDx
        qhNzf495e98A5KHqrHyBXzqeBg==
X-Google-Smtp-Source: ABdhPJwq1PO5lgTpZYuNfDF5dsEQK0VDS944J027R6H5avmaaoLY9oBKx6HWRLB0XomGbxLAksAwag==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr16492224wrr.417.1635195340287;
        Mon, 25 Oct 2021 13:55:40 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v4sm10101398wrs.86.2021.10.25.13.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 13:55:39 -0700 (PDT)
Message-ID: <71e39011-71af-8f68-a829-7be0e186bc3a@linaro.org>
Date:   Mon, 25 Oct 2021 21:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 6/6] usb: typec: qcom: Add pm8150b TCPM driver
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
 <20211025150906.176686-7-bryan.odonoghue@linaro.org>
 <20211025161747.GA970809@roeck-us.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20211025161747.GA970809@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2021 17:17, Guenter Roeck wrote:
>> +static int qcom_pmic_tcpm_core_set_polarity(struct tcpc_dev *tcpc,
>> +					    enum typec_cc_polarity pol)
>> +{
>> +	return 0;
> A comment explaining why this isn't needed with this hardware would help.
> 

Will do.

Briefly though, there's a separate USB PHY which is responsible for 
orientation switches, its done outside of this block.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=usb-next-25-10-21-pm8150b-tcpm&id=4d754f4eee2ae7c142ab55092f8c4aabd30b433c

---
bod
