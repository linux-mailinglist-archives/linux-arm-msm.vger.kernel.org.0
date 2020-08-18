Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011E5248956
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 17:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgHRPTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 11:19:35 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:53876 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728093AbgHRPSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 11:18:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597763926; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=llOXz6hHf939lRgjzq6PQgYsFaUkZxMefMQodFWY1Y4=;
 b=DuMiueE7A8WHFaXK9Ev9a7m2Gkhy1vAiC1JsOthv7Jqr2LG7Tm4Dm8oC3NA3D5JUrQyByiFB
 ZJFjYJCpPPoJDU8QUHaVv9slkQnH6WwMDKEyTkJh/y3SRqYmBGRPK967H1lmCEt3dS2Zy9s/
 Lh86wIjTQErZ6WcshA/XS9ymRwM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f3bf14f668ab3fef6c61a63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 15:18:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 241F2C433A1; Tue, 18 Aug 2020 15:18:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49A95C433CA;
        Tue, 18 Aug 2020 15:18:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Aug 2020 20:48:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
In-Reply-To: <CAF6AEGvDN2B-xxecOt+0aaweWohGSKekb3tCerX42T1eOte-ig@mail.gmail.com>
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <a3fcad3f97c258043cd4268ef2c99740@codeaurora.org>
 <CAF6AEGvDN2B-xxecOt+0aaweWohGSKekb3tCerX42T1eOte-ig@mail.gmail.com>
Message-ID: <0c3a5b78537c659f49037e3f9d0d8888@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-18 20:42, Rob Clark wrote:
> On Tue, Aug 18, 2020 at 3:03 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi,
>> 
>> On 2020-06-01 16:33, Krishna Manikandan wrote:
>> > Define shutdown callback for display drm driver,
>> > so as to disable all the CRTCS when shutdown
>> > notification is received by the driver.
>> >
>> > This change will turn off the timing engine so
>> > that no display transactions are requested
>> > while mmu translations are getting disabled
>> > during reboot sequence.
>> >
>> > Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> >
>> > Changes in v2:
>> >       - Remove NULL check from msm_pdev_shutdown (Stephen Boyd)
>> >       - Change commit text to reflect when this issue
>> >         was uncovered (Sai Prakash Ranjan)
>> > ---
>> >  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
>> > b/drivers/gpu/drm/msm/msm_drv.c
>> > index e4b750b..94e3963 100644
>> > --- a/drivers/gpu/drm/msm/msm_drv.c
>> > +++ b/drivers/gpu/drm/msm/msm_drv.c
>> > @@ -1322,6 +1322,13 @@ static int msm_pdev_remove(struct
>> > platform_device *pdev)
>> >       return 0;
>> >  }
>> >
>> > +static void msm_pdev_shutdown(struct platform_device *pdev)
>> > +{
>> > +     struct drm_device *drm = platform_get_drvdata(pdev);
>> > +
>> > +     drm_atomic_helper_shutdown(drm);
>> > +}
>> > +
>> >  static const struct of_device_id dt_match[] = {
>> >       { .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>> >       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>> > @@ -1334,6 +1341,7 @@ static int msm_pdev_remove(struct platform_device
>> > *pdev)
>> >  static struct platform_driver msm_platform_driver = {
>> >       .probe      = msm_pdev_probe,
>> >       .remove     = msm_pdev_remove,
>> > +     .shutdown   = msm_pdev_shutdown,
>> >       .driver     = {
>> >               .name   = "msm",
>> >               .of_match_table = dt_match,
>> 
>> Any more comments on this patch?
> 
> sorry, I managed to overlook this earlier.. I've pulled it in to 
> msm-next
> 

No problem, thanks Rob.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
