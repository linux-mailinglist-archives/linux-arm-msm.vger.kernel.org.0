Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A3648AA71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 10:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237125AbiAKJZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 04:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237091AbiAKJZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 04:25:21 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89737C061748
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 01:25:20 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j11so54000357lfg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 01:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y8mwq/91wKR30uOg3+FsI/MTSBZvRcJrn+c6MHJw1YI=;
        b=EnShUE9NSE50KzW659GLBONwodhP7P5Rdwsc/b+JyCl7eScuxmTRJ4kLmLvHV3xdEU
         zVbDDA61j/Hr0RaoTAc0vAcAcZ38+U1dfibNxdk4rGG3yEd5X0dnwJ2JkVOjQQhicB9h
         iIBhG8k5Lq8hQtT81rymDsMRKLH6TkUtIsevClsUR1Lmrnk1akv4C9PNL0p38Ko7JnNJ
         VPtt8jkhCNHTucJXwM6/Iawr/oKP/dQiVbHq319wj82XGoRd7xlO90HDdaoLLUk0wLxa
         rs/4fpXTJruzSvmIvxIhs5tibBTbKzY4WkFgx3MZfhDK65w3T/kvM3syCGZzoGiTYqgV
         xutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y8mwq/91wKR30uOg3+FsI/MTSBZvRcJrn+c6MHJw1YI=;
        b=UGxQZrFeZY8cy2UBUpg0IDWw9Te6gSpmC7WXf0tPjBCzi23WCVBN75C9tFAmnmZbOE
         BFGGJJpOGhoBa3eyDTWFugu8B5MaubZAAG2BsnFCQ8VxOKutpXR0wr+SSAreyLECCM6l
         O0LobyFBJmNH2XfJqCeH7guKkru5LEkIdXiaCRMdzKYaRk+1xtXw9xkW88kNUsKUHGJ0
         gXzIgsqvG0si928LKJw6I7QjSq+ThDOQzJyk73f4jn1b9PGQaiBKdYZFT+KqNxIF/+Ry
         Y+O59qS4a64SAuBwMr/mkVeVK3R11ireiQmfSGWT64yIfkvYBL+Z5lXwQa6mZQkAm4Gc
         mHnQ==
X-Gm-Message-State: AOAM532vEp37XxFq+CE6yobGv2GBSCDBYRe45kgY0FU9NkixZOmNVSIX
        H9Ln9dEqLlahCphDTknuf+5tfw==
X-Google-Smtp-Source: ABdhPJzbbt03hC5JHFQCN3xoXCSkCExpSRmhV0MK/iIxT3xmLrp0hbKOc3el+1npZ+njNmYfug6eJQ==
X-Received: by 2002:a05:6512:448:: with SMTP id y8mr137177lfk.652.1641893118929;
        Tue, 11 Jan 2022 01:25:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u11sm1277914lfs.21.2022.01.11.01.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 01:25:18 -0800 (PST)
Message-ID: <b889b926-425b-dfe7-3a0d-edf2ef947ebb@linaro.org>
Date:   Tue, 11 Jan 2022 12:25:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v10 0/5] group dp driver related patches into one series
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2022 23:55, Kuogee Hsieh wrote:
> Group below 5 dp driver related patches into one series.

Could you please rebase this on top of msm-next?

> 
> Kuogee Hsieh (5):
>    drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read
>      failed

This patch is already a part of the tree.

>    drm/msm/dp: do not initialize phy until plugin interrupt received
>    drm/msm/dp:  populate connector of struct  dp_panel

This one does not apply because of your dp-bridge patch. The conflict is 
more or less obvious to fix, but it would be nice to have the proper 
version from you.

>    drm/msm/dp: add support of tps4 (training pattern 4) for HBR3
>    drm/msm/dp: stop link training after link training 2 failed
> 
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  12 ++---
>   drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 100 ++++++++++++++++--------------------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   8 +--
>   drivers/gpu/drm/msm/dp/dp_display.c |  98 ++++++++++++++++++++++++-----------
>   drivers/gpu/drm/msm/dp/dp_link.c    |  19 +++++--
>   6 files changed, 140 insertions(+), 99 deletions(-)
> 


-- 
With best wishes
Dmitry
