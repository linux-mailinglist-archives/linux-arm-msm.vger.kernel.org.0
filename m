Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F372512602D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 11:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfLSK6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 05:58:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42543 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfLSK6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 05:58:32 -0500
Received: by mail-wr1-f67.google.com with SMTP id q6so5485644wro.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 02:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LOOsEyvuasBLr3yvzRlpYBFKNpQOIsg2Ax8aja0jnrY=;
        b=yhr1ZjMOsQqXqHsILFXcqatMCvF/ZDmFxSvKD1L8H+K8GLS+/5QDFqfRvsc2CXQFe7
         MN9rTxDI7kZaM92BKsGytik2Y7UK5f3AsWw8X/lT24REN4JmS9ZrVaTq6Sr7rRDyeQo9
         1gRCJr20NNQpcxkUYo+hTc7aaGMnuHswv93eeBwusOHhT8j9cLzegTFmaH9A1hLvflb/
         IWAn7+xHWcvTVZWIQJg8U44AEWRsEmMIAY5pjl5xmkA82sLgMqme0acOXG3PTELobbVv
         KHbO/IEHiTmABkV/YUpa22EsG2ta671r+1bkEMvRzXbwK7PoT+l/N/Bf76YOxeJiZyBT
         MQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LOOsEyvuasBLr3yvzRlpYBFKNpQOIsg2Ax8aja0jnrY=;
        b=mjkFhMc2sBPworrQKFETOu+TcrtpsZ2a6yfcIl08gin9wL9a2dJEIKFjb3rxofZ4TX
         cCkBjx1GmOfZCAQTA5BruT8AIogSm5/LV+QTNacG0F2Q7KF3Wqno7Asq9xl/xvNoy7Q7
         pn0BxsGjEBa+gr7fwVXiqVoeblXhwNWJpEKhwBHsPySItz3+gmNYj+kPmzylIhxofGgg
         ZGpxhtgGCUZPCNIr+SrnG8Jb66Omm5C0H2mhKsvbRpb1O9898NhrXx8BzD+m67mhpC5a
         jUGs3GhUNBux0XacdevyRh2slV0Y4Ay5LfiqnHnsTdStkLIxZJOJwHUUp9jP/ZvcXDn7
         zhGA==
X-Gm-Message-State: APjAAAUFDU9/6rv1jS81dE44LhAJqXNUg7QQyH7+s9KpKFxIOejSWQZ3
        Y+FADQvyoYR3AQi+l+8KHxRSfQ==
X-Google-Smtp-Source: APXvYqwUw4nBzvJG6W7Ot6OE7z+N85JhMh19YIzO5YKGLoeCcKnDhKV5FIeSRUYPB8ceaij4DGeyoQ==
X-Received: by 2002:adf:e683:: with SMTP id r3mr8690894wrm.38.1576753111420;
        Thu, 19 Dec 2019 02:58:31 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id v22sm5504084wml.11.2019.12.19.02.58.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 02:58:30 -0800 (PST)
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use dma_request_chan() instead
 dma_request_slave_channel()
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20191217104629.24590-1-peter.ujfalusi@ti.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2a2c444a-178b-b813-d329-49abbf099381@linaro.org>
Date:   Thu, 19 Dec 2019 10:58:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191217104629.24590-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/12/2019 10:46, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)


Applied thanks,
srini
