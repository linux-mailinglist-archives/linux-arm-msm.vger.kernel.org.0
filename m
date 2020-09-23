Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F00275D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIWQZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgIWQZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:25:33 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39645C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:25:33 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id c2so218157qkf.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bod+KA++P85pU20jfJ5vwCcsVE27X5/8ush82A6fa28=;
        b=LDMkD7Dksx6sEh5TMPKFRCduNXALi8F1ujxrEamhcNMqTf2RdkFpFlLcRLV68MogME
         b09UtnzuVu2+zzitJFB0HLp4Uub8hrMjkqafMbSNjCqq0f1POJvtQQNJvBmHqj2G5h5B
         7Oj5aG4en1W4p+Km7wPq5M3HL+oq/kcUOLFzi+aTvULnVDLWg7q2Grr9hU+ySWxdM16x
         zWHS2+WPHCLsoGF/nv4P7eI/meB5Uww52K24p0VpzcH3pFFSLZ2+LdlsSThcU4a83KW4
         mMQIn5R1HC3lAunoL0gL3qRJVYwzMjcObXhjUKXpHQ5bAmN5GuUrrRtVojrrmUc2OQ4r
         xH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bod+KA++P85pU20jfJ5vwCcsVE27X5/8ush82A6fa28=;
        b=asXVKStXobANTFBbyGId3lyo5n7wgGJy/5dbb7C+hdtDEVndv0UIMaO2Oym2UTOgz6
         larr+JLnHREG9tYaNuj9Mqvhq4jp6EIVbWN3O5RQKI0AiuePqH7u+u216XEQ7tIlMXVP
         g0x/WguPiVKVq5mYfpxQjpeIgYcbP4twCPKgC/xvxPoUMJQIuc8YhAamuOGEVz8+Fb7R
         b/jc95BgZcG0I2JkMcLiQb3u0klOKxu97mpXaZlXIKxsxVfHGBU5GZ5Ets9bvHipjWEf
         RcxgQppx9NBSXDAfm9U8zTj8YpDE+fAZlzUMg1H32ciiqgq8/ac1CVEbRMxEWpPNb+vw
         6pqw==
X-Gm-Message-State: AOAM5316OrQ7gJaO0wBqAgY1Wtmb3t9/qa7I3RszNVSI5fiHo6bnCPv7
        MWaYR/9xNyVR3+C1cRiBWsAuxQ==
X-Google-Smtp-Source: ABdhPJw6groUotwQ8vbhdy/IR1sMD/34/axJnsXXheLrwgCvcSStxI4/PuxfuCq+USg3V9Z5KE7fRw==
X-Received: by 2002:a37:9d86:: with SMTP id g128mr653358qke.26.1600878332126;
        Wed, 23 Sep 2020 09:25:32 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 25sm313336qks.41.2020.09.23.09.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:25:31 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] clk: qcom: Add display clock controller driver for
 SM8150
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200911153412.21672-1-jonathan@marek.ca>
 <20200911153412.21672-7-jonathan@marek.ca>
 <160080149549.310579.17453759593211612997@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <3370cff3-9296-74fc-8e7d-ff93c3978351@marek.ca>
Date:   Wed, 23 Sep 2020 12:24:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160080149549.310579.17453759593211612997@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/22/20 3:04 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-11 08:34:06)
>> Add support for the display clock controller found on SM8150
>> based devices. This would allow display drivers to probe and
>> control their clocks.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/clk/qcom/Kconfig         |    9 +
>>   drivers/clk/qcom/Makefile        |    1 +
>>   drivers/clk/qcom/dispcc-sm8150.c | 1152 ++++++++++++++++++++++++++++++
>>   3 files changed, 1162 insertions(+)
>>   create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
> 
> If the bindings are the same for these two drivers I wonder if there is
> anything different between the two. Maybe the two drivers can be one
> driver?
> 

Possibly, the biggest difference seems to be the plls (trion vs lucid, 
different config), which could be resolved in the probe() function. If 
you think combining the drivers is the right thing to do then I can do that.
