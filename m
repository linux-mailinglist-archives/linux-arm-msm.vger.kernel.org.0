Return-Path: <linux-arm-msm+bounces-53831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E5A84509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 15:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388754A7BB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B87B2853E9;
	Thu, 10 Apr 2025 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QsvfUpRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE33270EDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292166; cv=none; b=nQ712K8rQ07i8oiVjzVu8Utraotl1lIvPjb7KR08MoHIKiU8ZBwexxxO5y/qa/pvmiRcJ0D3LvkoXuVnYuytb2dyImrXec0R3mrNFD0iXkAUVJ1iAO2nXe+47uW4OuUMMOehtdNfijSlM2vhqLbBIHdj80Lf+KZdI85Nago5vs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292166; c=relaxed/simple;
	bh=uUYl05kwlY1SBjUnXgr9Vvp1DOy5cPab4ndqaDEwMwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fosS+vXqbcYo6d64NL4bTmJaesGtwIW7Bvz1hZARaGWziI/i5aoR/8jnjUsX9Gkgpiz9ciMlNquKu1sDj+P0mhPL0B+dIR9BazC/9vVIYaHJUwrZfCS8FSmd2lhCjqcCeTySgpwRG/jJ3sK9Jpc+LulQTzJTaqA9ybbu4Y1Ey48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QsvfUpRF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1669794b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744292164; x=1744896964; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qa9H55NP8y0lcikIbP/iehZE8InfczV+B4Ob1WcMMVs=;
        b=QsvfUpRFrO/GSO1hz1R8Xc2SoYIiFIi5jJmM0HfybDOZd7xyi33i6NO+mKOAhWGZrr
         otO0nRE9F9ofPzzeWFWAauIIbkSxKQpjWs1lTd5/u4aA2439pnJ87S8tG43Ek0dBK5/Q
         Lw6l0JswL0wows5c29tlwCtZFIYsOfNZ5GMxOv+dBa22lKMiuy5Prv2Rkz+yne3cPbgz
         BhRHh2/05SHc4GrsOSopVZs7/B6EwY6EV4EvLPMiKfs+vZuCmS8VOr5z2w9X7MY/QqHn
         S1ogsQijPaFJhqxSMkZpGA/zrzn2Hmr84ZrEm200kZPnxsOx1cCdNp6Yt2F1uNaLHmh/
         LQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292164; x=1744896964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qa9H55NP8y0lcikIbP/iehZE8InfczV+B4Ob1WcMMVs=;
        b=jx/qL+dHqayls+4LOggCx6f1TcGrfVBNpL0zXNsIbBWaLoi916tlP5MWxIdGj6Kmo8
         jFItfiBbF4QsFhIuafEQkpFQsOQp0ZY0rH8veL5E6gg8n6A+GSV1VUpbOJTF8toQ4DIy
         oD6UAFeF+imjyrAR1hIOhaBMB55EIo60ys+9sXCo1vj3GLbI+9p2PyQEQrLva7MJYRtx
         HgnqsLyi2xCgZrIxoN/hVcAQLFTpmtY1BQ5xM4YxL74XiRDmTGDhwDOK+2aCdWQ6MdSl
         WYvn5grgoetrp4nYc+AUc9eNzEqQDfiT30Wk5n+qYF1A83zGVt21xdFCdzznB+mSh/0z
         W8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWOgDwImxmCtwDQHGw6iGhenfuTA6LBejcNbvCSuo5wR+NQkn/qSW34f5JMmF7Cn4zFuoiO4eJa7ZS9S2UE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5s6L4n+F0SnDs3rNrdmrzb8gKEAezCQiqyHHBqmFTB9gmcRdx
	4FnInqOHuNYJN16V/ErsosI5nW59c12008owVI4oshRFhCJ2XjYThqWm3G0tQNME+iKDk+ZAnmq
	vE9IL1SqwdPu5ZyaatRvt1QMZ+a2LlqZsI5PKlw==
