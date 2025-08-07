Return-Path: <linux-arm-msm+bounces-67988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60016B1D5A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B7963AC54E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41753218E8B;
	Thu,  7 Aug 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdrQb/x8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333E22A4E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561830; cv=none; b=U9N0SCD4VWNUWwkg6FcYzD4zefh9XdRvVbxXjnUhMnOIN7L3n0eV/WS+AKKR+8Py8LYBqZ4h3XjSESmEAcv69lFt3uHj9j5f8faXznFpRUBxTbwRgfNakb3K6mlBc5+f3dl2fqLl1wVeJKDU56H/HWKjZEdov4/eUyJpDSVvjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561830; c=relaxed/simple;
	bh=hQqQrB9x5CTf2+b2miREUHPTZdmUilKcUNXrLQs7I/A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AATUbXuep8btzb9mWSMetwII3RLfXuJzDN17gJcLCV25RW+/eizr8SOdarpun21xQn+9CSJYQiT30uGd3vuZbZiylOL9C+wB/pN8SdzSUNfH+aEauMmf5GnazLqCjTSk2yJ8f9Ce9bZVwmYXO2mRAEz02Jqyee3Kg0FC/7l/JyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdrQb/x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DA9S011872
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 10:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LSMAw16rqz9HkkSbuIAhf3q5
	6NKWpVJbEjxeVNYRh0w=; b=EdrQb/x8xQH956TsVerEzZsaOrg+ke6vrRoRE8XI
	SUZDkhNRRCezKN4sYiKnkBPNA7wG+ocvMa0ewCJA1ZkaUdDkMSfsh9D9L/zbGpvk
	+GX1f4hcPsRfA7hzhNvEaRN6vDh/j2kLB+Noe3sem1xRen7QwqtAkU85zYiIw9Iy
	kx/iEge4nHjXFS0QzHhR+Dfwgmia4gURjzNYdFoxeE5Q6PSWkFHI5mZdp4/5Fq1+
	Xz6PeiijbH7qS3fQYMz1r+YSSZlkw08PNI+rGofdBmNtC1Hi2wwVrEEXSOQvInDs
	ZkFep19tiGaQbm6ApQNP+WZ167uIMjLDSMJQHTI/v6u2Mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy0nq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 10:17:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4aedd0b5af9so18390861cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 03:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561827; x=1755166627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSMAw16rqz9HkkSbuIAhf3q56NKWpVJbEjxeVNYRh0w=;
        b=e4JqcLrDfizywovqplEoiMfmY9kqKAIjr2d212EOY2UWS0y6zGS+059A1et3kz3qrC
         HtdwBq2oP7prYYpsOsQ3ioCoSh5BCZU4EeJmTI9uOY0vhFrFnBwbc4QjEQV+6S+3y9oL
         DJPfFV/2AgNGmNOBR3VloWnIYVJyjE01Ggfb625VT7PEauT7ftDYgfelOMe1ptPz/P7Q
         SzbNeDVNckN9WIvQASh0Kn/khttyR692CGRAQd/AtaILRa9eeOytObfsYrh1nJW2jQXW
         K7mX0Yj9erAmp0WpA9zQTJFQ/MHT2EHbYEIMe1VVRJL2beHYi8/igIBuZ63MlaAX27iZ
         33/g==
X-Forwarded-Encrypted: i=1; AJvYcCW1+5piy1PJQ8+96PsckGeWnIcpnhzEqfDk3K0DKeENWJtb6zvNEnYuuKQH/mAvmGTvyy7OKwiUxK8tBq8p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+DK4ipybnKJTbkF5JomtaSWKzDjJnEhvLi+3FBdSvIemR5IG2
	15w37AY9iZvY/BLfjreFEL26ShCWfQEF9bbsrYA7zDBga4wfoXtvA2aQPdQ2keuAOtxtw3IXfz1
	M0fCyZkI6IcHm1VPGjXAvVIidaoNBsUSHFf1u93Q25MpAVNkfya9Okh4zZ8VwUn6xeK10
