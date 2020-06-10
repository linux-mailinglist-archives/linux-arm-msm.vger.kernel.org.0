Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D231F5286
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 12:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgFJKkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 06:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgFJKkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 06:40:14 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA12C03E96B
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 03:40:14 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r7so1707115wro.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qLlLk3V5ioxa5pJGyX00HwHM24UNk9AnRXpgPCWgkA8=;
        b=RXIiKLojET+GmBfIBlY18PfL9PfblafAEJZFIj0V/UCtrbXGvAIeAWG75PsJ8XUeLK
         4hlKNrP/u/8Ze+Ve8R39WNmgTuzD85NMze4bdw4Rg6KkUbDas1CYGfVBFgcqtcjNKRXP
         O7hrA170mwgCTnHULnrgD0mUNuRr1SDX7Y6rg3r52SiAxXcMeQqP927XgVhMupaZkU5V
         XLMxYsIrCLCZpQnkYemssLNbmZLtkWdQWZqwBKkVzcvEcP8l/1Vy+W+tau7NG6ZpWZ7U
         DdaA3MV/w0oKcFFwCah93KF8MWJlzHmJ0KBANYSGdeL8mTy2xAIFyJzBR55FDRiq4CuD
         v51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qLlLk3V5ioxa5pJGyX00HwHM24UNk9AnRXpgPCWgkA8=;
        b=NrPqivjBSCtL0tLNhNIC8+UUgO5+S7EzXiZX+ABML99lBts3o6Y0gE73E+WGp4o4b4
         iMdCEe0YKeujo5RR7LWrErr8fhDUUgg83TUB2RKwTAitiQ7+EdS/h27B2vRTu5iAv1HV
         u5iOPScxetz3Vp0IZWcGb9MYW4taialGO/zAOl2a1GX0BkIiV/s7OYKpL1C4vYAlcxyX
         V+/i2rzhz96xwobw1tRN2tzLq7Fhcn8Dyl3O3GdKD/hvwjBMMBXqMOlb4jH0JML2BDiM
         mZuj4FoDZgI3gyWlgLLIeOPl6s+IL07tHptFMs13nOstr+64NdFvaURbX7OWXEKZ2DeG
         3kRg==
X-Gm-Message-State: AOAM5316DwP6cSn/2klFwfsw3uHwJB9ECfu8vIpk7Na8nWgzExWQqfyw
        I8wQP/eNzfw2lLXdOhhIk8ECFA==
X-Google-Smtp-Source: ABdhPJxMnh6Q+iHJ/ITsv+IujCAUdhqJPGacWEISNqEsOna4LjK7wdSM4T9bxHxEfageYkx5/m3ygA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr2919542wrt.322.1591785611772;
        Wed, 10 Jun 2020 03:40:11 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id q4sm6201705wma.47.2020.06.10.03.40.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 03:40:11 -0700 (PDT)
Subject: Re: [PATCH 3/5] soundwire: qcom: add v1.5.1 compatible
To:     Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>
Cc:     alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-4-jonathan@marek.ca>
 <20200609052619.GB1084979@vkoul-mobl>
 <53817047-f916-b042-70b7-66aa875a9ade@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a8fddf74-9f95-9bc8-6e4f-5fb654c6a43c@linaro.org>
Date:   Wed, 10 Jun 2020 11:40:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53817047-f916-b042-70b7-66aa875a9ade@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/06/2020 12:17, Jonathan Marek wrote:
> On 6/9/20 1:26 AM, Vinod Koul wrote:
>> On 08-06-20, 16:43, Jonathan Marek wrote:
>>> Add a compatible string for HW version v1.5.1 on sm8250 SoCs.
>>
>> Please document this new compatible
>>
> 
> Does it really need to be documented? The documentation already says the 
> compatible should be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>". It gives 
> "qcom,soundwire-v1.5.0" as an example, which is not actually a supported 
> compatible, so my understanding is we don't need to update the list of 
> examples with every possible compatible.

checkpatch should have reported about this, and in future once we 
convert to yaml and list the compatible strings then dt_binding_check 
would fail too. So there is no harm in adding an additional compatible 
string for this new entry.


--srini
