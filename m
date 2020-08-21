Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5965C24D333
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 12:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbgHUKv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 06:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgHUKvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 06:51:15 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCB6C061387
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 03:51:14 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 88so1523723wrh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zHmahM4WlAU5TkrnZ9qUadrG7WkBXC8LyNKGjyFPPtA=;
        b=JZlV/bMFi3bja47qPW846zX9+5ZcUjXqZEUqi6aDKdZcnXdbDYLeAeEQt/MAPXm/ye
         /t8CTNSmIJdEkA1GQEHfXVdG1AvitZZtz7yp9N2WRiYFeQV365HDFCP+G4UT+rfOiVLo
         kJpE3L0T1OH8XvXmMrBPc/6NOlO4N0ENRAbC3FLerLvK6q5J5V/yBYxc/SdK36MeeeYn
         C0Z7tuEzIcpSZmeIerWrbvrZrzFn9zvHOFEFKUXQCC83mjFLLpILW+/Qe50m+GsrJr5a
         +8kv4f+wz5/uf3rMTnBOSG2l2+MVT4P5qJ9nM29Ti2uLcVcywA1ZHEjx8SZ24Mso1S7M
         654A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zHmahM4WlAU5TkrnZ9qUadrG7WkBXC8LyNKGjyFPPtA=;
        b=o+0sF5mM+vzAltxtH+aApQGgWZiAn9uMWQFIaIX14KgAlHvflHxGIrxbSiLgLsekqg
         /zr+aKyDbTBi8fAwmb84tpMKPPNeWgMdLit6+/0krq/zKRYvB+Ho8GgDgj0kdLeYltp8
         B2PQumIE8IXgUeCWASdgPN70A9Wt0Hx5Th3UAi7UW+WepXmKM5BbSh3Q69K1V4KyDlOz
         7Qi3twj3r/Gr7/97zbgdlykoAM+q3XIVKEVDBoj2A/IMeGDaTutCgVrepLJ71xsj6ND7
         JCPe+9jQgiTMpci3ZiD4n0YWk4OaYorw+CNU/beByA0OxPgHNiGZKeR/aSR39yhZz1zd
         aJyQ==
X-Gm-Message-State: AOAM532xsgzK4/uhodRL1M9B2/oV54R6A6xM78s19lGn3EuL4eX11s5w
        GDPbjwXEztqX6pb9nujpHKU0RA==
X-Google-Smtp-Source: ABdhPJzmKaDTcZfXCKyhcewuR1bQYiG2AundNu1zlG5E8k4jdRUOni8PGM5/AKGLL6Ql07oNTh7RJg==
X-Received: by 2002:a5d:688d:: with SMTP id h13mr472373wru.176.1598007073221;
        Fri, 21 Aug 2020 03:51:13 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id d11sm3363460wrw.77.2020.08.21.03.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 03:51:12 -0700 (PDT)
Subject: Re: [PATCH v5 0/3] Venus dynamic debug
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <eb96ce39-4a2e-aa94-be69-6018f4c7da33@linaro.org>
Date:   Fri, 21 Aug 2020 13:51:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

If no objections I'm going to queue 1/3 and 3/3 for v5.10. 2/3 will be
postponed because of Stephen's comment.

On 7/30/20 12:53 PM, Stanimir Varbanov wrote:
> Hello,
> 
> Changes in v5:
>  * 1/3 - dropped dev_warn when set FW debug level - Greg KH
>  * 3/3 - dropped pr_debug, and now group levels by prefix in dev_dbg
> 
> v4 can be fount at [1].
> 
> regards,
> Stan
> 
> [1] https://www.spinics.net/lists/kernel/msg3550106.html
> 
> Stanimir Varbanov (3):
>   venus: Add debugfs interface to set firmware log level
>   venus: Add a debugfs file for SSR trigger
>   venus: Make debug infrastructure more flexible
> 
>  drivers/media/platform/qcom/venus/Makefile    |  2 +-
>  drivers/media/platform/qcom/venus/core.c      |  3 ++
>  drivers/media/platform/qcom/venus/core.h      |  8 +++
>  drivers/media/platform/qcom/venus/dbgfs.c     | 51 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/dbgfs.h     | 12 +++++
>  drivers/media/platform/qcom/venus/helpers.c   |  2 +-
>  drivers/media/platform/qcom/venus/hfi_msgs.c  | 18 +++----
>  drivers/media/platform/qcom/venus/hfi_venus.c | 10 ++--
>  .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
>  drivers/media/platform/qcom/venus/vdec.c      |  6 +--
>  10 files changed, 96 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
>  create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h
> 

-- 
regards,
Stan
