Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF6122DF27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 14:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGZMsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 08:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGZMsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 08:48:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E98C0619D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 05:48:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x5so11146372wmi.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ls/bxGHWKOsSWND3CuCCnbnDhwt7VUsal24v9OVekgM=;
        b=HUxu9+WbE2jY14ERvhESXBh6vufUqFLI7Ymt8EB0lBqwQosBtDDd7wITlrAmLfK71W
         Lj9/7AiC7pcGnuSbRSkUJciFd86yGUFvq0T9awfMxJsCfDxJo9ecS8ChNiFMcgq4sm4a
         vcfkc6NQjH6qEhgJ8CRbczHNSN20Iep5sx1vxSW9kzVCbWuGzgKR0usHGntUGnjBwyV+
         Or6tvqVFtDAiqgl57mgUUkhaHIxg/VR4CH6A76DX7iKFonjltFLxKtK+jThAAzGAR5fG
         O4LTHPugRwxtB+ujQz239Aq1EnUk3Pf3cgUrG1ReoLbM7OUuTU1MztgTHKF5NEkCCasD
         Buhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ls/bxGHWKOsSWND3CuCCnbnDhwt7VUsal24v9OVekgM=;
        b=aw/nVPcyxS+A5+h1aOymMFz9+4VbXMdDKorXS+9Cnl5/5jgtgnpM/kGnr5qoufVVmB
         kjlvtemOa+Yq8f5uZZFflMuqYLh88vA4Hp3k7MsS6z5dDVheHP5cdvWdnuGcNxfHrfO4
         o6Wy4o9q3awALCLns92Z1hDgtRBtAtgz7HaohDekgqDsE+10uY1AftnwgsOADUZiDkBX
         RNLLA4QjkwtrRKgeCCnC22CVQKdEUcP0uxhUO5untsN+SV2/wukkpIU3QON5MycY8KE/
         qwstbemG9JcKrkiLJVm6LR81w8hd2Uw43ZidQET8Jh0UJ17ONoFq/mN3GT3OXASPu/I6
         jF6A==
X-Gm-Message-State: AOAM532309SOuXnrO8Hunr1rVHanw0C3hX3xn0I6yyYT/VA8FuvATFhf
        Gnzx7A2laEDU3LDA0H3zO1UQgw==
X-Google-Smtp-Source: ABdhPJwyLUi8eTNwe8h23tZ30h5NPEBzjshMo97UQvtYCZS6mAkwfjUFNPDwjeCU2HfvehL0+M/x0g==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr14008434wml.181.1595767678843;
        Sun, 26 Jul 2020 05:47:58 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id z12sm8232338wrp.20.2020.07.26.05.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 05:47:58 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] media: venus: core: Add support for opp
 tables/perf voting
To:     Rajendra Nayak <rnayak@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-4-git-send-email-rnayak@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <24975bc8-58ed-4633-8f67-ed85f67fc497@linaro.org>
Date:   Sun, 26 Jul 2020 15:47:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595503612-2901-4-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On 7/23/20 2:26 PM, Rajendra Nayak wrote:
> Add support to add OPP tables and perf voting on the OPP powerdomain.
> This is needed so venus votes on the corresponding performance state
> for the OPP powerdomain along with setting the core clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.c       |  2 +
>  drivers/media/platform/qcom/venus/core.h       |  5 ++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 92 ++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 7 deletions(-)

Once we have a fix in opp-table (patch 4/5) to avoid -ERANGE from
dev_pm_opp_set_rate:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

<cut>

-- 
regards,
Stan
