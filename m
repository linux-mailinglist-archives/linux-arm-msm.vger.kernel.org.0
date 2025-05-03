Return-Path: <linux-arm-msm+bounces-56608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A81AA7E8A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96BE7984D1F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CB219D890;
	Sat,  3 May 2025 05:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8cSLmye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB981990B7
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250212; cv=none; b=TT1J4CNE/nxa0qyDOpkoqTIzbgBcHYFdej0C1btn/BPsm0Xn0mBGHn0sjGS2ns2pYFzDShH/+uzVbq4c+0W5e+2UrDRC1mVD4+bYeA5esQtLNnUMsFko6Br0JxLDZxCp1z1IdXjjpMsprqhvO1dP4TjhA59sj4hX4quPgvNXUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250212; c=relaxed/simple;
	bh=uLDU4nKjdB4VwJbi7HckXCZ5+JkN3E176RbbKcNAJik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mS5pOlqJKxw9352sNHBHA8x9ILr5j7NEL3s8C+LFB/PoyGncTfqEMd8xt5U5kUwuq1wFyFYaCEDnvi+tCuIwFn+aFGcqN4J5X4zsqtj/PRkACtPl5hGwMCRsuZPv6uh8pvMSR4eG9dhU6k85DUfttWIXd+Zd8/nVRiz1FgwQPmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8cSLmye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434oMmk019280
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1M46KCqq419/ZiESDjDMMYHt0TaN38Nca9EZw54XOvo=; b=Z8cSLmyeTXyypGq9
	+BE4spC/Ssf98Rt5IjVzy34I8h5p9xNpcqb7uNEWB/swb6AmH2dVEjxddoFMmEIt
	ho9fQ8z7bi3fcjV0hBZAzilXqRw1WrQ99dfU1lgX5fg/42pgKxTQZvd37bjEGG6t
	4NontRb4MLbyffxED/s33DOmFgCqaDOipJIcBzNKEr9fVL0z84LjdSK2Y+CR0+tP
	b5fSeqacNEBzWMOhbO6EnY6b/OFMCdQLbglQs3FV1HhX8pZGPxYbzAFHQ9TYnvy6
	RV8XukfbAtBC1Ayhkd+tf6u0Vjeqprsdw/RxaxqmwDhF0xj5x0f+uSnef5uz5oPh
	CQMKOg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc583vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:30:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ed0526b507so46093496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250208; x=1746855008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1M46KCqq419/ZiESDjDMMYHt0TaN38Nca9EZw54XOvo=;
        b=rSO6IDP9mGT7n6X9cwWuVFFeq+BPh/VkntI0dW8HRBiql5cX+sNG83DqB8UOJ+vh5l
         rtkPUZhlum2AzqtGUSxqku0sP1SBFmWwnUys5a+58wb8aZNL3jOPae9F5t1QI5ztq2oi
         CrKRbotOjyIJ6YqZ/39UvYaTkGIfUAlLaPIPi5un7vZHZKZMkEKSln4O/JqpO/SWQGor
         Z5Pwv0oX8Wo+6fURK/Zq1vOKnSA0oAlOqsbFYCViNFkP2KYgNwF1Zee3wdKIhGgmcR2D
         U8T2eTLfKw9q9BhqReESbJ8ZjQLKcrAvVjIQEXrnjRaoztvPq2u0+K7ZyA3hOPGXBGQA
         myug==
X-Forwarded-Encrypted: i=1; AJvYcCXrwbiN3LjayS9+e8BStb21EfZXEJ9gDhVGCp9pE3Y/QMsJWayhFCA0otNUyNDeyOKHulQzvTPSoCBtnvci@vger.kernel.org
X-Gm-Message-State: AOJu0YxegYz1+G95tvYd73MU20DKJEWmSGO56SxonY+tycj7ibJvdVBu
	lp6cD/YZywga7biAJvKSAOpRTF64Xh64WXcnBqXAsBafcuFX21lWnOBkIdplNiYH0FUl4xBIECx
	fmM3v4LPlUsv7RZp9gs2eRTVKtW6Ppb4lVhLtROxuP34QlSUd0JRoi2vMYmES2P9FITJkC9F5BF
	E=
