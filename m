Return-Path: <linux-arm-msm+bounces-52359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA3A6DF6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEE5F188DA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0D32638B5;
	Mon, 24 Mar 2025 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVuZKjCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A42638B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833130; cv=none; b=Eb870G+S5HyCz5T0jt36/zsXeGIfPfrfSQFnWn4D1f8FgjkvsXoRslCLmqezr+mrvybFeMzspjApN1utFOvA5VA42YAy9iJcsQnm9a2anWM9SwLmjVnPhkTwDXHyL0zZiC8HJ/6hkKe9cXTBuDmBbVlme5pzPzB9n5mLkIBTcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833130; c=relaxed/simple;
	bh=FhoXOYAA1iz/4SuQApCmCCm7e20hHuDPIHWlBiVTuas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcy7RxJ3jxJz6M+RQ+mRYNbQGAHjdNUnvBC/duuLZ4FnmHoGhqiyOnFk5gyG0oJ6crJ9Eh38LOE9WU0u0i3dctSH541+8KGcLiSOtRJ9havumVzj4kcz7PQHk2EUQIzONK3ZPJJw7KMY0EJyb3X0i8GQusLu4YCq0CKhAezTdWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVuZKjCz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9POZq030755
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wlqnd0XrME7ieQy3eY1m4t2l
	0GttO4vmYnyHol1MECg=; b=FVuZKjCzLD2+hAjZyrfggO4TbayQ+2FalZEUdx0h
	TxNhn0mqqPMwv/+WI8f8OCCOsBq8CN9W7jCTp3MRhXxgrRQO91GtuigWM252ybrT
	3WHONsjZ42N0ybxJlgejnEN/UTxO1pF5Bou3xarTS6X9cOwcExyL7xKia8pu1OuB
	3aKGRRKEN3dhhF2IQDVsEu9qfuHayx1prrbJoqzv29xuWD7Ezhn821WNhFYGetRa
	jG9aN5EA9nY4iONowS7XBt5xU+uIpQWB56APPDvSAvCvHtelWKHbwd0JwEjuO8Tt
	ROChe4i4q14uhkbrRtHT8rX4rU8bGwASadF6FNN36gJwTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmt04vtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:18:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0a3ff7e81so854182185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 09:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833125; x=1743437925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlqnd0XrME7ieQy3eY1m4t2l0GttO4vmYnyHol1MECg=;
        b=XdhPKNbWVRp/yJgkCqIYPijIvnaNSUyvvJ9m3eUDLUHfhr2v+32mTpXm+0hJ/xhkeK
         uZwEhBKGv6Z8skTSKkoGFZUWXsbP3UhQNCvYx6BzYe+4Sf2UGthH6wdabLL5kG65+bXf
         yj9GE6DWZl7kVD6X765GX9XJoR0gwKDN3JY+K5+UPTKZO2vEuyvz3O4oCd0vr9yFsaTS
         7sTNPGzNlrgPlKWyJSvHmHG7kwUpgqEaEWguYuCCyvx/9i43Z0A7nMWsgMfQd0Kgn41u
         RcYz2gQeKk7Zq6/CdC6W3hPSz9B+xiAeo2sA0O5uRh88YIyYzbi05DbseCJAOs/sVQ35
         dpBA==
X-Forwarded-Encrypted: i=1; AJvYcCUWvcgs8SC38MrleDrhL56zEVXt0oPL1ei2DEJnKNE0RVA44phUfEdt/fuY32xZL6DCL13S/4reXB4dliep@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/oRctUVtz1tapoqcgYvIXov8ju9UQT9b+zLCe6QC6gA0eqKO
	96d3WgAcOtlEasn4LPQBTYBqQVrJldqahDem9iB6TlxtgV2UppejBagT/F3Ljq8WBWZgkITJQEo
	mCJ4E59qlak7gFS85Ime9mgIeoKGZcWg1CvhpMmgLCggDDEIQzpNYmOnhN70rj7Ee