X-Gm-Gg: ASbGncuayCU8pyNDEw/t8WtiZfldhAbJWiq8hcRT67J6+ixKpt1KXgWPvv1tlSpCwJO
	/W1KGAPg0+Ad5lVjJ0L+4abxiiCFwiUbmDfEl9WdmnvBoNxHZ9tc0L4zFIMPyUm2Fn93s+nwFmF
	JUghqlACpNuEEKSVhV/u1ijGD9iMl3doSyAw==
X-Google-Smtp-Source: AGHT+IEHQtHA1hIyrrZ5K3gF9H81/k+y6X+jg/dj+3RpXa9S79dRt2dUU6xPfC7SZcpmtk9E5MNDMlfRZEPvRixGBSI=
X-Received: by 2002:a05:6a00:3d0d:b0:732:56a7:a935 with SMTP id
 d2e1a72fcca58-73bbf6116d1mr4733304b3a.12.1744292163542; Thu, 10 Apr 2025
 06:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-5-quic_songchai@quicinc.com> <CAJ9a7Vj3eaZB_i8B8ke4cu=Mz7PjB5Z8Gt=MWB13YXZ9MDZyFA@mail.gmail.com>
 <57272ecc-0ebd-4146-8860-a2dd71833d23@quicinc.com>
In-Reply-To: <57272ecc-0ebd-4146-8860-a2dd71833d23@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 10 Apr 2025 14:35:52 +0100
X-Gm-Features: ATxdqUHK1Zmf0voZjxm0DFtdMYH3w6c87lqw0rW9vtlLoKYZdl2MEVe4lp0H328
Message-ID: <CAJ9a7VgksdNNH-3HEoeKd+odgiboskm8fpGBSB-=aPVOG_0KKQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] coresight-tgu: Add TGU decode support
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 10 Apr 2025 at 08:46, songchai <quic_songchai@quicinc.com> wrote:
>
>
> On 3/7/2025 6:58 PM, Mike Leach wrote:
>
> Hi,
>
> On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>
> From: Songwei Chai <quic_songchai@quicinc.com>
>
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> step.
>
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> Signed-off-by: songchai <quic_songchai@quicinc.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-tgu   |   7 ++
>  drivers/hwtracing/coresight/coresight-tgu.c   | 113 ++++++++++++++++--
>  drivers/hwtracing/coresight/coresight-tgu.h   |  29 ++++-
>  3 files changed, 136 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> index af7332153833..dd6cc1184d52 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion   6.15
>  Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>  Description:
>                  (RW) Set/Get the sensed siganal with specific step and priority for TGU.
> +
> +What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:           February 2025
> +KernelVersion   6.15
> +Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
> +Description:
> +                (RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
> index f28761619ebe..5eebf5eecbbb 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.c
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -22,9 +22,21 @@ static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
>  {
>         int ret = -EINVAL;
>
> -       ret = operation_index * (drvdata->max_step) *
> -                     (drvdata->max_reg) + step_index * (drvdata->max_reg)
> -                               + reg_index;
> +       switch (operation_index) {
> +       case TGU_PRIORITY0:
> +       case TGU_PRIORITY1:
> +       case TGU_PRIORITY2:
> +       case TGU_PRIORITY3:
> +               ret = operation_index * (drvdata->max_step) *
> +                       (drvdata->max_reg) + step_index * (drvdata->max_reg)
> +                       + reg_index;
> +               break;
> +       case TGU_CONDITION_DECODE:
> +               ret = step_index * (drvdata->max_condition_decode) + reg_index;
> +               break;
> +       default:
> +               break;
> +       }
>
>         return ret;
>  }
> @@ -36,10 +48,23 @@ static ssize_t tgu_dataset_show(struct device *dev,
>         struct tgu_attribute *tgu_attr =
>                 container_of(attr, struct tgu_attribute, attr);
>
> -       return sysfs_emit(buf, "0x%x\n",
> -                         drvdata->value_table->priority[calculate_array_location(
> +       switch (tgu_attr->operation_index) {
> +       case TGU_PRIORITY0:
> +       case TGU_PRIORITY1:
> +       case TGU_PRIORITY2:
> +       case TGU_PRIORITY3:
> +               return sysfs_emit(buf, "0x%x\n",
> +                                 drvdata->value_table->priority[calculate_array_location(
>
> calculate_array_location() can return -EINVAL - you could be
> referencing array value drvdata->value_table->priority[-EINVAL] here.
> Test the return before referencing the array.
>
> Same for all following occurrences.
>
> Both tgu_dataset_store/show and calculate_array_location use switch cases to evaluate tgu_attr->operation_index.
>
>  Therefore, when a case in tgu_dataset_store/show satisfies tgu_attr->operation_index, calculate_array_location
>
>  will not return -EINVAL. This prevents the occurrence of -EINVAL within the array.

If the function can never return -EINVAL, then do not use is at all in
the function - it is unneeded.
It does not matter that you believe that the current implementation
can never produce an incorrect response - if you write a function that
can return -EINVAL, this must be checked for - do not assume that
future changes will retain the apparent "safety".


Regards

Mike

>
>                                   drvdata, tgu_attr->step_index,
>                                   tgu_attr->operation_index, tgu_attr->reg_num)]);
> +       case TGU_CONDITION_DECODE:
> +               return sysfs_emit(buf, "0x%x\n",
> +                                 drvdata->value_table->condition_decode[calculate_array_location(
> +                                 drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                                 tgu_attr->reg_num)]);
> +
>
> missing default - did this code compile without warnings?
>
> Will correct it in next version.
>
> +       }
> +       return -EINVAL;
>
>  }
>
> @@ -58,11 +83,25 @@ static ssize_t tgu_dataset_store(struct device *dev,
>                 return ret;
>
>         guard(spinlock)(&tgu_drvdata->spinlock);
> -       tgu_drvdata->value_table->priority[calculate_array_location(
> -               tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> -               tgu_attr->reg_num)] = val;
> -       ret = size;
> -
> +       switch (tgu_attr->operation_index) {
> +       case TGU_PRIORITY0:
> +       case TGU_PRIORITY1:
> +       case TGU_PRIORITY2:
> +       case TGU_PRIORITY3:
> +               tgu_drvdata->value_table->priority[calculate_array_location(
> +                       tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                       tgu_attr->reg_num)] = val;
> +               ret = size;
> +               break;
> +       case TGU_CONDITION_DECODE:
> +               tgu_drvdata->value_table->condition_decode[calculate_array_location(
> +                       tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                       tgu_attr->reg_num)] = val;
> +               ret = size;
> +               break;
> +       default:
> +               break;
> +       }
>         return ret;
>  }
>
> @@ -79,8 +118,23 @@ static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
>                 container_of(dev_attr, struct tgu_attribute, attr);
>
>         if (tgu_attr->step_index < drvdata->max_step) {
> -               ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> -                                           attr->mode : 0;
> +               switch (tgu_attr->operation_index) {
> +               case TGU_PRIORITY0:
> +               case TGU_PRIORITY1:
> +               case TGU_PRIORITY2:
> +               case TGU_PRIORITY3:
> +                       ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> +                                     attr->mode : 0;
> +                       break;
> +               case TGU_CONDITION_DECODE:
> +                       ret = (tgu_attr->reg_num <
> +                                       drvdata->max_condition_decode) ?
> +                                               attr->mode : 0;
> +                       break;
> +               default:
> +                       break;
> +               }
> +
>                 return ret;
>         }
>         return SYSFS_GROUP_INVISIBLE;
> @@ -103,6 +157,17 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>                 }
>         }
>
> +       for (i = 0; i < drvdata->max_step; i++) {
> +               for (j = 0; j < drvdata->max_condition_decode; j++) {
> +                       tgu_writel(drvdata,
> +                                  drvdata->value_table
> +                                          ->condition_decode[calculate_array_location(
> +                                                  drvdata, i,
> +                                                  TGU_CONDITION_DECODE, j)],
> +                                  CONDITION_DECODE_STEP(i, j));
> +               }
> +       }
> +
>         /* Enable TGU to program the triggers */
>         tgu_writel(drvdata, 1, TGU_CONTROL);
>         CS_LOCK(drvdata->base);
> @@ -245,6 +310,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>         PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>         PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>         PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>         NULL,
>  };
>
> @@ -289,6 +362,13 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>         if (ret)
>                 return -EINVAL;
>
> +       ret = of_property_read_u32(adev->dev.of_node, "tgu-conditions",
> +                                  &drvdata->max_condition);
> +       if (ret)
> +               return -EINVAL;
> +
> +       drvdata->max_condition_decode = drvdata->max_condition;
> +
>         drvdata->value_table =
>                 devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>         if (!drvdata->value_table)
> @@ -303,6 +383,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>         if (!drvdata->value_table->priority)
>                 return -ENOMEM;
>
> +       drvdata->value_table->condition_decode = devm_kzalloc(
> +               dev,
> +               drvdata->max_condition_decode * drvdata->max_step *
> +                       sizeof(*(drvdata->value_table->condition_decode)),
> +               GFP_KERNEL);
> +
> +       if (!drvdata->value_table->condition_decode)
> +               return -ENOMEM;
> +
>         drvdata->enable = false;
>         desc.type = CORESIGHT_DEV_TYPE_HELPER;
>         desc.pdata = adev->dev.platform_data;
> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
> index 6e5d465117df..c2a9ce38b44f 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.h
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
> @@ -46,6 +46,9 @@
>  #define PRIORITY_REG_STEP(step, priority, reg)\
>         (0x0074 + 0x60 * priority + 0x4 * reg + 0x1D8 * step)
>
> +#define CONDITION_DECODE_STEP(step, decode) \
> +       (0x0050 + 0x4 * decode + 0x1D8 * step)
> +
>
> use #define constants with explanations of what they are rather than
> arbitrary magic numbers.
>
> Done.
>
>  #define tgu_dataset_ro(name, step_index, type, reg_num)     \
>         (&((struct tgu_attribute[]){ {                      \
>                 __ATTR(name, 0444, tgu_dataset_show, NULL), \
> @@ -66,6 +69,9 @@
>         tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>                        reg_num)
>
> +#define STEP_DECODE(step_index, reg_num) \
> +       tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
> +
>  #define STEP_PRIORITY_LIST(step_index, priority)  \
>         {STEP_PRIORITY(step_index, 0, priority),  \
>          STEP_PRIORITY(step_index, 1, priority),  \
> @@ -88,6 +94,14 @@
>          NULL                   \
>         }
>
> +#define STEP_DECODE_LIST(n) \
> +       {STEP_DECODE(n, 0), \
> +        STEP_DECODE(n, 1), \
> +        STEP_DECODE(n, 2), \
> +        STEP_DECODE(n, 3), \
> +        NULL           \
> +       }
> +
>  #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>         (&(const struct attribute_group){\
>                 .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -95,11 +109,19 @@
>                 .name = "step" #step "_priority" #priority \
>         })
>
> +#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
> +       (&(const struct attribute_group){\
> +               .attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
> +               .is_visible = tgu_node_visible,\
> +               .name = "step" #step "_condition_decode" \
> +       })
> +
>  enum operation_index {
>         TGU_PRIORITY0,
>         TGU_PRIORITY1,
>         TGU_PRIORITY2,
> -       TGU_PRIORITY3
> +       TGU_PRIORITY3,
> +       TGU_CONDITION_DECODE
>
>  };
>
> @@ -115,6 +137,7 @@ struct tgu_attribute {
>
>  struct value_table {
>         unsigned int *priority;
> +       unsigned int *condition_decode;
>  };
>
>  /**
> @@ -127,6 +150,8 @@ struct value_table {
>   * @value_table: Store given value based on relevant parameters.
>   * @max_reg: Maximum number of registers
>   * @max_step: Maximum step size
> + * @max_condition: Maximum number of condition
> + * @max_condition_decode: Maximum number of condition_decode
>   *
>   * This structure defines the data associated with a TGU device, including its base
>   * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
> @@ -141,6 +166,8 @@ struct tgu_drvdata {
>         struct value_table *value_table;
>         int max_reg;
>         int max_step;
> +       int max_condition;
> +       int max_condition_decode;
>  };
>
>  #endif
>
> Regards
>
> Mike
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