X-Gm-Gg: ASbGncu4+PyCQN1EBNGtjJbPJ8X6BWQS6ZPso6UMpYNVVpfy9S2/5XZ+eTPHTO0zACl
	1CodVrXd9F609O/YT+xo/8w2G887XPKd0YVKAXlOBI2xtRtGLzWBdOo1Q8sytMPL5oUZFa+pihQ
	flQ6uY1Pp8YSx+HtlNBpgn+CCEBABAEPI4GOu0COPEjgifHZY/2U6DZ+vkjnucSZWLr77FTnN+9
	koGLLDHXZ3lKIMV59rKkYlqws7eq1evhP3IAyZjf5HWzmIlf50hpmBODB6TQmehjOtISOujYTDV
	PxrmBz8B9dwH+sTXniOPFCiH6hJReG9n6mwCkgTCiL9V/5+MiG+zNAdozMu47SZ4pl7wz60CL7M
	=
X-Received: by 2002:a05:6214:2508:b0:6e6:9ce0:da9d with SMTP id 6a1803df08f44-6f515388bedmr90212526d6.27.1746250207873;
        Fri, 02 May 2025 22:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESKbK7aHW5BA/d6GPrY1hOVPcwF51p/nhSS9tIKj13+UM3oDAIaHbwyOOFf1RhpjILf8ewtg==
X-Received: by 2002:a05:6214:2508:b0:6e6:9ce0:da9d with SMTP id 6a1803df08f44-6f515388bedmr90212296d6.27.1746250207430;
        Fri, 02 May 2025 22:30:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b38df3sm6142311fa.11.2025.05.02.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:30:06 -0700 (PDT)
Date: Sat, 3 May 2025 08:30:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
Message-ID: <wa6ajhkrceg3h24c7jmniws2lkkrb3zhhyqpeo3y7d74hbh25x@brt3etvm7dh3>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
 <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
 <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
 <944dab74-f431-41e1-b4d7-fddf25ffa147@gmail.com>
 <5add8ddd-fcc8-445d-9699-42c27df0e1c7@gmail.com>
 <cupvce3ptuidmjpiwbzddv3err5m5antfwtdgvxlmamypdadnl@ii6occccx72h>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cupvce3ptuidmjpiwbzddv3err5m5antfwtdgvxlmamypdadnl@ii6occccx72h>
X-Proofpoint-GUID: Qk639nlkVYxbn4Qr1N7GWrCVJRPHI0Am
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6815a9e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=FMltWieEs2buDHtkUkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Qk639nlkVYxbn4Qr1N7GWrCVJRPHI0Am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfX9OY6PcmfL4ZI
 VOYKqq7hjZTh5i823SdCrHT5oBUycI5Q33rWvOIvVaEg6dgwmSjmVlK4JDkFtJFBqYwOpylqWrU
 qxrVkIBWm/LkCuMC9X1I/75dQAwkBqn4u7kEk8iHi4mmgPFPQgxR12vfbTGZzr+V5r7EYsC8TYB
 5LD38wo60dzWohGwHGh5GbtzflkgDfRpK70rkTGCloOca2UW/2z93ASsE3dnQEEQv0HKMI7ddV1
 sXpZHyOBd7MFb3e1kMG+36Vew6lnyGP6ftBk2FasEWUdakMIyQ8ttT/zgR9IyM7pw/4SfYWyF1y
 0WtL1PR5THQR+5eAPTJKDDgRfTSQGFhEbYeuBWQbm/+tYJ4/NtYBe4ibUvo8990T8ZtENApRJab
 H5L03QNNr+2k1DW875c3j2BUzQbmAC2kd4M3Im2tC6KA+XjNVZ/WSArLiVXgg7IL0Fh9jA+V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030044

