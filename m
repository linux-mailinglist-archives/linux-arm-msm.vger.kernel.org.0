Return-Path: <linux-arm-msm+bounces-57223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5DAAF488
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A334A0416
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 07:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5D0211A00;
	Thu,  8 May 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UdaBgOgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C31DDC23
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688700; cv=none; b=SGMyxbzdd80y/Pmkx/XCHR0MJQPqbRoagc+RJ/OdJZ1zf5kaACGGP1bFBbP4tPou26jB8YM4ZWXXMWkV4D7icTr0NUupWdY6QJUEWLgBSxq6Fuzrd+D0JmAcr1qO8EJQqqtmQn7J0iW/GMlMmoUz77mh5hU8vEJTOP5zdh4u9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688700; c=relaxed/simple;
	bh=S5miTwQjKtUGk4+tBA+XNJT4ocOUhvHK6OTAEig+7Y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sr7LZacIS/yG+BqcrUySd4wRjcRT9s+H3rM57kWnYnzW52MFze+ZPn7D8kjGEC7R5nUVn6tR+yNTHksFikVh0zQusTQ5RIaaW2apFeeUwiSQ0D1innQxeBY0YSYcKbRYKcm2XxS8werigYD0Ih3Jg+55v1AWgqek99DnHxO4i8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UdaBgOgN; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7082ad1355bso6115597b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688697; x=1747293497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+w+9EINo0lX9EJXtPXbnuVVO6F/k1kru+gtfl2aKLk=;
        b=UdaBgOgNgI6ckEC5syzbJLabpPaV7rTaqtHTU253E/0wQ4h92vy5nGxpPKTYQz9Ccj
         Nkcbc/TjdvLNkM2aeC03rR2ipN5AlTYAUORecAlupW9dMR0pvFpPd04OKtOc3089bMN6
         7oKABBDPYkAbcKmFQ6VSS+15wAy5ustQRVAWYBAf3gSubOJATpSYu6gs7MMFAcLikQe6
         M+AkhuguLwxcMy6DzCEIU8cjtAxhfm2HTTfYtLSlHFTKYK0KqYWvEB/MlL2wI3/26mSi
         zXXCsIywh0GuC8R/IA/1AGUM5JDeooZcsnmc6abFKuhnjQYUxMGJRWFu8iwBS8xoMlxi
         IGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688697; x=1747293497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+w+9EINo0lX9EJXtPXbnuVVO6F/k1kru+gtfl2aKLk=;
        b=pKpuZF1sgYx6PqxtAw0YA1mRIliB5vNMqNfqHIlkXR3ocNJ2axtZM1ctG2BgwLIi9d
         0bK6KRHdGX37km5BhuCjW9ncBEio89M5xR4AtKF0x8Y/jNCgwYN5HaHK+i8p4kZiJEuF
         /f5WPbtJ5xwrIllxHMBcDG624kj0/XHUrpx0R22d2ffIaYfAPBk0ujnu8lfyCT8sXtDj
         K8tDko5T5h/Gua7fIZtlz42Ka+06TdONKv2uupmYX0ReoRK40XoZVkln9RdVnQahWy7z
         ig1e5O4Myj31jdf/qiPqX1lfei1Mg/qIP8E5B4RqlEi+QQGfoGjfDYK3UNU2u8wzIqVD
         Z+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZLEpzq67zsOFTUjsyOayH/tkNm7Fj0EtiJ79qxAtvZ8N9CGNJCdiUCiA0u26zqPw0XsikC99SND+Fd+wL@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5b5dkdJWSS+opez7IdmI7d8XDfAcByQPKbOhV/DFI2VXhsmS
	5tcwWuMgBicD7GF81rtH4kURFIo2CEQwCk2RPo/ZIx62qvm/DRjufB+V/dhEe55fuTGXf3xESIp
	TS94ncP5GK4AITyVCrS9DY4/qKy2pwsvZv6E5nA==
X-Gm-Gg: ASbGnctOoXDHFgORlDHKXv6DF7s7Wg3AuslwW99KCLoB6fgNeECA2XTJM+h/EhdNf7t
	M5IQNcBixzwcBItPii7809bP+aM2DY2Hla1t7DgLP3MBkZVF9hYtv52IQyExhgu77WVZaToIg97
	v8kAbmTI8Sd8B3mZxg2eFqhw==
X-Google-Smtp-Source: AGHT+IH51os8fHvy3MAakr7dpD0MInwd0ULz+Lr+M+W4+Dm5+oufyZh79e6I8shKBJmO2DKjt0Mu77XsFMWH8KSoBhs=
X-Received: by 2002:a05:690c:48c6:b0:708:7b42:7b98 with SMTP id
 00721157ae682-70a1da6db90mr83461097b3.9.1746688697118; Thu, 08 May 2025
 00:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206112225.3270400-1-quic_mohs@quicinc.com>
 <20250206112225.3270400-4-quic_mohs@quicinc.com> <4ddd6855-3817-4dc4-81c4-d8ddaa039865@oss.qualcomm.com>
