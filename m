Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1599515A551
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 10:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgBLJwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 04:52:04 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38757 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbgBLJwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 04:52:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so1395706wrh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P1BE/J6k12sw+5b4sdZJAqIoEkv4CupE36M6VkS2iPk=;
        b=QYsqlI9CK3W1WYd+81VRLDbVrXSvTLcqcOtmxlp7DQqLG8nG/Imqsojr2LpIE7SoEf
         KmLq+Vx+nr7l8mAU5rSKGgywBXGYPFRXb55OR7wPtZ5D089rMiRwyn00uHzZFwZ26/aX
         E+LJIV2U5RWB9jFrn30qBqiZ5eBQavfsGrVkN8xD8N1XC4MiL0Dqk5DTSjJGAhVcCspk
         OxEnJpwgOBKG6+uvrk/6Zbh91r+M63HFYDQndyQaDLRNQhm2FLIpoJppJpsG3E374l4E
         3pq8uu3IAGg6FW2KVCkpM7eh8KDMrsKBA7vSRwrtqqVJq4/YwKNzU2R6l6tC3H6HiLFM
         1XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P1BE/J6k12sw+5b4sdZJAqIoEkv4CupE36M6VkS2iPk=;
        b=R5lPymafWoL0jWH2/pJbbU26QnP4/qe68Dz+hsqRf5Ymp4R38mFA4INaFNnUTV/CLQ
         hJNKDiw4zOuB890Y4VpDzp2q/toZMRWXSViA/kJSjSBZ+T8Dec0+F+RF9dkqOoh2U0Es
         JeRtZNLSEp4/I8lcIKJUpq0HI2IvnWSh+MXwsMqOmDqgzoWV7wzjaZJOChl4HBkgDLI4
         HNuVR8iYxiHmqXhYEfIohhr/+6XObX7x3AJa6Veuxy4D3on1YlPgUIAnYJ27i43IGWVQ
         nUZ3bAwk4kMOf7z+8WJTS0T7bN9AJqmO4c/ZP5OSH+GIjN/0wUFfrrZqhvE5NF2W+OFH
         A6UA==
X-Gm-Message-State: APjAAAWp8s7QVQFYEnfrDIp6Y4TVkUkFDiy2zGE5oaC95FJshkxumzEl
        Lu6YtTiML4hr+qBAK7JtQQgbZA==
X-Google-Smtp-Source: APXvYqzsQwheQau9uolf3pWBRAMxduG9Z1N4tSP3VvEA0X/qjSw6MaHP8j8sf7/aCCkRVNTE9MxaRQ==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr14099564wrb.407.1581501122445;
        Wed, 12 Feb 2020 01:52:02 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id d9sm8887197wrx.94.2020.02.12.01.52.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 01:52:01 -0800 (PST)
Subject: Re: [PATCH v3 3/6] ASoC: qdsp6: q6afe-dai: add support to pcm port
 dais
To:     Adam Serbinski <adam@serbinski.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-4-adam@serbinski.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1875fb89-6a25-0d1a-c367-183ae6980ac8@linaro.org>
Date:   Wed, 12 Feb 2020 09:52:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200212015222.8229-4-adam@serbinski.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/02/2020 01:52, Adam Serbinski wrote:
> +			ret = of_property_read_u32(node, "qcom,pcm-quantype",
> +						   &priv->quantype);
> +			if (ret) {
> +				dev_err(dev, "No quantype from DT\n");
> +				break;
> +			}
> +
> +			ret = of_property_read_variable_u32_array(node,
> +						"qcom,pcm-slot-mapping",
> +						priv->slot_number_mapping,
> +						1, AFE_MAX_PCM_SLOT_COUNT);

These new bindings needs to be documented in 
Documentation/devicetree/bindings/sound/qcom,q6afe.txt

--srini
