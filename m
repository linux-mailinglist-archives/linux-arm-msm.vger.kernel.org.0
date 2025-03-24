Return-Path: <linux-arm-msm+bounces-52348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 955D7A6DC1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9250716EBE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AA625F78F;
	Mon, 24 Mar 2025 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A77I0csl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE6114F9FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824236; cv=none; b=Z5z55fyZq7ApiFuX6Rd9lqGnl9fY3j3ky0QgNOKViE6w5c19QQJaekhpCsEYumE3/onQULX3wPg4WlA2t2uxhnzx9il+U4K0fOnaL5P1ut+suCQHIhLAXPFReny6ObkGmGABzM1DL6yu2YlAK0C3xHmyMiYEk+AqNUTW0WH5CP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824236; c=relaxed/simple;
	bh=KH2AbP8hEOSyv2dSdRRqSFbyC0F8lwz0bs994ri1ioI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeizKftIIhunPYcCR0LwKqMoC3p6Pt9dbidowQRB5ZNO/8avxJnewotWVISmpGJgzgMkys7T+Fy454W61ZB74r8577Gury8dxxg9ezqnVIc6VYyFYsIUL15hXP2Wgr2OWWzaL6NX+7S3ozlI8W0qftl2dm1UpEJvacxT8UbAAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A77I0csl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PN4d004786
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95hHTOgsDguSuXKORfoFD7vr
	/pR9Ww99EDSaRcdphmo=; b=A77I0cslgUO6KN1avRSTcNvcEdxDhvbGDnAqsWYS
	1DiN3GG84OOsuDBjFqoch3J503z+vt58vf1Rc/tDcNA9XObdukHQnckRyuBcqpzH
	tgcM4NmzogXkGji8gdLnlZviqjw7uVtRXUuJevXmd0LZLAEnLqUEXsmKxwhvQhka
	lhnnlnSQFjC1MQzGeuod661zZAOxbxqds4j3GEkDmI4oVigs4DGXERU284JXsOFB
	ykEMTns9kINH7EmDXwAKgV8iAFeJCssaVwZmpbFO0xQru/sHuHcfvv+7QJDBJSlj
	LhB99VFEMtQcnDasXkeVRXP65bRkF1/kWRj5eXJlqsorCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm79mm9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:50:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff68033070so6938594a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824232; x=1743429032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95hHTOgsDguSuXKORfoFD7vr/pR9Ww99EDSaRcdphmo=;
        b=oSx/Vyt4eY2vlkPMmz1TFSzbUujgLDg8M7wdXM54kWXBRT5FC4w3LnSC3b82106UN4
         ZSbGo2pRyzLOnP+tezejP+EVEkXfJTVzbZt0sFxD56fJf65RttHSYKsnEOC1CW0gnnNe
         Jm/MDYUdzHyegVOCNpqujAIOeh7+TcYVCp2WZrtK54dTpxeBawufWBVNjBQOYNJi7qN+
         QDlEXZkhfWLS+bgpfJds0wT2DezF1oyEm1a7g+KkD53CPTEpJHtohmDa9BQMuYt/C8av
         LUc0/BmTSiapr9e3Cx2cB+dWcefUGUTerTvmYYJl0sv1JG3WMXzLriA4lMRvw2lMIx/Q
         TbzA==
X-Forwarded-Encrypted: i=1; AJvYcCWKVjYoYu4w+Qnk3BJCaKfMvjwD45r2OyWYJlQmY0o0uXVAqPK8N2X5RDNcQ4+B6KF+DUDYp2SrcLwxhMQJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp42+jIwLcSB6MIi8Ep6jSi4+ZD1uhqOHFzguxuUrKPxanBqzA
	S0J+mGb5ZzqyaNbfsW1Ll8BEyaYCAaP8iftiRMRdBj0K0xpDK1qndvHjGxPEG2r8nXlKmmMKTe6
	STfSh/2CVPPWIBQx1t9xdVDcu2vRWDs0gjJkNJGkeWDQUWTNqSZiRpjluOGEdDMIVM5kYAXUeQp
	mfsFAGBt6dIVnnbNUKSmpQdj1da8t9VNV4IHv6csNkPuR18WY=
X-Gm-Gg: ASbGncvX23KzhlVzEzvDYXIp0Z04EyjOJTfgdlj71ZmxoHhbTTHawgMOmhb2A7Uz8Td
	tyLwqz1IJkLoLBd1peJ2JXkxYy1c2yAj6DVuzSnILKT1Dg3sXNjCsAt4JD3r0Z1lq6vfkblwQVs
	KxS0oDd7kn5nb3Yx0BbBK8qvrt/wx81A==