On Sat, May 03, 2025 at 12:41:30AM +0300, Dmitry Baryshkov wrote:
> On Sun, Apr 13, 2025 at 11:51:29AM +0300, Matti Vaittinen wrote:
> > On 13/04/2025 11:08, Matti Vaittinen wrote:
> > > Hi Doug,
> > > 
> > > On 13/04/2025 02:00, Doug Anderson wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Mar 5, 2025 at 5:23 AM Matti Vaittinen
> > > > <mazziesaccount@gmail.com> wrote:
> > > > > 
> > > > > The valid_mask member of the struct gpio_chip is unconditionally written
> > > > > by the GPIO core at driver registration. Current documentation does not
> > > > > mention this but just says the valid_mask is used if it's not NULL. This
> > > > > lured me to try populating it directly in the GPIO driver probe instead
> > > > > of using the init_valid_mask() callback. It took some retries with
> > > > > different bitmaps and eventually a bit of code-reading to understand why
> > > > > the valid_mask was not obeyed. I could've avoided this trial and
> > > > > error if
> > > > > the valid_mask was hidden in the struct gpio_device instead of being a
> > > > > visible member of the struct gpio_chip.
> > > > > 
> > > > > Help the next developer who decides to directly populate the valid_mask
> > > > > in struct gpio_chip by hiding the valid_mask in struct gpio_device and
> > > > > keep it internal to the GPIO core.
> > > > > 
> > > > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > ---
> > > > > Revision history:
> > > > > v2 => v3:
> > > > >   - Rebase to gpio/for-next
> > > > > v1 => v2:
> > > > >   - Hide the valid_mask instead of documenting it as internal to GPIO
> > > > >     core as suggested by Linus W.
> > > > > https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
> > > > > ---
> > > > >   drivers/gpio/gpiolib.c      | 16 ++++++++--------
> > > > >   drivers/gpio/gpiolib.h      |  3 +++
> > > > >   include/linux/gpio/driver.h |  8 --------
> > > > >   3 files changed, 11 insertions(+), 16 deletions(-)
> > > > 
> > > > FWIW, I've found that this patch is crashing me at bootup on my
> > > > sc7180-trogdor board. The problem is pretty obvious in gdb.
> > > > "gc->gpiodev" is NULL in gpiochip_line_is_valid().
> > > 
> > > Thanks for debugging this! I find this odd. It seems to me the pinctrl-
> > > msm.c is calling the gpiochip_add_data() for the chip, in the
> > > msm_gpio_init() - which is called from the msm_pinctrl_probe().
> > > 
> > > The gpiochip_add_data() should go to the gpiochip_add_data_with_key() -
> > > where the gpiodev should be allocated and set.
> > > 
> > > I don't spot any successful code path where the gpiodev was not allocated.
> > > 
> > > > 
> > > > 0xffff80008066c760 in gpiochip_line_is_valid (gc=0xffff000083223890,
> > > > offset=offset@entry=66) at drivers/gpio/gpiolib.c:746
> > > > 746             if (likely(!gc->gpiodev->valid_mask))
> > > > (gdb) bt
> > > > #0  0xffff80008066c760 in gpiochip_line_is_valid
> > > > (gc=0xffff000083223890, offset=offset@entry=66) at
> > > > drivers/gpio/gpiolib.c:746
> > > > #1  0xffff800080666338 in msm_pinmux_request (pctldev=<optimized out>,
> > > 
> > > Ah, but now I see the call comes from the pinmux. Looking at the
> > > msm_pinctrl_probe() - the pincontroller is registered before the gpio.
> > > Maybe, with unlucky timing, the request happens right after registering
> > > the pinctrl - but before registering the gpios.
> > > 
> > > This, I think, can be a bug even before this change (because the
> > > valid_mask is not initialized prior the gpio registration) - but this
> > > change now made it obvious.
> > > 
> > > I see the probe is actually an exported function, and there are mentions
> > > about ACPI support etc. I don't really know if there are valid cases
> > > where the pincontroller should be usable without the gpiochip. If this
> > > is the case, the unconditional call to the gpiochip_line_is_valid() from
> > > the msm_pinmux_request() smells wrong.
> > > 
> > > I am not sure about the right fix. One could try:
> > > 
> > > @@ -1568,6 +1568,10 @@ int msm_pinctrl_probe(struct platform_device *pdev,
> > >          if (pctrl->irq < 0)
> > >                  return pctrl->irq;
> > > 
> > > +       ret = msm_gpio_init(pctrl);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > >          pctrl->desc.owner = THIS_MODULE;
> > >          pctrl->desc.pctlops = &msm_pinctrl_ops;
> > >          pctrl->desc.pmxops = &msm_pinmux_ops;
> > > @@ -1582,10 +1586,6 @@ int msm_pinctrl_probe(struct platform_device *pdev,
> > >                  return PTR_ERR(pctrl->pctrl);
> > >          }
> > > 
> > > -       ret = msm_gpio_init(pctrl);
> > > -       if (ret)
> > > -               return ret;
> > > -
> > >          platform_set_drvdata(pdev, pctrl);
> > > 
> > >          dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n")
> > > 
> > > but I am not at all this is the fix we're looking after. I wonder if
> > > Krzysztof has any suggestions? (Seeing he has been authoring some
> > > changes here :] )
> 
> I think a correct fix for the pinctrl-msm driver would to use
> devm_pinctrl_register_and_init() and then pinctrl_enable() after
> registering GPIO chip, I'm going to submit a relevant patch. However I
> can't stop but notice that pinctrl-msm is not unique in the pattern of
> simply calling [devm_]pinctrl_register() and then registering a GPIO
> chip. This patch makes this pattern much more fragile.

