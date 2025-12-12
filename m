Return-Path: <linux-arm-msm+bounces-85115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4663DCB9A2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 20:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45A5E30076A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 19:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDCE30AACB;
	Fri, 12 Dec 2025 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/32L1dH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+2i2eq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70E2F5467
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567452; cv=none; b=n5IXcQJ5Vvw6Uu8WHhvmKNKJS+5DRx+UhcCTxv0YY8EKG267U49A7qNSjgbwebvjnPsMOkWCwwW44fEnd7O/SyIWngEc3XWjAmHUPgbeRnDXpHY6PhM/VfaHSVr9ZZxCWRoor7nfnm6AL7ApITX0pJN7uFCeIuwBQyQ9Z0O9CzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567452; c=relaxed/simple;
	bh=JG1eh83VUAe7ybg++FT/8uvvYfh/CW0gtMmTomvJSzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WosEeoKPlt/3nAWk4VBVjXAzFD4wTJ8B3EU633vZpypKa4q/IZAjYl37unpWlf3H07EInhaAxTCzMcLHsve7Yq5VBHMwONRFfijd37d62q8uW3cRceUG59ApK/Vdgm5Ap1NvvRvtVUQeLDmqXtIp1d9zgVnpyQgSyuBnkvaow04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/32L1dH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+2i2eq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC9jkgw2946295
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vBp4N59DWuvcPKDmqy9j4p8p
	DX+N9x/9WBdOnhLgvWE=; b=D/32L1dH4m9neKbw5f6ssy5tTOCuY0cWPnr8yTMe
	1Ad4JtI6oQQAdozrv2N5FxIyvDw7zWC28hsrsadWbObiZZdn/C/p2O+1u/bs+d+Z
	V6O1pq7euHAWFEbV40u+3igDlFZVDU04Hus5L0KSXAaN7aA2QMBxj8jwq4ymQ6io
	mGILGhrUITHEQEF1KLVMZw7xXyNL93+2eHR7YSUSWLmmT+3JD7dKThpEhYDTi/Sv
	LtmmOkxeaYRaWYoQGeclxW26yEMIhh+jFy40XHznHRhrECuxMe4utqXSu9KbWVQr
	oFPVfFvaxgJ5laBoQiEVbrthVBGi8J/4/NmZBtguMQt1ww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04a2jvrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:24:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so33788201cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765567449; x=1766172249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vBp4N59DWuvcPKDmqy9j4p8pDX+N9x/9WBdOnhLgvWE=;
        b=P+2i2eq+KPsbSPds4SV+0esGzt6w2YWuMQCjezG+tDpEXetkNh6bNXDH0+JMoEphhl
         EGPjKoo9+rmokQgXWhyv2WSaXvym9UOa7W/HwOs7bLpO7cXzKDAEOe3UdKpGigmhJFYU
         rUS6DiYESXiEbGcAdVly6tlpF17VPghppHlbX0XkSQzlwAzMW1FJpbWOCSYVA/FqRwnG
         ccBhLNnNvUDSsAnIJFZ7Xq7UdvHexzgs+arcVhDVMyE0oLm7ziH/E8F11KoumioPYQeu
         escKR2cv3HzaB7PWzvwuwKlOQURLBqDqkzYlFHqixCFdXAVP1Yy1piD+3geWJTAeaaCU
         mCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567449; x=1766172249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBp4N59DWuvcPKDmqy9j4p8pDX+N9x/9WBdOnhLgvWE=;
        b=Og0VcFye28o+7zemFDEOQ3iX0BCdzseHUT4U83eKj58bYhNzK9bFOE9P9jArBxTBez
         KI1QOZHQCdctIaE34AGCj1v6Xtwkoj2PC4AZTfpHkDXGWglDk+fd0HRcI2Oid7VZ/z9N
         t7XklwU0BM9OAC1Z13yUhNpIZvvrgp5/2ccebU0K2b5ETvWJzK4ay+z6PN0xyVOUQlIW
         WtjpVv0ovWsiXzUK9djQz2pxERF4KWr16eN1Um7VOYttiFViygeGnTrvRXB6jaRDwZci
         LFSTCcH/lfT3jFwQktJljzBQglAMBJGTokR8/WkYM4/VKKNkDQMq3ekSXiGgvX14i2Y0
         1BtA==
X-Forwarded-Encrypted: i=1; AJvYcCVFDjYQVraVdz0zw6+3qXnSiVQ8OkdqDHwXDdilUBw+0Rp1jjM+8CPYQdqnsbeFrtGWjOr7JzCgsBu54Z4F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48NfV7IpDqzouAmoBdxY40o7icswMAFhvWgpQTBVF6dtTH/SS
	+0pJRTO7HXR2u1RXQsaTyx+P8wm+1AuL0BS43oHCOVrJ4ULtpFb0RvCnEEiCPpBVJuAFrYkydEA
	HPYd5G2gn8aNPZTGK0fiLFDyFSiS8L2EIxwgNiawnFICF2CGDvMoARXjTKmpL6d3pmMvX
