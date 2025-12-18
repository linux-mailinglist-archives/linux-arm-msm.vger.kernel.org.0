Return-Path: <linux-arm-msm+bounces-85642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F6CCAB48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2FB6300B305
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 07:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECD92957B6;
	Thu, 18 Dec 2025 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIAnhgK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6LzV0ut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CACA29B766
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043682; cv=none; b=RbrQ0Mti4taYUhauQlsPz9JbeRRZkeWiWDZxiEgG/jjXK7xj5t4UQ+tAl7Uw/Ldnd7b/rUHZZtcVHVPyNabQycUOldIrVgbC0Q27PpKUq0QsMoY4Z3+D6crsXqrc9tJPuZnt9BrF8xDdtaq+rkDD6CxJJIAJsny/7qtnU17E1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043682; c=relaxed/simple;
	bh=83rrWFR9Cf6O0E9k5CnE8zHujsQtFN6SCAcTxwNcp5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igUeUBmSihfrdDZePjVmKp1yjhgjhgMsAKieRRwkztzXcXZ7bu8nL+ghJg9gOjkTQx7O4+jRCAAt8HR4R5XGVfblPX8sQbO/hxhphoYx4J0D5St8k+rl0XJZtRVPDNVA6ywcdRc6E32ZQ+wbR1HcjgSuDC3Rp488l//v/XqU4HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIAnhgK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6LzV0ut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YiFg680765
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z32ol302noWEPitFyAvFLaOEfK5bJa6lRU9gSg5dRU=; b=LIAnhgK+CnHzqWdT
	yWsb5sTREA8vfGaPH7X8t197wab2w663q74x/Xsf/YOIgkHay1ETl1n/uHbG41yj
	+eHA0U8XgoVC56v8fYi/okxnv9lOyH2UfVoKxZAsVJ+ut8LSZER7e5oiMlynBfuT
	s9sDboTDJckQ/YG5/U7qSEkofUS9X6U9ggZ9AdwBvqSKzm0izpXOrq2EBoTi3asC
	L1SNsmrT79SM8gr9UR2XPCErd/OA1fW3nyNHoxbvnhQ25rEZjfBAFLzoQkCKseB5
	idK9fmHNaexvRo4H1SWU/pFmdjL2ldCV8JXL1L/wCmV2CVpDfcp0UTO9Dvuwhk6t
	dgzOEA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhh9qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:41:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so823511a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 23:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766043678; x=1766648478; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Z32ol302noWEPitFyAvFLaOEfK5bJa6lRU9gSg5dRU=;
        b=M6LzV0utwX3kVWbczSR6pqfhGgpkwmy7yiaxQxlOzLFsUbiCzgqh38g6ubT2b0y74U
         EJZlNL09gyBdmPqQRI4JGI+gOgAFzPNrqRKDd9Vv2iFnmhvFMg1frMA9AOdKKNQanmbh
         VVmghg4pWD5iPGsmQsbQXMn9QooU5sqn8U8holYnkYmuQXgf7ikXVd9kb3Nw0HecqRaz
         lfzSB66pLEFb/+8F9PDtXBQ1+ritLX9Tu+n9D9m+WSHObigMU7ibqyBtZst6Jf1Qje6/
         59EXk/dkxqfS4JefwdjeVmwKGrh9nv0gfM7zQmlfSTuKB9FTkUcr/HijLQXHW0jOCz73
         Lssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043678; x=1766648478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z32ol302noWEPitFyAvFLaOEfK5bJa6lRU9gSg5dRU=;
        b=Wf2ry8C4vUeN+L7Bbnb5o9IMg+BliHGToXnR9UniJYmik4DalHCYOQglSwx3kdWtPx
         banSVJd1X0x6zyyJKGqVUT59azFVYUXRiVd4Sa6su5W729Xn6SPZhVQfgKjeATdKfMmf
         cU311HsnJHU25wpWLD4fdKAqJJJCKE9//+xLauXbxvl/XAgNrNruHDmbVIILl3TJYRi3
         SmizRq5GnAjs726mI1Kp/g/rwk5fqu5wtaAneZTSq4y5p/ART6VvmB96oq4Uy87T1Jgc
         oe2xHwlODtljjmGfkCqrUNh1x40ECIBCsEPLkmOTv3v2brWHlaLOVsFRNiQX+GK7smS8
         He0w==
