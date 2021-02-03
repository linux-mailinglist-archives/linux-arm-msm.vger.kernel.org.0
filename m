Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52CE30D080
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 01:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhBCAvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 19:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhBCAuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 19:50:55 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D30C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 16:50:15 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id lw17so2542286pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 16:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WrIVK8sDseMlS4o9lz0V6MRsGpJ6jWjlISOO9cArdaE=;
        b=SWSiiHtZvYGMNzfqn0C705T+byGm0SCksZTFqTryqHaM/C6AJ2+ZFyZfH977qTEzUb
         S+fzKzvzpBfi9CqT6vS20/vSqQ3Pgf9kx+tWZTe7I7oF+n7AL3aNgDDxxV/YNFIDK463
         IDXak76GlG862GDExIWJUcWa9x1fedwPFH+1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WrIVK8sDseMlS4o9lz0V6MRsGpJ6jWjlISOO9cArdaE=;
        b=gffBuq+08MlqfLrjWqcjCX6E+JQf4eEb6bYZmvt+2e1r2Aoz6rx6oUX24/N5yRRxFN
         hFLqHRZNvc97eUnUvdr/v0eX8qctPjekp+1N6QESHsIKxxYi/P9Bc3M1wQgCR0TuPO+y
         NMaKzQUDFoa+GckxlSaeY+/ytUnogPAQ0AJwEm51kdsSrWWA5fRN2bDYaFhVUuIZFcFk
         Tm2Uo8cr6MbDo0qTT5LQ9YlzEYAN1WXTM/+uCKpVxW0/c3ZjQQpj1T68si4Cbl615r3q
         UwZPrGeMQnHZb/Z9lnoFutVryqBNN4NcrKz/CJeYYsbtQd4njTXQkCQlHEDbch6Bluot
         wlCg==
X-Gm-Message-State: AOAM533csHPuuNeNymNSHJAWPwaixMk17RWiLSihQlUDtf2w8wYDnzGs
        7NS1Q6wlRqRVt4nkSKrq4nyk5w==
X-Google-Smtp-Source: ABdhPJwUtVndBlHghaUzgOXZqCD8uLRkChgDzib4W7gmbknEoDqpUtRqOAYHnIJg9ki5c/5sOFwvKQ==
X-Received: by 2002:a17:902:a614:b029:e1:5b43:956a with SMTP id u20-20020a170902a614b02900e15b43956amr846276plq.38.1612313415034;
        Tue, 02 Feb 2021 16:50:15 -0800 (PST)
Received: from benl-m5lvdt.local ([2600:1700:87d0:94f:dd59:3fb8:f6a9:fc02])
        by smtp.gmail.com with ESMTPSA id z11sm169589pfk.97.2021.02.02.16.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 16:50:14 -0800 (PST)
Subject: Re: [PATCH v2 5/5] interconnect: qcom: Add MSM8939 interconnect
 provider driver
To:     Georgi Djakov <georgi.djakov@linaro.org>,
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
From:   Benjamin Li <benl@squareup.com>
Message-ID: <7630c4aa-b023-55a6-e2aa-37a7538c6b45@squareup.com>
Date:   Tue, 2 Feb 2021 16:50:12 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a88b39dd-1c50-8aff-f85e-27086db9b040@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/5/21 5:54 AM, Georgi Djakov wrote:
> On 1/2/21 13:08, Vincent Knecht wrote:
>> Le vendredi 04 décembre 2020 à 15:53 +0800, Jun Nie a écrit :
>>> Add driver for the Qualcomm interconnect buses found in MSM8939 based
>>> platforms. The topology consists of four NoCs that are controlled by
>>> a remote processor that collects the aggregated bandwidth for each
>>> master-slave pairs.
>>>
>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>
>> Shouldn't some rpm ids be changed like they were for msm8916 in the following patch ?
>> c497f9322af9 ("interconnect: qcom: msm8916: Remove rpm-ids from non-RPM nodes")
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20201112105140.10092-1-georgi.djakov@linaro.org/
> 
> Maybe they should. I don't have the hardware to try it, but the test will be
> to just add the NoC DT nodes, enable the driver and inspect the boot log for
> messages like:
> [    2.926647] qcom_icc_rpm_smd_send mas X error -6
> 
> Thanks,
> Georgi

Hi Vincent & Georgi,

Thanks, I ran your suggestion on an MSM8939 board (with an additional
change to print slave IDs as well). Results:

[    1.901376] qcom_icc_rpm_smd_send slv 24 error -6
[    2.005977] qcom_icc_rpm_smd_send mas 20 error -6
[    2.010250] qcom_icc_rpm_smd_send slv 20 error -6
[    2.014684] qcom_icc_rpm_smd_send slv 106 error -6
[    2.019338] qcom_icc_rpm_smd_send slv 107 error -6
[    2.024615] qcom_icc_rpm_smd_send slv 29 error -6
[    2.028782] qcom_icc_rpm_smd_send mas 3 error -6
[    2.034657] qcom_icc_rpm_smd_send mas 100 error -6
(and there's another slv 131 that's hidden by the mas 100 failure)

Jun, I'll send you the patch I tested with to silence all these errors,
if you want to just squash that into the next version of your patchset.

Ben
