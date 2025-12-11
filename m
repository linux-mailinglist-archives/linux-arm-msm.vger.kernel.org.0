Return-Path: <linux-arm-msm+bounces-85062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5967CB61FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73DE8301AD28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221C2C11F9;
	Thu, 11 Dec 2025 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFDvx6Pq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX8lnnIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AA2C0F78
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461480; cv=none; b=EccTg/z8QBBSnaeTbIR1huTpi11cPBT0XP7bdacH1e2QhTHCl+hhFKPpdX0IqEYISaftwfOvxhHYhU1U/3ouAreBiX1ei+SqRDGeVULNyB4MkPtf6cs+YnEI3omKhjCMytkf1BaTuqdbR/UcQ3U99LfaSkBKh/2hw8kH0cW/Cys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461480; c=relaxed/simple;
	bh=E6J+s1ir76ZerayYtD2w5yzzIIMkc//ceWObfnwy+dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLcCkHXw3m+IItt39IJutSPVz8g3Ce3ueOtomGIIuINH3x1FgeU0y+HHDp+09m5KnxHP4KTxChjRN+ygemPi5BCzEyEL1zfcoGoHAA6Wgk2JPxja5JORCn4bFBuZ68HYROSFdEgESNtsIVd8ZWLDL3L3synVPxhvcRi1fpxFNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFDvx6Pq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX8lnnIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXrhF1597507
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NHaQjXZedbPB0BE6Tg53rJFg
	jUM0ap8QHGxUzTRk9Ic=; b=JFDvx6PqHb9tSQ8q9ZcmLQwG3Aw4CDhb+4mVTNCR
	X4S7yeLKl1JxDs2qnP+IdrAvpK6iKV9v/ukE0Ziu9r6QOc/Z+/TnJTCp4otWeVH9
	8U4oxW4mAYokAuA/mwp6DfY8V0XHqVZ9yvA9NpyWkabcYCzJXwOjGPlqSbYUup8J
	H/nV8LrQyToI0PA+AcD+sfvmSxHSDmESTTwhRvfp0K7WiBvnMZrz+ODUrhQIY61c
	n7WhgA9r1hC3XF0KLz7nz2oI/wTiulKBZsi96wDKEOvdO6kEBUeIe4HnYFllMvrW
	19TPYOCLMFOCMLTo5O7RsAmI5IlJLP2KgXLKiVt0kp93hA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpbv9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:57:57 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b09eaea3fso133443e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765461477; x=1766066277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHaQjXZedbPB0BE6Tg53rJFgjUM0ap8QHGxUzTRk9Ic=;
        b=iX8lnnICzlEiTCXqb6Wq53eMcnWAPDLfbU/s6QAY5ZK4i3gHWKX85k7T3LDMixzZz2
         pimZlSwJwi/aj5KT/KoyaqQhBORiUdZ0YOVo4E6u0MuYiTd9vCnUa5g6SX6isXWvcQBT
         GvlazYHrUKraO8weE9dgW/uoQIUbdbkSNCJj/DkKMMFEcnIvh6XdVi2OfgCprEwvosvH
         wiic3sAPfhQMyMLnRMhdVXL2hSFva9Qghbri31OIMN9Nk61HAEup/hZOQrtA1uhVdgxM
         ASWsHzJoe3k6y6Gl9GfRj0A7dBjcugXkjAfcx82dHrxqbFxX1Iz3P3ZUdunNLZaGFLFM
         n5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461477; x=1766066277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHaQjXZedbPB0BE6Tg53rJFgjUM0ap8QHGxUzTRk9Ic=;
        b=pmOfynQKI8BjPjLUf0Nlc05haJcrI6gLgMK7i2Zeej8UbK90MWyDxZRYx10sD4cRno
         a6nT2Dgnp4OWTCfjo4UCtMbrXafpz1W7+hUXZrYZF5w0nPAky/2Iwh9Rca0Ds22l07jr
         AiA173HMUWCc/kMb5e6RlGyVl0UbAjgdLG2KIjoyFeVj6N90ZqRG4EBNQMf95y/oapkq
         Auef+V9egi3pYWvwR1do1yO1dvcfbYv9aTnQjMTeT2WKAQtMX4IiSLPMxkSsOj5SxfaW
         miMpJ5omXrj8wT7Wu9loDtITU5h5d9mJi4ZXKZqXUUK2ErAUdLCRw/mpFoSTLYM43uYy
         eIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7dZimh3HFYZiFgWGVK7uz6PdsG9essS3oC2I2VcSKnPyq05f6/jbJBBkYCta2rd6RHjhiFTFDi82dmgFh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8vwl4L5jYMhj92Xa0B/l/KlJvGRRNr2mQ4y59Wh8lAuEjjhw
	EGzBRu4YfhF0NBtxDUcj5BFyePnDG7F/1LW0/CYNc2/4sYMlBwgrsekaWL7l+K5LRvEgZddHIsd
	nm9Fa/xo/oW+Yg5tpsqGf4quW0GTiWB0XE8ngmtrjVupC1/EpZQ25F62V4eCpKcgCb1Nz
