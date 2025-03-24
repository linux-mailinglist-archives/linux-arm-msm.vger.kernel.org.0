Return-Path: <linux-arm-msm+bounces-52356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3FEA6DE21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B20B3A3B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 15:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5374325D909;
	Mon, 24 Mar 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Doa9pHwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9016741C85
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742829500; cv=none; b=I4AU7J6A0AKbH32sxNoulIN+pMNuVnYVF0j9lIcrumnvctYFLX0crvX162gnX4QawyfXi586UnUupk4XmbWOd1sli9gPkMRIg6fmQtaN0MfVUNJc8pNfUExTe98PsPWMDqJQLrYtYXY6rMblRH2AlPynoFhu3j3fizVUa9SqhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742829500; c=relaxed/simple;
	bh=XHQMUjEjbZLDgavTvCJiZqSwRVqVRVlMSHmpp7AADuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCSEDNENaz1sApKYzaUY/IxuWnJdC0pCLdBlw+DTDDBueijyPPFCJeZVbMtjGpo1K25ppy1Eo4hEB5DB/K5lMzhYQXrx1CAOmi/ti0e7U8Ozy8t6Bnr6QdqKp0NjqgaWnfTt2TsFAivs7c6cVoXXzUzq4VIb0fLhJ3mOCwhaMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Doa9pHwZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9POqr022028
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 15:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RBj5wpEg+SrAwIscXXtQbPvh
	Mb2gJI4cBrfY/nN2XHA=; b=Doa9pHwZCAMi1z2j69wrbna8FnDI9v5C8z4d9+p9
	cm/JQ4HPT8OT6XSMPvtuKCXFWTdoOtg2pOVbdGa8QxBTX59O6bJswOrmvt3SReV7
	pFWPjjxDeeecKGJDqR0F376hVI8gEDin5CiJ6x0hoT0p/6Y474NTQlz/BfbsalI/
	n1Q/XoX1uJHDW2LwBAYefLBeyGq3FBx1Q/gXKAnWEOpvMlDycYZRKT2rv0W46X9Q
	cxkamiZeX+IqBcnJ/RlJgSYwdKny3mAa79lIBOIankNCc703wqNCF+Kskd9lj+zI
	N6c/dgd1Gp/Le5gnyAFN22G2iMtwUdWvaFWt17EtoLg2RQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpcp4nhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 15:18:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so750109885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 08:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742829496; x=1743434296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBj5wpEg+SrAwIscXXtQbPvhMb2gJI4cBrfY/nN2XHA=;
        b=a86wWh4p49axnXKSsz34TXuojrAluDhxlUW8gvZgsEMyxrbeDJK8eUIv15yNSqPqV3
         jc+AX3noIi2dEs1a2y/WDuqo9+vSgykz6v8kQ2wa/WvkuIvAK8UxzucGbQDF2moiuQ8D
         pAeWLDJSmu2x/OnRXhjCLt2EfkYRjWL77tvX3vdU436iRreVWeKaaGuiE6f8DYKkicM2
         0pGpIsfcVsTFKG7bhVVqs/R2D17Fo68k02QbUcgmTcQGeyD36e1bfjQKKjrOlhaqb5/O
         MMrPf2gpyZIPQZwpaYRLkfxMPkzJbF3jnrHZL6SKBXUVshWLPiKGklJILOCWlreieaOL
         bLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWENh+e6cKA6wAJyAJ3rf/BKxb7jQ8HgbUFPPF4kc8HCkzqwz28drjf2iMo7SqFxl4JeCypQ7EGeW3vkvc0@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzTqNvzDFKu2IXDnkEUfx16k8IZBRjBeJtha+/Uo1FuE4yUd7
	4DlF04BJz5Ou2kbegoGv/6td9QTMSoqkR/g7A6iJYkxr5Yx6mGzqQOZkubIqmJt5y92xywPPp1I
	A82NrJVAnhuCw+vNVyZxMRG4urs+7FTr9NNjf9L0vqSV3S6d/NEG3PDkOOKrL/SlD
X-Gm-Gg: ASbGncv2A2EKRPpqAVEPiBdyKIu4iGzQ1/YzH41Bsjk/rUuNHOWot7k31DoVdy3TOAy
	4lq6iImbU2yeYbeEj+tLr3d1imRNAOjp0KINPs9BfCfMeu1W9tWUsxk4Eugu3QA1whw74kgIt2J
	kbKxEiXzC7uPMZaSN7SudpLCQU+TpfU5fxLfiCoKIpujP1+gL4vZQm/AMyEeiNfMnRjAQmcLAuz
	q9OLznoAAWOtmfrW6L9xCHNeE9JEQ59jgr3tkkbdTy0rrKH4hfhwgw79XWGl0bdq7BJxLVIt74B
	DxZC6mb03ureLxLc3b+Gt25H4Sgc+sj55Wnnm8vR+0udjGUKE60Jk2CD7qP4GZnQvcmYVmwHhmJ
	J5zI=
X-Received: by 2002:a05:620a:258e:b0:7c5:a2be:6e4c with SMTP id af79cd13be357-7c5ba247882mr2372634885a.55.1742829496053;
        Mon, 24 Mar 2025 08:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFARjdRe711E7Dx0Shw9oLzlq33M5bIuw7jDsDdDa4jCC7zZ67lPaBlBULAAs8KAUp7bJnqSg==
X-Received: by 2002:a05:620a:258e:b0:7c5:a2be:6e4c with SMTP id af79cd13be357-7c5ba247882mr2372627385a.55.1742829495443;
        Mon, 24 Mar 2025 08:18:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7df853sm14218491fa.29.2025.03.24.08.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:18:14 -0700 (PDT)
