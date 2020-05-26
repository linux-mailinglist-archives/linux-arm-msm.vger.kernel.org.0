Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA40E1E33B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 01:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgEZXaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 19:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgEZXaN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 19:30:13 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335A7C03E96D
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 16:30:13 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f189so22613801qkd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 16:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=muYolnYZmufgcHzMuhz5medXrKFllBeZIV0QKir0gLA=;
        b=s75QVjRxg1JImvQV+OJMPp/TgNXfTCYbs0KzsaS+JyUdWLHTSXt07wIK/DyhXy/4Fw
         ngwEw8trvE9ofv4Ss5sJt27CBrf6KW2qUPLwCI/JMw1oVicsBcyjtwRhnDWvtOussLU7
         l3R5cDpM58uiYnvcA9/wD64TafQp+MRCs/7EsFnYX9wKOGZvNQg+IvyyF/TNz3MCCYVq
         wF0QPWYk4znAPrklYVi6kQTnaQfF5hbZkgWHLvBuyHKOOoHlnEe9LBlrN83sDLtZGmS+
         lvTCicmEhZm8xyceiNENWlVhycsgTzO5q9yVOIrDW3ZvhEDeVzmsqQy4TaT6tEy/qtaH
         B26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=muYolnYZmufgcHzMuhz5medXrKFllBeZIV0QKir0gLA=;
        b=dYVwbzcsS9lDKKKZyVy9Tq0l6gqAo6FusIyALzZB5J8MxWJQsiH2zQcxQjO6KKw3Tw
         8AMBhsVnucpnx66y9QEzEWI1Z0MD7t2In60eKPM/RiMdRJ2r5hHaO6gqs20J7L3J2TzH
         46+LyLfYZr1+pO5H76mxrJpApqNQChY27tXxlq3gzX4e+7OQ5M14lzzdaWhNAy2XvxNk
         sdwOngfuxcVLwkRjfd1HJvbHImcO4YDg3CRVUGga9s1aAZ+vt0wRbP+e34pNXM9fM+fP
         ymdDJpkdiimHIv9Smkvps8stdaCXjqq+UYpnfgri4fh1jac6zbe/M7hKdzmGuP9Yb5yw
         TsCw==
X-Gm-Message-State: AOAM533qgEYJPYIQrZGFJrxZa3Y4OOExc7ma+M7iBmKJhiNWX8PeL59o
        O8/ZYNPEgxrHas/3o1QrIqocPw==
X-Google-Smtp-Source: ABdhPJwz3LWDpaFCddkPLoA/lLv2hAE0TJMt/S/YcrFyegb0aLfFp9jP+WvWm8sKW3V0K3dLSRV2FQ==
X-Received: by 2002:a37:684:: with SMTP id 126mr1338066qkg.486.1590535812308;
        Tue, 26 May 2020 16:30:12 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v1sm906851qkb.19.2020.05.26.16.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 16:30:11 -0700 (PDT)
Subject: Re: [PATCH 01/10] clk: qcom: clk-alpha-pll: remove unused/incorrect
 PLL_CAL_VAL
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-2-jonathan@marek.ca>
 <159053527806.88029.14584721858766224777@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <86a7c49f-44ea-11d3-2983-8443ad7ec309@marek.ca>
Date:   Tue, 26 May 2020 19:30:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <159053527806.88029.14584721858766224777@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/26/20 7:21 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-05-24 14:06:02)
>> 0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
> 
> Any fixes tag?
> 

This doesn't fix anything (its unused as the commit message says), does 
that still qualify for a fixes tag?
