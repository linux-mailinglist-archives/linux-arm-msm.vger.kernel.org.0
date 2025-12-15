Return-Path: <linux-arm-msm+bounces-85268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92021CBF75B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 19:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5C78301913D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 18:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4805D25393B;
	Mon, 15 Dec 2025 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaD8om7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLNjCL6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E77643147
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824099; cv=none; b=rMlIg8HTX2uIY2naR5o7ppPYOPSigjbAWsXKWFwjh1XtT2eK4mFzAFHGp0Xo2SZTFSI8p/cTikwULnBgn8cA6JGxmhUMi6nhfgOVnrvPs7KykGs5Xr1rJtnGB8tGlZfso60EuDvEcBiX0wFvet1iBHUv2uDBhDQekgqZwHMkKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824099; c=relaxed/simple;
	bh=OnQEYOmrkAYIJx4r/S6mafxdFYSSWUV0jdT9M9qY+/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+GaXTZ1VhEACb+2XqwPAXGHvKewJzWEoL3NPpAxhmY9bWgz8ctRZnwWFE2a8yD3TAqt91JSjfFKe396lV0b/yOccM1JGDsJY2GJZRcTXmq17bwKK7Qq0VXfTKCTDS9oSG17UGd2S0wcp4zGek4elzulscBOYz3CbqG+lZ6WUfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaD8om7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLNjCL6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFE3p704174124
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 18:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pNEJUMGRY+3vQEybSGpQ4Gzk
	ywOIMauWbmtCCqmv+r4=; b=PaD8om7vXM1qWDymFOpc28CGyqhXVHxBnnrW/u1W
	TTHnNlWA0uS4nhVV7wcAZFPE0RQCIjsXaK/brRDgh+LTH7N/x6aozO60/r3I+L7E
	z264PNY2aW6KEE/FL+/7fhS4GMQ9xY60nP6yUyuJJnBvouEfC5WYiPk1JB01NFo8
	evMLH78VPRulaEqlEQ3lhQv0ySnqclSeVJnk5qbxLAwjrHtn4Gap0vBzmfOcPkm3
	rikMfMaiZp7afH4WzjS2fzbjS526mraAGyVOYN7iKWFl3tup+5k4eS1EBdabdpKF
	yUsAC2jy1EeUczMK70NLzq3zoyknTWAvujNDtniGCh8qiA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks00uq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 18:41:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed82af96faso82500331cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765824096; x=1766428896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNEJUMGRY+3vQEybSGpQ4GzkywOIMauWbmtCCqmv+r4=;
        b=aLNjCL6/bowi/o4B6SDbgaqszi0QHRS43TInuqFmlJxi8nYfKur1z/1IkT4Qf3/tFY
         wjff8Sc4wpOk3IyhpSwxkOoiioSQcMtIFNPnyJ8Pc8y+fjF8E6YeIQrdKNFvOfPrCF8p
         wE4Imv822afvTRsPr6BDLpFVDZm4qWNYElcadE8EadqOQh+jxOyjiqCYQhNmGurD4LrE
         tEboxmXqWevlL8IENkzYmz9Bq+gtSG136IQIfibPSLvjIa/BBijs2fN5SINar3VaQFcS
         F9U99Cf2WsU85DYUQbPmbFgXA3p2cLaiFt/+jt/JdJXEPdwLY5ZPdkVMgzBMHrZk3ttz
         M+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765824096; x=1766428896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNEJUMGRY+3vQEybSGpQ4GzkywOIMauWbmtCCqmv+r4=;
        b=oKbGKIABXy6fdicrul31XrO5QEEDbjGb1MZps9kM1KxAqhS/PLI6Unr5n1PSU/EDCW
         TZBUNhVLn1o6HoLtOuJdg+f3bhHNZJd0i48lDfXNDY8JWQrJWEKqQuFgFowzgwOSGlHe
         Bivj2LOpE3WSO2PFdUviMkmysNEB5RnHCJi42+QDtIsS7r6/Qiit4tipF9KTypiX5KpI
         9mn9wGhYkYvR2RoLW8bUtKmpopUoNXJXv/4F0iN2Qrm+1UEH+ObBEoTAEW6Nbmo5dHXc
         WZFrCXO4z97rfebrW7lk7swknOtIbRpG/Ukg+eekMJ06dzr/xQpU4AOQJS3pDs3rpJ5J
         VPEw==
X-Forwarded-Encrypted: i=1; AJvYcCUtoHqu3c/5qvHAzPgCaqSrCAEsHY90lvxU05NHs3dq9+q98z6W9Eg2Aieqrnp26YOJd/ajOgVY5HMQ/YUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ZypUOso0AWzURJ6Mbmre6ybS4cBgCF/aqLLGD4tHKinkJbss
	Ei1IYnVegWbtkbze4RBhDS5CGDCeHo3yWzc4A2AF/zNos5iSaIVbDQFKVxSomIhO1iRyuFcGE2m
	cVDSeMm0k7/8zQ20cQdzPE2qWcfAPXHJNJz+WcWcTpUB6j+uy57DWTVHaXw+Ytes8FcFL