X-Gm-Gg: ASbGncs0z7RvCVN6XqdlTwcIp1xFd7jGpwKbW9Imsffn4st7tEwXF0NqZmC/+VyZc+O
	Cxtwmwup5OtalRiYKhHMaSR9k2uSYhpitgSOPr1pGd01gMaY8s9PHk1qAcFFSAi5ID18ifxqqUi
	/oOVgrwek7xM+C6Ve9UUb/psN40/72yFGnKb1mq000z/Gv3we/oSXFxRfP7Y0L2FQzOL8D2gAtY
	hggZffVXaukqBL1YzHtKnQLVVCskvcXC33I+6cuFZ3mDwJIZeT9nQ5zuJFzLfEXClqq44EJ4X0m
	p0TMaHKWl7/Sfh+4eV7voKgtKcWH1uv4XaJWXfuhYxT25N+WMqMq1S2yc7/kqkbb+hBkeQ==
X-Received: by 2002:ac8:7c44:0:b0:4ab:b0a0:5b58 with SMTP id d75a77b69052e-4b0915b2ea7mr88011211cf.46.1754561826695;
        Thu, 07 Aug 2025 03:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFog7XVeNO1DWuYUw+8uakXHI7VfO0Cam05IxQrT4njSSBu3k4GA9z89rCO/DGT0Q6+Lpq0A==
X-Received: by 2002:ac8:7c44:0:b0:4ab:b0a0:5b58 with SMTP id d75a77b69052e-4b0915b2ea7mr88010821cf.46.1754561826232;
        Thu, 07 Aug 2025 03:17:06 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm26613983f8f.44.2025.08.07.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 03:17:05 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 7 Aug 2025 12:17:04 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJR9IJYz47EfNamO@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
 <aJRMUzF0GN2LFIZd@trex>
 <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=68947d24 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=7TY_VEaP9L5SwCdglBoA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xb0LGPSpi2S0mfPbnF-A4-ZLn94sezSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX4xmyQYeWiari
 UaSx9KkfZ+mqTFpd0ZaRLQ5ScDYRt9V/O0m0ypLLUqUlZosmtbjM3Ay9WND2IuwDLuncWDkMjOm
 28vYntMXmE4wzOk8ToEaXcdPfrWB6izYl8f92mLADkWaBs4CiaSXvjpiZjD/wNfIhvQm3n0CGY8
 V05iwpoc1650f53gbalRp2y6K6ziNxFex+KOqlXGtIkd28beO1vPBmdXJMyXDLCNQJIH6bbyYoZ
 xJSQe+o7CaLRT2U3mM1ic9nKqsrwP9N789Boji9Cyzd/quC7tr+C6NiC8H+/+HMkQ6W3JPeyQhm
 o2CKL0CLHDXhQaXb5pdZdqqR4YjuevmOymCrBvEQ0ImJWQrS9uZwVmD15qHEpXSBTXlMfdGTdlJ
 sVcEteNO
X-Proofpoint-ORIG-GUID: xb0LGPSpi2S0mfPbnF-A4-ZLn94sezSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

On 07/08/25 11:11:31, Bryan O'Donoghue wrote:
> On 07/08/2025 07:48, Jorge Ramirez wrote:
> > > There's not alot of value to the user in that configuration.
> > I dont know the user base but when I originally did the code (v7) I was
> > thinking about security conscious users (signed firmwares) who might not
> > be able to switch to the new fw release so easily (unnaccessible key
> > management and updates).
> 
> Since the driver for the LITE hasn't been upstreamed the # of users must be
> ... zero

sure but that is just one dimension of the problem isnt it? the other
dimension is the number of users with a signed firmware that could _now_
enable the driver and have a working decoder.

that could be zero or plenty (I have no clue) 

> 
> ---
> bod