X-Received: by 2002:a17:90b:4c0f:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-3030fe5b15bmr20207264a91.4.1742824231625;
        Mon, 24 Mar 2025 06:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXMOsAoGpdtih1+0ssF5i40YdS6JFQsTc0IGSXQBUtJaK2Mm+GfER10JaDD1Nn24M59aGXBRi9MPLEp7Jiixs=
X-Received: by 2002:a17:90b:4c0f:b0:2fe:99cf:f579 with SMTP id
 98e67ed59e1d1-3030fe5b15bmr20207201a91.4.1742824231062; Mon, 24 Mar 2025
 06:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org> <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 15:50:20 +0200
X-Gm-Features: AQ5f1JqiwDly8jNyPcDcoChNoCMpD8WkI2T1QYMZRnXTR-tMOVaIet3UtcOHoEE
Message-ID: <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Y8OiqEU-JYxGBgxZu2jCRjj9j5u9yL73
X-Proofpoint-ORIG-GUID: Y8OiqEU-JYxGBgxZu2jCRjj9j5u9yL73
X-Authority-Analysis: v=2.4 cv=IKYCChvG c=1 sm=1 tr=0 ts=67e16329 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=OAj1MUjZvtZXw01r514A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240100

On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
>
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  sound/soc/codecs/Kconfig   |  1 +
>  sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
>  2 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index ee35f3aa5521..a2829d76e108 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
>         tristate
>         depends on SOUNDWIRE || !SOUNDWIRE
>         select SND_SOC_WCD_CLASSH
> +       select MULTIPLEXER
>
>  config SND_SOC_WCD938X_SDW
>         tristate "WCD9380/WCD9385 Codec - SDW"
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index dfaa3de31164..88c758efe40d 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -19,6 +19,7 @@
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
> +#include <linux/mux/consumer.h>
>  #include <linux/regulator/consumer.h>
>
>  #include "wcd-clsh-v2.h"
> @@ -178,6 +179,8 @@ struct wcd938x_priv {
>         int variant;
>         int reset_gpio;
>         struct gpio_desc *us_euro_gpio;
> +       struct mux_control *us_euro_mux;
> +       u32 mux_state;
>         u32 micb1_mv;
>         u32 micb2_mv;
>         u32 micb3_mv;
> @@ -3235,17 +3238,31 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>                 dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>  }
>
> -static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> +static int wcd938x_select_mux_state(struct device *dev, struct wcd938x_priv *wcd938x, int state)
>  {
> -       int value;
> +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);

Hmm. Does this really work? You have selected the mux in probe
function, now you are trying to select it again. If I'm reading the
code correctly, you will get -EBUSY here.

>
> -       struct wcd938x_priv *wcd938x;
> +       if (ret) {
> +               dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> +               return ret;
> +       }
>
> -       wcd938x = snd_soc_component_get_drvdata(component);
> +       wcd938x->mux_state = state;
> +       mux_control_deselect(wcd938x->us_euro_mux);
> +
> +       return 0;
> +}
>
> -       value = gpiod_get_value(wcd938x->us_euro_gpio);
> +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> +{
> +       struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>
> -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
> +       if (wcd938x->us_euro_mux) {
> +               if (wcd938x_select_mux_state(component->dev, wcd938x, !wcd938x->mux_state))
> +                       return false;
> +       } else {
> +               gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
> +       }
>
>         return true;
>  }
> @@ -3261,11 +3278,22 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>                 return dev_err_probe(dev, wcd938x->reset_gpio,
>                                      "Failed to get reset gpio\n");
>
> -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> -                                               GPIOD_OUT_LOW);
> -       if (IS_ERR(wcd938x->us_euro_gpio))
> -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> -                                    "us-euro swap Control GPIO not found\n");
> +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> +       if (IS_ERR(wcd938x->us_euro_mux)) {
> +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> +                       return -EPROBE_DEFER;
> +
> +               /* mux is optional and now fallback to using gpio */
> +               wcd938x->us_euro_mux = NULL;
> +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> +               if (IS_ERR(wcd938x->us_euro_gpio))
> +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> +                                            "us-euro swap Control GPIO not found\n");
> +       } else {
> +               ret = wcd938x_select_mux_state(dev, wcd938x, wcd938x->mux_state);
> +               if (ret)
> +                       return ret;
> +       }
>
>         cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
>
> --
> 2.39.5
>


-- 
With best wishes
Dmitry