X-Forwarded-Encrypted: i=1; AJvYcCWH6aj9WsrveS2EG7h2dVLpfMIwPj4x20WAFRevuJ5ZiaqcI7ms3OF+XopFkMQfTDV8Ig2Ze1pceXFSv49g@vger.kernel.org
X-Gm-Message-State: AOJu0YzXytZr2QBKIq09JJHSaQ5MwIn9HgLhIGvOgO1up2u8pwbfz+tH
	EqPXvC/jmkf3mKH4+fnIRiRTHsHfqczjLR+qx5XlxDeoUloVx/d6dFGSgAt5vYx8jEUc5dst7I9
	tlNA9TVXBXZMsfCReuZoZxkGCpGw+Uovy/KKCcZzXG8Qm/vUjCih3gE4S8avkqtfC203XXh+h+5
	K8
X-Gm-Gg: AY/fxX7Mr+4og3b6whpE8Bg50cghP7shIYF4yy9TZ96tPG0zq2Mfnse3dYFxsXjM3e2
	/MwRwCpFLlxFA2x7Cf6CpAB9zCBpS4KT7UyLtsNpkM6bB3JUi4mJjxI3Jk1Y+8GpowPjrd6dTdf
	LofJnqYpYy6KJzLiC1hm+rZiEHuz/ZZTCn/BKU4RrI0iP3w3IjBjaCRO/JmmwQyG2wi0QsoS5Qo
	bmR0pVjakOqfsEHhXVsUJVYzcnELxUb3iH4x8DRivvQtioz5X0iJ9Iz4LnTFDAhKtS0P0rl4XYf
	Hw7fdGPJjcM0UCfZoe2trjFDCz5bpo29CFisY7CwMl7qNtW7raOMoIlypsZVGzEpcXFx0iTtSJD
	ofkBB+R/wJjaghqQ0B4eEDCvvWFXPBNGX8Ft6+KJrD16SaszQQQXHCaeN
X-Received: by 2002:a05:7300:ce8f:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2ac32236385mr11386319eec.15.1766043678155;
        Wed, 17 Dec 2025 23:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR9XkYLTZmipnm0M2ysrIiQS9kJjYJAQIoe5aLvQ70K/SfEeW5vJGRItL3ygrv3PRGsZRVdw==
X-Received: by 2002:a05:7300:ce8f:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2ac32236385mr11386301eec.15.1766043677512;
        Wed, 17 Dec 2025 23:41:17 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d415sm2509673eec.3.2025.12.17.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:41:17 -0800 (PST)
Date: Wed, 17 Dec 2025 23:41:15 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUOwG3TJ7N6sexAb@hu-qianyu-lv.qualcomm.com>
References: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <6276nut6ro5xh2pt734k4z2z3lpxmkffjjh6wwpvwuy2lldowc@soojtr77xe4z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6276nut6ro5xh2pt734k4z2z3lpxmkffjjh6wwpvwuy2lldowc@soojtr77xe4z>
X-Proofpoint-GUID: JNjrFIh5jvyFxzsUP9JUSQFeE7WpUMyn
X-Proofpoint-ORIG-GUID: JNjrFIh5jvyFxzsUP9JUSQFeE7WpUMyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2MSBTYWx0ZWRfXyZKeQI+JvQoP
 +2Tsyfpf00+Uh+VcElVXGg6suKQ6JP4PwGJhJrLJYgwXIB9baHRNjL1F/tjE1sILZu/+gaBOy/h
 hPP51rjTrqJbGdSw3MBIWJQq+PQ6omOgGoq5o5Ct613m1kvo1T1fHvowUUzUizHB3vAJpgj8Do0
 5GM1/vMWZm5TcU8ZXeLlVfhW/MdLdcYk0+W2TC3JbYq0+kfsv1j6DSNHEuowUGr+hyZJSOJEq4q
 ggO5LxL/CIrJiT1Rxlfx1HJZaCz79ksHyM+dvqoZcGEeKZQHO9BjVRg4PP7nPaqVTL5CXSm7eQk
 pE8j80s5PKcBmblcZHEKntEbmEeA0yNjXoZRZop/iWOFFMakvCwS4d95qXpGSlXXbqNhFUkCN+q
 8EQLAeLe5e3KAXls36nvKKbr+ZPlTA==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943b01f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7Jv5yrs01gcKwjDWLeYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180061