X-Gm-Gg: ASbGnctkAuRm0uXQLVgd9n1wtSKYUC/umLGnkSx8BUdcZdqwAfh/Yw15ICNVx40vVrX
	MMYZEySHopb8LCCUDUxNw00oLrYfBl451qts9NK4vD7i0pppBz17esN5fEspRiIc2ZDF2A+qieJ
	0P347rihYcuw1v5sTvBU3E1Vo0F6LT0lX87VsDdOxUkALjRT40XN8Wu/6dKTwDOr7r+WekzG5bQ
	Q4SnB9bxZ9lTsDnSlWr28UpHaWTlg7jcScTd7j0EB9WH5WGTxvO9u+E8+Kof8SbAXLCvvvqevVb
	0aXGY/bl4oMiKDHxexSlj6bb1W3KhPjLx3CuPiGVPet2jYl3NFnilORzF4bgEe0BMmbvQ4Yuo9h
	P8K0=
X-Received: by 2002:a05:620a:46a5:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7c5ba1476f2mr1698184385a.15.1742833124485;
        Mon, 24 Mar 2025 09:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0TAppUS3Au1eXF33air+jgVxzflNCCe1SVJzl/UnSMYgb3QVULayRcEbJnNV1cMl1e1FQQg==
X-Received: by 2002:a05:620a:46a5:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7c5ba1476f2mr1698179385a.15.1742833123865;
        Mon, 24 Mar 2025 09:18:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b635sm1188629e87.63.2025.03.24.09.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:18:42 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:18:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <fdshfu4g5bzrpva4skvydh5lizhtkqoskivoda7q2ai5byqd4j@rjza74mudtz5>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
 <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
 <ctcqkdbv6zh2rabkkr7tlhxlcfsn5nazjfbsnbbu4l4blyakft@pejdsvnazfh6>
 <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
X-Proofpoint-GUID: At7C4Pd_JjkpaIIwclLokFNvITtjbnC6
X-Proofpoint-ORIG-GUID: At7C4Pd_JjkpaIIwclLokFNvITtjbnC6
X-Authority-Analysis: v=2.4 cv=aqGyCTZV c=1 sm=1 tr=0 ts=67e185e5 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=9UW2u0tblTimzNtmCfUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240117