In-Reply-To: <4ddd6855-3817-4dc4-81c4-d8ddaa039865@oss.qualcomm.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Thu, 8 May 2025 15:18:06 +0800
X-Gm-Features: ATxdqUFpg-ULIFAYhb5Zs4xVblqJNC1eTqm6s5EV0MB8ljI_jnDHI_Nm1Xe_U-A
Message-ID: <CAMSo37U1kJq_gK8jiW9iMbhHXtn=Chr7NawiK4fPUPj4kyqH2w@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] soundwire: qcom: Add set_channel_map api support
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com, 
	kernel@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Mohammad

On Mon, 10 Feb 2025 at 11:30, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
>
>
> On 2/6/2025 7:22 PM, Mohammad Rafi Shaik wrote:
> > Added qcom_swrm_set_channel_map api to set the master channel mask for
> > TX and RX paths based on the provided slots.
> >
> > Added a new field ch_mask to the qcom_swrm_port_config structure.
> > This field is used to store the master channel mask, which allows more
> > flexible to configure channel mask in runtime for specific active
> > soundwire ports.
> >
> > Modified the qcom_swrm_port_enable function to configure master
> > channel mask. If the ch_mask is set to SWR_INVALID_PARAM or is zero,
> > the function will use the default channel mask.
> >
> > Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > Acked-by: Vinod Koul <vkoul@kernel.org>
> > ---

There is one "UBSAN: array index out of bounds" kernel panic reported
by one of our db845c Android builds,
the kernel panic is something like the following:
    [   34.478844][   T12] CPU: 1 UID: 0 PID: 12 Comm: kworker/u32:0
Tainted: G        W   E       6.15.0-rc5-mainline-g3d5bad71a798-4k #1
PREEMPT  6c0487950a65cef6b999d2d67be1f493cc9d9cb7
    [   34.495133][   T12] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
    [   34.500663][   T12] Hardware name: Thundercomm Dragonboard 845c (DT)
    [   34.507072][   T12] Workqueue: events_unbound deferred_probe_work_func
    [   34.513667][   T12] pstate: 20400005 (nzCv daif +PAN -UAO -TCO
-DIT -SSBS BTYPE=--)
    [   34.521392][   T12] pc : qcom_swrm_set_channel_map+0x208/0x210
[soundwire_qcom]
    [   34.528776][   T12] lr : snd_soc_dai_set_channel_map+0x50/0x8c
    [   34.534670][   T12] sp : ffffffc0800b3910
    [   34.538715][   T12] x29: ffffffc0800b3910 x28: ffffff808e65d090
x27: ffffffed1b8edec8
    [   34.546622][   T12] x26: ffffffed1b8edec8 x25: ffffff808c579c80
x24: ffffff808c6ff480
    [   34.554527][   T12] x23: 0000000000000002 x22: ffffff808cebea80
x21: ffffff808e639080
    [   34.562433][   T12] x20: ffffff808e63a880 x19: ffffff808cebea80
x18: ffffffc0800b50a0
    [   34.570334][   T12] x17: 00000000e068a532 x16: 00000000e068a532
x15: 00000000035fc49d
    [   34.578241][   T12] x14: 000000003b9243a6 x13: 00000000ec1dbcad
x12: ffffff93e1f38000
    [   34.586145][   T12] x11: 0000009b0000009a x10: 0000008100000080
x9 : 000000000000008e
    [   34.594051][   T12] x8 : ffffff808e463080 x7 : 0000000000000000
x6 : ffffffed1a0779c0
    [   34.601951][   T12] x5 : ffffff808034ba80 x4 : ffffffc0800b3970
x3 : 000000000000000d
    [   34.609857][   T12] x2 : ffffffc0800b3930 x1 : 0000000000000010
x0 : ffffff808cebea80
    [   34.617763][   T12] Call trace:
    [   34.620944][   T12]  qcom_swrm_set_channel_map+0x208/0x210
[soundwire_qcom e3a7c79ee66106e972319e98e81c50cf82a5307f] (P)
    [   34.631908][   T12]  sdm845_dai_init+0x1d8/0x2f4
[snd_soc_sdm845 1c888555a3e29ffd70a1064d1f53d421696609ba]
    [   34.641644][   T12]  snd_soc_link_init+0x48/0x88
    [   34.646314][   T12]  snd_soc_bind_card+0x734/0xbc4
    [   34.651157][   T12]  snd_soc_register_card+0xf8/0x110
    [   34.656261][   T12]  devm_snd_soc_register_card+0x54/0xa0
    [   34.661709][   T12]  sdm845_snd_platform_probe+0x13c/0x144
