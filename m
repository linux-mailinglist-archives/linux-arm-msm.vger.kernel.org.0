Return-Path: <linux-arm-msm+bounces-50634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F83EA565F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 11:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD493B23A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 10:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1A721129E;
	Fri,  7 Mar 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iouX2nYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7720E33F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741345117; cv=none; b=X/0owUj2h5vPSFNh/VbPtEjfKxP+H0BfIL6zavJsSvr/EC59VSFBpC1G+9ah5DpaKRDVaOVQLoaM+/LxrVTNb2Jy9sPQ14Bac62uBhxLLrEZTZ40fnhqmInzTDJ1vd4O8VOfribG+T39e/SHX2gwU+V5gP0Wild8wnwrTNY9Tco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741345117; c=relaxed/simple;
	bh=l1dQ0/rtRnz2aTH7XxZx5Q82OW+kzId8sU4BU9VpwFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNyWY3jNbobAv95DDVtyjII5ljBLnmdvnjsVRd+ZpciRppDuLD/qAl8mxHq03i+8kijSWdt4yiEDOwcrWoTu/N3623EQ3VMV+Fwwcz+OAVvhB5YQ0+Cv9PjEM7Hqv61AIedE9WH/AVB31QtcFXC53ZuR+25s8GJkz/4PUS0FxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iouX2nYM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2240b4de12bso1879075ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 02:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741345114; x=1741949914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RBF1+pAchwOYwmZk8JsBAh3dFd74qhlpxSBC1djEUD0=;
        b=iouX2nYM9/ORhVIMSE98X1Y0Z0axvk/DNXMwCOPir3UEcLpJ1pIEHQG7GAItFE8vjj
         4Nnih0Bb7/t76nledlnwPEpf8nA0JreByvgKpPHNQSu4Yp++U0gS+3zeH+YFZA+yOuz+
         lxYNp2pkfUkT6LkgcFSLv0dyeTUXNrd01J2bOXo9F5G+4rPCiuL5ZuyatnpryOhBINsX
         2oayLqMEgLMNzuvqpeEyl1viWx/ZKSS0h/e32CcnuH05yPGhSF0I6+1el28GqjJgwU9B
         UZDK5Dn1P7OZC0fjXmZIzvsufrDIQgkFdtwgSgmvNSHWl3fuFkFpnqkZMO0CwHx8T38d
         gEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345114; x=1741949914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBF1+pAchwOYwmZk8JsBAh3dFd74qhlpxSBC1djEUD0=;
        b=cwIvMn1Xr129QmHh9Qm/dK2R8eNlWXLyzlm4zH83xNIQDVOiDr3B0LOqxvV0hb8KtK
         47wss6+a5LLmTvZDcNRxxgyVTFO3VKe6PCWb64U3B2h3fKW62+0vnOUPArfWtpIleatw
         XIxtJde7e41HF7kVZQko5/++GPjOZz+uvHKX1B7DLEYVoLNAz2L+zKwbsfmqQmAm5Yr/
         iJvTNFn5VvzfZGQosd2m3gBbMUxuk1l1d3IWU6JVyA3KVcvR74++yq14iN+rnqHY7A9J
         pEjweA1sr1hD91hijXFozNX/Er2tL/7P8/ySwqFZAOmQJ5kIoLxj7QYIsF4JUNk68HlD
         gy3w==
X-Forwarded-Encrypted: i=1; AJvYcCW8dDwmuwpmjt8QucCZymc2ZMu6Mlnjjw0QXEpqLlKmDlqnOHcMQIsWDvhBgcRzcV7nyNUR9Xca8+2AUPV6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu374GIRPEtK6rLNFFRribcWjCXoyEEeHT05dCK3Audx6Yjfz6
	UqrI9b5y8BomFYo8SBRvlv6ZGeCh8PXLFZ5X1mY+Mpg7AI5PlGW/KqZgpQFVHizN8IWVncvwRJm
	/VQpi0kURVc6u2IzWwQZFyWjg7Dgovf/EB4Dw0w==
X-Gm-Gg: ASbGncsbRp3VeaTcMbFS67Ybf3GEAJ0fksCy4Kz9ieMpP/0LmfKlVxI/aQpXZfGcvPL
	Ow9RbezzTunWQy431eQlYafroHgVuK8gsKfMI85JcroeE49yXvD5aCr214Z0e1s8zXV0D9a5Agg
	XjGSeB2MNNG5j/O/qolMV0FShMy6s=
X-Google-Smtp-Source: AGHT+IGy+H6CFor2Eu5URMCyynzpHIvBG6uUq/tbXtuo7RQ0dg125igVD+2Tl7LGVc5Fu4EoMqeERs+R3WmGjUaIox0=
X-Received: by 2002:a05:6a20:6a0c:b0:1ee:efb2:f68c with SMTP id
 adf61e73a8af0-1f544aedbb3mr5905497637.12.1741345113846; Fri, 07 Mar 2025
 02:58:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com> <20250227092640.2666894-5-quic_songchai@quicinc.com>
In-Reply-To: <20250227092640.2666894-5-quic_songchai@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Mar 2025 10:58:22 +0000
X-Gm-Features: AQ5f1Johoq6YNGEtVJ7BctoHsSguorr7O26llLcCgo13WzMcb7Ul2rblWp6WUHQ
Message-ID: <CAJ9a7Vj3eaZB_i8B8ke4cu=Mz7PjB5Z8Gt=MWB13YXZ9MDZyFA@mail.gmail.com>
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

On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
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

calculate_array_location() can return -EINVAL - you could be
referencing array value drvdata->value_table->priority[-EINVAL] here.
Test the return before referencing the array.

Same for all following occurrences.


>                                   drvdata, tgu_attr->step_index,
>                                   tgu_attr->operation_index, tgu_attr->reg_num)]);
> +       case TGU_CONDITION_DECODE:
> +               return sysfs_emit(buf, "0x%x\n",
> +                                 drvdata->value_table->condition_decode[calculate_array_location(
> +                                 drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                                 tgu_attr->reg_num)]);
> +

missing default - did this code compile without warnings?

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

use #define constants with explanations of what they are rather than
arbitrary magic numbers.

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

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

