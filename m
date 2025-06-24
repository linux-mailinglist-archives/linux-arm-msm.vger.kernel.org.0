Return-Path: <linux-arm-msm+bounces-62260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF623AE736D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 01:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A67035A04BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 23:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFEE22FF35;
	Tue, 24 Jun 2025 23:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7wbS7Yy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9271BC9E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808735; cv=none; b=MpdxWHPzLScnr4RZFyGhJ11NzmpQdHE9jFIesGpwPtaE8wI9CmrmI1NcxcgD8xsmXXz7Nz+vbrFKxOshjExDSrQvgAG5kAFMOI2QNBinF8k/r/gLW3AVBlInyQ0IekPyM5izxVsiLuV/645fIgj5YndJVNnxaQsiXPA5lAe3rI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808735; c=relaxed/simple;
	bh=w6IhdpIk3yS3go6uegQbi6+YJCp+vgrPMBUABWk0SK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYvPrG1gqCjNnNtR3x+gfInvwmjk4JYkKo3YjBpqzB2Au1SO2cW5yj3eWggOYPLpX1fXFb0NFs4cvjNON5Vrw8Xsp4QyeyFelk5LhfRgCN+UMGAuFuUYeomw776+ewv7pcYyEpdfBZDVqRmkiynSug9FlbyT569S81r6fYhFeK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7wbS7Yy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OG9jhB032017
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 23:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WAJsPIbRnjXmAo6ZjZnEWFmI
	vAfVjWJKXaneql+iv3g=; b=M7wbS7YyipqfWrl5JiHqR3dDLD5shJHyYP0Ub18m
	vvQG8JIPVswpSQ1FWIPxRUIIoUXIHz1PRBJklmKRVAxhBVkMbZoiTD3XNVa6cdKp
	+kgX0QwZSLlPrJKrzdqTt1WOmt4MZ69f1q15S8bAQn3xQ1baEVGG1q98PoCvX6XL
	eBgWV2kwekufllI2O++xAYNFdNlrGIRo6JLYb4H1uNUGADvVkIIZpKuJgVMuQtVR
	gWPdFqMRtQFrNrqlNo9h57C4JlEo3NQP8E1nHXN0S5HD+05vb9kj/fQGY2I+PpFx
	IfW0CsWGk/3lvjMaSy1QnMOMCbojQZEikXX6bTOxH7NpBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4q63j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 23:45:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so916186885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 16:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750808731; x=1751413531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAJsPIbRnjXmAo6ZjZnEWFmIvAfVjWJKXaneql+iv3g=;
        b=QDE7nj9yUbc97aF68H5Wc8j4shWWum1seu7leTns8Ld2cBmiQj2/A7Yg14Am0FUDmI
         2i/tbiO/dhoh7b52b8o3FFqdaAf2rfVkRhTlL+thVpHaeoYHUskkzQa6usu61tCD/Zp4
         sJsECBjZJ97MrqES+tbYIrL4W8QOHe3aJFuWF5IsOaM8iWV5XLrI8BzLS0UG8dzEyonM
         B4336FL1gfsOEsbCWihBRhHkW7n0r3Kqe+liuKsPDd11mKdjWSfxLgWAXdDBKi76UgbD
         IIHZpfykTbGosLwGIk98Q9EyOaS1QAd/th2J29PWqahVNXNhr6MHhiH693MGwRwWKVlR
         CuGA==
X-Forwarded-Encrypted: i=1; AJvYcCUyVZe7of9mCEsS02QRkwp87VUghSjJPuHtZ1TgwmU7NwoJa58vYufTD8Op1wrIllNGpPnUM/966NcKT5Xn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9IV3WnGouyJwFlKZWYZ11W7DHGym9n70ETqIJLT4k81QpGci
	nc3TeF1ZGme/R0KqBj3cCj6vA7ipc6KAzfxpSWcvW2DFYNiwmY4Gw/zDQoj+22jZdRjkfeSdVwx
	Zi3o9/hHLWVNBkKIrYCqtjW7XgiMFQo2Mvp+TcLrN0NIHBEg1UQt8KEfIzZjxE6i+CCmL
X-Gm-Gg: ASbGncv8UdbX1FUGGqrOByYBRYh8EIq1NEEzhCoC/dEw9qqh5Rwi5oxGMF9qMDFCJjb
	QhH86RF18Rn9XG6fEdT9bSCVZRYplr5c3SGmONrK7CpApmj0i4G//JPZJWMX6PhbpfIkgCxA5VA
	4Yc96SawOZsC87Jm7RTg0WNAT0b9WTh7iQvMSuYoVKjQwBe/Jxp3Hn6KV9ApiEcetAV9N7+Oowr
	7fQRZ/2iFG1AFIxBxk8dAERbTC50AtmK5jad0gRDqpbWZvxDKHCoz1tkQRiJ5OKmv5/W6KymfzC
	BFcwk9rwCR9x9mM31qAtOA5AbAzDp1Vdv4gam8xo25cIKDRIV4HzwDoUyt9LedxReNiDnD+Inbu
	D87fJkmEgCTJC+YBVDGcly1SdqOwKCD5YNGA=
