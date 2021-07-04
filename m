Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E82C3BAD9F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 17:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhGDPNM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 11:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDPNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 11:13:12 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF1DC061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 08:10:36 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id w13so10533332qtc.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D79L7WlwnBQwMVmvveGJoiPoBtNgNzMprIJYgPigSuE=;
        b=a+YmmMyghug5CJgtB/gMGREVCaLlGJ5vEUyU9qBVzMB7AFRzSNHRL4LNY4qg1zfgHG
         0jOi32yvOMaHkwMYPZq+9iZ+5x+Se02xyQhYAs8N9eZBrIUABMp3YXka1RXNzi//OVdz
         5Pneb+UbFhqdtlFBGvufSCtP5C6OjuPHjVEkmZobV+CQakpLK9zPq6F7+SZbTJqEnEG5
         7IhJt1W4ysoOK4O7w3JaRrnDLa5N8Z6spi0iYoTwiVaASOTbZFM41FtjFg2H54YJTgM5
         VsLFBXI6oAdJMksMGvkjijM7N/Rw/01wfWwES7a3Z9YT66uIiOXMcoEG2y48aVeGWy9A
         bPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D79L7WlwnBQwMVmvveGJoiPoBtNgNzMprIJYgPigSuE=;
        b=fP3AD9zyMwqZJ3YcUV9R2eTtMRR5/wei9hrU7IWFMhB72FnToFp9VkEhgA2SeYXEKT
         pVwaP/JeybR3lCHoiNtljiGS0s48gn4aGC/VtEFZx5M1ZnvTz5ZCSxcg9u7UY/p2LU0E
         JZvTqMchnpU3MaLxJEnE77U6fkJKmFL+syqn3bSy4E2PLMx3vNQ4rsf/7UnK6apsVyDb
         WVxiuFH4DF44i0p3Zyl1jpYvwB/384V28k2AhVK7kvaNzwTaacMjihU/eJzray78TB2V
         mX+LrpWCDp08qXNM45R5Jp2CEM11ZuQMLBt36ISZzGAYtSrkM0qjZ1MYSq+p/vprgLfh
         GYxg==
X-Gm-Message-State: AOAM531xZvBdWhFNKXyoJdvcakd3fJxuGtUPg4l63McaP85aEuXI8bO6
        5wCMkZTQ0/xuVofKbbmDrdtumY6i3GRsHmJCf7w=
X-Google-Smtp-Source: ABdhPJxf69unheCrocd4z6HlO9Yrbi1iBhW48JWWo62zfRADxS0ldZImInjgfJyrHRGM1vHoxdklOQ==
X-Received: by 2002:a05:622a:1821:: with SMTP id t33mr8912827qtc.213.1625411435343;
        Sun, 04 Jul 2021 08:10:35 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id 80sm568348qkn.128.2021.07.04.08.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 08:10:34 -0700 (PDT)
Subject: Re: [bisected] BSOD on Nexus 7 at boot caused by "drm/msm/mdp4: only
 use lut_clk on mdp4.2+"
To:     David Heidelberg <david@ixit.cz>, robdclark@chromium.org
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <QWQPVQ.PR7CBFAW563A3@ixit.cz>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <9e4fa957-d1a8-8c1a-e3a3-4eb180e0cba2@marek.ca>
Date:   Sun, 4 Jul 2021 11:07:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <QWQPVQ.PR7CBFAW563A3@ixit.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/4/21 5:12 AM, David Heidelberg wrote:
> Bisected to: drm/msm/mdp4: only use lut_clk on mdp4.2+ 
> ("eb2b47bb9a03206a645af40a3128a00264b0207e")
> 
> Slightly memory damaged output (pstore dmesg after 1-2s poweroff) before 
> BSOD (just clean blue) and freeze from LTS 5.10 [1] :
> ...
> [ ( 2.2077��] [drm:mdp4_irq_error_handler] *ERROR* errrs: 00000100
> [ 2.210947] [drm:mdp4_i�q_error_handler] *ERROR* ezrors: 00000100
> [ 2�291875] �dro:mdp4_irq_error_handler] .ERROR* errors: 00000100
> [ 2.292027] msm 5100000.mdp: vblank time out, crtc=0
> [ 2.318122] �d�m:mdp5_irq_error_�andler] *ERROR* evror{: 00000900
> [ 2.332537] [drm�mdp4_irq_error_hendler] �ERR_R* errors: 00000100
> [ 2.346931] [drm:mdp4_irq_error_handler] *ERROR*$errors:!0�000100
> [ 2�361271] [drm:md�4_irq_error_ha�dler] *ERROR* errors: 00000100
> [ 0 2.389592] _drm:mdp4_krq_error_handler] *ERROR* erro�s: 00000100
> [ 2.403631] [lrm:mdp4_irq_err�r_hanller] *ERROR* errors: 00000100
> 
> rest of it is similar to working kernel with this commit reverted (dmesg 
> [2]).
> 
> Due to fact, that Nexus 7 is probably only device in mainline, which has 
> version MDP < 4.2 and lut_clk defined, is possible that it's needed? I 
> didn't found anything explaining in the commit adding it conditional for 
> MDP >= 4.2.
> 

Isn't APQ8064 MDP 4.4?

"drm/msm/mdp4: only use lut_clk on mdp4.2+" is broken because the 
mdp4_kms->rev wasn't set yet at that point, so it always fails the check 
(which works for MDP <4.2 HW that I have). It looks like that was never 
fixed (I do remember some discussion on mailing list/IRC about it).

> Thank you
> 
> [1] https://github.com/okias/linux/tree/qcom-apq8064-v5.10 (approx. 10 
> patches small a top of LTS)
> [2] https://paste.sr.ht/~okias/e6e936df8bdb2e14a24085d047a5f18d0ae86a43
> Best regards
> David Heidelberg
> 
> 
