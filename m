Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3727863F862
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 20:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiLATe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 14:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiLATej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 14:34:39 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D799381C;
        Thu,  1 Dec 2022 11:33:49 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-14286d5ebc3so3335979fac.3;
        Thu, 01 Dec 2022 11:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VPkQQERyjiDmblFdMpvetG3Txhv1fALmSUiNK4uispU=;
        b=JIVTb6kVxC2+GkogklTf3iO7DdD+uMRGAWgl1zuxAMxh7CuiezggfqAOEft6c/q8eW
         RJLqfbNwTaiLr3hJaXKVcu91q0hjddR3wiaXAUojE/zXibeNisE9YFCIV6F6JTV9ClHW
         YNWBOrfFh0xZarYfsulryI7QCQJ/04teja9lHFjLB6w0YTLDhiPctaZpMoDUwsyOn6Zn
         NyP/dwmmWZDQcEh54JVmq0JV5UGQD5s9g15X8MIpt6Y9ur1MGU2B1L2g7muF1jku24Ap
         DZS/aSJ+FRrTBJ1VBsf3tRZypBAFZteumLCs6GvgAl1iHbfZjxl/iKXOHF9PTRYbtnqQ
         nc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPkQQERyjiDmblFdMpvetG3Txhv1fALmSUiNK4uispU=;
        b=b9mz2T3OH3VHU2gwUE8hPcy6R/Crph2+sDqApEJ5uU0tODp9JbL3x5iLki7OGvjFLt
         WZmw0eamB/CikgwHyQ/GkSQPRrQcebg5r/Zh2JyrCGPrLh+Bv1D91FmDVcz8zJUX4arB
         k0z+OyiRdP3KhwK/nQT5/GbWd19x+mVDgi06jeEqZu/4Uqgrf6HDh4nvbg/mIMIUcQzh
         ING1O+dgQCiRrSWlu/2jNN4zGxq/5HpLR/xHUylj6Om7BhQ3uztlp4XJ/lNUv54rsNjG
         5lC+KZD4qVLYUJCMNIBZunkc93o/9oeFBDFdwz7Qcu+s2jf8Vjibl3sraCmI4xW1oKHB
         xyww==
X-Gm-Message-State: ANoB5pklnd+GpM+bf2FyIzvLXuzaLJr27M68Bk3XiMaGAsM4u+CGDuuN
        /Kb9B2gtqjPEly65yr8yIEQJ8OdMg053ug8IrtvVtO85
X-Google-Smtp-Source: AA0mqf5Y1FCdimrFaHTrU8Rv9VYLNayXBm6wkTjy2CMyzp5Sfd1yy5/UTaWmVF4ZZMuRF85ezZkOgwQrLlHPdjOhg84=
X-Received: by 2002:a05:6870:b01e:b0:131:f559:461b with SMTP id
 y30-20020a056870b01e00b00131f559461bmr37615734oae.38.1669923228590; Thu, 01
 Dec 2022 11:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20221111194957.4046771-1-joel@joelfernandes.org>
 <20221111194957.4046771-2-joel@joelfernandes.org> <899db0f8-7b8a-ed8f-30b8-4f630da1298d@quicinc.com>
 <CAF6AEGtEswqCRXkrd+tWKb_1N1UXgQ=EVMTZAgxxpNcD2vYGHQ@mail.gmail.com> <CAEXW_YSKBsVKBqJHB=9dQYV9XboTnsNb10ESJk1S_ia0gyKbuw@mail.gmail.com>
