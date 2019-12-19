Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5008812608C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 12:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLSLLM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 06:11:12 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51066 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLSLLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 06:11:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so5011933wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 03:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5Xc5XvWcEEycjOnD+EPG6sMgV+BpYwH+4ZWrv1cyfpw=;
        b=TosF3EXn2hu9xqrdp8Xsd+n2oQJbGcJX3yeio9cZrfQ76GW9tAWpEY7FryfsOnlr4h
         M5BJs3iJOBWHYuGk/fDR/pKx3kNOf+IHheXOy0IW2AHQPshclkpU5MlMYwPnTCkR0Kr8
         eG9jhD/R1vPq2dgBnWM7vtKRQH1mN/ak+Qc70L/mMRUAYzWYS7rWplvOECf0G3sjYWHs
         6AMzaCwyPQEJo+9GM8Bn3aqdxmnnUAYl397Wr8mi+9OzRTWM1v4ODan2luTjSqcbLOjT
         p5MUXJ8iOjvFa7mDOXJksj2gk61KZCw2FAqNWef+VS4+6LpUf2RUTOh06YNozLbDD5Rk
         mE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5Xc5XvWcEEycjOnD+EPG6sMgV+BpYwH+4ZWrv1cyfpw=;
        b=efIKPMZ0uoC3IPZq1WyoBpyG1smoitIiS60nzAXRQjKX8A3QJQwY7/Krm8a82dsLC6
         v9edkEKygloZAcU94u6STRvjM3W/XpJd17iAYteIV2YlV2ydWkyBLBsRtDX/GUgdg6r2
         W0lzGdFjglqAIClx+c53n2qTL6O7sftb8P0/bNQ7/gSSWHGL5MVbeK0p9rT3kCS+J9sR
         YU9PyvvXJd9i6yjcadPZuX7Oojhuz6HtsEygQdvilsr85kZy16Y4YgFZ5FRFBm1xk591
         RfGQd8IeSSi6ygVle4zypHZ4UTCDdSB/re52ombUqyC1vNA0+XbtGoL2Gng9l9IQkF0v
         vm6Q==
X-Gm-Message-State: APjAAAUTVLiCjHUPpfPchz/sQQl7UDwapfqR5djgkilGyrBPYu2hslGa
        oAOEF7nfOwxlPMclYTVAAoMp/1pSfNM=
X-Google-Smtp-Source: APXvYqy3JYgxz0Mf9riMDxtaRhDbhfUewuJHxYKjM1zkamYu6acokMF69y9Qp0nohXAR304IbOAAyw==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr9324907wmj.100.1576753870114;
        Thu, 19 Dec 2019 03:11:10 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c17sm5993682wrr.87.2019.12.19.03.11.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 03:11:09 -0800 (PST)
Subject: Re: [PATCH v2] nvmem: add QTI SDAM driver
To:     Shyam Kumar Thella <sthella@codeaurora.org>
Cc:     Anirudh Ghayal <aghayal@codeaurora.org>, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1576753570-23515-1-git-send-email-sthella@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b6a6ce09-2af6-0c67-bb24-e5066d819897@linaro.org>
Date:   Thu, 19 Dec 2019 11:11:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1576753570-23515-1-git-send-email-sthella@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/12/2019 11:06, Shyam Kumar Thella wrote:
> +static const struct of_device_id sdam_match_table[] = {
> +	{ .compatible = "qcom,spmi-sdam" },
> +	{},
> +};

This patch can not be accepted without Device tree bindings documented.

--srini
