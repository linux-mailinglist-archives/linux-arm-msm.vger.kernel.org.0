Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0145B45D975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 12:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238019AbhKYLrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 06:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235590AbhKYLo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 06:44:59 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D34C06175E
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 03:39:08 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bi37so15589499lfb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QQHaD9Txbs+YqnVFTQVUah9dRuHXv52COwlrZP0qSXA=;
        b=Q9MZsBn9M6sfe4zNLAumUeRG31c3T58WM1qgrRkMxZvPi0HVLMHruCd+DUVxA2YRMn
         A1c7q6QRGSvPLhVNUr+zLWFJ263bLNEYVeSwI2p1p8EjDixpgR3zbmaS02sIL6q6FAP9
         Ns3qFlU6iAlhPcDSrqpJmneiqw+wsbfud3qleFDBGVfTVX+cQfK5cx9J4/GxspqJMFLt
         RVG8R1ySmvyy3LRTlLHajNm4jIoBQher3c5JOJt1wTGWS1W7qWbdgF8ojX86sbO1jXF0
         +O081hT3yldBAavYUtzp5WCwGjUW/g+jqlh49G8ADgFf5b++U3nQmzIILHhj/GjH8gDW
         +zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QQHaD9Txbs+YqnVFTQVUah9dRuHXv52COwlrZP0qSXA=;
        b=QU7UtW6KCZ5H9OtDjXFS/7cv4sIJdwOXpz6eumvfyE4eiHn8nGYljkbRDKgQu34zFE
         b+OG9Bfr7JhuAxzyWxVqAvvtJ8RfIgX17nPd7LpZz3Db5sbBdknxKwIniLPV9BqG8CIC
         om+D/05zWv6qkRfpiKmwzKvX1zamCgVjpNPnIuR3DiVoIXIxwCIkjteDIB/I2ODlnD1E
         21czw5i2tnCLqQADBkXp4Hafa8NxQ921Fq+mgWxK6FHXUibknnkc48mqEbs1CgNj5CDQ
         loUKdeMzQOi+9cfNBe6fd0yW9CdkCtEYQm3/oEtNuU+FufuR4p2JtZwXysu0FC4CzO/g
         tDvA==
X-Gm-Message-State: AOAM530rgQuWjNwSSFhrHc05u9GtSDGGKE+IqS9ENHSSdsuQXsQxVF7O
        CDomuuWpUv1r2SfTxEMf1ORgpg==
X-Google-Smtp-Source: ABdhPJzlG30kK4JbRdw/TaSOXXDqNQj9vIewf6GaWsy2uQD/hxhmzBejbbNG+maY/xnuolKOKq+1qw==
X-Received: by 2002:ac2:4aca:: with SMTP id m10mr23035513lfp.437.1637840346426;
        Thu, 25 Nov 2021 03:39:06 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h20sm241601lfv.248.2021.11.25.03.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 03:39:06 -0800 (PST)
Subject: Re: [PATCH v4 0/6] add fixes to pass DP Link Layer compliance test
 cases
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <1628699407-28358-1-git-send-email-khsieh@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <efe700b3-9e08-10fa-405f-bc608f617407@linaro.org>
Date:   Thu, 25 Nov 2021 14:39:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1628699407-28358-1-git-send-email-khsieh@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/08/2021 19:30, Kuogee Hsieh wrote:
> drm/msm/dp: add fixes to pass DP Link Layer compliance test cases
> 
> Kuogee Hsieh (6):
>    drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
>    drm/msm/dp: reduce link rate if failed at link training 1
>    drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
>    drm/msm/dp: replug event is converted into an unplug followed by an
>      plug events
>    drm/msm/dp: return correct edid checksum after corrupted edid checksum
>      read
>    drm/msm/dp: do not end dp link training until video is ready
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c     |   3 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++++++-------------
>   drivers/gpu/drm/msm/dp/dp_display.c |  14 ++--
>   drivers/gpu/drm/msm/dp/dp_panel.c   |   9 ++-
>   4 files changed, 102 insertions(+), 61 deletions(-)

Previous version of this patchset is already merged. If there are any 
changes on top of it, please submit the incremental diff/fixup.


-- 
With best wishes
Dmitry
