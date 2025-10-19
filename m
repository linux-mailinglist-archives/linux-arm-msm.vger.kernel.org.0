Return-Path: <linux-arm-msm+bounces-77911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FACBEE480
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 302AE4E8ED3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 12:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B9C2E6CA2;
	Sun, 19 Oct 2025 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8ouADzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406152E54D7
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760875915; cv=none; b=cF+s81SxF6BCqJt4uVp0nA+1BLi0Q07ZIHRfPjrygrM5agcFJSvb06f4iiP1wxR3j2gBzBj9ms2NW0CIAmOpa1hjzvgshJHeqRFoiWkzbHxhLOBa98Hqi8xyxWlp4X7x9FuHMxm+ySb3z9GpmFAwswb0VRHm4aGQ8KI1hUjrTq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760875915; c=relaxed/simple;
	bh=jvznlM6D5OFeTEFwMN+wEgRK7LeLJiu3wj1O/umiVSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRYEmQLuzX5lOhXyBY/G4ZM6NKFkuHTb/9sWcdnLEVP+x/9jH5CjBVT3lgZC33ckTAPW+E7c2o/pFQx+1f7OdZsDtV8gOy/i6ZJyTCyKNhoVz7Td9MCV1x4ALAh2p1VbR76xtKA7rW3wowAbI4NckCfjdRAF0SlDo/PqRdXt9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8ouADzE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8e2i8011756
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FXakmNjNk9hILrNuLbMXrtpa
	gW3k4d1NuiaVjYCVt/0=; b=g8ouADzEe0zM/uNAVtVaconF+XQLNz+dEJWtiayy
	wZxGiZVX74GKQFgaPqUdiyjOsqx9Q67CLBNMvO3UZU3IxvLpIB9yUJ2you+o4zvr
	HTBnLtyiVb8GD3v9rTSx+QfOyb6UlW4i+KzQrY6CvsLLMPKNSni1LjiQmPcoYyH6
	GmhpYg7qy28ZubfupYrrFfUeX74bL/p+lX+RBANpLiQ+6N2xa2ZsvBOdKEn16Z9J
	3ujNlM5WqFj2bWuSfW2x2irKnhIDL9n/BzRr2jlIrqMBX3dnjL9U0F/xb97u9WaJ
	zgxW9W5fzW9mNnw/w/3eybvl1zxu6NmD+LXTBhBohKLgFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pakqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:11:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88ef355f7a3so1399590585a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 05:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760875912; x=1761480712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXakmNjNk9hILrNuLbMXrtpagW3k4d1NuiaVjYCVt/0=;
        b=WtFVIR5fdfq2PX0bX9YoA+nJYWAPSh0Hl4kcK12KdnMd6A+r87b99X9LNvHfiIAoMP
         P/qu/0+hAolpK+citIjLvOudQ4bdTIMUO9N7iGzTXDF0oZ927d1NrK0XKMLts9Zla25V
         +JYQ27UG1/ivFPtCo3MpJQOlesqNPh351Kz3voPG5UPO+kNrlGtoGfayFr6hn1tkXX6a
         n5gDdkWnadOtZpVArxLmXnWQvAD5QEIOa/+Myj+9i60VSH/tfF0d4woGMpnz8W6C/hvn
         bSU/gPbbJcMOxKN/GFoGDWrLNAPgWeqN5ALN1SGyB3y5tuK5YNZUfOmu/jtx2CEsBgiG
         hTew==
X-Forwarded-Encrypted: i=1; AJvYcCXk8f2Axy5kB1NfS3fIr6Y8bBQVYjgmRw0AJm3B0QeAmqv8kfdi2ZQjANlzeLd8O9I1MgN1T++AM0Pk8OwR@vger.kernel.org
X-Gm-Message-State: AOJu0YxlOm21vmoswFciKL4kYqmy+fLoRqb/sjvh9Zd18DTAGpJpcfht
	SHI7wuQXqjho7y3j8hR9DtGwCAx4LOna+IZIVrJizkLPa9Ggi+AVHt3Mn31s8PV6uWTxBlsjg6T
	jJNxcmB+3qScQXDnGak4YdQzw7vjVPbPh6tMrHtr4CBegn+7XyKhkxOHTkgmYGay8tpIq
X-Gm-Gg: ASbGncscZOupnCGFUnKx6htmd8mULvgRw2zbyYyy84gFkNff5/qCP6audcosw+yWkTc
	I5OU9m3mns8qkkKlq2AfGIW5mmaimqE3ttGcMWjbsz2QmtHW4+Z63dJ1kd6YmUEZe3rl2Xo9Ccp
	wesxgIEBXJkkKohknotpeymHpjno7tY1JmepTk5sq5yDjWoulhHUOaGYAiZ22JzTKFRdXbXhF/e
	Y40sBGhX5YyJndA3e25wT+RS7aLis94CzVamkX1PTx/7T0ll28xkNqmy13MOmNK3KELO9hIFoXG
	awiOomhOMW1BHXKCkkbCLby1KAsgF4bg7BEo5RP9CxvL4WJ+kkY3pcdUjIXanny3WdxYHEt6wVF
	WQgUVaRyF48IONlJ90HC88oHh5ykXjIwzfnm9Owc3BTyuwWnqf29p0FrKk4J+ARdOcanvYTsE8K
	JDjaZZ5Gj+Usk=
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id d75a77b69052e-4e8a51ed369mr89145081cf.43.1760875912130;
        Sun, 19 Oct 2025 05:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQGIvBCD9sJ/M1qvRjDaUZ1+T6tRELaWa2oMHhW/HyBqE/0fYTWTtclEdazefvpcZR2v9Ysg==
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id d75a77b69052e-4e8a51ed369mr89144771cf.43.1760875911633;
        Sun, 19 Oct 2025 05:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b7111sm13663761fa.7.2025.10.19.05.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 05:11:49 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <32iy3k5aq7aiz3juq5i2wnnidsmbde3kdixlkpxrvgv75573ow@ebo3pi6kbr6n>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
 <didkbltadu4ql6xcqtjrtf2iguody5bgy6mqlwtbyfgbambaii@mzofzymnfbju>
 <d13cdf83-22df-4a24-a711-2db4abe3a0a8@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13cdf83-22df-4a24-a711-2db4abe3a0a8@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX3+KPUOkf6/PY
 MVrvJUQTE65kmp2JJ2Wlyk+rMK4SU5sDsI38Js7IQKnTZ3LCjC/QEP7X8b3wJjlY6XiqkMZsyqy
 vx4wricrEoG8yBRZxhWTca8I1hgO0j7vihqoRoT4eNtzA2vxg4B9Xz+4rMzMxx3VGqAebX3uKEs
 SBTbbMteupeaGg7juTOReVste+Hi0l/aWR4+rtakXoUB1MJf1bYcyse7Hh2O+ILT+dmf5SFXSNZ
 ZfU18aA6z3CQtnXfoRDTOgpmnW0xTcTevwOg1+zwufsTAtzxgNzpXW4Hcm7AXXJ+ABoPN/n4vP0
 IjvMqj+3AxNxygp3FRt6XOGRwmTFdosg1V94P0LEvxvOy/QWm4fYYhzpiQ/+MoolqpIKfVoK/Qh
 exy0jPbuxuVEMCuOlakqkKt5d7vT0Q==
X-Proofpoint-GUID: DGtVU3tsbYQ2xhOL1RG_dXRjp_90gl9x
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f4d589 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=yoNOsk6A1An68yMDdNAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: DGtVU3tsbYQ2xhOL1RG_dXRjp_90gl9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Thu, Oct 16, 2025 at 10:46:56PM +0200, David Heidelberg wrote:
> On 16/10/2025 22:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 16, 2025 at 06:16:59PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Add panel driver used in the OnePlus 6T.
> > > 
> > > No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> > > 
> > > Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> > > by OnePlus 6T device-tree.
> > > The reason is because DDIC itself without knowing the panel type used
> > > with it will not give the driver enough information about the panel used,
> > > as the panel cannot be autodetected.
> > > While would be more practical to support the original compatible,
> > > I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> > > 
> > > Based on work of:
> > >    Casey Connolly <casey@connolly.tech>
> > >    Joel Selvaraj <foss@joelselvaraj.com>
> > >    Nia Espera <a5b6@riseup.net>
> > > 
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   MAINTAINERS                                      |   1 +
> > >   drivers/gpu/drm/panel/Kconfig                    |  13 +
> > >   drivers/gpu/drm/panel/Makefile                   |   1 +
> > >   drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 399 +++++++++++++++++++++++
> > >   4 files changed, 414 insertions(+)
> > > 
> > > +static const struct of_device_id s6e3fc2x01_of_match[] = {
> > > +	/* samsung,s6e3fc2x01 will default to the AMS641RW mode (legacy) */
> > > +	{ .compatible = "samsung,s6e3fc2x01", .data = &ams641rw_mode },
> > 
> > Is there a need to probide this kind of legacy?
> 
> I don't know. I don't see the need to provide it, but I understood you may
> want to have it. If not, please tell me and I'll happily remove it from next
> version.

Since this never worked as expected and there were no DTs in upstream
that used this compat string, I think it can be dropped.

> 
> David
> 
> > 
> > > +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> > > +
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry

