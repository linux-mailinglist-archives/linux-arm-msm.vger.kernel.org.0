Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2007158190
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 18:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgBJRlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 12:41:04 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:38424 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgBJRlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 12:41:04 -0500
Received: by mail-wr1-f47.google.com with SMTP id y17so8858851wrh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 09:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3gIUz/+oLLuaq19t30k8Jz+s5aA2PVpnAzXQO10cT/Y=;
        b=FQ5SjqjI8mESjcAV3hk0fQYB1DIjyI3CqJt/Aw53H9qwncQV+lCBRMSjQ9ez4AuPS9
         TO7MkvREuIQeW/8B7MTc602yDlTEDGJeJW2aW15lFEJSUDTv2cwNH3coJVWJL3uztvdQ
         8eHriud893T21Xf6LGypKFQcYCVPSKUIVcn9fWTNO9j2jF7Gi+iZQB+cDdbI9YZ6YoZP
         CEWpAt/4hPKW5geh6ytp1UpQN70S1ciZz061CDJL/aboGKgm4pnl8PidJ06uNY+3yli9
         DN8AeGMPwJZDOSEWRrpTIa0PI6WclosM+d3+AeBamTiIZPLsF35gyimD/PAgQIksG9ab
         r2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3gIUz/+oLLuaq19t30k8Jz+s5aA2PVpnAzXQO10cT/Y=;
        b=P3eEOYiusCJpUh3smLwfcct/idFqiwkM3qqX2dHnso31eIlscFO2s86SA9rp41iDRj
         KlXCJoFwbr/IT5XDnVV9VwmhK6V5trOS1khMsL5HAT7/WNz6ZRkL743faN2RCejKZ3HL
         FXvQGlQ9zYnVcDlKa+9ZsGUYVsmL5P+nVsaBhQp24DiIC/ZkY44ZHov3uIysWAz20szk
         9g7gOATj4GREiAicUKQZoV6a+Jt43bUE0y4qFyxbCnv4jd+RbAryzneWUzL+GsHyyGsi
         eaYEsc6JHI8LrpSpJxnIrujGtDuvPcSy7CDUw4CWfR+8FVojTnxOyed8Gv1DM1NLOZHj
         u/tQ==
X-Gm-Message-State: APjAAAXZ9xpApk6XrH+U3K/JFxc+fO0v3ERksXlphMrZS/Zn9O++qeI0
        Ig8SXcHVbAexSKD9n7IcTXcPww==
X-Google-Smtp-Source: APXvYqwbPVn4r/e2i10UW5NrTzU1jT70XhhtfiutTlrnJyFJyV3h+DHyidgLZwaetvsInEsC+lSh5Q==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr3078880wru.256.1581356461456;
        Mon, 10 Feb 2020 09:41:01 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id o15sm1401166wra.83.2020.02.10.09.41.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:41:00 -0800 (PST)
Subject: Re: [PATCH v2 3/8] ASoC: qdsp6: q6afe-dai: add support to pcm port
 dais
To:     Adam Serbinski <adam@serbinski.com>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-4-adam@serbinski.com>
 <d0437f6d-84c8-e1cd-b6f5-c1009e00245d@linaro.org>
 <616e3042f46cb7f052fc71e0ba4919a2@serbinski.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5464ab87-f711-4aa6-3f22-f27bf4819998@linaro.org>
Date:   Mon, 10 Feb 2020 17:40:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <616e3042f46cb7f052fc71e0ba4919a2@serbinski.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/02/2020 17:22, Adam Serbinski wrote:
>>>
>>
>> Why are we adding exactly duplicate function of q6afe_mi2s_set_sysclk 
>> here?
> 
> It isn't an exact duplicate.
> 
> The reason I split off the new function is because the clock IDs for PCM
> overlap/duplicate the clock IDs for TDM, yet the parameters to
> q6afe_port_set_sysclk are not the same for PCM and TDM.
> 
we should be able to use dai->id to make that decision.

--srini




> 
>>>   +    SND_SOC_DAPM_AIF_IN("QUAT_PCM_RX", NULL,
>>> +                0, 0, 0, 0),
