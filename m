Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6111D3F86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 23:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgENVDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 17:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727837AbgENVDJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 17:03:09 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19ECC05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 14:03:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i15so502555wrx.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AzuGSbtk0koOgdKXayRT9aJsHBhz24oQCO02IEFXmXs=;
        b=BphBmLZG1gvlrzweeCpbYDKzhMZgskFuDOLm+c5qocsGvA3+c5hvgFeaTgw2xK7fY1
         KSoeOEtBQv37TqIOQbtCr03Nz1MZ78Tqx/dvazy3jErpQq6FR/gnEYCi+sfRdIYXaCMn
         VbUyz8yn3Q2dmDClslSeOTr4+Jzq/Y/H0ZqgBDiDTbELYeLX97TJX7rUa8bn/KjNnfwU
         a+/I7BK3Uv/BtWoe4i/xEl2s8Huzp1pQigi7ByhUlXECYnYf3KiaHwYoruaGiEa/Bahd
         s4loQAfykA0FK6Y1cLczbaWgQDNDjJOhreE3yl2CKBELv00APDPsGtgCZn5uG+/E9mgc
         ZZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AzuGSbtk0koOgdKXayRT9aJsHBhz24oQCO02IEFXmXs=;
        b=JulQeuLS8ZSeBgmZcmQ7HvotvfRq87wCRiG2XFQTyGSWfl0VUy0PuJtVw9/+C9eyIY
         yYGp1xJuIGNBx6z5+PZwD0d9FnG8FuKzXtEi7UtlkrVU+QKrvNoio92UySL2S80UQVkk
         Ms3i+r8aHfUuheqCxIvxm9usq7CWuDBoBPaTOZD1H4hF0kMGVItOCkoxQghBy/PWaDbU
         BdaqMET+iRx/hVFI/qZDa58Ma/UicJgs960/uNCE4zWP//xjjJErl/0gn1ajfyfJ/kwT
         uAa3nZUxHiWLOnwj3CES6njNZ/ajssRstuZx5eo8zBwnhpvlThIgCctiimOxqgFVOKxQ
         zpGw==
X-Gm-Message-State: AOAM5312PEZz18xwxHGjQtEo0eRjDDsnGyV0sfJq4V/8Jnw8XLP8RNUF
        2N/hPg/mrVPFnxfsTXkKFzFsyg==
X-Google-Smtp-Source: ABdhPJywcn+9WFj0CKjxg0AfdYgXxp44m2pHJVUBgaSFNeHQxLFRJwMKl0GTjJH2dN2ipbqdhslxYQ==
X-Received: by 2002:adf:c381:: with SMTP id p1mr385127wrf.148.1589490187405;
        Thu, 14 May 2020 14:03:07 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id n9sm468132wmj.5.2020.05.14.14.03.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 14:03:06 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
Date:   Fri, 15 May 2020 00:02:59 +0300
MIME-Version: 1.0
In-Reply-To: <20200514171352.GP4525@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/14/20 20:13, Matthias Kaehlcke wrote:
> On Thu, May 14, 2020 at 02:30:28PM +0300, Felipe Balbi wrote:
>> Felipe Balbi <balbi@kernel.org> writes:
>>
>>> Hi,
>>>
>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>> +{
>>>> +	struct device *dev = qcom->dev;
>>>> +	int ret;
>>>> +
>>>> +	if (!device_is_bound(&qcom->dwc3->dev))
>>>> +		return -EPROBE_DEFER;
>>>
>>> this breaks allmodconfig. I'm dropping this series from my queue for
>>> this merge window.
>>
>> Sorry, I meant this patch ;-)
> 
> I guess that's due to INTERCONNECT being a module. There is currently a

I believe it's because of this:
ERROR: modpost: "device_is_bound" [drivers/usb/dwc3/dwc3-qcom.ko] undefined!

> discussion about this  with Viresh and Georgi in response to another
> automated build failure. Viresh suggests changing CONFIG_INTERCONNECT
> from tristate to bool, which seems sensible to me given that interconnect
> is a core subsystem.

The problem you are talking about would arise when INTERCONNECT=m and
USB_DWC3_QCOM=y and it definitely exists here and could be triggered with
randconfig build. So i suggest to squash also the diff below.

Thanks,
Georgi

---8<---
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 206caa0ea1c6..6661788b1a76 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -129,6 +129,7 @@ config USB_DWC3_QCOM
 	tristate "Qualcomm Platform"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on EXTCON || !EXTCON
+	depends on INTERCONNECT || !INTERCONNECT
 	depends on (OF || ACPI)
 	default USB_DWC3
 	help