X-Gm-Gg: AY/fxX4zrsml9gvpHoGtmaZCpxGv9Kt36G2TvNHD0vP7n6+O1RSkS+xuuKKxljdGeis
	TyTUXZH0/HFMN+vGYFDSO/NGuoHHh/Ty5FrRHNFWphTUsSOC1VY1oLPtHgVNE7PZQlPxD+asjfp
	acRJ+CMOxCS429JQJSVQCf3aKIYKqNx/K/6Ycl33Kkh8rDdi5gu9qAV6Ks+RYdoIK97AhRwGxs/
	tucV/eb/haAsMoLwQDoQpkog0Z4VZYQIR0dOAbdCoQwdSeJ95WWEHVIgzzU2muXJOxCPTyxT4M6
	GDHhjxitcLksXN2yhMQtVcBOsEJiKGl3Nz5MsIMV9QmrVR3t4+RyTXnpjyqEwcebZOVaqd1sF+N
	dBVYBYoOVIy0K6H5XsIGtLQBzZmOK7uQsDh5xJ+xiL68kkT4wDwOYzd1eyG7Qx7gXP3OJ/9X24H
	HLiDzTNXvKL1mhsrWSiZq4k1o=
X-Received: by 2002:ac8:7f88:0:b0:4ec:f156:883d with SMTP id d75a77b69052e-4f1d05a7f79mr154991421cf.43.1765824095732;
        Mon, 15 Dec 2025 10:41:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAJgHuhNdLAt/gPPl4X5ZBBDYldHvbw1d8BwxWkgZDQVIbgX1pv/raya4y8NzSNm1vVd9i8g==
X-Received: by 2002:ac8:7f88:0:b0:4ec:f156:883d with SMTP id d75a77b69052e-4f1d05a7f79mr154991081cf.43.1765824095247;
        Mon, 15 Dec 2025 10:41:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5f6cfsm30311e87.85.2025.12.15.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:41:34 -0800 (PST)
Date: Mon, 15 Dec 2025 20:41:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-ORIG-GUID: em7RxPtWYn3BSkI54ggvsA3IxrcTYzP6
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=69405660 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=g5dMWhOOQPDu3jAcnNsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: em7RxPtWYn3BSkI54ggvsA3IxrcTYzP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2MiBTYWx0ZWRfX+6sYEeC8Jm/x
 DNKgxyW6zJabuT02C3+58cCg3CDPA+ACjIxuDgtVABiTswCPR/aGVXoJJ7xTYqO/46oTmm937Re
 dL/yJiEhyHChCyClBu3ukMBq2GNltypOFl36FIVBYt/xZ2awtY3k07BlZUpJArdHTNJG9Lk+4vt
 jAU9MFMIWXgRki0lQ4WA9xO/dhvCGLFZMMOuF13Cf4UZ0g8mYZnWUdyqXUxMX02FJdN9Ol/1wqq
 Ml+ktiLKCpQsQWKIUeZXs0dFsgZiOVGcXXgUri1/NHMcxHXpQT7WaG8cCSdDZIBpo6PzSpMVQpV
 gpyBNCUQ/CfS+secCxrviufwNL0/uAUVos8KjnvQmSgO0mADfC+Cgc3AXCEFIkHx1vRAfxTzvhw
 1MZzMeWl2VwKQU2K2S7C45tnXmaPGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150162

On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > 
> > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > authentication requirement.
> > > > > > > > > > 
> > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > 
> > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > headers in a single binary:
> > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > 
> > > > > > > > > > Download behavior:
> > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > 
> > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > 
> > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > 
> > > > > > > > > What is standard about it?
> > > > > > > > 
> > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > header and WLAN FW segment.
> > > > > > > > 
> > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > tme_supported_image?
> > > > > > > 
> > > > > > > Just elf_image?
> > > > > > 
> > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > contains elf header.
> > > > > 
> > > > > upload_elf_image?
> > > > > 
> > > > 
> > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > used previously.
> > > 
> > > What kind of ELF image was used previously? Could you please explain
> > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > 
> > 
> > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > that was a non-standard ELF image and the new one is going to be spec
> > conformant.
> >
> Previous image format:
> ELF header + SBL segments + WLAN FW segments
> 
> The TME-L supported image format:
> First ELF header + SBL segments + Second ELF header + WLAN FW segments

What is the Second ELF header in this context? ELF files usually have
only one header. Are we repeating the same ELF header or is some kind of
an embedded ELF-in-ELF.

> 
> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format

pointer?

> is also standard elf image. But it doesn't meet the requirement of TME-L
> because we need separate elf header for SBL and WL FW for TME-L
> authentication.
> 
> So the commit message stating "Currently, the FBC image is a non-standard
> ELF file that contains a single ELF header, followed by segments for SBL,
> and WLAN FW" is not correct and standard_elf_image is not accurate.
> 
> Can we avoid saying anything about standard in commit message? Flags eg.
> separate_elf_header and tme_supported_image are more accurate.

Please define, what is the supported image.

> 
> - Qiang Yu

-- 
With best wishes
Dmitry

