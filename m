Return-Path: <linux-arm-msm+bounces-33752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A082E9979A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 218871F231C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 00:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728A063C;
	Thu, 10 Oct 2024 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="c3phwLCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A128107B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728520439; cv=none; b=puDrxZ+WAOGlplyizQM48GLwjDveB1kLurYAVwU6+loS2cpSVSLt35FJ8SG6Yu18S22zll9N3+mSd/Lni4vKv3AiN0WRqJfDFR2aYfuEACHGlkt4jnyy85mE7xWjy5u2JB5vx+L13FVXTmlRYvDsHgLnlfDMGVBC2JI92h2amxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728520439; c=relaxed/simple;
	bh=ZeelYH8VnNj//5IJ4M8ZOuzZBtXZAbw71SorIgb+7s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QC5YCrUnb0Hxcl9obb/CV0f4AuDlAQmvV9lgw8h2pg9cwYw/RqFenwgD7JUshUPHaMDqYluNGYtR9P9krzLSXJ9lF5DnwUBhGrfyT2YkC2/38pw/Tp3IrAx0DdNDaK124DgjmoRZ92xylUsUWfwCfBdqOc4AiKU2mb6zXoTET7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=c3phwLCL; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c91d0eadbfso412926a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 17:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1728520436; x=1729125236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3fKVGSAlNjckIiZ+oe9M59U57xg/4iYvvzitdxkMa8=;
        b=c3phwLCLCwgFRZDBd1KltOj+VwC72ILaxgKPGJ7o63+xsNY7R61J5eNXjeJvgXOfgM
         2xL16rWCS6+sx7x2YG5iXq0rjeTgPMLj/nEBT3yTcCixukY3FdWrPk0ASj75ovYBz8N2
         q2t5Q2V1rY4CsGe1IRSD+yFR9uqv+ezEoZzWcSxcigORdpWpqAnfXsAkETdRmpRnthUu
         qmQ4/OMoOptAgMfDcA6i8yhvB/cPHKstd+8Qpp+esB/F10CNQiaM61wTAqrKwCBDQPEe
         Y7IcoqCodwhSA2jJkIATfOeIWyZ3GMqA/XdYFjnCYqeHDgRveTtUUzMfjDdSsQ8iQM6p
         lk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728520436; x=1729125236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3fKVGSAlNjckIiZ+oe9M59U57xg/4iYvvzitdxkMa8=;
        b=jhKvndTlaoyPUtJ1Irw1mHfGXBjL9okbjOyrXuybVz+QlndFb2C5YKzsk90AqPB52v
         pwLB0ZTw1bKkTYQRJ/oU9/XhO48vU+7vZVMy7GtE+/RMzFiccZAqAPA92Bobr77Emge9
         eZES32ESmnpr4WDpq/5nbbrga0ALN2pJTNwVXv4wQrkHJ/p7yOD2RIq7N3LOAHfhCyeL
         fzwYRe5durC7oZ19KDbnu/O++HUch7wd7TCnHlLM8+QFcGLgM0khZJ9P/IDbkQ06lK+e
         +dFJIPSJJQCbGePytFTSru2A8wlKDy4uChnFhmo4Vi4dKDy5TmK9gGZ6I9AirTKlvt5o
         FcWw==
X-Forwarded-Encrypted: i=1; AJvYcCUh6Q4rhPJXrMXPhHD6rG7/EvNyxKIs1PJupTXXz/xhT21RhbF9SlgOX7xewVcwIeiHl9KbKkJg6gXvNQuO@vger.kernel.org
X-Gm-Message-State: AOJu0YxPC4ipyMdBJhJnpWaaIqhvvxSXpBsWiExVZyaJizAiBJcJ486u
	4zJT7uJcB3elK0zFKIaHh29zNHfM7roT7Gf87OC8+PU9bqmqSAEh7KDDgHx87/EtFuCKON/wROd
	wv1yvVP1BPC/5O/Bd4VFCUvO9hEetWI6sC9kJdq+8qO7tKEfGXB8=