Date: Mon, 24 Mar 2025 17:18:12 +0200
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
Message-ID: <ctcqkdbv6zh2rabkkr7tlhxlcfsn5nazjfbsnbbu4l4blyakft@pejdsvnazfh6>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
 <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
X-Proofpoint-GUID: UMY0WZ5tWbdwNj6XPDTQqlvN6G9Zes3w
X-Proofpoint-ORIG-GUID: UMY0WZ5tWbdwNj6XPDTQqlvN6G9Zes3w
X-Authority-Analysis: v=2.4 cv=PLYP+eqC c=1 sm=1 tr=0 ts=67e177b9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=lNgCk4es9Rhgkq0fFtoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240110

On Mon, Mar 24, 2025 at 01:58:06PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 24/03/2025 13:50, Dmitry Baryshkov wrote:
> > On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
> > > 
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > On some platforms to minimise pop and click during switching between
> > > CTIA and OMTP headset an additional HiFi mux is used. Most common
> > > case is that this switch is switched on by default, but on some
> > > platforms this needs a regulator enable.
> > > 
> > > move to using mux control to enable both regulator and handle gpios,
> > > deprecate the usage of gpio.
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > >   sound/soc/codecs/Kconfig   |  1 +
> > >   sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
> > >   2 files changed, 40 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > > index ee35f3aa5521..a2829d76e108 100644
> > > --- a/sound/soc/codecs/Kconfig
> > > +++ b/sound/soc/codecs/Kconfig
> > > @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
> > >          tristate
> > >          depends on SOUNDWIRE || !SOUNDWIRE
> > >          select SND_SOC_WCD_CLASSH
> > > +       select MULTIPLEXER
> > > 
> > >   config SND_SOC_WCD938X_SDW
> > >          tristate "WCD9380/WCD9385 Codec - SDW"
> > > diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> > > index dfaa3de31164..88c758efe40d 100644
> > > --- a/sound/soc/codecs/wcd938x.c
> > > +++ b/sound/soc/codecs/wcd938x.c
> > > @@ -19,6 +19,7 @@
> > >   #include <linux/regmap.h>
> > >   #include <sound/soc.h>
> > >   #include <sound/soc-dapm.h>
> > > +#include <linux/mux/consumer.h>
> > >   #include <linux/regulator/consumer.h>
> > > 
> > >   #include "wcd-clsh-v2.h"
> > > @@ -178,6 +179,8 @@ struct wcd938x_priv {
> > >          int variant;
> > >          int reset_gpio;
> > >          struct gpio_desc *us_euro_gpio;
> > > +       struct mux_control *us_euro_mux;
> > > +       u32 mux_state;
> > >          u32 micb1_mv;
> > >          u32 micb2_mv;
> > >          u32 micb3_mv;
> > > @@ -3235,17 +3238,31 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
> > >                  dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
> > >   }
> > > 
> > > -static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> > > +static int wcd938x_select_mux_state(struct device *dev, struct wcd938x_priv *wcd938x, int state)
> > >   {
> > > -       int value;
> > > +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
> > 
> > Hmm. Does this really work? You have selected the mux in probe
> > function, now you are trying to select it again. If I'm reading the
> > code correctly, you will get -EBUSY here.
> 
> On successful selection of mux state, the mux will be kept available
> (mux_control_deselect) for any new callers.
> 
> So we will not get EBUSY for the second caller.

No. wcd938x_populate_dt_data() selects the state by calling
wcd938x_select_mux_state(). Then you call mux_control_try_select() here.
As far as I understand, it will return -EBUSY as the sempahore is
already taken. Moreover, this is not how the MUX API is supposed to be
used. The driver is supposed to hold a state while it is still in use.

> 
> --srini
> > 
> > > 
> > > -       struct wcd938x_priv *wcd938x;
> > > +       if (ret) {
> > > +               dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> > > +               return ret;
> > > +       }
> > > 
> > > -       wcd938x = snd_soc_component_get_drvdata(component);
> > > +       wcd938x->mux_state = state;
> > > +       mux_control_deselect(wcd938x->us_euro_mux);
> > > +
> > > +       return 0;
> > > +}
> > > 
> > > -       value = gpiod_get_value(wcd938x->us_euro_gpio);
> > > +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> > > +{
> > > +       struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> > > 
> > > -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
> > > +       if (wcd938x->us_euro_mux) {
> > > +               if (wcd938x_select_mux_state(component->dev, wcd938x, !wcd938x->mux_state))
> > > +                       return false;
> > > +       } else {
> > > +               gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
> > > +       }
> > > 
> > >          return true;
> > >   }
> > > @@ -3261,11 +3278,22 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> > >                  return dev_err_probe(dev, wcd938x->reset_gpio,
> > >                                       "Failed to get reset gpio\n");
> > > 
> > > -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> > > -                                               GPIOD_OUT_LOW);
> > > -       if (IS_ERR(wcd938x->us_euro_gpio))
> > > -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> > > -                                    "us-euro swap Control GPIO not found\n");
> > > +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> > > +       if (IS_ERR(wcd938x->us_euro_mux)) {
> > > +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> > > +                       return -EPROBE_DEFER;
> > > +
> > > +               /* mux is optional and now fallback to using gpio */
> > > +               wcd938x->us_euro_mux = NULL;
> > > +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> > > +               if (IS_ERR(wcd938x->us_euro_gpio))
> > > +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> > > +                                            "us-euro swap Control GPIO not found\n");
> > > +       } else {
> > > +               ret = wcd938x_select_mux_state(dev, wcd938x, wcd938x->mux_state);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > 
> > >          cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
> > > 
> > > --
> > > 2.39.5
> > > 
> > 
> > 

-- 
With best wishes
Dmitry