[snd_soc_sdm845 1c888555a3e29ffd70a1064d1f53d421696609ba]
    [   34.672314][   T12]  platform_probe+0xa8/0xe8
    [   34.676715][   T12]  really_probe+0x11c/0x45c
    [   34.681116][   T12]  __driver_probe_device+0xac/0x168
    [   34.686219][   T12]  driver_probe_device+0x44/0x1b4
    [   34.691150][   T12]  __device_attach_driver+0x108/0x184
    [   34.696426][   T12]  bus_for_each_drv+0x114/0x170
    [   34.701183][   T12]  __device_attach+0xc8/0x1a8
    [   34.705757][   T12]  device_initial_probe+0x1c/0x2c
    [   34.710678][   T12]  bus_probe_device+0x9c/0x128
    [   34.715341][   T12]  deferred_probe_work_func+0xc8/0x134
    [   34.720706][   T12]  process_one_work+0x26c/0x614
    [   34.725462][   T12]  worker_thread+0x268/0x3b8
    [   34.729954][   T12]  kthread+0x164/0x294
    [   34.733923][   T12]  ret_from_fork+0x10/0x20
    [   34.738251][   T12] Code: 39190109 54000061 2a1f03e0 d65f03c0 (d42aa240)
    [   34.745094][   T12] ---[ end trace 0000000000000000 ]---
    [   34.750456][   T12] Kernel panic - not syncing: UBSAN: array
index out of bounds: Fatal exception
    [   34.759398][   T12] SMP: stopping secondary CPUs
    [   34.964362][   T12] Kernel Offset: 0x2c99200000 from 0xffffffc080000000
    [   34.971037][   T12] PHYS_OFFSET: 0x80000000
    [   34.975258][   T12] CPU features: 0x0000,00000248,01002650,8200721b
    [   34.981581][   T12] Memory Limit: none

With my investigation, IIUC, it seems related to the following tree variables:
    #define QCOM_SDW_MAX_PORTS 14
    #define SLIM_MAX_TX_PORTS 16
    #define SLIM_MAX_RX_PORTS 13

QCOM_SDW_MAX_PORTS is used to declare the pconfig array,
SLIM_MAX_TX_PORTS and SLIM_MAX_RX_PORTS
are used to declare the rx_ch and tx_ch arrays in the sdm845_dai_init
function, which are finally passed
to qcom_swrm_set_channel_map as the rx_slot and tx_slot,

And I could confirm that the panic is not reported if this commit is reverted.
I also tried to add one debug line to print the value of the related
numbers in qcom_swrm_set_channel_map,
and here is the output
    [ 34.143174][ T115] drivers/soundwire/qcom.c 1287
qcom_swrm_set_channel_map tx_num=16, rx_num=13, QCOM_SDW_MAX_PORTS=14,
ARRAY_SIZE(ctrl->pconfig)=15

which could help to confirm the "array index out of bounds" error as well.

Could you please help to have a check, and give some suggestions?

Thanks,
Yongqin Liu


> >   drivers/soundwire/qcom.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index 0f45e3404756..295a46dc2be7 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -156,6 +156,7 @@ struct qcom_swrm_port_config {
> >       u8 word_length;
> >       u8 blk_group_count;
> >       u8 lane_control;
> > +     u8 ch_mask;
> >   };
> >
> >   /*
> > @@ -1048,9 +1049,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
> >   {
> >       u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
> >       struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> > +     struct qcom_swrm_port_config *pcfg;
> >       u32 val;
> >
> > +     pcfg = &ctrl->pconfig[enable_ch->port_num];
> >       ctrl->reg_read(ctrl, reg, &val);
> > +     if (pcfg->ch_mask != SWR_INVALID_PARAM && pcfg->ch_mask != 0)
> > +             enable_ch->ch_mask = pcfg->ch_mask;
> >
> >       if (enable_ch->enable)
> >               val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> > @@ -1270,6 +1275,26 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
> >       return ctrl->sruntime[dai->id];
> >   }
> >
> > +static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
> > +                                  unsigned int tx_num, const unsigned int *tx_slot,
> > +                                  unsigned int rx_num, const unsigned int *rx_slot)
> > +{
> > +     struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> > +     int i;
> > +
> > +     if (tx_slot) {
> > +             for (i = 0; i < tx_num; i++)
> > +                     ctrl->pconfig[i].ch_mask = tx_slot[i];
> > +     }
> > +
> > +     if (rx_slot) {
> > +             for (i = 0; i < rx_num; i++)
> > +                     ctrl->pconfig[i].ch_mask = rx_slot[i];
> > +     }
> > +
> It looks like a hack.
> Consider the situation: if(tx_slot) is true and if(rx_slot) is true. So
> the ch_mask always overwritten by rx_slot?
>
> > +     return 0;
> I think you dont need the return value here. Just void is ok.
>
> Thanks,
> Jie
>
> > +}
> > +
> >   static int qcom_swrm_startup(struct snd_pcm_substream *substream,
> >                            struct snd_soc_dai *dai)
> >   {
> > @@ -1306,6 +1331,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
> >       .shutdown = qcom_swrm_shutdown,
> >       .set_stream = qcom_swrm_set_sdw_stream,
> >       .get_stream = qcom_swrm_get_sdw_stream,
> > +     .set_channel_map = qcom_swrm_set_channel_map,
> >   };
> >
> >   static const struct snd_soc_component_driver qcom_swrm_dai_component = {
>
>


--
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

