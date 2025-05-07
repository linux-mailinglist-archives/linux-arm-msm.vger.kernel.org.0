Return-Path: <linux-arm-msm+bounces-57023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A3AAD24D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 02:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A33C1B68758
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 00:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7198718E25;
	Wed,  7 May 2025 00:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6mJUPiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0CA945
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 00:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577825; cv=none; b=M1Tc9alotY5uqFlS/8sr8mxUwQXn/IN2KSGu7/7XRc6sxiOEPPPW/0E52o98JbmFhjS0s6fQmbhA/0zldibtFtL9n254HMQECnMwTdT3CFD/h32oBwnR30ep6u5BXJTvAiuUJvQ7t9d6WHotvXojeu8VSka/mThZZop41XWoZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577825; c=relaxed/simple;
	bh=ZBge7jMBgNPb3mHQNiyPpffxlphyMxP+LJ+R76AC2U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imoy0Bew/P9uHEOrMwveNN2ZZK67B0itEXdKx2tD8R6sWc08HgRKv6sAfMMxcIRib4wf3gOX/+1YXkZ0DU8nZ+rdfG3MkI8DALQre6RLLKKkrkMJVBzTtOf0EOeFm6t1FhvG5CcZ2hj/MHwkm/fVnfM632RbFy2oax0o5uZ19gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6mJUPiS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546NUNPr015412
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 May 2025 00:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U6czlrWo7n/eCpa71Z14BBOF
	9eOHw4aaoez+mTmbCkU=; b=I6mJUPiSD9yGGzA5QoKTy/CIvOfDbFnY0fr753Ac
	vvcvMhAoG4ViJ/OzKXKyqWugovwu7mQvjjsWoT+62+tC5DBbDJllecM1PBXYbO2n
	FAmz3DqkKaBplnCs+jFWwiO3LCbam3y4D4GglqBymEwaOiO9vMucAlPGOsOk3xXT
	waoaNLLjMNIZILQzkrc1Y22Hv1ZOsYpemquhlNLrd/bRwHNyb2nDH0uv8yfaOL0v
	MasDLZMaVIbBImfD4GTawp/yOxA2+NI/ZYL8aGMwqiYLAlVTu+IKn/M/46+4DFdu
	pgJrK4yVpZ5RUiBgiY0UaEvWW4sbKnAJBsUf05FcA8pJzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguuj2sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 00:30:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47693206d3bso157156351cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 17:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577820; x=1747182620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6czlrWo7n/eCpa71Z14BBOF9eOHw4aaoez+mTmbCkU=;
        b=qA80WeHaLvqzIAO+CoakFiqfKoCiB5uc/Ea2IloqOcp/Zr1wosL6WiAP4oHbkxu9co
         cMY5IpZ6knkEowQN6gGv99qv5pIVcH07EfJEr5i3X3FpOzoi0pSqhdA0beWP2hJVlm4x
         WwG0OpBrwOSM6jiHYom0irhvkuRW1LotZSI+XDBCSa9+N2R9poZPLENyB2FXlhPYJN5x
         dcc58bWE0wsmX8zC2ovbmFhorzWDkZHkCfMUpnJIYkyy16cM31hh47Cr2LQ/0Nmouxjk
         74iVLOsBB/ag1LpFcDQmdXGXn+hrYnzsZhDaUA09fk/1FT3Bjo/dh39yvc0942ATI4c0
         V4xw==
X-Forwarded-Encrypted: i=1; AJvYcCUpJf5ARL+u5KHLNxof+HEmcxv/T7biCy24u1OY+OhYWVyIGsunljMhndY/IbJEyR4Ujv4P9PH64+3eMs+x@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfQ4kMZfQHwJ60yWNRVLyrg10NIzYfYrQ0kHl4x5j6xQQLaUg
	6qev078SdHU7m0/Jw8MpV9WuWycVfSsL//RArrRB2L8wJ6z2CPx6Ur9nOxD95IVK3u6ZQGRG2up
	hnzRYPZIk7NjJONEJ5KjUW6qV9/P92ncvsSKvUqPCf/+BOCRw/3vslZCNFpI9tZh/0Poo26O3