On Thu, Dec 18, 2025 at 03:12:23AM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > > > authentication requirement.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Download behavior:
> > > > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > > > 
> > > > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > > > 
> > > > > > > > > > > > What is standard about it?
> > > > > > > > > > > 
> > > > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > > > header and WLAN FW segment.
> > > > > > > > > > > 
> > > > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > > > tme_supported_image?
> > > > > > > > > > 
> > > > > > > > > > Just elf_image?
> > > > > > > > > 
> > > > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > > > contains elf header.
> > > > > > > > 
> > > > > > > > upload_elf_image?
> > > > > > > > 
> > > > > > > 
> > > > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > > > used previously.
> > > > > > 
> > > > > > What kind of ELF image was used previously? Could you please explain
> > > > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > > > 
> > > > > 
> > > > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > > that was a non-standard ELF image and the new one is going to be spec
> > > > > conformant.
> > > > >
> > > > Previous image format:
> > > > ELF header + SBL segments + WLAN FW segments
> > > > 
> > > > The TME-L supported image format:
> > > > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > > 
> > > What is the Second ELF header in this context? ELF files usually have
> > > only one header. Are we repeating the same ELF header or is some kind of
> > > an embedded ELF-in-ELF.
> > 
> > The "Second ELF header" refers to a separate, complete ELF file embedded
> > within the FBC image, not a duplicate header. The TME-L supported format
> > contains:
> > 
> > FBC Image Structure:
> > ┌─────────────────────────────────────┐
> > │  Complete ELF File #1 (SBL)        │
> > │  ┌─────────────────────────────┐   │
> > │  │ ELF Header                  │   │ ← First ELF header
> > │  │ Program Headers             │   │
> > │  │ SBL Segments                │   │
> > │  └─────────────────────────────┘   │
> > ├─────────────────────────────────────┤
> > │  Complete ELF File #2 (WLAN FW)    │
> > │  ┌─────────────────────────────┐   │
> > │  │ ELF Header                  │   │ ← Second ELF header
> > │  │ Program Headers             │   │
> > │  │ WLAN FW Segments            │   │
> > │  └─────────────────────────────┘   │
> > └─────────────────────────────────────┘
> 
> okay. This should have been at the beginning of the thread.
> 
> So, if I understand correclty, beforehand WLAN was a raw data and now
> it's wrapped in ELF file. If I'm correct, then this might be a
> definitive name - .raw_wlan_data or .elf_wrapped_wlan_data (up to you).
> 
> Or is it that previously you were skipping the ELF header and just
> sending the subset of the contents of the included ELF file?

In previous fbc image, SBL is also a raw data. The ELF header is for the
whole binaries including SBL + WLAN FW. So, elf_wrapped_wlan_data or
.raw_wlan_data are still not accurate. So I still prefer
tme_supported_image, or can we avoid describing the image but describe the
behavoir like skip_sbl_on_wlan_load?
> 
> 
> > > 
> > > > 
> > > > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > > 
> > > pointer?
> > 
> > The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > ELF excutable file, I can not point out a specfic sentence or phase that
> > tell us the previous image format is standard. But at least there is an
> > example we can refer to: Figure A-4. Executable File Example. And I can
> > also use readelf cmd to parse the image.
> > 
> > > 
> > > > is also standard elf image. But it doesn't meet the requirement of TME-L
> > > > because we need separate elf header for SBL and WL FW for TME-L
> > > > authentication.
> > > > 
> > > > So the commit message stating "Currently, the FBC image is a non-standard
> > > > ELF file that contains a single ELF header, followed by segments for SBL,
> > > > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > > 
> > > > Can we avoid saying anything about standard in commit message? Flags eg.
> > > > separate_elf_header and tme_supported_image are more accurate.
> > > 
> > > Please define, what is the supported image.
> > 
> > The supported image refers to an image format that TME-L can authenticate.
> > Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > TME-L.
> > 
> > - Qiang Yu
> > > 
> > > > 
> > > > - Qiang Yu
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

