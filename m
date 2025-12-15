Return-Path: <linux-arm-msm+bounces-85195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90341CBCB93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B36353008497
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 07:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264CC21773F;
	Mon, 15 Dec 2025 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9FjePqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUco+T1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7837541C63
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765782605; cv=none; b=oQJCpssHoPlZN40ZLM/15z4WWJq9FMwuzkPFUZt54v3h6OGkmR0CICO8Q3xH7xmhhlu6+u8717gZ4CD6nfW/7nejtWG47DPtM60hSUpD2ujwrdneZTOzzaFbPcd1zJqG4DQDcTNtiK5uhNwoUv00WRGGc6Caf3pEUBdZltndkqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765782605; c=relaxed/simple;
	bh=FQjh4k3jyqVA7PBtuXbHS2kerI/YfgH7J0362Jxma1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNjX0pgKXH0mJC2whsWtYOKCKHd8TispsR+xhwR3u9EziAuxddAMPtTmo2lKXpQRWqWzVabBRPdS/vDu/JHqO+2g/NPrLxvK8nXtl6Fax5hoaPbrzdKT5j/GKEr1MLQq/sWkX1Ion9IzK+1T23IU4rZ28CgFpMmcMa1i+lBGQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9FjePqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUco+T1c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BENTahx2909158
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 07:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xgNTXZ+zJiuxpHyRxeOIDEib
	JBU942iwPmUc9j5aWDQ=; b=Z9FjePqjDIW0FQVjbMf9QjcR61KvoG2DKQm8xPlc
	jEsD6TCGDNl7y9wk6tlj8FNXlwCsPvFzSxeRkOaY/IWm5mNBFmBTTHfXjrPq/YTr
	vxZlk+fL0GHdAKu55EkzA3u+V0aU4CwDL+oGrzysejov4iVz4Ta+EpS9PiGYlOk9
	7GQLqOK/FCa+q7HoR8i94OQwz87E/jZu6oytPVW0lWj8IkLpxgonNwEQnvrQ1COo
	MYIljtzH/JEkmm2Ojvzo09iSF2eY6cQUPm6eK6IT8c8z2u/sKCby29iQhyhjSu63
	f3DvS18BeDF94B572hIHct4PninEG+YUyPmT635f2lKcqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6kj74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 07:10:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29e6b269686so71379415ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 23:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765782602; x=1766387402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xgNTXZ+zJiuxpHyRxeOIDEibJBU942iwPmUc9j5aWDQ=;
        b=iUco+T1c1ngU8P35/Aa4lE2AT48Eu3mISSucDoVcE2oeMDuQdTzkqfq5hCAUYK9U/z
         7Vi8snKVYINQGq2ICpLEvwx5EXSy4XM/iFFranRbc9xfd4KcUQzovSzgZ+d+F0wQvs+z
         8eyoz6fyC3Gub5nnosfv9N6Kl2z4pR+iFnFj0Kd1g4wfpBP2oe0JZhOrrqCHczz7aN9t
         gzTcB3J2/+5BtlJX6SL+PveC6yfyUgBWU4RKc/rzpx7trKT/DOZBC6TPb5+zRTFQA/BM
         ydeJxspYdE1Onw0WueSsPPyXr0VFyJDRQMQlRVsT+0Qcdcmn5v3Ay9NlP8HZYmK9IwGm
         hPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765782602; x=1766387402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgNTXZ+zJiuxpHyRxeOIDEibJBU942iwPmUc9j5aWDQ=;
        b=GhQHgaasiR9DFar0DMmRcqrgBxRtahcEjKqgv7nxrsxTwfPJMlygRyIzg8rc/mafOU
         1txuId7vYGuawoJY8Ipy95DrfGKbQ2Dsu8m3Ibb2RFb/gbcjYCrX7zPICjnD6reRj3La
         t8XYDax5e2q91Nu6X6MKw4CldASziYGUar2d5LsTcpRmHsClArGc9Es5wpe+qXOyuxi4
         YrwLSawSnamW/IxGInVeD/6bfFGYdfMPyWluKC0zVqlXMz42CeFAgatm5qOpdVB3ogtK
         JQCLFxijV0yi9mdR8XG/lR5f38EEOqupvCPDb6UwkwsWJPbFdYnjz+NsgEbRL+dLsz2d
         5Emg==
X-Forwarded-Encrypted: i=1; AJvYcCXhcDS9fbZfltKdj2WOFHzIP5JOppU/aUBum+ILuDRHRtQpysyfvexRNe97NFHcZAJaaYpn13Z9J+zQ3Wmx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AlghqrmOEudx2rQsOUomX+6bW5DOOMfM5nYkK4tGUZZcsTja
	tUjNcj7D9cjwdrV/nPjal1DWZyFhTzHsKx2XslzQp1wULZZmipmF7j1UgyUyPThNFvfrC9sCDv1
	aeShEZRIOF+JxsxBqmoyH699UY1C1aY83BE1eJWrnXcDmJ4wgyLRibTGe+HspTL4y576msH27TS
	iD