X-Gm-Gg: ASbGncu7yJC+Vi/Hnn+veU6YZn1IM6YDJGtOA6itek3eNWVUdesxcBkZlC5UIWjAHf0
	AnqLp70NHVbCIm+/kA+A6gXTT8KdzRnqiSfoTNFlDUCNoUP1PV1m0xABJjk9Wqhr5z08aI9Xtv5
	D8lc1YPB4k3ciX0HVogVJp6hPrw+kWBbCu0Iz7FacpopSEpl4yoTC2ECPs4ldemeQh8y/27jtMM
	/aODl58b9MIXXAS9jYjem5MdXz8/fL/ofmKvA/uHuIYuBVDBCnCVeDSJRnyp0C6bVmLOqv31Vs9
	9ivS1Y/hoehzUNXtjMwbY2cXguRUu5z9swMEhw6GNGOtr5ebUNXMmOepu+QSkBASryvQ4L59fAA
	=
X-Received: by 2002:ad4:5768:0:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f542a06093mr16546706d6.12.1746577820353;
        Tue, 06 May 2025 17:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWm5XgjPTDMCnhvnoYdEiVxjS3Tf90qt6dPg5mitG5DK13+TYZY++IA7Ni8CuMYo239uk+0g==
X-Received: by 2002:ad4:5768:0:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f542a06093mr16546406d6.12.1746577820007;
        Tue, 06 May 2025 17:30:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6915sm2175431e87.231.2025.05.06.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:30:19 -0700 (PDT)
Date: Wed, 7 May 2025 03:30:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
Message-ID: <mz6kajh7jkn5ly77rah2yxefgferlbpn2zngzeifgaoh5h4k57@iqojnv73sp4b>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
 <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=681aa99e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=m-dU8d_lu5hDCtaHrWIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lglgam0lX3mc0c4aLlK7lin4OCn6Hrpw
X-Proofpoint-GUID: lglgam0lX3mc0c4aLlK7lin4OCn6Hrpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAwMyBTYWx0ZWRfX0VSrijC2w0ei
 SR54klDwEe5tVr4nD5XHKOwslRk4XQdcdmiDsTr/BUB9zJjivAP49gnVhiKxIxdJL2WV4uIKn3Y
 TpoVwg7FeDeZZLKkYK6mvQaBQ5kSgW85gM/bu0gK7u0VAK+OE+8mSIJxHqmVq11RRfWKNPZtO53
 gDYttRUhjisFO468DHqK++JllYfSRfWHD+4PYIXf0ytMOUBZ+Y1mke4EXWoqmQaWABOcIRoItHI
 HnTVCoPsh1ig4ehza5v4fr6JFCwjtMRCKnBwXw9jzBG5UTScm6VlMmr6glWm7aOf8NRel+oGmuI
 FvfzO2xntZf+SpgfYqZXZ7xWylBAPNv1yBKyCOGUBY79az0EF0E70tagFUGG3Fpr0MT+SFZnVx+
 W7X/hlZJDDo/1CtpPJB2uMD8dunfwRGm217fiZg8+00bT5VDifU3lzpBZUPH9WiAGO8IQX5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070003

On Tue, May 06, 2025 at 07:23:10PM +0200, Bartosz Golaszewski wrote:
> On Tue, 6 May 2025 at 19:18, Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> >
> > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > In order to simplify cleanup actions, use devres-enabled version of
> > > gpiochip_add_data().
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> > >         girq->handler = handle_bad_irq;
> > >         girq->parents[0] = pctrl->irq;
> > >
> > > -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> > > +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> > >         if (ret) {
> > >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> > >                 return ret;
> > > @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> > >                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
> > >                 if (ret) {
> > >                         dev_err(pctrl->dev, "Failed to add pin range\n");
> > > -                       gpiochip_remove(&pctrl->chip);
> > >                         return ret;
> > >                 }
> > >         }
> > > @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
> > >
> > >  void msm_pinctrl_remove(struct platform_device *pdev)
> > >  {
> > > -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> > > -
> > > -       gpiochip_remove(&pctrl->chip);
> > >  }
> > >  EXPORT_SYMBOL(msm_pinctrl_remove);
> > >
> > >
> > > --
> > > 2.39.5
> > >
> >
> > If you're at it then why not remove this function here and the
> > callback assignment throughout the pinctrl/qcom/ directory?
> >
> > Bart
> 
> Ah, it's in the next patch. I'd make it one commit though, no reason
> to split it IMO.

Up to you, but from my POV it's cleaner this way: first patch removes
the contents, second one removes the function. Otherwise it's too easy
to loose the functional changes (of gpiochip_remove() removal) in the
noise of updating all the platform files.

If you wish, I can add a note to the commit message telling that the
actual function will be dropped in the next commit.

-- 
With best wishes
Dmitry