X-Google-Smtp-Source: AGHT+IHmmF/XDWlMuPhBm1Jg1GUTwu6Xp949ldgPO2FAE0Mfw7lrJ/pqJc7oe8PlgA4Dsq4A+gL+Y5wglhMUs08dZwM=
X-Received: by 2002:a05:6402:13c1:b0:5c7:927:6a5e with SMTP id
 4fb4d7f45d1cf-5c91d63dad5mr3159171a12.21.1728520435836; Wed, 09 Oct 2024
 17:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
In-Reply-To: <20241009213922.999355-1-alexey.klimov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Wed, 9 Oct 2024 19:33:44 -0500
Message-ID: <CAKXuJqiK3BHT-=3zyT1tbunpNF1b_gyZUAd4EE2FY2r7TbaXug@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime stream alloc
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org, broonie@kernel.org, 
	dmitry.baryshkov@linaro.org, krzysztof.kozlowski@linaro.org, 
	pierre-louis.bossart@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

On Wed, Oct 9, 2024 at 4:39=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:
>
> During the migration of Soundwire runtime stream allocation from
> the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
> soundcard was forgotten.
>
> At this point any playback attempt or audio daemon startup, for instance
> on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
> NULL dereference:
>
>  Unable to handle kernel NULL pointer dereference at virtual
>  address 0000000000000020
>  Mem abort info:
>    ESR =3D 0x0000000096000004
>    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>    SET =3D 0, FnV =3D 0
>    EA =3D 0, S1PTW =3D 0
>    FSC =3D 0x04: level 0 translation fault
>  Data abort info:
>    ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
>    CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>    GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
>  user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000101ecf000
>  [0000000000000020] pgd=3D0000000000000000, p4d=3D0000000000000000
>  Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>  Modules linked in: ...
>  CPU: 5 UID: 0 PID: 1198 Comm: aplay
>  Not tainted 6.12.0-rc2-qcomlt-arm64-00059-g9d78f315a362-dirty #18
>  Hardware name: Thundercomm Dragonboard 845c (DT)
>  pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>  pc : sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
>  lr : sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
>  sp : ffff80008a2035c0
>  x29: ffff80008a2035c0 x28: ffff80008a203978 x27: 0000000000000000
>  x26: 00000000000000c0 x25: 0000000000000000 x24: ffff1676025f4800
>  x23: ffff167600ff1cb8 x22: ffff167600ff1c98 x21: 0000000000000003
>  x20: ffff167607316000 x19: ffff167604e64e80 x18: 0000000000000000
>  x17: 0000000000000000 x16: ffffcec265074160 x15: 0000000000000000
>  x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
>  x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff167600ff1cec
>  x5 : ffffcec22cfa2010 x4 : 0000000000000000 x3 : 0000000000000003
>  x2 : ffff167613f836c0 x1 : 0000000000000000 x0 : ffff16761feb60b8
>  Call trace:
>   sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
>   wsa881x_hw_params+0x68/0x80 [snd_soc_wsa881x]
>   snd_soc_dai_hw_params+0x3c/0xa4
>   __soc_pcm_hw_params+0x230/0x660
>   dpcm_be_dai_hw_params+0x1d0/0x3f8
>   dpcm_fe_dai_hw_params+0x98/0x268
>   snd_pcm_hw_params+0x124/0x460
>   snd_pcm_common_ioctl+0x998/0x16e8
>   snd_pcm_ioctl+0x34/0x58
>   __arm64_sys_ioctl+0xac/0xf8
>   invoke_syscall+0x48/0x104
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x34/0xe0
>   el0t_64_sync_handler+0x120/0x12c
>   el0t_64_sync+0x190/0x194
>  Code: aa0403fb f9418400 9100e000 9400102f (f8420f22)
>  ---[ end trace 0000000000000000 ]---
>
> 0000000000006108 <sdw_stream_add_slave>:
>     6108:       d503233f        paciasp
>     610c:       a9b97bfd        stp     x29, x30, [sp, #-112]!
>     6110:       910003fd        mov     x29, sp
>     6114:       a90153f3        stp     x19, x20, [sp, #16]
>     6118:       a9025bf5        stp     x21, x22, [sp, #32]
>     611c:       aa0103f6        mov     x22, x1
>     6120:       2a0303f5        mov     w21, w3
>     6124:       a90363f7        stp     x23, x24, [sp, #48]
>     6128:       aa0003f8        mov     x24, x0
>     612c:       aa0203f7        mov     x23, x2
>     6130:       a9046bf9        stp     x25, x26, [sp, #64]
>     6134:       aa0403f9        mov     x25, x4        <-- x4 copied to x=
25
>     6138:       a90573fb        stp     x27, x28, [sp, #80]
>     613c:       aa0403fb        mov     x27, x4
>     6140:       f9418400        ldr     x0, [x0, #776]
>     6144:       9100e000        add     x0, x0, #0x38
>     6148:       94000000        bl      0 <mutex_lock>
>     614c:       f8420f22        ldr     x2, [x25, #32]!  <-- offset 0x44
>     ^^^
> This is 0x6108 + offset 0x44 from the beginning of sdw_stream_add_slave()
> where data abort happens.
> wsa881x_hw_params() is called with stream =3D NULL and passes it further
> in register x4 (5th argument) to sdw_stream_add_slave() without any check=
s.
> Value from x4 is copied to x25 and finally it aborts on trying to load
> a value from address in x25 plus offset 32 (in dec) which corresponds
> to master_list member in struct sdw_stream_runtime:
>
> struct sdw_stream_runtime {
>         const char  *              name;        /*     0     8 */
>         struct sdw_stream_params   params;      /*     8    12 */
>         enum sdw_stream_state      state;       /*    20     4 */
>         enum sdw_stream_type       type;        /*    24     4 */
>         /* XXX 4 bytes hole, try to pack */
>  here-> struct list_head           master_list; /*    32    16 */
>         int                        m_rt_count;  /*    48     4 */
>         /* size: 56, cachelines: 1, members: 6 */
>         /* sum members: 48, holes: 1, sum holes: 4 */
>         /* padding: 4 */
>         /* last cacheline: 56 bytes */
>
> Fix this by adding required calls to qcom_snd_sdw_startup() and
> sdw_release_stream() to startup and shutdown routines which restores
> the previous correct behaviour when ->set_stream() method is called to
> set a valid stream runtime pointer on playback startup.
>
> Reproduced and then fix was tested on db845c RB3 board.
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: stable@vger.kernel.org
> Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to =
soundcards")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/sdm845.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 75701546b6ea..a479d7e5b7fb 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -15,6 +15,7 @@
>  #include <uapi/linux/input-event-codes.h>
>  #include "common.h"
>  #include "qdsp6/q6afe.h"
> +#include "sdw.h"
>  #include "../codecs/rt5663.h"
>
>  #define DRIVER_NAME    "sdm845"
> @@ -416,7 +417,7 @@ static int sdm845_snd_startup(struct snd_pcm_substrea=
m *substream)
>                 pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id=
);
>                 break;
>         }
> -       return 0;
> +       return qcom_snd_sdw_startup(substream);
>  }
>
>  static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
> @@ -425,6 +426,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_subst=
ream *substream)
>         struct snd_soc_card *card =3D rtd->card;
>         struct sdm845_snd_data *data =3D snd_soc_card_get_drvdata(card);
>         struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +       struct sdw_stream_runtime *sruntime =3D data->sruntime[cpu_dai->i=
d];
>
>         switch (cpu_dai->id) {
>         case PRIMARY_MI2S_RX:
> @@ -463,6 +465,9 @@ static void  sdm845_snd_shutdown(struct snd_pcm_subst=
ream *substream)
>                 pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id=
);
>                 break;
>         }
> +
> +       data->sruntime[cpu_dai->id] =3D NULL;
> +       sdw_release_stream(sruntime);
>  }
>
>  static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
> --
> 2.45.2
>
>
Thank you so much for tracking this down!  Was experiencing the same
thing on my Lenovo Yoga C630, and testing with this patch, I no longer
see the null pointer and also have working audio.

Tested-by: Steev Klimaszewski <steev@kali.org> # Lenovo Yoga C630

