Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CD946F2DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 19:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243212AbhLISWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 13:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241980AbhLISWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 13:22:44 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940A3C0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 10:19:10 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id m6so9866333oim.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 10:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=S0JQyjTunbOQRpAL1mfHYhxPgZ8eEhJSSXuzKq/Hnog=;
        b=mBM67eTxzKmcGwpgfzYUDIksjk4bYHhq/DkzT+XlRAyOh6vx+mzzjkJK1WPPB19zk2
         khhojfdUeocsVBNypzUwhe9OYapsIs6Ajc9yyfzkpBi9HpT1V4Zn7q9+66nvAlRFuKTZ
         6+YTVGSpOu3WDlFhD3EHZ3uRgwvnz0CaWtctmEMONcsDsxn3CbGtxSvsYbj9h5cmvafl
         Rv/MweraiRnxUmjJw/sy+2ys8kvfuMMObR8QX9ndQzexAzdw0r8feotJ9Zb1WUzWiF/9
         ettAfnqws5qF1a/+lVCjkvg9jbteHZW0Aeuq8dLQDQW0LbRNGM4V61Z1Bg4ZroMbrwPZ
         7Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=S0JQyjTunbOQRpAL1mfHYhxPgZ8eEhJSSXuzKq/Hnog=;
        b=sj2IetxEOMhJxaw/9iuWT0MDrkSadcm/83kJ6Je0QVD4PSeLDa+ICAftmwnR/gTXld
         Uz+vYwBcVuuOBG0otvLI4vcUqGLdLcKQQ1tHPejG5Tuvy0VZ0HcdM5pK2tQ0cyRAwiyZ
         AtPCtuiqKNfq/HY9hmWl1BkeUfIvu35PZ2UvRDodohYHU8EdRDwqTxGYXlZ1ywCa89/e
         kAwvSqjwWq0rX+x8PHiExyA1DCraKkxLplCtW/80vuymQjJUFKqdZrC+KhzdMcINHzyn
         ubk1k9ThjuFeSJsHf5chkJfy0Vjc30j1CwOzwGV+6vYNva5UgsMDRfPnJ/nWHcgP0W1U
         HeUA==
X-Gm-Message-State: AOAM530WVCOz4KabgCm1K+IDCRE4bXbJFW/YRMPZKF5ogRujOVz1sDF0
        EsevFIJrhe9KffZWhhIQPUWZ/w==
X-Google-Smtp-Source: ABdhPJwfjtg5LsFtSz5hYVc+XaPozIdUdnYNLwCPuRc4y9HIqO0mAIRwgLIhdD9OO+U/LU/BHO9toA==
X-Received: by 2002:a05:6808:d48:: with SMTP id w8mr7676796oik.135.1639073949927;
        Thu, 09 Dec 2021 10:19:09 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id q2sm111497otg.64.2021.12.09.10.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:19:09 -0800 (PST)
Message-ID: <c003889c-fe1c-0a85-5b2b-2875a909b1b7@kali.org>
Date:   Thu, 9 Dec 2021 12:19:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 0/2] arm64: dts: qcom: c630: update sound card setup
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/9/21 11:53 AM, Srinivas Kandagatla wrote:
> This patchset fixes issue a with existing sound card setup on c630 and
> also adds Headset button threshold values for button detection.
>
> relevant UCM changes are at
> https://git.linaro.org/people/srinivas.kandagatla/alsa-ucm-conf.git/log/?h=v1.2.5/c630
>
> Srinivas Kandagatla (2):
>    arm64: dts: qcom: c630: Fix soundcard setup
>    arm64: dts: qcom: c630: add headset jack and button detection support
>
>   .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
Tested on Lenovo Yoga C630

Tested-By: Steev Klimaszewski <steev@kali.org>

