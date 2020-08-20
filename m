Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F3024AF27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 08:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgHTGTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 02:19:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64596 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgHTGTM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 02:19:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597904351; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1Tw/sLiDck9pi6k/ICBYzHQlwO363+orOwakPWPDaPE=;
 b=Vd6WnZhH3N+rcBtLmHS1gzjNIxKK8jOnjOFVxEz4cDvHFL0Y5CXUHaUbKsMJc61t0qjevJWl
 m+Aiz1wHbEegP/Ff7ksv9vovHnuyGPhAGEkK0WqtNNcJxgO3HfoFl23qfjlWnJ0o0DUH9Sen
 p62TQm/QFmKy4q/jdV7d/hDs4mQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f3e15dece76f1f961940235 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 Aug 2020 06:19:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F71FC433C6; Thu, 20 Aug 2020 06:19:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34332C433CA;
        Thu, 20 Aug 2020 06:19:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Aug 2020 11:49:09 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle
 tracepoints for rpmh"
In-Reply-To: <1597831670-17401-2-git-send-email-mkshah@codeaurora.org>
References: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org>
 <1597831670-17401-2-git-send-email-mkshah@codeaurora.org>
Message-ID: <8456a8006c0c165bb33dc34219eb7e5e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-19 15:37, Maulik Shah wrote:
> This change was done based on an test results of unmerged series of
> adding RSC power domain and using .power_off callback of genpd to
> invoke rpmh_flush().
> 
>      Call trace:
>       dump_backtrace+0x0/0x174
>       show_stack+0x20/0x2c
>       dump_stack+0xc8/0x124
>       lockdep_rcu_suspicious+0xe4/0x104
>       __tcs_buffer_write+0x230/0x2d0
>       rpmh_rsc_write_ctrl_data+0x210/0x270
>       rpmh_flush+0x84/0x24c
>       rpmh_domain_power_off+0x78/0x98
>       _genpd_power_off+0x40/0xc0
>       genpd_power_off+0x168/0x208
> 
> Later the final merged solution is to use CPU PM notification to invoke
> rpmh_flush() and .power_off callback of genpd is not implemented in the
> driver.
> 
> Remove this change since RCU will not be idle during CPU PM 
> notifications
> hence not required to use _rcuidle tracepoint. Using _rcuidle 
> tracepoint
> prevented rpmh driver to be loadable module as these are not exported
> symbols.
> 
> This reverts commit efde2659b0fe835732047357b2902cca14f054d9.
> 
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
