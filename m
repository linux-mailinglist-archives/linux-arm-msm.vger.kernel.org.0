Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88474333C7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 13:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbhCJMTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 07:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhCJMTt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 07:19:49 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D42CC061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 04:19:49 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e10so23059221wro.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Thwrg3qqoUAhwxM+WcU2u+TiYXJHE8JDjJsGatqd/Y=;
        b=P9VknKEPcyVqWWZufkGPkL7KVSXa9RkQyQkPYODUoIxqRJr90IqY6fiSolH8U3aiWv
         93JrhtgP4aRcezHmCi/YEeCpNg/2qq8Htgn72XxVRzoQIuy5JLGiNLEpwbehqN5NtV9x
         8WEEvuVyRkSrBzZCRjPqwC4cCElK1sEkpwVGSKL6iszB+SvOHyLXRpvlPBg3flwuHEKu
         +fcDcHvQcHiVoPaQ8L4eQmbQ/XKi1bKnqV3jW/2gv0gXqjfEDOvYsJ55ihjlmIe+NQcF
         1bpbpL+j+mI1HQ9dQXY1/yUhJgeqaPgqIe+iC0EuBEqZ7SpCj1oFA0iSZQHwYQ/mj8/t
         4riA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Thwrg3qqoUAhwxM+WcU2u+TiYXJHE8JDjJsGatqd/Y=;
        b=BygeDBaEvn1Eme/qTIQpUrk0snnZC2H2g/MpKrjjVzQ+VuyII/V8fIRb02rYAP8HoX
         tr6lHoxfap5orYxPB8Bl75ebFbCbsYaWMYFZqvxSQm4lXc+BnoAuiyNXQdFzGg8Mtii7
         y1OEhx66ALOe5P6IVANJ7lhYSbGZQWHKdivOm1FhsSZXvVgewHqI6F7EbcfA7KNpkDgJ
         Y/vEJU07QwhcfS4iaD8VvSx0SKUJpHKuydEh/AXkywG3tvFkeTxVOpWsb+x7l9x2R0e6
         OLCGmulgOI5NsStQjNTmmc3effcJWOUxvfIwWCbIKfNC1WJRP0z0YVXXdB7cJ6uHE6s+
         5VEA==
X-Gm-Message-State: AOAM532W9BCd6QkQ4pIF7vB0Bq5pstgN5q7hkbNy9fNBbDxuKQVPQ1K0
        n/4tuL3yaKpTZvFns2GABFHlrgyDIXcrIA==
X-Google-Smtp-Source: ABdhPJy2wS4+o8phanKVOn3lZq7ICLobsnju1ml3279qVLpDMTBVRF+ouyMr00zPdGc/SISKLUPpYA==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr3253733wrq.425.1615378787498;
        Wed, 10 Mar 2021 04:19:47 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8018:efa9:4421:9140? ([2a01:e34:ed2f:f020:8018:efa9:4421:9140])
        by smtp.googlemail.com with ESMTPSA id r11sm30479183wrm.26.2021.03.10.04.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 04:19:47 -0800 (PST)
Subject: Re: [PATCH v10 0/8] Add support for ipq8064 tsens
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Amit Kucheria <amitk@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>
References: <20210217194011.22649-1-ansuelsmth@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f0ab094e-440d-993c-6618-bf80fd05d484@linaro.org>
Date:   Wed, 10 Mar 2021 13:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217194011.22649-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Ansuel,

On 17/02/2021 20:40, Ansuel Smith wrote:
> This patchset convert msm8960 to reg_filed, use int_common instead 
> of a custom function and fix wrong tsens get_temp function for msm8960.
> Ipq8064 SoCs tsens driver is based on 8960 tsens driver. Ipq8064 needs
> to be registered as a gcc child as the tsens regs on this platform are
> shared with the controller.
> This is based on work and code here
> https://git.linaro.org/people/amit.kucheria/kernel.git/log/?h=wrk3/tsens-8960-breakage

I don't have major concerns with the series except there is no comment
from the maintainer / reviewer of the sensor.

Given it is based on Amit's work, I can assume they are correct.

I added Thara in Cc hoping she has time to review the changes. If nobody
complains with the series, I'll merge them in the next days

Thanks

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