On Mon, Mar 24, 2025 at 03:58:32PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 24/03/2025 15:18, Dmitry Baryshkov wrote:
> > On Mon, Mar 24, 2025 at 01:58:06PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 24/03/2025 13:50, Dmitry Baryshkov wrote:
> > > > On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
> > > > > 
> > > > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > 
> > > > > On some platforms to minimise pop and click during switching between
> > > > > CTIA and OMTP headset an additional HiFi mux is used. Most common
> > > > > case is that this switch is switched on by default, but on some
> > > > > platforms this needs a regulator enable.
> > > > > 
> > > > > move to using mux control to enable both regulator and handle gpios,
> > > > > deprecate the usage of gpio.
> > > > > 
> > > > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > > > ---
> > > > >    sound/soc/codecs/Kconfig   |  1 +
> > > > >    sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
> > > > >    2 files changed, 40 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > > > > index ee35f3aa5521..a2829d76e108 100644
> > > > > --- a/sound/soc/codecs/Kconfig
> > > > > +++ b/sound/soc/codecs/Kconfig
> > > > > @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
> > > > >           tristate
> > > > >           depends on SOUNDWIRE || !SOUNDWIRE
> > > > >           select SND_SOC_WCD_CLASSH
> > > > > +       select MULTIPLEXER
> > > > > 
> > > > >    config SND_SOC_WCD938X_SDW
> > > > >           tristate "WCD9380/WCD9385 Codec - SDW"
> > > > > diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> > > > > index dfaa3de31164..88c758efe40d 100644
> > > > > --- a/sound/soc/codecs/wcd938x.c
> > > > > +++ b/sound/soc/codecs/wcd938x.c
> > > > > @@ -19,6 +19,7 @@
> > > > >    #include <linux/regmap.h>
> > > > >    #include <sound/soc.h>
> > > > >    #include <sound/soc-dapm.h>
> > > > > +#include <linux/mux/consumer.h>
> > > > >    #include <linux/regulator/consumer.h>
> > > > > 
> > > > >    #include "wcd-clsh-v2.h"
> > > > > @@ -178,6 +179,8 @@ struct wcd938x_priv {
> > > > >           int variant;
> > > > >           int reset_gpio;
> > > > >           struct gpio_desc *us_euro_gpio;
> > > > > +       struct mux_control *us_euro_mux;
> > > > > +       u32 mux_state;
> > > > >           u32 micb1_mv;
> > > > >           u32 micb2_mv;
> > > > >           u32 micb3_mv;
> > > > > @@ -3235,17 +3238,31 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
> > > > >                   dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
> > > > >    }
> > > > > 
> > > > > -static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> > > > > +static int wcd938x_select_mux_state(struct device *dev, struct wcd938x_priv *wcd938x, int state)
> > > > >    {
> > > > > -       int value;
> > > > > +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
> > > > 
> > > > Hmm. Does this really work? You have selected the mux in probe
> > > > function, now you are trying to select it again. If I'm reading the
> > > > code correctly, you will get -EBUSY here.
> > > 
> > > On successful selection of mux state, the mux will be kept available
> > > (mux_control_deselect) for any new callers.
> > > 
> > > So we will not get EBUSY for the second caller.
> > 
> > No. wcd938x_populate_dt_data() selects the state by calling
> > wcd938x_select_mux_state().
> 
> At this point we also released it (both in success and error case).

By which code path? You call this function directly from
wcd938x_swap_gnd_mic() and the control is already selected from the
probe path.

> This will hold on to the previous state unless we have defined a fallback
> idle-state.

As I wrote, this doesn't seem to be a proper use of MUX API. I think
it's much easier to add a boolean which states that MUX has been
selected and use it to deselect the state both in this function and in
shutdown path.

Another option is really to expand the MUX API to add 'switch state'
call which will work if the state is already selected.

> 
> 
>  Then you call mux_control_try_select() here.
> > As far as I understand, it will return -EBUSY as the sempahore is > already taken. Moreover, this is not how the MUX API is supposed to be
> > used. The driver is supposed to hold a state while it is still in use.
> > 
> > > 
> > > --srini
> > > > 
> > > > > 
> > > > > -       struct wcd938x_priv *wcd938x;
> > > > > +       if (ret) {
> > > > > +               dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> > > > > +               return ret;
> > > > > +       }
> > > > > 
> > > > > -       wcd938x = snd_soc_component_get_drvdata(component);
> > > > > +       wcd938x->mux_state = state;
> > > > > +       mux_control_deselect(wcd938x->us_euro_mux);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > 
> > > > > -       value = gpiod_get_value(wcd938x->us_euro_gpio);
> > > > > +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> > > > > +{
> > > > > +       struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> > > > > 
> > > > > -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
> > > > > +       if (wcd938x->us_euro_mux) {
> > > > > +               if (wcd938x_select_mux_state(component->dev, wcd938x, !wcd938x->mux_state))
> > > > > +                       return false;
> > > > > +       } else {
> > > > > +               gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);

Which codepath will update mux_state in case of the GPIO?

> > > > > +       }
> > > > > 
> > > > >           return true;
> > > > >    }
> > > > > @@ -3261,11 +3278,22 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> > > > >                   return dev_err_probe(dev, wcd938x->reset_gpio,
> > > > >                                        "Failed to get reset gpio\n");
> > > > > 
> > > > > -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> > > > > -                                               GPIOD_OUT_LOW);
> > > > > -       if (IS_ERR(wcd938x->us_euro_gpio))
> > > > > -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> > > > > -                                    "us-euro swap Control GPIO not found\n");
> > > > > +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> > > > > +       if (IS_ERR(wcd938x->us_euro_mux)) {
> > > > > +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> > > > > +                       return -EPROBE_DEFER;
> > > > > +
> > > > > +               /* mux is optional and now fallback to using gpio */
> > > > > +               wcd938x->us_euro_mux = NULL;
> > > > > +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> > > > > +               if (IS_ERR(wcd938x->us_euro_gpio))
> > > > > +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> > > > > +                                            "us-euro swap Control GPIO not found\n");
> > > > > +       } else {
> > > > > +               ret = wcd938x_select_mux_state(dev, wcd938x, wcd938x->mux_state);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > > > +       }
> > > > > 
> > > > >           cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
> > > > > 
> > > > > --
> > > > > 2.39.5
> > > > > 
> > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry

