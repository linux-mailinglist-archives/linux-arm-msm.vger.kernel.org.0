Return-Path: <linux-arm-msm+bounces-88456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE8D10EB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15B7B30049F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF99330B0E;
	Mon, 12 Jan 2026 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIoNQ2Wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTnAZsjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA432E154
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768203535; cv=none; b=oGD5y8GBViyRJZrCQDLoKCFA6KsjWO1a9ouEEl8ghswuFVfE6mnm3BDDanhDa49MPoa8rLSNG3bIH7BHCBUMIuwcwFrF3vCZ6JLU6myx0isd1Paescj1ITHTs0Z4T+hR53XOgZXIqAgMMOJFLQnvp+Euu1zi1kOtdR1DiegCOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768203535; c=relaxed/simple;
	bh=q4HYSCQkylg711foljmNipEYdONKWJHOjhn7NTlWw4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqwjQAfVhsdhT19eWIG3u/SHg1qVaSSnt8PEReNxt4jEdCDiq6+EiPJK+e14GuJvsI/GBKmtrHFLiOXHMwQyo/t+mTM4dyg5tr1g4HVojNl+yN3zTqVVxMsZQCqldWDq67IxuQGI9Ou/Qoxzez3pUoF7AcI+tWp3U0twvnqhFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIoNQ2Wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTnAZsjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2Nuo7113526
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RFtsdA1HdiIkQGbTLKH9PDklaHIFEli3es+PL58CLIU=; b=SIoNQ2WcPv/lsEa8
	mbhiUzbRuZXgMWLjimArn9sG0yUNzebFjzuVmJO2c0ZT5a3J4VQy8FxqTHJiei0h
	8bd4yXyQqusLJ82PAVJs6/4Q+7Mwh/kFjMuvU2bvgd2l7Pb7R7/HM+T2QWBJ6Mzh
	r5unDJuMG5tACiFnHhI8iZjl5uF7YMjVAKRhYnzZI7/mdnQGJjpTUvKTF9SkibsK
	6iRpMDh4nrtGXdiSB6poq+QEN/O3/RQTNYVOhnquX20Sp3DVoKihLOvhLRp0Y4bM
	8dzVS2wEpFNEWRY7jlKgojwbdhuvdrghEDshEDXxrNw3NVtfLT7teXRHIFEMdc5J
	bgHxGA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ugsqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:38:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso6830115a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 23:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203533; x=1768808333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFtsdA1HdiIkQGbTLKH9PDklaHIFEli3es+PL58CLIU=;
        b=CTnAZsjtL3G3u+aUjKKQHdsKffzpQ9jJoFgIfJRYcSzyoHjRR57WSW31p69TlCZaKB
         X4PDL5v/YcnaADqFvjfjU6HpZ1BZWyQsEe28yfpGSNnRjrGBXHPy+kT+TDf/5Df/k4lr
         kRmygsn/eRiV35wrlAUYmFm0ruqEsKgd60Z+g0d9wbTdgIfApAIa8R4QSL0JFxLPRwgi
         gG1ONWClCcNjSPIOl7lI1AT7F2PtDCkt9twi5lJxkZCwa4oB35eag2cDFobV+3FBHQCQ
         klE8N7DUn6ku6GEYRO1QyCHX4tZ1k8lxIqhPKmfyHm77GbzRUs8ezX3E8P1Cw1MX05j9
         k2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203533; x=1768808333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFtsdA1HdiIkQGbTLKH9PDklaHIFEli3es+PL58CLIU=;
        b=aWaiSpQMikB0ahh4rNHTmcDatoGujoEMsym8D/IdcG5HjjKNQ5p7wM0EiNAcbURCUn
         YaJjsNQtd4qBa8UoSzCEe/IrbYj+m6MV+p8yZ1wUEzixHL+g8/hvl0dCWWnXYZp1c3H3
         zfnRmVUyFX2nGEGxxZdqhuVcELyKGTxhS+fbNjlNhZr4gDhbK4Mr+9Vzb4I7QwfyNlV9
         PpJsl4iahVWsXFwcDIPQ3+t8lzd7y3kd48fFz6ozmHDHPowfbMLbmhtN8+X8vzTbSI6P
         zEP/8HQAW7vE/tnuzqJBs6jAPG3pve574Ya4onQdRvlIQg3sXXTpfCfZGrzI3g1oIHn2
         b45A==
X-Forwarded-Encrypted: i=1; AJvYcCXuyL1PJto8whF3MQXRyRgkKUO6RFvDz/kWgHpgvXIQcU2SBPVDSNsDdSOJ/K/UxUx0T3G1D8UBq9nH+ouP@vger.kernel.org
X-Gm-Message-State: AOJu0YzzDgR0UWMfdSqdx3J967WBo7rOn7c/Jzm43Bfnp/Arm2HkNdfB
	vweKzA4wRz3GYzxQNpovi4Xi6gh64JgZ+QPMcjhL1mfVUGIPWRekWY95IsBmAYKB84NgD+7usN1
	u39tnXMiZ92Uh2j1MH0xLRCCluUurdjqkOo+Ru05EAo72/N4oFIZcmoNTezGfVK7zkevW1l/JMP
	RpysgDuj2FRySOQoI96I/soAH34mIt+WWAgC2GttYrj5s=
X-Gm-Gg: AY/fxX7ZKrzV8uOsVJTsavbb2Hacn98nu60/GXvrXWqa5njUHDya+xAPrO2kr0kbqe+
	GutMrOoK/phYi30R7xRCdyzS2/Uj5MwQS9oYik0vlpJpnzBkkvS0Y5smCohBuxD+KNJhewiRcUd
	kyXm9igxJCmQiU8r84wSKpeOVgecY+CqE+BTze3JAPTzOvCKdopBnIK4Dsr6YperZW73AnaxI9Q
	6csFDZM
X-Received: by 2002:a17:90b:57f0:b0:349:3fe8:e7de with SMTP id 98e67ed59e1d1-34f68c27620mr13615394a91.28.1768203532821;
        Sun, 11 Jan 2026 23:38:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNeZ4F2xzWsiizPQu2h4UkdnywlrKOdvasMIWylHdSP1VUo7D84pgBeE3G5Eneoz9m7J7xZi0+lOdLByq8mpI=
X-Received: by 2002:a17:90b:57f0:b0:349:3fe8:e7de with SMTP id
 98e67ed59e1d1-34f68c27620mr13615355a91.28.1768203532286; Sun, 11 Jan 2026
 23:38:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com> <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
In-Reply-To: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:38:41 +0200
X-Gm-Features: AZwV_QjL9gudYcHpU58rbHr0h-Wj5spnOuZS-hY3AJQJKKknOYhu4H3eLcS1M0Y
Message-ID: <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfXw9oBfbjgEtoz
 BxNmj8y6v81X/toDXG5/L4e3v8jhel/fKdJEz1UCA1VD/sKXhA46Jr7lLeLSTGBHAAsEK9l+r1P
 tdNpCZVt6F0WXd5hxCo/JLh4WMLVd5+/lb47ailOMWHzp2ZaaCt3+CL1oBci50vLnsRmWHEhw23
 vSA5PvafQ5YqCcNK9DWvniQ1trBZlw5GSj8OdWHmjyAXMPRLAq9Km9m5dEvu7txHI+dFfRrJJvd
 KGOPmGIlvWjunnfrbEgnKxMKfCK6TYfgYxISl0fkSamGqyTNLWVbrU4/PSV2H1BUcQTTFTcHqv2
 qlkwLBYSVpP+BrhSPUZwZrnw0F0R5OKHW4OkQApPl2YrRtLQ5ax1xSTLQmIxkbX+S3Azr2wyg3G
 SCvdsJLinwTWu6v8EvCKV+6xrUKHYPyZAVajviJ66LyoaqXMCXv4JrGA29LXG2P33v4cnzVsApd
 PvHpnBz0OsigYWma34Q==
X-Proofpoint-ORIG-GUID: 4qCuO-4Xd9UBNRFZO5vTFdT2is9R6e14
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964a50d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=jzdye9AysFvke8xWlIgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4qCuO-4Xd9UBNRFZO5vTFdT2is9R6e14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058

On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrot=
e:
>
> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >
> > > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > > the MMCX rail to MIN_SVS while the core clock frequency remains at it=
s
> > > original (highest) rate. When runtime resume re-enables the clock, th=
is
> > > may result in a mismatch between the rail voltage and the clock rate.
> > >
> > > For example, in the DPU bind path, the sequence could be:
> > >   cpu0: dev_sync_state -> rpmhpd_sync_state
> > >   cpu1:                                     dpu_kms_hw_init
> > > timeline 0 ------------------------------------------------> t
> > >
> > > After rpmhpd_sync_state, the voltage performance is no longer guarant=
eed
> > > to stay at the highest level. During dpu_kms_hw_init, calling
> > > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail =
to
> > > fall to MIN_SVS while the core clock is still at its maximum frequenc=
y.
> >
> > Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), whic=
h
> > doesn't do anything with clocks. I think we should have a call to
> > clk_disable_unprepare() before that and clk_prepare_enable() in the
> > resume path.
>
> I do check the backtrace on kaanapali:
>
> active_corner =3D 3 (MIN_SVS)
> rpmhpd_aggregate_corner+0x168/0x1d0
> rpmhpd_set_performance_state+0x84/0xd0
> _genpd_set_performance_state+0x50/0x198
> genpd_set_performance_state.isra.0+0xbc/0xdc
> genpd_dev_pm_set_performance_state+0x60/0xc4
> dev_pm_domain_set_performance_state+0x24/0x3c
> _set_opp+0x370/0x584
> dev_pm_opp_set_rate+0x258/0x2b4
> dpu_runtime_suspend+0x50/0x11c [msm]
> pm_generic_runtime_suspend+0x2c/0x44
> genpd_runtime_suspend+0xac/0x2d0
> __rpm_callback+0x48/0x19c
> rpm_callback+0x74/0x80
> rpm_suspend+0x108/0x588
> rpm_idle+0xe8/0x190
> __pm_runtime_idle+0x50/0x94
> dpu_kms_hw_init+0x3a0/0x4a8
>
> dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> And freq MDP: 650MHz
>
>
> And I try change the order:
> from:
>         dev_pm_opp_set_rate(dev, 0);
>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> to:
>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>         dev_pm_opp_set_rate(dev, 0);
>
> But the issue is still here.

But which clock is still demanding higher MMCX voltage? All DPU clocks
should be turned off at this point.

>
>
> > > When the power is re-enabled, only the clock is enabled, leading to a
> > > situation where the MMCX rail is at MIN_SVS but the core clock is at =
its
> > > highest rate. In this state, the rail cannot sustain the clock rate,
> > > which may cause instability or system crash.
> > >
> > > Fix this by setting the corresponding OPP corner during both power-on
> > > and power-off sequences to ensure proper alignment of rail voltage an=
d
> > > clock frequency.
> > >
> > > Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state"=
)
> > >
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >
> > No empty lines between the tags. Also please cc stable.
>
> Sure, will fix.
>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> > >  2 files changed, 15 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms.c
> > > index 0623f1dbed97..c31488335f2b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *dde=
v)
> > >     struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
> > >     struct dev_pm_opp *opp;
> > >     int ret =3D 0;
> > > -   unsigned long max_freq =3D ULONG_MAX;
> > > +   dpu_kms->max_freq =3D ULONG_MAX;
> > > +   dpu_kms->min_freq =3D 0;
> > >
> > > -   opp =3D dev_pm_opp_find_freq_floor(dev, &max_freq);
> > > +   opp =3D dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> > > +   if (!IS_ERR(opp))
> > > +           dev_pm_opp_put(opp);
> > > +
> > > +   opp =3D dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> > >     if (!IS_ERR(opp))
> > >             dev_pm_opp_put(opp);
> > >
> > > @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(s=
truct device *dev)
> > >     struct msm_drm_private *priv =3D platform_get_drvdata(pdev);
> > >     struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
> > >
> > > -   /* Drop the performance state vote */
> > > -   dev_pm_opp_set_rate(dev, 0);
> > > +   /* adjust the performance state vote to low performance state */
> > > +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> >
> > Here min_freq is the minumum working frequency, which will keep it
> > ticking at a high frequency.  I think we are supposed to turn it off
> > (well, switch to XO). Would it be enough to swap these two lines
> > instead?
>
> Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks=
) to
> disable clk is OK.
> we can drop change here.
>
> > >     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> > >
> > >     for (i =3D 0; i < dpu_kms->num_paths; i++)
> > > @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(st=
ruct device *dev)
> > >     struct drm_device *ddev;
> > >
> > >     ddev =3D dpu_kms->dev;
> > > +   /* adjust the performance state vote to high performance state */
> > > +   if (dpu_kms->max_freq !=3D ULONG_MAX)
> > > +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> >
> > This one should not be necessary, we should be setting the performance
> > point while comitting the DRM state.
>
> No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable po=
wer.
> But We do not set the appropriate OPP each time the power is enabled.
> As a result, a situation may occur where the rail stays at MIN_SVS while =
the
> MDP is running at a high frequency.

Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().

>
> rpm_idle+0xe8/0x190
> __pm_runtime_idle+0x50/0x94
> dpu_kms_hw_init+0x3a0/0x4a8 [msm]
> msm_drm_kms_init+0xb8/0x340 [msm]
> msm_drm_init+0x16c/0x22c [msm]
> msm_drm_bind+0x30/0x3c [msm]
> try_to_bring_up_aggregate_device+0x168/0x1d4
> __component_add+0xa4/0x170
> component_add+0x14/0x20
> dsi_dev_attach+0x20/0x2c [msm]
> dsi_host_attach+0x58/0x98 [msm]
> mipi_dsi_attach+0x30/0x54
> novatek_nt37801_probe+0x13c/0x1c8 [panel_novatek_nt37801]
>
> And I found a a similar bug.
> https://lore.kernel.org/all/20220915205559.14574-1-quic_bjorande@quicinc.=
com/
>
> Since the panel driver does not hold the property power-domains =3D <&rpm=
hpd RPMHPD_MMCX>
> once all drivers that do own the RPMHPD_MMCX power domain finish probing,
> the interconnect=E2=80=99s dev_sync_state is triggered, which eventually =
runs rpmhpd_sync_state
> and starts dynamic voltage adjustment. This is when the issue occurs.
>
>
> if do change below, this issue can also be fixed.
> &mdss_dsi0 {
>     ...
>         panel@0 {
>                 compatible =3D "novatek,nt37801";
>                 ...
>         ++      power-domains =3D <&rpmhpd RPMHPD_MMCX>;
>     }
> }
> But I don't think panel driver should own a power-domains =3D <&rpmhpd RP=
MHPD_MMCX>;

That's not related.

>
>
>
> Thanks,
> Yuanjie
>
> > >
> > >     rc =3D clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->cloc=
ks);
> > >     if (rc) {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms.h
> > > index 993cf512f8c5..8d2595d8a5f6 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > @@ -92,6 +92,9 @@ struct dpu_kms {
> > >     struct clk_bulk_data *clocks;
> > >     size_t num_clocks;
> > >
> > > +   unsigned long max_freq;
> > > +   unsigned long min_freq;
> > > +
> > >     /* reference count bandwidth requests, so we know when we can
> > >      * release bandwidth.  Each atomic update increments, and frame-
> > >      * done event decrements.  Additionally, for video mode, the
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

