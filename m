Return-Path: <linux-arm-msm+bounces-80203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC2C2F29C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1CB5834A7AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E390D287506;
	Tue,  4 Nov 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMY5XL7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZ2lCjP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5240034D3B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 03:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762227037; cv=none; b=Osa/nxN+pUz6MTK96D3Hidkvm3u9SP/MMbqhH/05X8hx5E185EIKhlEb8Sp9yByM4FVasc2lu4VWpFFPzUw4/zdXvDfiXTjKtsptgTJBy2UeyGbjY1qmB+efDDiYvthjSSDXbb8ajbpWgweLArw/M1FY/Qgv2ZPXOJ1yZv5NiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762227037; c=relaxed/simple;
	bh=BlSk3g/qmv69Aqy08a9H0y9SJtoy4sGuPi5gwuM79B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWULmxQNdo4X62bqsVwEPuA4Ua5JDgNH4ruaLQkuH3AHr9Y1EkSGcapyUsmaVuHHTL9DeSpTuFKftwKsbbBMB86njgBXlP825tanJuoOCcnpdJ7KWrTCOlUdru1g+3VHPqugBsH3xENehyZ1Jo+9SjFZ8IuA9v9qSlQUXo1tqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMY5XL7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZ2lCjP9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H4DKV3616709
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 03:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKRlnIEjZ1vQhOJXUwZiC+b+
	tF0FUi5RTLlNjrfPLQ8=; b=DMY5XL7fkmJjHz5/cfERKpBEAgRRAWN7k4FDzq8Q
	LtTX9vfaeQBbDYs69EpHcTiwfc+LH2UfbPfW2ZIlsCWwZ1cNloGrMR+rnWJDy+it
	6tDscjvGJy4DVfsbJqsH1DdM1BUxUHOdDHzq3y6p0Y0ebVu8ouIQv/gh895sK8TM
	VY28Ow5glaKWua5RtcexvxpSk6YPPtWHfl54pMbb5JCA83qWzXqQSRGS5mkJ0dsW
	BsPoE+Lmy+0b2KgdM8h9bCaah8oN/HeIakYCUbBbUrl3F/6DkEkXKYmRn6sLYT7c
	7EfXKeviDSTLYpC3QXRi7vNpKdeyQxoiGgGGT0SjoF83Cg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70fhsfw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:30:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3660962a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 19:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762227035; x=1762831835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKRlnIEjZ1vQhOJXUwZiC+b+tF0FUi5RTLlNjrfPLQ8=;
        b=JZ2lCjP95wd+RrTboYo9Q493lor/yMXHwr5WFgjVIFH6LNkMD0yE4FHDxoqVfmKLaF
         2ozn7Diwv/TpHTPuc3rLGKQq3COVFXI3T40tMjVyOYkAJWXCsBjluHjTmoJ7u4Sn/t7G
         GDwz/ewjCW/ArxraJ0wq2vgR5XVte96n/NwGXMycmF7jb3zgRK+QtB/wz1Gjrx7yHEjT
         6lHP+dGV1qOHaWluMma81uEKKOk/SUI+J71oSEBDayUQrm+hZpxciOg2sUW2WidA+Vxt
         VvA5Jm0kQEKQi8NGLHAvhAOd7fJkrbD/kYB4Ye/prsU6EiyYvQbYDXr9p4pR7lu1qIiN
         xyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227035; x=1762831835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKRlnIEjZ1vQhOJXUwZiC+b+tF0FUi5RTLlNjrfPLQ8=;
        b=SFsSJPtNoQgFYKTP6QNCWy8QqpCDCdfxaBvDdzc/PUCZdqwBIBX9atUtmCs2vxjgbk
         3G3K51C8B8Ew/ESMwdJKWMo+BZtCzXcS/sHPsb1Tg9U+xkg8v2zMM/NhGvIlhXEtDvbs
         bO5Z7ROsvZHpUdtpjZY+sjZcC2qtOZ6HPr3c9s+nLOqJQEt/l6dK3El6K4d3z70dR4Zw
         LxSXSWdZV5pl7vGpT6d8hYWa0ztlKK8H4UAwavStmljjYmoke72gpwR/swCbuHslDc8C
         YRCZL4TCz9unAerF7p3r2N39T5+WtCiCSvy/lwQEV0dYfQKtRSkkGtPnhD+MN+0QDcZq
         3/gw==
X-Forwarded-Encrypted: i=1; AJvYcCVAwYjFB4+rNNJmS8qStfUXoErZh5wtjefkawIizd+/kYWygXxm5Tl9Z5Hn3jqDoPTDuvvYScSab1mdoaT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqu8w1YRnowjS/JFP3WHvNv/DVjOTIvpv3p1JJLwkI4PqMKv40
	B8Ta6g85+LTWBBTzlepsnoqoggsD8g785D9MkiZ03EaxtLCUIG+fLnuXjyi6ZgE2ER7Fe7HcV9o
	Jm0iE88HP151rwX7vwitcJyjw4cuuoQffCmthqem8tb3ONq5XV2gE8u3yGh8H9PiVHbBj
X-Gm-Gg: ASbGnctUhdkQ1tohhFFMFS1UoREJ0xtqY3ba3JCtjfndteKnq3LVSzcgGOwBzN7uNPR
	JtdfFoKyVIj+WdWld3RUcyvsQSiAUk3e1Mf+XaWleeC1F+7233uJmkKHHf8ow/4TPnUl20UnuyB
	Wzx5lmNxjfYFdkttdf+NjTojB1cOS0tm266lI0yR1Ef3PZw1NqUGAjgmDyifOUx3J3/cnxvSZPZ
	RbYaG4xrbPKWrsJ66AB6a0ODxYI4YwP+0uK6paBlMADT+Ld4Tb7YTAbQQWvyn1+i8yy923RplzG
	QF/fzyPXbB5dmgjGJsM7eX8eSptRa5GKglWJxhZVER9qEZHo9/mDncwroOWHT850mG+t2o4R6J9
	oy3HZWcD3f8Bv6XPTsegMgJzgPTLv48I/
X-Received: by 2002:a17:90b:3d8f:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-340f05a40bamr9318451a91.21.1762227034796;
        Mon, 03 Nov 2025 19:30:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJt+3mR9cCrponHqIjyBb39wA61XEC1qVOkrzh6B9Q27iV/RhmQUZTE7F/v9v66nMik1499g==
X-Received: by 2002:a17:90b:3d8f:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-340f05a40bamr9318414a91.21.1762227034250;
        Mon, 03 Nov 2025 19:30:34 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417bcca63dsm364697a91.4.2025.11.03.19.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 19:30:33 -0800 (PST)
Date: Tue, 4 Nov 2025 09:00:27 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNiBTYWx0ZWRfX4XnEhDL8AdCj
 hYa6K47JHxpQePM6wWPK52HzQO9POk7Bxfq4SV+bew4zZOcTpqrtfZDrWL6uPwlmAZaAvG2RM7j
 6vgtfbUj2+cLIDL/iE8zR5zmEOuzJP4yBHWV8CjXddbiqBiXNNDZhpbaXMMmw9R68FPaqeBR0qf
 w1Ip7oXO05t1WIeYUF84NJLWFxThmQaNXbYB41TugMGWHrASsFNGKb9kZBVcDg6LMo/aScesH3B
 2SCiE1392HyMMlnaPrJwfR64ilnh1w14Rc2sPzFUUbO9R77Tmdtplw6YFfV19KggsBbY4HCDjZf
 hdO6Se6/gvn5MgNfwY6Ihn2FkWcMXHC4PuTYK/Kfz7w18UYlvtoZ58HxMXqjS2MOroPVl1JtfX4
 vUFCN/FYz28UUbh53IRGGZZE3EU2lw==
X-Proofpoint-ORIG-GUID: YMy71Z7kAL5U4M-rpKGqUPlajIUvAoCH
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=6909735b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LARJouCqKqH4ZFREdpwA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YMy71Z7kAL5U4M-rpKGqUPlajIUvAoCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040026

On Mon, Nov 03, 2025 at 07:01:51PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 03, 2025 at 04:03:44PM +0530, Hrishabh Rajput wrote:
> > 
> > On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> > > On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > 
> > > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > > register the watchdog device in the SMEM driver.
> > > > 
> > > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > > present in the devicetree. If none of these device nodes are detected,
> > > > we register the SMC-based Gunyah watchdog device.
> > > > 
> > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > ---
> > > >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 37 insertions(+)
> > > > 
> > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > index cf425930539e..40e4749fab02 100644
> > > > --- a/drivers/soc/qcom/smem.c
> > > > +++ b/drivers/soc/qcom/smem.c
> > > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > > >   	return 0;
> > > >   }
> > > > +static int register_gunyah_wdt_device(void)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev;
> > > > +	struct device_node *np;
> > > > +
> > > > +	/*
> > > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > > +	 * the case.
> > > E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> > > arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?
> > 
> > 
> > It doesn't implement Gunyah watchdog. For platforms like these we've kept a
> > STATUS SMC call in the gunyah_wdt_probe().
> > 
> 
> I think it would be good to make that call before registering the
> platform driver.

Did you mean platform device here? Becase we don't want the gunayh-wdt
module to do anything other than registering the platform driver on
platforms other than qcom.

> 
> > The SMC Call is expected to fail on platforms which do not have support for
> > SMC based Gunyah watchdog, which in turn will fail the probe.
> > 
> 
> Perhaps I'm missing something, just looked quickly and it's been a while
> since I looked at this code, but you're making a HVC (or SMC) call with
> the function:
> 
>   ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_VENDOR_HYP, 6)
> 
> which doesn't look unique to Gunyah in my eyes.
> 
> If I read correctly, the ARM_SMCCC_SMC_32 is the only bit (literally)
> that differentiates this from being a __vgic_v3_get_gic_config() call in
> KVM, just as an example.
> 

Yes, you are right. This SMCC falls under ARM_SMCCC_OWNER_VENDOR_HYP
space, so it would behave differently on different hypervisors.

Please let me know what you think about this **defensive** approach.

- Move the Gunyah platform device registration to SCM driver.
- Checks to be done before registering the device
  - Make ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC [1] to verify that we are
    running under gunyah
  - check for the other wdt devices like kpss, sbsa in dT

ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC will not be supported by all
versions of Gunyah, but atleast it would confirm the definitive presence
of Gunyah.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-4-1e9da6763d38@quicinc.com/

