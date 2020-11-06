Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AFD2A8DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 04:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgKFD6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 22:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgKFD6h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 22:58:37 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9292BC0613CF;
        Thu,  5 Nov 2020 19:58:35 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id z3so98094pfz.6;
        Thu, 05 Nov 2020 19:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=72WK5gdLfg+8RgepOagG7LllxF4BWHujAXVduDm7r+4=;
        b=SAA4dD3ObW/Kw83JMEzBKEwOFbgINDIl/QDPZnDGEzT9D1MQqtKgLblLF4gon3H6XI
         e/H8Ricdau5eNPtdBuEZyLdbIfCSXJjcSAWRo8jJmqQl+3eXGlwTZo4pYUf9PdZrtrs8
         tnvl6bGch2awvWymlM8d51ZMaRs7dPKya07HVre4kb3BietyhriyNTMJvQZpo3R8UH0i
         +g9Iya/Ua6NJVu5TjXNMXfcSG9CeecnHaE3kKdh/uiWJY1t3hz90Nj+eykhP0viAv/xI
         6vrbAhd8qt3cREWgij3AXggvFfOxzl2/w7DEtDcbAR48QMxndi9m47EtNWM5usiAwmRx
         74RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=72WK5gdLfg+8RgepOagG7LllxF4BWHujAXVduDm7r+4=;
        b=EZEjMZPuNUSBbM2K3o9B936FL/iwpdFktli0GhjJvXqMCllRv9EBPAIfXq8kCElKUO
         QjXtCtN6beAFzfMpR5YbfTKi246dAl1BPREkZDhICdnSzjFmOUM7fKUtElEhh7PzitVw
         JXdZaZcnmzXP5H0DDtNDd1LZ4zcIwUpxXJUkhl2p7qIdn2C1RupoxJJGrkvMxHjWG00w
         jtwQ/Aa7OEwH34F0/T3mF5krX5D0vKKywGPGaHzwkeYz6hv8N7BZBiv8PzMiRY8RNIX0
         EIgQmZjJQi8q9lXMY77K4FYlhV1jAeRYx+nNIfE8fQx76c5SjfqkLZJ8SR+YJsYiZNWJ
         98ow==
X-Gm-Message-State: AOAM533yzzLM7BWDwCDXqnTIBf0bhrnNSiHmtHEZOBDlFoXbbvwZjRAO
        7DgVBMz85nsoFHkxGZF12AE=
X-Google-Smtp-Source: ABdhPJw197tx4uU6/FgGT5umqJUIokir+xifWVT5zLhPEW3lgXFo7oLNXg+7DZ0uhJVTM6h7GHjN6w==
X-Received: by 2002:a63:4006:: with SMTP id n6mr42376pga.171.1604635114907;
        Thu, 05 Nov 2020 19:58:34 -0800 (PST)
Received: from [10.230.1.248] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id s6sm129495pfh.9.2020.11.05.19.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 19:58:33 -0800 (PST)
To:     Prasad Sodagudi <psodagud@codeaurora.org>, rostedt@goodmis.org,
        mingo@redhat.com, keescook@chromium.org, catalin.marinas@arm.com,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, ccross@android.com,
        jbaron@akamai.com, jim.cromie@gmail.com, joe@perches.com,
        joel@joelfernandes.org
References: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2] Register read and writes tracing
Message-ID: <a9de1928-d709-896f-ffa6-febc5d6d34c6@gmail.com>
Date:   Thu, 5 Nov 2020 19:58:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/5/2020 6:56 PM, Prasad Sodagudi wrote:
> This patch series adds register read/write event tracing
> support. Qualcomm team tried upstreaming the register
> trace buffer solution - [1] with pstore and dynamic debug
> feature but that patch series didn't merge. I have followed
> Steve suggestion from -[2] and used tracepoint_enabled() API.
> 
> [1] - https://patchwork.kernel.org/project/linux-arm-msm/cover/cover.1536430404.git.saiprakash.ranjan@codeaurora.org/
> [2] - https://lore.kernel.org/lkml/20200928105501.7e29df65@oasis.local.home/ 
> 
> Qualcomm teams uses these logs for debugging various issues
> in the product life cycle and hopping that this logging
> would help other silicon vendors as this is generic approach.

There is not anything arm64 specific here other than where you have
hooked into the low-level I/O accessors, you could consider adding this
as a generic facility to other architectures as well.

Also, have you looked at making mmiotrace less x86 specific and more
generic?
-- 
Florian
