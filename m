Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6D344B9F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 02:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbhKJBiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 20:38:23 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:38932 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229450AbhKJBiX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 20:38:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636508136; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WxuHeU6WnDPO5ADqzv4gqiilRPE7wwJoyyd//Ezwlg8=;
 b=ENWxbfX0mezTfDkgIibvbYfOH5wmFQ3EzNlhMk3l6mt0Qb2pdpMhtsDxcm8kfYoug7TVSxQ1
 hIRuzBbK+BA9WsAzH37LXAYYgioHJ00xbqyrgavMNSEiHgYkYR19gBzqxejHt+krs0bM3Y/W
 kLOhv8NKqPieF1q59COND/dmack=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 618b21e7a4b510b38f5c53a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 01:35:35
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E8A9C4360D; Wed, 10 Nov 2021 01:35:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F254EC4338F;
        Wed, 10 Nov 2021 01:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Nov 2021 17:35:32 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH v2 16/22] drm/msm/dpu: do not limit the zpos
 property
In-Reply-To: <CAA8EJpoKiu32oqGLpus-W8Z1ifKKVyAyOOp9kPF6NnxRLS6+fw@mail.gmail.com>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-17-dmitry.baryshkov@linaro.org>
 <3a48e580272ceb9d5d499455d8f35630@codeaurora.org>
 <CAA8EJpoKiu32oqGLpus-W8Z1ifKKVyAyOOp9kPF6NnxRLS6+fw@mail.gmail.com>
Message-ID: <08150e6e9df2ebbbfee71b6b7f2ea395@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-09 12:21, Dmitry Baryshkov wrote:
> On Tue, 9 Nov 2021 at 23:15, <abhinavk@codeaurora.org> wrote:
>> 
>> On 2021-07-04 18:21, Dmitry Baryshkov wrote:
>> > Stop limiting zpos property values, we use normalized_zpos anyway. And
>> > nothing stops userspace from assigning several planes to a single zpos
>> > (it is a userspace bug, but the kernel is forgiving about it).
>> 
>> Userspace assigning several planes to a single zpos was intended to
>> identify
>> cases where src split can be used. Downstream does not use normalized
>> zpos,
>> hence it did not come across as a bug but mostly as a way to identify
>> when
>> usermode needs src split to be enabled based on the composition
>> strategy.
>> 
>> We can talk about that more in the rest of the patches of this series.
>> 
>> For this one, I only have a couple of questions:
>> 
>> 1) Across different vendors, some have gone with limiting the zpos and
>> some have gone with
>> the max, so is there an issue with sticking with the max_blend_stages
>> limit?
>> 
>> 2) If there is no hard reason to make this change, I think its better 
>> to
>> keep it the way it is.
> 
> Short answer to both questions: we want to have more planes than the
> max_blend_stages. So we should remove the limit.
> 
> Consider this to be a unification with MDP5, which uses 255 here.

Alright, one minor comment below.

Also, what you have mentioned now "wanting to have more planes than 
blend stages"
should goto the commit text and the userspace bug part can be omitted as 
its technically
isnt a bug but just the way we intended it to be.


> 
>> 
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
>> >  1 file changed, 1 insertion(+), 10 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> > index 8ed7b8f0db69..3850f2714bf3 100644
>> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> > @@ -44,7 +44,6 @@
>> >  #define DPU_NAME_SIZE  12
>> >
>> >  #define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
>> > -#define DPU_ZPOS_MAX 255
instead of getting rid of this, you can use this macro below where 255 
is hardcoded.
>> >
>> >  /* multirect rect index */
>> >  enum {
>> > @@ -1374,7 +1373,6 @@ struct drm_plane *dpu_plane_init(struct
>> > drm_device *dev,
>> >       struct dpu_plane *pdpu;
>> >       struct msm_drm_private *priv = dev->dev_private;
>> >       struct dpu_kms *kms = to_dpu_kms(priv->kms);
>> > -     int zpos_max = DPU_ZPOS_MAX;
>> >       uint32_t num_formats;
>> >       int ret = -EINVAL;
>> >
>> > @@ -1412,14 +1410,7 @@ struct drm_plane *dpu_plane_init(struct
>> > drm_device *dev,
>> >
>> >       pdpu->catalog = kms->catalog;
>> >
>> > -     if (kms->catalog->mixer_count &&
>> > -             kms->catalog->mixer[0].sblk->maxblendstages) {
>> > -             zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
>> > -             if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
>> > -                     zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
>> > -     }
>> > -
>> > -     ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
>> > +     ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
>> >       if (ret)
>> >               DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
