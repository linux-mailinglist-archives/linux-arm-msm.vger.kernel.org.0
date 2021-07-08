Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F313BF83B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 12:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhGHKRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 06:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhGHKRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 06:17:54 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DCEC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 03:15:11 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k4so536041wrc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hQCK+Zcd2t60sEgEFMh43/KmT8Y7J1HENZolpobLhN0=;
        b=u0qWpWCDJGGNvS+FqBecOwPYuNDzATIU9G+y5Hz2C9hnUW4Tf11XZLL1EJwOGh9VML
         c1ljWCDeYkMWFVWkRlCCL1TMvz0+O6Ift8p7JnAGndjgbQYSePWanjsJ+VyMVhUjw5tn
         HXvIbHlvHQCHZvnl9qh3nWTgV5+rrdIzhGG/7nSrlIR+8sOjHrhtfnTvKh/GjxQQbSQ8
         rMHeuLY2gi+qW6bcc+dLXYgq9rPgIvFDAwW49v16SexvKC7oBaGdMk5VHbWkTI5wPCPr
         o2dXQ9PE3puh+Hui4ddog5gCRQelga6UZVLU2pONFKv5mnhmFc8eQtM+y6nY0YvswiOc
         gtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQCK+Zcd2t60sEgEFMh43/KmT8Y7J1HENZolpobLhN0=;
        b=LrUwLCk52FDsiJ/sdCqz0YjkYMFfy19SZhZzHnxycitvZBpdOytXr9tLMJPyvJf5+F
         eAAf5O/CWT8qBmeAv6nvfUttS5kJVgSgOgSUHfDM/kewxUjqccgDPJU4TjuGix/i7nWW
         1lDJ1sfujMWW99Ezjvt48neEriYqMKdSXXP8W6zkROpEsNjnOqE2IZtlsm//Bip/tsOh
         RYjy/bFQ3vwgnwBaTCcmhYPuvn1GSc1oIoDwaeNCg9TKuP5L4aNZ0vTUOTfzJRSJItsd
         LN3ATeU8f0lKF3WvinsqVw6i/FdrUbQ5Ds9vx/5yl6EbB644NSdY25gpogkU8Lb1gaeV
         hi6A==
X-Gm-Message-State: AOAM530c2GIU5O59uZ0XwAeTl/SkzTaqADB7V7r5S6yCnsDAQLrEqaKX
        z6rAUgY5GTZWezu35QfEf3liXr4TQe7o7g==
X-Google-Smtp-Source: ABdhPJz/JDSbpj7RRseOXudH3Z8vk1hTRWlR/bPVaFvzJC+3xTHcaueRQuI02V/gG+QumZdGCSIzDQ==
X-Received: by 2002:adf:f8c5:: with SMTP id f5mr33269437wrq.420.1625739309730;
        Thu, 08 Jul 2021 03:15:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t17sm1728273wrs.61.2021.07.08.03.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 03:15:09 -0700 (PDT)
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Peter Chen <peter.chen@kernel.org>
Cc:     balbi@kernel.org, agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YOZ3CBNTXFTa+fNx@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <de86a2c5-92cf-da0a-8819-2de4c3c88b3f@linaro.org>
Date:   Thu, 8 Jul 2021 11:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YOZ3CBNTXFTa+fNx@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2021 04:54, Bjorn Andersson wrote:
> Bryan had a previous patch where the glue layer was notified about role
> switching (iirc) and as soon as we hit a probe deferal in the core
> driver we'd dereference some pointer in the glue layer. I don't find the
> patch right now, but I suspect it might have been caused by the same
> platform_get_drvdata() as we see in qcom_dwc3_resume_irq().

Here

https://lore.kernel.org/linux-usb/20200311191501.8165-7-bryan.odonoghue@linaro.org/

and here

https://lore.kernel.org/linux-usb/20200311191501.8165-8-bryan.odonoghue@linaro.org/

one thing about that I don't think is right now in retrospect is having 
to find a DT connector in the core, meaning it incorrectly assumes you 
have a node named "connector" as a child of dwc3-core

https://lore.kernel.org/linux-usb/158463604559.152100.9219030962819234620@swboyd.mtv.corp.google.com/

Having done some work with TCPM on pm8150b silicon I see what Stephen 
was saying about that

That's one solid reason I like the USB role-switch API - because it gets 
you out of the business of trying to discern from dwc3-qcom if dwc3-core 
has role-switching turned on by iterating through its range of DT nodes 
and looking for a special one named "connector"

The initial and imperfect solution I had for that looked like this

if (dwc3_qcom_find_gpio_usb_connector(qcom->dwc3)) {}

Wesley had another iteration on that that was a little better

https://lore.kernel.org/linux-usb/20201009082843.28503-4-wcheng@codeaurora.org/

+static int dwc3_qcom_connector_check(struct fwnode_handle *fwnode)
+{
+	if (fwnode && (!fwnode_property_match_string(fwnode, "compatible",
+						     "gpio-usb-b-connector") ||
+	    !fwnode_property_match_string(fwnode, "compatible",
+					  "usb-c-connector")))
+		return 1;
+
+	return 0;
+}

All we are really doing there is replicating functionality that the 
role-switch API already provides


---
bod