X-Gm-Gg: AY/fxX4mTN0h/0NTOeV1yLWBh7dGWuHnUNjgyvxoVyaCpImhOGtGm5TqlPWO6pGloqy
	BBqDHLzDI6iBwa/k2wHbc8NfQH81OfSiYWHQM2DE7/recZMm8NSRgA7KrrOM2lrcKYrooTCDslR
	JhTSrwbssw+89o6h8YcDQi05Hk5VBHVFEcRnALY8aU3kGNGnY75cJUYUlxDqQID31YyC8H1iNK/
	ascVtCwsfc65T37pdPi560TRoBMUBAbYB884PgGrXIacQ4OaVt3GMHAq8CpHVn47Nhaeuc1vdB3
	1TPUwcigoMQx9K5sARumoGSLAyl6fD7zXgJrKoPurGevINwVPLMCdeGuMNX8VPNA5i7eRZte1vL
	gNESQQO2a9PmEXXeaHSJ9jtsYoFEuwvnBMQNzPC0pZX3pZjJyUuOBqsyfbLDMFzh/uZeXEALZTR
	ecw+N/o61lgKMTmUyeKr6RW/g=
X-Received: by 2002:a05:6122:1307:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55fcfc0039emr2042626e0c.13.1765461477210;
        Thu, 11 Dec 2025 05:57:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRokDGKOZnfhAu7AfSnM3zMB7Xzcnq3nI/slMvscPdYN0YVpU88J9PSA9sdv2VGHSGWJh6lw==
X-Received: by 2002:a05:6122:1307:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55fcfc0039emr2042607e0c.13.1765461476788;
        Thu, 11 Dec 2025 05:57:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca7dc98sm6602941fa.37.2025.12.11.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:57:56 -0800 (PST)
Date: Thu, 11 Dec 2025 15:57:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMCBTYWx0ZWRfX5RqWlOwP6I0H
 guVjZAkXuL8E+fsx13JE3aMxLBMIvZOg8z90tnLpRo7zej+b2EOs8iL67098cc7RhK4Kj9FDJQ5
 hsCLRcgJ0eLQBGgVPghe3R/mkTJXEabetcWE9hIjPFokMWrpNCKIkjD750gJJcndHGbkV1NrxzC
 YK/8qcodQJABDON60GsKOjZmrWu5Z+orFeqdrVQsOfVwhbpwge0+FnDPULQbRN5lWLofvOU218m
 RKymYKPXKzkhAq1s4IsPCMe2zM45OqmuI5N3kjnVkwLr28J31CxLgYffeQ/LvFkHjBY0TFY7L0p
 5mKCkBXifSSxZgYhfEazvVP7DuiufvGh/nQ8EpfuMw39fXPP1RyXs5Caztra4Wd9J/jrhVLMiav
 L2xldL3xpc7/2f7nEzjk+Ig3cnHwsA==
X-Proofpoint-ORIG-GUID: KFmGtZUsHZohrM-_RXeSG_zg6_3hBYbU
X-Proofpoint-GUID: KFmGtZUsHZohrM-_RXeSG_zg6_3hBYbU
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693acde5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eBkKlvPrDTbhV-cBLhQA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110110

On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > 
> > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > authentication requirement.
> > > > > 
> > > > > Current image format contains two sections in a single binary:
> > > > > - First 512KB: ELF header + SBL segments
> > > > > - Remaining: WLAN FW segments
> > > > > 
> > > > > The TME-L supported image format contains two sections with two elf
> > > > > headers in a single binary:
> > > > > - First 512KB: First ELF header + SBL segments
> > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > 
> > > > > Download behavior:
> > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > >           2. Full image via BHIe
> > > > > 
> > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > 
> > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > download over BHIe as it is loaded in BHI phase.
> > > > 
> > > > What is standard about it?
> > > 
> > > The TME-L requires standard elf image format which includes single EFL
> > > header and WLAN FW segment.
> > > 
> > > The "standard_elf_image" seems misleading. Since the new image format is
> > > required for TME-L image authentication, how about using 
> > > tme_supported_image?
> > 
> > Just elf_image?
> 
> Is it too generic for this specific use case. Current image format also
> contains elf header.

upload_elf_image?

-- 
With best wishes
Dmitry

