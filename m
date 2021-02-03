Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE38130D387
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 07:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhBCGu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 01:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhBCGuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 01:50:23 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403F4C0613ED
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 22:49:43 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id q7so22864446wre.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 22:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Llt9wZ/++YWpNuv24fYJyAK2KaKZ50JAQBYyHHTRHl0=;
        b=eMd6ybxnZ1GMNU8CePXnXb1pTr6Ufz1IDd0Ctp4ZlKMVoPoNxn0ozbVA2qeUr1CqPN
         Go0jM+q9METdwsc19UY3lhxyBGBqmQem9uQv3feFzfiYu4Xm4gubwTEDWsqd6ndAz/R5
         zZaaTNnjrM7HXSPRIzwwnd+ICKb9BAO+0Q0r9CbY+tLvoNv5Wmq3vEwWU3qWhB6v6x0s
         p15tmaQ+8Rx7FSXc4FF1/shXUABaAcZhXzjWQvk+prBEyBK8nxwoDu2/H9wPkCsqj7wv
         jXQo5x/fNSBx3ThDZnAN6BUFvMO4tD6gcg8vofcRDo3n2hTDGX67QtWQV5CHc9lU+dg9
         aiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Llt9wZ/++YWpNuv24fYJyAK2KaKZ50JAQBYyHHTRHl0=;
        b=j/Tlbp4UIwEgRvJDoTRXPPcbwRBXRnauaZr5czTpHbidNLfy2H9qsJSR8pBLsvoHlP
         QNpO1rbP7d+3e9cvD/liXUN5Ofrudh+qv5JF5dFM6vs+cDJN+s2z+kOa7uaaHRGn6t27
         VZzORFJgDWnGJLCKEyOdshjw/7AwJSTbs3u0TjL0pEefGtNSiiMd03z2Y5X+2rs4QOse
         DTbxDi06HYydzy9v2OliI/SfAl2CcU1RXuqOUcmHeuT2Uph+Q5VLOT2UIZCPjooIX9YI
         VRkrE6AL3JaAxpSB9HGmtHCkX92WxD3JXCqmX3GqgpE2E9nXeGAvHK0YWBPO0gxEncUe
         JV/w==
X-Gm-Message-State: AOAM530Bwhn0B2NMJW4J520+K0YfIFJ3W62T+G3ABDdo19eXwGud44wX
        SCOeX9O+JKB+Guy+lccqKMuOgg==
X-Google-Smtp-Source: ABdhPJxQrjhEspsMyRywC+CZuV6pLjH2d0gs0SU2q/MWY/IqDeweyxSs/Z4+de3Z6tAprGygraB2Qw==
X-Received: by 2002:adf:fc86:: with SMTP id g6mr1721941wrr.20.1612334981687;
        Tue, 02 Feb 2021 22:49:41 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id l5sm1883815wrv.44.2021.02.02.22.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 22:49:41 -0800 (PST)
Subject: Re: [PATCH v2 5/5] interconnect: qcom: Add MSM8939 interconnect
 provider driver
To:     Benjamin Li <benl@squareup.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Jun Nie <jun.nie@linaro.org>, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
Cc:     shawn.guo@linaro.org
References: <20201204075345.5161-1-jun.nie@linaro.org>
 <20201204075345.5161-6-jun.nie@linaro.org>
 <d869ea94b3b1c73800a5c3b855cb6f280be6c185.camel@mailoo.org>
 <a88b39dd-1c50-8aff-f85e-27086db9b040@linaro.org>
 <7630c4aa-b023-55a6-e2aa-37a7538c6b45@squareup.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <8aa03f6d-dcf5-73b3-41f8-0d872d9f4f86@linaro.org>
Date:   Wed, 3 Feb 2021 08:49:40 +0200
MIME-Version: 1.0
In-Reply-To: <7630c4aa-b023-55a6-e2aa-37a7538c6b45@squareup.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ben,

On 2/3/21 02:50, Benjamin Li wrote:
> On 1/5/21 5:54 AM, Georgi Djakov wrote:
>> On 1/2/21 13:08, Vincent Knecht wrote:
>>> Le vendredi 04 décembre 2020 à 15:53 +0800, Jun Nie a écrit :
>>>> Add driver for the Qualcomm interconnect buses found in MSM8939 based
>>>> platforms. The topology consists of four NoCs that are controlled by
>>>> a remote processor that collects the aggregated bandwidth for each
>>>> master-slave pairs.
>>>>
>>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>>
>>> Shouldn't some rpm ids be changed like they were for msm8916 in the following patch ?
>>> c497f9322af9 ("interconnect: qcom: msm8916: Remove rpm-ids from non-RPM nodes")
>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20201112105140.10092-1-georgi.djakov@linaro.org/
>>
>> Maybe they should. I don't have the hardware to try it, but the test will be
>> to just add the NoC DT nodes, enable the driver and inspect the boot log for
>> messages like:
>> [    2.926647] qcom_icc_rpm_smd_send mas X error -6
>>
>> Thanks,
>> Georgi
> 
> Hi Vincent & Georgi,
> 
> Thanks, I ran your suggestion on an MSM8939 board (with an additional
> change to print slave IDs as well). Results:
> 
> [    1.901376] qcom_icc_rpm_smd_send slv 24 error -6
> [    2.005977] qcom_icc_rpm_smd_send mas 20 error -6
> [    2.010250] qcom_icc_rpm_smd_send slv 20 error -6
> [    2.014684] qcom_icc_rpm_smd_send slv 106 error -6
> [    2.019338] qcom_icc_rpm_smd_send slv 107 error -6
> [    2.024615] qcom_icc_rpm_smd_send slv 29 error -6
> [    2.028782] qcom_icc_rpm_smd_send mas 3 error -6
> [    2.034657] qcom_icc_rpm_smd_send mas 100 error -6
> (and there's another slv 131 that's hidden by the mas 100 failure)
> 
> Jun, I'll send you the patch I tested with to silence all these errors,
> if you want to just squash that into the next version of your patchset.

Thank you for doing this! Please send a follow-up patch as i already
queued Jun's patches.

Thanks,
Georgi
