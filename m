Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D8A342F59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 20:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCTTrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Mar 2021 15:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhCTTrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Mar 2021 15:47:10 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEF9C061763
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Mar 2021 12:47:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id g25so7271368wmh.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Mar 2021 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sEs3tkdpgomWMgBdp5ufK0ArrMR+heyRjJppxs079kk=;
        b=AkEg6FC9dlkL/3Q2vkIk0HU3HOsVdoh2gs9LMWL3tksL4IqG111QBp7MV+PobOe4Ei
         cV5QgF15/8GTAG4SDfSmv05VkgfgyOPvOlOpVSwaFmHSdnGyg0GjCTbaFW1NWo81l+Ze
         wjlEQq2fJHovA27LaYC+ZOiW0ECXNSuAglQHERJtlKZTQdcL4fhP8/xRAWKkys7x3r7E
         +cmwRAAUOx3IksxVY9S9Da9uAg5EXJdMEtZGdlAVDTQ/ENkVMetzyxhyNQCW3A5VoB3J
         tnN4NpzQX/LFJX4ZgdBfPEoZIIj/+j0/VjY+TwF6BxE1QpENjhN+JRKxryUsEYGWVhxy
         yg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sEs3tkdpgomWMgBdp5ufK0ArrMR+heyRjJppxs079kk=;
        b=qjAY7akX+CDOukni8XgCfIRktNhuRzTVKUoGCmRXTLJwZqfdBsXaMgXYf/jkC5WfdR
         SrgIpfPYjyEU7s5LStOphfHeAOgDPjlJPUxIINr0PI5Q/iSybu1ORUSdUuSqk7tCB2fs
         oMcvV2Oxne90vVwMVcsAIbOey7SmXLsWkkJj9eBF4vh4chbpHQCOJ/CZZqObTPZAL2iL
         PL+Z/ABJO8JVZom1XuKiTD6nRvj2lRfA5nWhK/ruXNlzX3cypGZrPqsDQtC+9OPpZb+B
         tJ7CiX0DdtKjqIRx+sXVS+HIKAO/KPJNxe/pHVR+rXTKUWmgyMeikTDunyb8JIHz9lGC
         vXkg==
X-Gm-Message-State: AOAM532NbjpPu2WwfL7ZY7B1Y4QT88zShWFW4ildtFwIzRlGITu4M0vI
        ckHOjkPjQlHjpNa/eQoHetlDdA==
X-Google-Smtp-Source: ABdhPJw+6Kj5u/+IjUYGqevwJluXpvLx9KSKFqvbgKODl7WyAIsEgiGwjjmiZmtRNJ8Zv2vJOWPwFw==
X-Received: by 2002:a1c:e482:: with SMTP id b124mr8723604wmh.70.1616269628146;
        Sat, 20 Mar 2021 12:47:08 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:2452:bc69:af94:a0d8? ([2a01:e34:ed2f:f020:2452:bc69:af94:a0d8])
        by smtp.googlemail.com with ESMTPSA id m10sm11661108wmh.13.2021.03.20.12.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 12:47:07 -0700 (PDT)
Subject: Re: [RESEND PATCH v4 1/2] dt-bindings: tsens: qcom: Document MDM9607
 compatible
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210319220802.198215-1-konrad.dybcio@somainline.org>
 <5733a2bf-8a75-2224-b821-eeb8556c6914@somainline.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a7018d4d-7c95-370e-9d47-615f63a65a22@linaro.org>
Date:   Sat, 20 Mar 2021 20:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5733a2bf-8a75-2224-b821-eeb8556c6914@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/03/2021 20:01, Konrad Dybcio wrote:
> Add the compatible for MDM9607.
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>> v4: separate from the main patch
>>
>>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> This change was previously a-b Rob Herring, I forgot to add the ack back in after separating the patch, sorry for that.

Can you point it to a lkml@ archive ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
