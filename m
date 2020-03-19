Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C5418BAF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 16:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbgCSPV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 11:21:58 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46798 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgCSPV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 11:21:57 -0400
Received: by mail-ed1-f65.google.com with SMTP id ca19so3039325edb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Vo/Ftz8y0HanBL9Q9HVvo6it3DMCdNOtqGEMgDJW9I=;
        b=A3/iwjkX8mSzEwg+8yC2HsPaBnY0BRs8nvdHzyDdfD7Rkega4Hbel/Z+53KqkZZXmO
         wGA/zFmaNJKqzZVoItWdyptVzur6M3qHAvKdKGzimpbZoaK9xPD8ZCu031tQjA2v2MHp
         J+FXZveu8cxu78e0xK9SA+SpEYIKheUQPMpm3TjmA551iPhkAgkkmsoGDoxc0VVa/fCQ
         n9p8NyD7NwhTpEnj0voJdyxYYbNdgvhRtoDLGIkFJBix+bV31j0i186dnZ0pXgCRt6X7
         cZhkQwZ1xIkdmVIJhKrAloj4k10oCmccp1UdNNiqnYeCVj0H2DkQvgBZtk+eAd56F6it
         wjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Vo/Ftz8y0HanBL9Q9HVvo6it3DMCdNOtqGEMgDJW9I=;
        b=k0ryItxt1s6tChhA3ndIE0q+y8+qqh0k3ja1P0HUychKx1VKo5x1/pseTWtYSz5LJk
         GZRl5mh9l1MhKD48mrEz01SbCVkjV0FXvv9JeoLEHi6ynJMAU5ChkN/AW4QpWPS4GxPj
         NbnvF3GoTjNRM4HTFy4UmQy0GzX4qS/tymMkiv2RD78whTtaFQTGQfwjp+jTAwLyZmFL
         tMjOUWZ5vV+We1Ic2aiOqk8XenYtXDozNWavYrMuRhWoyMlj95bXrn5sX79h8TPVxj3H
         wFYV7PriaAtu2d0cVhQWxbfy6V1ivOcQf7+ZsoGR3mvk6D7hxuM2En5AwG0GJojEfARQ
         F/8Q==
X-Gm-Message-State: ANhLgQ1VDjSYYIypsRtKOyH4Lxbr2OoqSEIwzze6OWUqhgDGKz8P3tFQ
        dW8YyxbLkZvl371hdEmFbi6JbA==
X-Google-Smtp-Source: ADFU+vtLlcnn3fVK+LYjZ9eeWQZLIwYJtZSt0seyEWRCmYEYKSnZNg5Ich6NL3IamCZnBo4cqxl5LA==
X-Received: by 2002:a50:9f07:: with SMTP id b7mr3330605edf.148.1584631315616;
        Thu, 19 Mar 2020 08:21:55 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id l19sm150533ejn.31.2020.03.19.08.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 08:21:54 -0700 (PDT)
Subject: Re: [PATCH 2/7] dt-bindings: usb: dwc3: Add a gpio-usb-connector
 example
To:     Stephen Boyd <swboyd@chromium.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
 <20200311191501.8165-3-bryan.odonoghue@linaro.org>
 <158458013177.152100.17920784952083533825@swboyd.mtv.corp.google.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <aa6aa234-e2d1-bdcd-0f0e-64b2a7e497d3@linaro.org>
Date:   Thu, 19 Mar 2020 15:22:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158458013177.152100.17920784952083533825@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2020 01:08, Stephen Boyd wrote:
> Quoting Bryan O'Donoghue (2020-03-11 12:14:56)
>> A USB connector should be a child node of the USB controller
>> connector/usb-connector.txt. This patch adds an example of how to do this
>> to the dwc3 binding descriptions.
> 
> I read that as a child of the USB interface controller, which is not the
> same as the USB controller. For example, we're talking about having the
> usb connector be a child of the EC on ChromeOS devices because that
> manages the connector
> 
>>
>> It is necessary to declare a connector as a child-node of a USB controller
>> for role-switching to work, so this example should be helpful to others
>> implementing that.
> 
> Maybe it should be a virtual node at the root of the DT if it's GPIO
> controlled? And then the phy can be connected to the usb connector
> through the graph binding.

Graph binding can probably work.

Re: the PHY.

For myself the hardware model is

Connector -> PHY -> Host controller -> Host controller wrapper

Only

Connector -> Host controller -> Host controller wrapper

care about the USB role though.

If your PHY did care about the role, you'd really need to write a 
connector/phy type-c type driver, to detect the state and toggle your 
PHY bits before doing usb_role_switch_set_role() back to DWC3.

At least that's my understanding.

---
bod
