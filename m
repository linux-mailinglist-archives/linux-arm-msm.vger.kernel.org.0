Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351EF225AC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 11:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgGTJFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 05:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgGTJFG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 05:05:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8618EC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 02:05:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a14so2166940wra.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DkRWC0cI8O7GbXOYyHnGL5QyWF9IbOGv2nZauF5wCkI=;
        b=bU8EMgFph/+KkpB7s9feIuGmNFweYyoKifyCutks+uAGpXf0FdKEY221dDMC3pPPwE
         EPkm1IKadr74GCklQzZfCzYiRvTrA13cuP+tlXZk6Oe5X9gotE0Y+WlClqT1cPrDC4OM
         7jmWVUA8x9OunWjWq9OJ8SarD2APdKH/QtcZV5e+VnQflCvT1hJdUE6lpE65l3tBdT7l
         nb+mQR++sRVlL/ajK5nBUJuVjt8vGtSP6iA28jN4WtD4+dXXapcXVl52DnbCiEwxs6eS
         MQC2pHVUz5nCy6TOdB4yzYWTviKb8UQbCcdAvXUmWBDeH96GVHAo2pNgsvwKblF3jOCT
         u1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DkRWC0cI8O7GbXOYyHnGL5QyWF9IbOGv2nZauF5wCkI=;
        b=ee6XeLgjye5pfowoQY3oHu+5ISKzLeQh0JdGWlbfbMF6Wt5CIk6irvpVAuSY/oQIYK
         vpa1Ect8bFrjbNLYfKtDJ2uzSB4FI033h41qsV2fGdeSAYymjGZ5KezSeVDiLLIySf9r
         Gf227Luaa6TL4L9ibZXlhAUPqXnAsEpzGoyjSmtL6+nRQYchg2JW9I66/D2ChPa/dm6c
         r6PO48X3G3CQuJcIp/BQIyvfnshQHNKRvF8h/6yVyasevfj8I4KQ3FftfuC+tFFLkUm6
         ex4O40LRc2LhBYPpZtx7kw/NSIGmAjLRrJ7suPfrOEmw3RvYS7jU5rkg7ULYPG37aF6f
         H/xQ==
X-Gm-Message-State: AOAM531zaWIG4NkA0swLDiqfgBnZskfNvvS5FtYjmJMybnzDOsdZLwE5
        LIV9O6GCrOAqoX5MHEFfHEh/dBFAT7g=
X-Google-Smtp-Source: ABdhPJxjaq34hzFmwVQqgEd8EEjoU54tk8kNmyK8IbWqdlkGCdZ95EJD2792qPaZuzt6PY2tbOPt+w==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr1900499wrr.151.1595235905139;
        Mon, 20 Jul 2020 02:05:05 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id z1sm31934372wru.30.2020.07.20.02.05.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 02:05:04 -0700 (PDT)
Subject: Re: [PATCH v5 0/4] nvmem: qfprom: Patches for fuse blowing on
 Qualcomm SoCs
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     sparate@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        mturney@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>, dhavalp@codeaurora.org,
        rnayak@codeaurora.org, mkurumel@codeaurora.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200710143520.1206846-1-dianders@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3aff0624-b698-4711-aaa1-6d2fb661b085@linaro.org>
Date:   Mon, 20 Jul 2020 10:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200710143520.1206846-1-dianders@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/07/2020 15:35, Douglas Anderson wrote:
> This series enables blowing of fuses on Qualcomm SoCs by extending the
> existing qfprom driver with write support.
> 
> A few notes:
> - Though I don't have any firsthand knowledge of it, it's my
>    understanding that these changes could be used on any Qualcomm SoC.
>    However, it's likely not very useful on most boards because the
>    bootloader protects against this.  Thus the write support here is
>    likely only useful with a cooperating bootloader.
> - Blowing fuses is truly a one-way process.  If you mess around with
>    this and do something wrong you could irreparably brick your chip.
>    You have been warned.
> 
> Versions 1 and 2 of this series were posted by Ravi Kumar Bokka.  I
> posted version 3 containing my changes / fixups with his consent.  I
> have left authorship as Ravi but added my own Signed-off-by.
> 
> Version 4 is a minor spin over version 3.
> 
> Version 5 is an even more minor spin and just bumps up some timings to
> fix a failure reported by Ravi on one device.  I've collected Rob
> Herring's reviews and (as far as I know) this is ready to land.
> 
> Changes in v5:
> - QFPROM_FUSE_BLOW_POLL_US 10 => 100
> - QFPROM_FUSE_BLOW_TIMEOUT_US 100 => 1000
> 
> Changes in v4:
> - Maintainer now listed as Srinivas.
> - Example under "soc" to get #address-cells and #size-cells.
> - Clock name is "core", not "sec".
> - Example under "soc" to get #address-cells and #size-cells.
> - Only get clock/regulator if all address ranges are provided.
> - Don't use optional version of clk_get now.
> - Clock name is "core", not "sec".
> - Cleaned up error message if couldn't get clock.
> - Fixed up minor version mask.
> - Use GENMASK to generate masks.
> - Clock name is "core", not "sec".
> 
> Changes in v3:
> - Split conversion to yaml into separate patch new in v3.
> - Use 'const' for compatible instead of a 1-entry enum.
> - Changed filename to match compatible string.
> - Add #address-cells and #size-cells to list of properties.
> - Fixed up example.
> - Add an extra reg range (at 0x6000 offset for SoCs checked)
> - Define two options for reg: 1 item or 4 items.
> - No reg-names.
> - Add "clocks" and "clock-names" to list of properties.
> - Clock is now "sec", not "secclk".
> - Add "vcc-supply" to list of properties.
> - Fixed up example.
> - Don't provide "reset" value for things; just save/restore.
> - Use the major/minor version read from 0x6000.
> - Reading should still read "corrected", not "raw".
> - Added a sysfs knob to allow you to read "raw" instead of "corrected"
> - Simplified the SoC data structure.
> - No need for quite so many levels of abstraction for clocks/regulator.
> - Don't set regulator voltage.  Rely on device tree to make sure it's right.
> - Properly undo things in the case of failure.
> - Don't just keep enabling the regulator over and over again.
> - Enable / disable the clock each time
> - Polling every 100 us but timing out in 10 us didn't make sense; swap.
> - No reason for 100 us to be SoC specific.
> - No need for reg-names.
> - We shouldn't be creating two separate nvmem devices.
> - Name is now 'efuse' to match what schema checker wants.
> - Reorganized ranges to match driver/bindings changes.
> - Added 4th range as per driver/binding changes.
> - No more reg-names as per driver/binding changes.
> - Clock name is now just "sec" as per driver/binding changes.
> 
> Ravi Kumar Bokka (4):
>    dt-bindings: nvmem: qfprom: Convert to yaml
>    dt-bindings: nvmem: Add properties needed for blowing fuses
>    nvmem: qfprom: Add fuse blowing support

Applied above 3 with merge conflict fixed.
dts patches should go via arm-soc tree, Bjorn could pick that up!


Thanks,
srini
>    arm64: dts: qcom: sc7180: Add properties to qfprom for fuse blowing
> 
>   .../bindings/nvmem/qcom,qfprom.yaml           |  96 ++++++
>   .../devicetree/bindings/nvmem/qfprom.txt      |  35 --
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts       |   4 +
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          |  10 +-
>   drivers/nvmem/qfprom.c                        | 314 +++++++++++++++++-
>   5 files changed, 411 insertions(+), 48 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>   delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
> 