X-Gm-Gg: AY/fxX5ckrf/audnWL6TrBhMu0rlxbxDLWXPbIzdv+Gh5cXjILdjKVtpA7G2nQNwzIg
	m1bAVuoXAJwJEQq4zfKF5sasbdUvZ0giw+W36sqMP5DwNJQoqPK7uYSQqKOBJpqMPzBVdzBnyoq
	TL4FW1OjAODceu7sYj4YWEtCU6RDkmTafaKF7SECdkRXghtDO67VS/e+MFlW/zHfysRyrOZ1Tt9
	NVFl8wrhq+LEdUqD8bTerF5I9xxEVcMuFlJ5WT7+7xCuzQL8xprmTL7EyhwPr091/h28lOkJWGx
	MW5MHinoy5k+PJxSfvRUItLmtW0EhfNEI6+kqoWPVJwGJieuTGDFFMqMtaeDPVVxxO5KRDOlFXN
	xvfsuyR5u8YxaOVv9Ui7sqbT9YVmRJW6e7gEoUOwNE+NN9Qi97wSHegT49OHpGmLLabgVMMfRkB
	eoCXpzE3aqYVZLwBXzz5PsHx0=
X-Received: by 2002:ac8:58d2:0:b0:4ee:1527:cae0 with SMTP id d75a77b69052e-4f1d0048d32mr46128801cf.0.1765567449182;
        Fri, 12 Dec 2025 11:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTJjOdVOPhskva7CZnbnHt8qfv/aCr1BjJUJSHUdpDdO/WG88gAWBuhj+BZoTb59VZcIV75A==
X-Received: by 2002:ac8:58d2:0:b0:4ee:1527:cae0 with SMTP id d75a77b69052e-4f1d0048d32mr46128391cf.0.1765567448763;
        Fri, 12 Dec 2025 11:24:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379dfsm2187122e87.9.2025.12.12.11.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 11:24:08 -0800 (PST)
Date: Fri, 12 Dec 2025 21:24:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
X-Proofpoint-GUID: F1Mk83hxNhKa5QGs5Fa9nxoP2E-OsFEJ
X-Authority-Analysis: v=2.4 cv=PZPyRyhd c=1 sm=1 tr=0 ts=693c6bd9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mAA5u-Xvzpc1fc_J9KQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: F1Mk83hxNhKa5QGs5Fa9nxoP2E-OsFEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NSBTYWx0ZWRfXz3vqkk0XArDU
 y+ui6Si0aYj6mRQzBwEU39sEyUjEmzc0jukc02f8Yuzh1uGLXDC004suw8So6bx6zG2zG+vWMRD
 QOZ0MhMbHtkV0T1JHMrATlBN1axtI51c/SG5yxEKKzGukJgzSthChKvD1vf2/Sjg/TAMl91rKsA
 LCq5RBk9KEjxI4Jur8beakg0sh/tn7dx1eB/tqpMY9DbSy1qgWppg1esKVS9xj7/WhXnqbTjT5z
 b3mUuBkOhTBCKD+JnEOWod10WI0vcWY6F/FRfGa0Y2oHEAzSXkkhPI/yLf4VtMQFtUKH70YKKnp
 JqGYLejIcaLDy8VL36/juucXNf+Neql3+W4ZpMOHfzOzbqCteOIVrLnwaIiSF/TW4O9/WdEBaar
 N/+ImXAZ/XV9getowXn6tYt2qQWaPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120155

On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > 
> > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > authentication requirement.
> > > > > > > 
> > > > > > > Current image format contains two sections in a single binary:
> > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > - Remaining: WLAN FW segments
> > > > > > > 
> > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > headers in a single binary:
> > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > 
> > > > > > > Download behavior:
> > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > >           2. Full image via BHIe
> > > > > > > 
> > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > 
> > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > 
> > > > > > What is standard about it?
> > > > > 
> > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > header and WLAN FW segment.
> > > > > 
> > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > required for TME-L image authentication, how about using 
> > > > > tme_supported_image?
> > > > 
> > > > Just elf_image?
> > > 
> > > Is it too generic for this specific use case. Current image format also
> > > contains elf header.
> > 
> > upload_elf_image?
> > 
> 
> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> defines that an ELF executable can have only one ELF header. So I'd prefer
> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> used previously.

What kind of ELF image was used previously? Could you please explain
what do 'First ELF header' vs 'Second ELF header' mean here?

-- 
With best wishes
Dmitry

