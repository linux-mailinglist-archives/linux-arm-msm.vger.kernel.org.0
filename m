Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524732FEF12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 16:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbhAUPjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 10:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733149AbhAUPhh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 10:37:37 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEBDC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 07:36:56 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id c124so1824878wma.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JcVTg+smuk+JvjKNodQ46EIl4LUKQrz4MgqUhJc2c80=;
        b=JiBVAej+mj5P09SDTOqy/z13p3dfmhJLUGqUlhdCTWBgsEh4vciDlpLWsRf8TL4lvi
         sNqqBZluOfTslKoM48OG8EjkDvHT/8XFUcUCgycz+OvAN8p9j3lyD5HbXCldJSLwkzqK
         JYjvMxQgkPIUGjMPRxzaF97kve0KuVZebypAlN8uJqY6G1HiUo8Is+OfXsjeBYgBQL3U
         T88HHH7F4w5U819uM4sV8QWcHSbhGRsbACOP/kercgXBHMRsxcea6g5faDvCqUJqb6te
         KOCp/cR0z4xjU0+OnWCfQmhTdEsWtgiD54SNU1h8bDxJk2n0BCCckVasXzLfIjSSwWs2
         uL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JcVTg+smuk+JvjKNodQ46EIl4LUKQrz4MgqUhJc2c80=;
        b=LXV4mEO94ir89tI3il1CPruMSph26imlpS/7p/QFp+JWOK9MQCvZsyjbDhOhT6w49f
         OH9r07a0ymVMlkFvezlQ/jeNQKM9tlEPd8EwJ72pVreOosyAVBkIbiOm6I4WVyjFCqIv
         ymzjE33KiZLVRVhqbutmtJ35JG+rgX1I7Z7EURIP7buljlgVb0aDKnFwbkP+fPVvxev+
         fpMx4jLqNL4F89SXUqVYqB4HNqbvq3cpMXpbIvE2RyCwzPlQQdYpJyYXtG2cULwRKjFq
         jtVDocxR38Kl4rP74xwQJ9m+RzegxJd0mhw2N0qQFOg5Wu73ZLX8emNV2jl7gg8rftT4
         w0Mg==
X-Gm-Message-State: AOAM531FtMCCFcguLbLfrSbvaAUhB7UNqj6LjxezFkQSToeQYpwa2TWh
        OT4j8UVoSGN+5YW2zxcrAbKI8g==
X-Google-Smtp-Source: ABdhPJyfXqxxgqOmtoSnJpiF3iqSkYaC/yU+/103LNk7Ep1oDZ5J01CBAR32cmExYpf+0vSeN4/3KQ==
X-Received: by 2002:a1c:608b:: with SMTP id u133mr9438737wmb.140.1611243415109;
        Thu, 21 Jan 2021 07:36:55 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:1539:1c19:f5a3:71b8? ([2a01:e34:ed2f:f020:1539:1c19:f5a3:71b8])
        by smtp.googlemail.com with ESMTPSA id p17sm8602926wmg.46.2021.01.21.07.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 07:36:54 -0800 (PST)
Subject: Re: [PATCH v12 0/5] qcom: pm8150: add support for thermal monitoring
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>
References: <20210119054848.592329-1-dmitry.baryshkov@linaro.org>
 <078a7025-ce5c-a252-f8f4-694c56153b3a@linaro.org>
 <YAmedqs9/1oDSWvK@builder.lan>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <49eb2533-e6ba-9310-a4f8-5b633c7a0253@linaro.org>
Date:   Thu, 21 Jan 2021 16:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAmedqs9/1oDSWvK@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/01/2021 16:32, Bjorn Andersson wrote:
> On Tue 19 Jan 14:57 CST 2021, Daniel Lezcano wrote:
> 
>> On 19/01/2021 06:48, Dmitry Baryshkov wrote:
>>> This patch serie adds support for thermal monitoring block on Qualcomm's
>>> PMIC5 chips. PM8150{,b,l}, qrb5165-rb5 board and sm8250-mtp board device
>>> trees are extended to support thermal zones provided by this thermal
>>> monitoring block.  Unlike the rest of PMIC thermal senses, these thermal
>>> zones describe particular thermistors, which differ between from board
>>> to board.
>>>
>>> Dependencies: https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/log/?h=ib-iio-thermal-5.11-rc1
>>
>> Shall I pick 3,4,5 also ?
>>
> 
> I believe I have some adjacent changes staged in these files, so I'll
> prefer to pick them through the Qualcomm tree.

Ok, thanks

>> -- 
>> <http://www.linaro.org/> Linaro.org ??? Open source software for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