In-Reply-To: <CAEXW_YSKBsVKBqJHB=9dQYV9XboTnsNb10ESJk1S_ia0gyKbuw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 1 Dec 2022 11:33:40 -0800
Message-ID: <CAF6AEGv9nOy6+_xgs3oF5GUKi+JZazS0G0fcviShGCpqzM9eEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] adreno: Detect shutdown during get_param()
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Ross Zwisler <zwisler@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 1, 2022 at 10:42 AM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Sat, Nov 12, 2022 at 6:35 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Nov 11, 2022 at 1:28 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On 11/12/2022 1:19 AM, Joel Fernandes (Google) wrote:
> > > > Even though the GPU is shut down, during kexec reboot we can have userspace
> > > > still running. This is especially true if KEXEC_JUMP is not enabled, because we
> > > > do not freeze userspace in this case.
> > > >
> > > > To prevent crashes, track that the GPU is shutdown and prevent get_param() from
> > > > accessing GPU resources if we find it shutdown.
> > > >
> > > > This fixes the following crash during kexec reboot on an ARM64 device with adreno GPU:
> > > >
> > > > [  292.534314] Kernel panic - not syncing: Asynchronous SError Interrupt
> > > > [  292.534323] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> > > > [  292.534326] Call trace:
> > > > [  292.534328]  dump_backtrace+0x0/0x1d4
> > > > [  292.534337]  show_stack+0x20/0x2c
> > > > [  292.534342]  dump_stack_lvl+0x60/0x78
> > > > [  292.534347]  dump_stack+0x18/0x38
> > > > [  292.534352]  panic+0x148/0x3b0
> > > > [  292.534357]  nmi_panic+0x80/0x94
> > > > [  292.534364]  arm64_serror_panic+0x70/0x7c
> > > > [  292.534369]  do_serror+0x0/0x7c
> > > > [  292.534372]  do_serror+0x54/0x7c
> > > > [  292.534377]  el1h_64_error_handler+0x34/0x4c
> > > > [  292.534381]  el1h_64_error+0x7c/0x80
> > > > [  292.534386]  el1_interrupt+0x20/0x58
> > > > [  292.534389]  el1h_64_irq_handler+0x18/0x24
> > > > [  292.534395]  el1h_64_irq+0x7c/0x80
> > > > [  292.534399]  local_daif_inherit+0x10/0x18
> > > > [  292.534405]  el1h_64_sync_handler+0x48/0xb4
> > > > [  292.534410]  el1h_64_sync+0x7c/0x80
> > > > [  292.534414]  a6xx_gmu_set_oob+0xbc/0x1fc
> > > > [  292.534422]  a6xx_get_timestamp+0x40/0xb4
> > > > [  292.534426]  adreno_get_param+0x12c/0x1e0
> > > > [  292.534433]  msm_ioctl_get_param+0x64/0x70
> > > > [  292.534440]  drm_ioctl_kernel+0xe8/0x158
> > > > [  292.534448]  drm_ioctl+0x208/0x320
> > > > [  292.534453]  __arm64_sys_ioctl+0x98/0xd0
> > > > [  292.534461]  invoke_syscall+0x4c/0x118
> > > > [  292.534467]  el0_svc_common+0x98/0x104
> > > > [  292.534473]  do_el0_svc+0x30/0x80
> > > > [  292.534478]  el0_svc+0x20/0x50
> > > > [  292.534481]  el0t_64_sync_handler+0x78/0x108
> > > > [  292.534485]  el0t_64_sync+0x1a4/0x1a8
> > > > [  292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc008000000
> > > > [  292.534635] PHYS_OFFSET: 0x80000000
> > > > [  292.534638] CPU features: 0x40018541,a3300e42
> > > > [  292.534644] Memory Limit: none
> > > >
> > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > > Cc: Ricardo Ribalda <ribalda@chromium.org>
> > > > Cc: Ross Zwisler <zwisler@kernel.org>
> > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > ---
> > > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 +-
> > > >   drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
> > > >   3 files changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > index f0cff62812c3..03d912dc0130 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > @@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_device *pdev)
> > > >   {
> > > >       struct msm_gpu *gpu = dev_to_gpu(&pdev->dev);
> > > >
> > > > +     gpu->is_shutdown = true;
> > > >       WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
> > > >   }
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > index 382fb7f9e497..6903c6892469 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > @@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > > >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >
> > > >       /* No pointer params yet */
> > > > -     if (*len != 0)
> > > > +     if (*len != 0 || gpu->is_shutdown)
> > > >               return -EINVAL;
> > > This will race with shutdown. Probably, propagating back the return
> > > value of pm_runtime_get() in every possible ioctl call path is the right
> > > thing to do.
> > >
> > > I have never thought about this scenario. Do you know why userspace is
> > > not freezed before kexec?
> >
> > So userspace not being frozen seems like the root issue, and is likely
> > to cause all sorts of other whack-a-mole problems.  I guess I'd like
> > to know if this is the expected behavior?
>
> We tried that. Freezing before kexec seems to cause issues for ALSA as
> Ricardo found:
> https://lore.kernel.org/lkml/202211281209.mnBLzQ2I-lkp@intel.com/T/
>
> That patch is still TBD due to disagreement on the right approach to
> fix, so I don't think freezing before shutting down devices is viable
> at the moment.
>
> I am checking Ricardo if we can do something like util-linux's
> shutdown code which sends SIGTERM to all processes:
> https://kernel.googlesource.com/pub/scm/utils/util-linux/util-linux/+/v2.8/login-utils/shutdown.c#273
> , before issuing the kexec-reboot.
>
> Maybe, a more graceful shutdown from kexec-lite, will prevent the
> kexec-reboot it does from crashing? Though in my view that would still
> be a small copout instead of fixing the real issue, which is the
> kernel crashing for any reason.

The problem is that pm_runtime_force_suspend() yanks the rug out from
under the driver from a runpm PoV.. generally this is ok (as long as
scheduler kthread is parked) because we don't have to worry about
userspace ;-)

> > If so, we should probably look at
> > drm_dev_is_unplugged()/drm_dev_unplug()/etc rather than trying to NIH
> > that mechanism.  We would need to sprinkle drm_dev_is_unplugged()
> > checks more widely, and also ensure that the scheduler kthread(s) gets
> > parked.  But it would be nice to know first if we are just trying to
> > paper over a kexec bug.
>
> Agreed. I think we still patch 1/2 whether the SIGTERM trick mentioned
> above, works or not. I will await discussions with Ricardo before
> reposting that one.

Yeah, I think I'm waiting on a v2 of that one ;-)

BR,
-R

> Cheers,
>
>  -- Joel
