Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE4E1EBE74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 16:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFBOtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 10:49:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45326 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726073AbgFBOtl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 10:49:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591109381; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rlURGUY597TqbB43gaR7bgIPpydKPkFEMWK7XxPMQgc=;
 b=ZkX+iG1WZuJdGJtAGrsOI1ndsGB9ixoknotxzKx989kongUZpLOvq4pkMqdbfzhyqrVju5GE
 rqJw6Bs4LJQYwUPGwPXhmYNueQZJu/8IlQyy9HJq5ZkYl2Tq+9cvEtYFgCffuFyv2eS0kFk+
 NA866jzxahToPFYMiFF1hDUPQxI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ed666fe2c54998475e15257 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2020 14:49:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10E51C433CB; Tue,  2 Jun 2020 14:49:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 812F4C433C9;
        Tue,  2 Jun 2020 14:49:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jun 2020 20:19:33 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        devicetree <devicetree@vger.kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H . Kristensen" <hoegsberg@chromium.org>,
        mka@chromium.org, devicetree-owner@vger.kernel.org
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
In-Reply-To: <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
Message-ID: <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Emil,

On 2020-06-02 19:43, Emil Velikov wrote:
> Hi Krishna,
> 
> On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan 
> <mkrishn@codeaurora.org> wrote:
>> 
>> Define shutdown callback for display drm driver,
>> so as to disable all the CRTCS when shutdown
>> notification is received by the driver.
>> 
>> This change will turn off the timing engine so
>> that no display transactions are requested
>> while mmu translations are getting disabled
>> during reboot sequence.
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> 
> AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
> msm_drm_ops::unbind.
> 
> Are you saying that unbind never triggers? If so, then we should
> really fix that instead, since this patch seems more like a
> workaround.
> 

Which path do you suppose that the unbind should be called from, remove
callback? Here we are talking about the drivers which are builtin, where
remove callbacks are not called from the driver core during 
reboot/shutdown,
instead shutdown callbacks are called which needs to be defined in order 
to
trigger unbind. So AFAICS there is nothing to be fixed.

msm_pdev_shutdown()
  platform_drv_shutdown()
   device_shutdown()
    kernel_restart_prepare()
     kernel_restart()
      __arm64_sys_reboot()

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
