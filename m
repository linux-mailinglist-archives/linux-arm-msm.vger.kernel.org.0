Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6F5155A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 16:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbgBGPED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 10:04:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39742 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgBGPEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 10:04:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so3116741wme.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 07:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HMDl4o3rW3O7+RqgrNRzbPCmWSYVjKzp9g+zOGkOoBI=;
        b=OLbktre1TzHCgrai9hwALDQn2A4u4gf0naTmEJy2ZnmfGcxLqcW7A2TEK1xrf9O0M4
         fIx+Hn8OCOImGceqIpPjyscBlxiiuc+0rH2ANPM4DOaUx7ymHXGVPogah36x+V/YL2jV
         ly3BaYvHJaQZwxtd7nlNRbCxWLdzLqaM2f8J3ANZLgQmvEA5ZGDIpcE7bVESnhQS62F8
         VlY4+SqhM3NyqvQI6NrXFGfKCtgHSi8MSzn0X2lL5qKTjrE4qTk4O4rBX8a4KoZKTiSH
         ya9HuqrGuVpThRONAHxuhpTe9cGvpsY9/RRJ3KhxWmOA7R0jeRXMMwBR2EopsDAaNcpc
         8peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HMDl4o3rW3O7+RqgrNRzbPCmWSYVjKzp9g+zOGkOoBI=;
        b=V1R4KqfJhsmz9qHsYsbVGqd+vHvltZgqs1t6cGlG3RXs+IIHG9hoD+4ixG+qCVe3ZW
         6DIElVLupFWcGoqxdA48yxOhUnVNaXver34AslH2KWIz6T9PeAIie0LP4Q0XWRayhr0A
         /DA5HbCG7NMZbLeSgTaYdz8cgzi0POEImoQ9l31j/YNueiyjvIBhsqV0Ci90fxV5Mkrz
         csDXLi2DfCK1166wGGHzgP0QSC7m+aBTQeJz1rvOg/bqJTpnYKVY4qZ7pcws62vyzw4X
         r4Qp9Hc+F/Fgx6YSANXM6h77cnMmWSkkUbhvNf9czi7d4aZ8e1BfqfNCT1alqQZ92I6f
         iGnQ==
X-Gm-Message-State: APjAAAWgBm/ulqnflisbvqhdiUAbQZoQGI20LF01SAkNG1jRrMagbHmb
        aasVOFi65CuiVslBzBjV9Z5u8A==
X-Google-Smtp-Source: APXvYqzzyoqr1jCZCY/KRGQTW/dpbRzFbFLZJzXLdYAJxgaeh9DBWl2aUOBeJTHhN609Fk1V+Qu7Xg==
X-Received: by 2002:a05:600c:2207:: with SMTP id z7mr4863923wml.138.1581087840050;
        Fri, 07 Feb 2020 07:04:00 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id d9sm3591225wrx.94.2020.02.07.07.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 07:03:59 -0800 (PST)
Subject: Re: [PATCH v4 09/18] usb: dwc3: qcom: Override VBUS when using
 gpio_usb_connector
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manu Gautam <mgautam@codeaurora.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
 <20200207015907.242991-10-bryan.odonoghue@linaro.org>
 <20200207080729.GA30341@jackp-linux.qualcomm.com>
 <2bd67925-14cf-5851-14a2-c51a065fac6c@linaro.org>
 <453bfea7-4085-1a24-84ad-30c7671665e7@linaro.org>
Message-ID: <832a97f1-e138-5b2a-755a-c551f7264cbd@linaro.org>
Date:   Fri, 7 Feb 2020 15:04:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <453bfea7-4085-1a24-84ad-30c7671665e7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2020 10:50, Bryan O'Donoghue wrote:
> 
> Maybe I'm wrong...
> 
> Looking a bit closer at the role-switch code it might be possible to 
> register multiple devices _as-is_ so long as you have a pointer to the 
> relevant parent...

Soo... its possible to create a new role-switch device relatively easily 
@usb_role_switch_register() but, the drivers calling the role-switch 
callback have a 1:1 mapping between role-switch call and receiver.

Doing something inside DWC3 <=> DWC3::QCOM looks like less of a rewrite.