Unfortunately... my idea to split pinctrl_register() into _and_init()
and pinctrl_enable() calls didn't work. Internally GPIOchip reigstration
calls of_pinctrl_get(), gets NULL and fails gpiochip registration with
-EPROBE_DEFER.

> 
> > 
> > +Björn
> > 
> > > Yours,
> > >      -- Matti
> > > 
> > > 
> > > > offset=66) at drivers/pinctrl/qcom/pinctrl-msm.c:152
> > > > #2  0xffff800080662314 in pin_request (pctldev=0xffff000082686ac0,
> > > > pin=66, owner=0xffff000082c02790 "3500000.pinctrl", gpio_range=0x0)
> > > >      at drivers/pinctrl/pinmux.c:176
> > > > #3  0xffff800080662900 in pinmux_enable_setting
> > > > (setting=0xffff000082684b40) at drivers/pinctrl/pinmux.c:445
> > > > #4  0xffff80008065fd54 in pinctrl_commit_state (p=0xffff000083a07520,
> > > > state=0xffff000082684a40) at drivers/pinctrl/core.c:1300
> > > > #5  0xffff8000806605bc in pinctrl_select_state (p=0xffff000083223890,
> > > > p@entry=0xffff000082686ac0, state=0x42) at drivers/pinctrl/core.c:1381
> > > > #6  pinctrl_claim_hogs (pctldev=0xffff000082686ac0) at
> > > > drivers/pinctrl/core.c:2136
> > > > #7  pinctrl_enable (pctldev=0xffff000082686ac0) at drivers/pinctrl/
> > > > core.c:2156
> > > > #8  0xffff800080660814 in pinctrl_register
> > > > (pctldesc=0xffff000083223a90, dev=0xffff000081406410,
> > > > driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2193
> > > > #9  0xffff800080660df4 in devm_pinctrl_register
> > > > (dev=0xffff000081406410, pctldesc=0xffff000083223a90,
> > > > driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2313
> > > > #10 0xffff8000806657b4 in msm_pinctrl_probe (pdev=0xffff000081406400,
> > > > soc_data=<optimized out>) at drivers/pinctrl/qcom/pinctrl-msm.c:1579
> > > > #11 0xffff80008066afcc in sc7180_pinctrl_probe
> > > > (pdev=0xffff000083223890) at
> > > > drivers/pinctrl/qcom/pinctrl-sc7180.c:1147
> > > > #12 0xffff80008089583c in platform_probe (_dev=0xffff000081406410) at
> > > > drivers/base/platform.c:1404
> > > > 
> > > > (gdb) print gc->gpiodev
> > > > $1 = (struct gpio_device *) 0x0
> > > > 
> > > > -Doug
> > > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