X-Received: by 2002:a05:620a:2608:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d429738b3dmr140731585a.42.1750808731318;
        Tue, 24 Jun 2025 16:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgF4lKMv9pFTpq+Z5gqbHVZeWYlPV4tLNkOFjao+Almo/kU34/QQnWnyKwCR8y/LNKFMM9dA==
X-Received: by 2002:a05:620a:2608:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d429738b3dmr140728485a.42.1750808730822;
        Tue, 24 Jun 2025 16:45:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d2e38sm1978871e87.240.2025.06.24.16.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:45:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 02:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
 <2025062434-reviving-grumble-1e53@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062434-reviving-grumble-1e53@gregkh>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b389c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=_JTX4_t6f0o1SzS_BCQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9MHGXuEqlLKIZem0K4j_1AH6UkrMBoKo
X-Proofpoint-ORIG-GUID: 9MHGXuEqlLKIZem0K4j_1AH6UkrMBoKo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4OSBTYWx0ZWRfXxGQCyYcqPi7j
 ydtrffJDb9lin9LtBUUsSDeUh0skOE1lEEAYr7vIHlU1Vcg8GqGJyaOvpghqZupq6xgFjvXJIrn
 hUh9TaSj4ma0/yZb+SDorkbVOUQ3lYCQtwyD2bKd+4bG5+5GqymqZn+2NkcUynfPcHp8rkbyiBG
 LuLJEkmDUj0I40u6v3vybozqgaurui2VkmAaBpgKi2n9gp8FbVGnbL6zgdnedrWQHZbLxKPe/q3
 +ktH6TO53dhjcdZvn7A8iRTsH6vt8yXgzj0gREA1GGL5qqSZqMUwg7qi1u5Ssbuw0auye1Mw73u
 qIBsTT2GIIOwJY0h46zS5DmKy5TI6xHmmpyu1YkJwW13kP//5f64OfjUtRXN8V1Pxf71DidvIPd
 WPIHzYV7kLBpvlGnJ+UbSh//X3ebBQ4PNfYI0oAUSCbrONeCBxsWWS0fxJOJFmnuwFkp0zie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240189

On Tue, Jun 24, 2025 at 04:38:25PM +0100, Greg KH wrote:
> On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
> > On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > > > During rpmsg_probe, fastrpc device nodes are created first, then
> > > > channel specific resources are initialized, followed by
> > > > of_platform_populate, which triggers context bank probing. This
> > > > sequence can cause issues as applications might open the device
> > > > node before channel resources are initialized or the session is
> > > > available, leading to problems. For example, spin_lock is initialized
> > > > after the device node creation, but it is used in device_open,
> > > > potentially before initialization. Move device registration after
> > > > channel resource initialization in fastrpc_rpmsg_probe.
> > > 
> > > You've moved device init, however there is still a possibility for the
> > > context devices to be created, but not bound to the driver (because all
> > > the probings are async). I think instead we should drop the extra
> > > platform driver layer and create and set up corresponding devices
> > > manually. For example, see how it is handled in
> > > host1x_memory_context_list_init(). That function uses iommu-maps, but we
> > > can use OF nodes and iommus instead.
> > 
> > Is this a real platform device?  If so, why do you need a second
> > platform driver, what makes this so unique?  If this isn't a platform
> > device, then why not just use the faux bus instead?
> > 
> > It seems that "number of sessions" is a DT property, is that something
> > that is really defined by the hardware?  Or is it just a virtual thing
> > that people are abusing in the DT?

Purely software value.

> > 
> > And if you really have all these sessions, why not make them real
> > devices, wouldn't that make things simpler?
> 
> Oh wait, these are "fake" platform devices under the parent (i.e. real)
> platform device.  That's not good, please don't do that, use the faux
> bus code now instead to properly handle this.  Attempting to create a
> device when open() is called is really really odd...

The driver doesn't created devices during open(). It creates them
earlier, then another driver probes an populates the data. I suggest to
follow Tegra approach, remove the sub-driver completely and instead of
calling of_platform_populate() create necessary devices manually and set
corresponding IOMMU configuration from the main driver's probe path.

-- 
With best wishes
Dmitry

