Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38863E9B45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhHKXhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:37:31 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:31508 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhHKXhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:37:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628725027; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lT30KS6uIFtDVkk05MXCy+j2admrapAIXL+iZ+9AInM=;
 b=WhDWWt+L42y3VDXXGOSiRBk26CWzDdeMdyHK5z6cUOEB6MRO79WD0jFXMFnmsxXrhTcFxxnY
 7w9ov2bj45EUNGfLrgXeaQ6fL0Vdyai6KtToJwai20QoUggPm7i4vhbK/myvMDy6Vr1JdxGO
 BB8WHmKEpvLlEMwZmX+o3LvPe18=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61145f127ee6040977bb1777 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 23:36:50
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95500C433F1; Wed, 11 Aug 2021 23:36:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D9FDC433F1;
        Wed, 11 Aug 2021 23:36:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 16:36:40 -0700
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     Mark Yacoub <markyacoub@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Yacoub <markyacoub@google.com>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Read frame_count and line_count even
 when disabled.
In-Reply-To: <CAF6AEGuJ3c7WTN68HJKECu_uCeZoi_js1S8XOuEQ-nNSWbCybw@mail.gmail.com>
References: <20210811180844.2130484-1-markyacoub@chromium.org>
 <CAF6AEGveSFBOQkP=NXeRZAuAeL_yQc5Sq6LO+huf4bJO6c2yKA@mail.gmail.com>
 <105abb2369fdd47a76e330857024c96a@codeaurora.org>
 <CAF6AEGuJ3c7WTN68HJKECu_uCeZoi_js1S8XOuEQ-nNSWbCybw@mail.gmail.com>
Message-ID: <3f363089ffc7da3289204139ac275c3b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-11 16:28, Rob Clark wrote:
> On Wed, Aug 11, 2021 at 4:11 PM <abhinavk@codeaurora.org> wrote:
>> 
>> On 2021-08-11 11:43, Rob Clark wrote:
>> > On Wed, Aug 11, 2021 at 11:12 AM Mark Yacoub <markyacoub@chromium.org>
>> > wrote:
>> >>
>> >> From: Mark Yacoub <markyacoub@google.com>
>> >>
>> >> [why]
>> >> Reading frame count register used to get the vblank counter, which
>> >> calls
>> >> dpu_encoder_phys to get the frame count. Even when it's disabled, the
>> >> vblank counter (through frame count) should return a valid value for
>> >> the
>> >> count. An invalid value of 0, when compared to vblank->last (in
>> >> drm_vblank.c::drm_update_vblank_count()) returns an invalid number
>> >> that
>> >> throws off the vblank counter for the lifetime of the process.
>> >>
>> >> Rationale:
>> >> In drm_vblank.c::drm_update_vblank_count(), the new diff is calculated
>> >> through:
>> >> diff = (cur_vblank - vblank->last) & max_vblank_count;
>> >> cur_vblank comes from: cur_vblank = __get_vblank_counter(dev, pipe);
>> >> When the value is 0, diff results in a negative number (a very large
>> >> number as it's unsigned), which inflates the vblank count when the
>> >> diff
>> >> is added to the current vblank->count.
>> >>
>> >> [How]
>> >> Read frame_count register whether interface timing engine is enabled
>> >> or
>> >> not.
>> >>
>> >> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
>> >> Tested on ChromeOS Trogdor(msm)
>> >>
>> >> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>> >
>> > Reviewed-by: Rob Clark <robdclark@chromium.org>
>> >
>> > But I suspect we may have a bit more work for the display-off case..
>> > or at least I'm not seeing anything obviously doing a pm_runtime_get()
>> > in this call path.
>> >
>> > I'm also not sure if the line/frame-count registers loose state across
>> > a suspend->resume cycle, it might be that we need to save/restore
>> > these registers in the suspend/resume path?  Abhinav?
>> >
>> > BR,
>> > -R
>> >
>> I spent sometime checking this and I dont think we should go ahead 
>> with
>> this change.
>> So when the timing engine is off, I believe the reason this works is
>> that the clocks are still not OFF yet
>> so this should be returning the last value of the vsync counter before
>> the timing engine was turned OFF.
>> If the clocks got turned OFF and there is a power collapse, I expect 
>> the
>> frame_count and line_count to get reset
>> to 0.
> 
> I think if the interface clocks are off, it will be worse.. reading
> any register will make things go *boom*, won't it?
> 
> That said, I don't think this patch is making that particular issue 
> worse.

Yes any unclocked access will cause an abort. What I am trying to 
emphasize here
is that returning the register value after timing engine is off is 
unreliable and should
not be done. Its working because even though timing engine is off, the 
clocks are not
yet, so it returns the last value. But we should not rely on it because 
its incorrect
to check these registers after timing engine off.

> 
>> 
>> I was also looking at the stack in which this error will start
>> happening. So I believe the sequence is like this
>> (mark can correct me if wrong):
>> 
>> drm_crtc_vblank_off(crtc); ---> drm_vblank_disable_and_save ---->
>> drm_update_vblank_count ----> __get_vblank_counter().
>> 
>> crtc is disabled after the encoder so this path triggers an incorrect
>> value because encoder was already disabled (hence timing
>> engine was too). Clocks were still ON as full suspend hasnt happened
>> yet.
>> 
>> To fix this, I think we should do what the downstream drivers did, so
>> something like this:
>> 
>> 5471 static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>> 5472 {
>> 5473    struct drm_encoder *encoder;
>>          struct dpu_encoder_virt *dpu_enc = NULL;
>> 
>>          dpu_enc = to_dpu_encoder_virt(drm_enc);
>> 5480
>> ***********************************************************
>> 5485            return dpu_encoder_get_frame_count(encoder);
>> ************************************************************
>> 
>> this just returns phys->vsync_cnt (which is just an atomic counter 
>> which
>> doesnt reset during disable)
>> So in other words instead of relying on the hw register value which 
>> can
>> be unpredictable when the timing engine is off,
>> use a sw counter
> 
> I don't think that a sw counter will do the job, unless we never
> disable the vblank irq (or I am misunderstanding you).. the frame
> counter is expected to keep incrementing regardless of whether vblank
> is enabled or not.
> 
> But it does sound like on suspend we need to store the current frame
> count, and add that offset later when asked for the current frame
> counter.
> 
> BR,
> -R
the sw counter which i am referring to is already present in 
dpu_encoder.c
its never reset during disable and should do the job.

Yes, in principle yes, we need to store the current frame count before 
suspend.
Thats what the phys->vsync_cnt will do and wont get reset.

> 
>> 5486    }
>> 5487
>> 5488    return 0;
>> 5489 }
>> 
>> 
>> >> ---
>> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 ++-------
>> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
>> >>  2 files changed, 3 insertions(+), 8 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> >> index 116e2b5b1a90f..c436d901629f3 100644
>> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> >> @@ -266,13 +266,8 @@ static void dpu_hw_intf_get_status(
>> >>
>> >>         s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>> >>         s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) &
>> >> BIT(31));
>> >> -       if (s->is_en) {
>> >> -               s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
>> >> -               s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
>> >> -       } else {
>> >> -               s->line_count = 0;
>> >> -               s->frame_count = 0;
>> >> -       }
>> >> +       s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
>> >> +       s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
>> >>  }
>> >>
>> >>  static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> >> index 3568be80dab51..877ff48bfef04 100644
>> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> >> @@ -41,7 +41,7 @@ struct intf_prog_fetch {
>> >>  struct intf_status {
>> >>         u8 is_en;               /* interface timing engine is enabled
>> >> or not */
>> >>         u8 is_prog_fetch_en;    /* interface prog fetch counter is
>> >> enabled or not */
>> >> -       u32 frame_count;        /* frame count since timing engine
>> >> enabled */
>> >> +       u32 frame_count; /* frame count since timing engine first
>> >> enabled */
>> >>         u32 line_count;         /* current line count including
>> >> blanking */
>> >>  };
>> >>
>> >> --
>> >> 2.33.0.rc1.237.g0d66db33f3-goog
>> >>