X-Gm-Gg: AY/fxX7BezzfHSvCShcOIh5Iwh7rDAuJ3P44+1A4eaNbIMecsFWdEKYzBVatih/uFLw
	ozkFanWqEXYtfN5OtuXfqGTTjVpLpSI/NqN8mvXZz1wVqum4arhIT8VQ2yMj6IQUZwBrG3UBA4Q
	DqW6sWd+3NExfw7aLAoBTcKmDPkC6IsIqEeLQGR0WVhzb11Izl6ucMOp/4aGDQ8FMGfj38R6xJf
	5QmwwoF606xHC6UJHHT66ykg8XOQrndqbCzwajfKurYx75f0sOk3JzltN/93xKIE87QoB6OKEx7
	x4beeUnMwG9nfLskMaV2mTf4R9/ty2To0x5m+nMt0IenUewdrPO+0Uvc8kRFah37y9HAcTk/74i
	WAYN97cgVSJicP9nS+xxc3GLyVx2/quTqW/ntxOiCkHYlBsSCrR4ZXEvU
X-Received: by 2002:a05:7022:a8c:b0:119:e56b:9581 with SMTP id a92af1059eb24-11f34bd90efmr8355593c88.6.1765782601364;
        Sun, 14 Dec 2025 23:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiYxyp1HunA9yKmRCZRrNyzmwwJf6Q4hj1m/mbGfVJpyDYOC7fCyNkpCJfzvyxoW5C7EdZEw==
X-Received: by 2002:a05:7022:a8c:b0:119:e56b:9581 with SMTP id a92af1059eb24-11f34bd90efmr8355576c88.6.1765782600668;
        Sun, 14 Dec 2025 23:10:00 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm40191402c88.8.2025.12.14.23.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 23:10:00 -0800 (PST)
Date: Sun, 14 Dec 2025 23:09:58 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fb44a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=A0mC-r1KfrI2UX7ef1wA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ImhwEgS0bSKCxpAx_nU9LVxr5akIDxaO
X-Proofpoint-GUID: ImhwEgS0bSKCxpAx_nU9LVxr5akIDxaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA2MiBTYWx0ZWRfXwXi3euHRNaGb
 iwXY0YtcSf96crLx/jKD0utp+2bhZoam3dGJIAx0s93w9uTN7pR28/0IysuhE/pFghFCWymGWVy
 E4w5YJ5zxUua5cqprafyH71aUu4Mcs9iACV5t06jLj9AoTgwqc+n3JSQ4WGsSOUisTsXL31Skba
 yDnxXobpvvk0fGRJAKnUhiEsfLLND5oPLsw9mkHVWoNW2ECkzyR+Rw6ULBPi+7hLmxP7ZMc9hXg
 dFGjgm7PtNirn3VQ1YfiS0OAYpRjn8Rx7Dmm9HanM0WztBgjEzRy229izz9pdXM6aFskGpbVDbz
 NLgTos+DOJ+buLnWuJM3yoTNPCs3IlOIT/Ev7azEIW+rSVPriQBKwoaOM+xZ9TJfASexk6k+PrN
 BVdSyIp4vG0m6IcWPffjrNj6RqRttQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_07,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150062

On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > 
> > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > authentication requirement.
> > > > > > > > > 
> > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > 
> > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > headers in a single binary:
> > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > 
> > > > > > > > > Download behavior:
> > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > >           2. Full image via BHIe
> > > > > > > > > 
> > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > 
> > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > 
> > > > > > > > What is standard about it?
> > > > > > > 
> > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > header and WLAN FW segment.
> > > > > > > 
> > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > required for TME-L image authentication, how about using 
> > > > > > > tme_supported_image?
> > > > > > 
> > > > > > Just elf_image?
> > > > > 
> > > > > Is it too generic for this specific use case. Current image format also
> > > > > contains elf header.
> > > > 
> > > > upload_elf_image?
> > > > 
> > > 
> > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > used previously.
> > 
> > What kind of ELF image was used previously? Could you please explain
> > what do 'First ELF header' vs 'Second ELF header' mean here?
> > 
> 
> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> that was a non-standard ELF image and the new one is going to be spec
> conformant.
>
Previous image format:
ELF header + SBL segments + WLAN FW segments

The TME-L supported image format:
First ELF header + SBL segments + Second ELF header + WLAN FW segments

As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
is also standard elf image. But it doesn't meet the requirement of TME-L
because we need separate elf header for SBL and WL FW for TME-L
authentication.

So the commit message stating "Currently, the FBC image is a non-standard
ELF file that contains a single ELF header, followed by segments for SBL,
and WLAN FW" is not correct and standard_elf_image is not accurate.

Can we avoid saying anything about standard in commit message? Flags eg.
separate_elf_header and tme_supported_image are more accurate.

- Qiang Yu

