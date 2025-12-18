Return-Path: <linux-arm-msm+bounces-85614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BFCC9F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 02:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 977EA301984E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369602459D9;
	Thu, 18 Dec 2025 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8nbjL5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3ZUqvcu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795FC245014
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020350; cv=none; b=OXnVoYCvpDZthCGVE5igMgDwx70CBUUSut1ujkKNvSc1r+7EohsESQx30k/RzdDr2tpA2Vn04G21CmDkbVRj7FYpXJ27MKPSmdJxQu0KVia6HgNW3LGttBowwWGi1vR91Rc8CY0bTK4QVILlKibdQDgt5KnotrYZAVFZ9YIiI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020350; c=relaxed/simple;
	bh=Y4TyTIsFo5TNWzPCic1t9bDHpmxhm37tqGiar4U6sp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pU7RuGy3isxAXJsCVnTcAAxvcDZXyvIv5fAHZsNm7Ue/kVip3qXD4L/p1vDSGMMhzit2zJxxYKzGgTCvO78VCblLeaAWXHJUD8jpPgAiyfzAYTx3ZsmmEph0ZQwjYNEkapH/lnzEbzpugpMGn8TReMlex4ezFnMUWDaPz7Q5N5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8nbjL5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3ZUqvcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHN66Ak4052551
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQpcDrWvWGuGEEGm5cPAadKFMEAEj3hk/I/dFPvJL+o=; b=K8nbjL5BaLTF6Pvz
	XwttAHkLtTP9/R6MUyUVRbMUqI9oLJGztQqiXx443lhr7THY1g9pHs5IduJdJeND
	mCq6WDnj0wRnAQNL8s+1CpTXFC+g0qdlEW5j4jKqbQtrJ5nOnOPLnTcdah/LAqgO
	OQWPwThyNHkNKkB+uM9mtx5/gU6lH7Y41FTYpW2/pr6Purna6lVKjdfrPEOar8hs
	u32Qgo2yLwT7MKgSNJqPZn6Hm8/kRHU3NIq8gRgq7efcdWgpbFAJ5ScbD0tfN5po
	5SfNQiSZ/Gk54wAZSYJjZaCQxuqCQRpbuOiQ61OI0HKI66F+LS4wF9m/TENu/iiZ
	AsZsgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w509kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:12:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee16731ceaso1851831cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766020346; x=1766625146; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQpcDrWvWGuGEEGm5cPAadKFMEAEj3hk/I/dFPvJL+o=;
        b=O3ZUqvcu6b1gu3ihILe94ozzzIh8MSRgMHDne98X4hSujk6YqIO4CMN/+g7jQsGgML
         nJeU4VeKw1g6k9m0ipOFuRKvjMbTJ0zKEPd3hFv+bHbJ8QeonIEQ92gvYENpfQt/ZteT
         BWUU7BL01Ku8q+2PZKBVZCF+5iCr3PstACjTnA+zUGXf/UIQfZV5NqYSJ/k/BrY4sZF0
         aC4qLKdw3cighRHRHxW5JzCWhkiZvIjTd814lL8W0IRc9+6xw8+TmEm+3Yv1aBrA2ebq
         X6vcpT49jtMziHvqQFy0qbMwrIU/AUlRyZmMdpWqNAA3AMcnp4On/hMmmBdbzFL70fs5
         WZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766020346; x=1766625146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQpcDrWvWGuGEEGm5cPAadKFMEAEj3hk/I/dFPvJL+o=;
        b=m7BAoTdGgEuMSwzn6Fw/bpPAlQBscN1A09cDDhmH0zbY854LiP2oBTijGlWk8E1hVD
         rkHztEieMv1xRi5SJuXG51I/Zc/kSmV7QOQTnU+9+BZYRaIAVT6ojILCBZJSWGZexyvK
         aVhzzAKw0tCkkJY39DgcGVOjRTN+ZFfoDSIqSvjmWLC8cQsIWH7Cd1x+qNcqgDzS7CXj
         3F/Bjprh7YgvukTpDo4BDgtVqpBCaZPkzTwnyJZWuQCU0JoMrtOmlursGK4uH2fbDPey
         CRPfi3b/U12m1jAf6F9rzSayHaiMBTC5Vqp3nDc0XvWsjyNElF36JqlIgqG00IMqfmvn
         0rbg==
X-Forwarded-Encrypted: i=1; AJvYcCVhgnku44/ifv963eMZnmMQfyrmdMAQAzDbNGhNed60NGe3bkqRj/rfz8D96A8HJv4bdjZscn6aEn3ROd1P@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7MvaE8c2xWYDT94ZXq9Sn8ATBAjLqvEMkHJkiN8ooUmj7Y1b
	jc8W0X02wVZFaWy5XqL9Py3nBcNg37olLu/EgdiYtZfzuE+YEK9poMCOy7rKcGh8M3Kynlv+KDP
	z0fsykmzR8Upqceu0oXbK4YdDmHoVTCLfYZjoCesldHnwCuPZrTqV6tG5baDz9QF5tCQxAqcKyt
	H7
X-Gm-Gg: AY/fxX7p4uDanX/GiSfqq29/5rwsww3Jpmbyp3l0C+SxXyr7ljQLPNMWU7hOLJIKH/y
	LIMeYEtu/4Olt76A/2si4Qo74YSepCSIQ6r5kf9d5sCSB8D24ggVsA14GpQujbAWIT8OcHHULma
	QqoamvJVPtTNvcia6J8VvBaM2zyAyF2VK3unMi7PeRxtwMQAYhiG+35PrEHbblP3UQSivDVflx5
	PQHSdCR5OVugSRapBrCcwHqYRIA96tWbxUeDzBC/rT6eVgBSTvpLIc9uPGxDIRJ0n19OCqC4yIx
	XWQ+41ij8bicMsGHMrFHh25CmA8z5azGc0qrGZx3xBUqdbcPb+/euJ8polN6vZ4uzfPFDiPUw59
	iiUiTaxHKhgM+IIHqXHW6ujSVsWXDt70nTbntJyIjyG4RJR0mQ0h53cHbk+efJukzBhmqPwNhNR
	yS/6mo+PBwXF4s787Vtr1TSVk=
X-Received: by 2002:a05:622a:1b9f:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f1d059d2d6mr275458751cf.52.1766020346359;
        Wed, 17 Dec 2025 17:12:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHojaV5KkWTCATeCWAuTEmXYbTlomD6gCquL7HOFNZEfq+N9uEgyZmbPbOPEKInOA4ewBCR5A==
X-Received: by 2002:a05:622a:1b9f:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f1d059d2d6mr275458431cf.52.1766020345909;
        Wed, 17 Dec 2025 17:12:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a13506cdcsm394406e87.92.2025.12.17.17.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:12:25 -0800 (PST)
Date: Thu, 18 Dec 2025 03:12:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <6276nut6ro5xh2pt734k4z2z3lpxmkffjjh6wwpvwuy2lldowc@soojtr77xe4z>
References: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5jXY6NiRkeBVn7P7YTZNVWt55S_MisBZ
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=694354fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lSwTuEAEjFTJ6uFEpMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 5jXY6NiRkeBVn7P7YTZNVWt55S_MisBZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfXwEDGfRgxO6Mj
 t4rOCQ5i6+GROy8BvAmiHP1ggKs85qugtmyZVYHgpstwfY3d7FeFXycukPLhPqzeajPu96gIVR0
 0SJWSNzBF/hAv+VaMAf719ZrnfzJSNCCMgvkgMvWhR38Hw1fzgrlydSmbVPhApUghVAIAT5pWJq
 GAB4GmxyidYywJWcpLGz0aKCyzJ/AOXikBun86ce9HbOCQlvFRc7ier5SxQfovtVFhY6yypajxR
 n2P5JVO2MMe2LkmCDkavyZd7kgaVo9HVbbUYxVPCsKW1qrWG9vaySgZzTQNFZcZ3jl7tn9Jew/P
 Tx1EPA2kn2OsLcsB6nYnljQCs9cjx+8MFT+84ZKlNvBv/RGPw9Qf25ujWiF1VbAxpGt0gJ+E13P
 S0r1nbjtxoV6Pmwmwt4L17Wylemt6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180007

On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > > 
> > > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > > authentication requirement.
> > > > > > > > > > > > 
> > > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > > 
> > > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > > 
> > > > > > > > > > > > Download behavior:
> > > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > > 
> > > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > > 
> > > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > > 
> > > > > > > > > > > What is standard about it?
> > > > > > > > > > 
> > > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > > header and WLAN FW segment.
> > > > > > > > > > 
> > > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > > tme_supported_image?
> > > > > > > > > 
> > > > > > > > > Just elf_image?
> > > > > > > > 
> > > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > > contains elf header.
> > > > > > > 
> > > > > > > upload_elf_image?
> > > > > > > 
> > > > > > 
> > > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > > used previously.
> > > > > 
> > > > > What kind of ELF image was used previously? Could you please explain
> > > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > > 
> > > > 
> > > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > that was a non-standard ELF image and the new one is going to be spec
> > > > conformant.
> > > >
> > > Previous image format:
> > > ELF header + SBL segments + WLAN FW segments
> > > 
> > > The TME-L supported image format:
> > > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > 
> > What is the Second ELF header in this context? ELF files usually have
> > only one header. Are we repeating the same ELF header or is some kind of
> > an embedded ELF-in-ELF.
> 
> The "Second ELF header" refers to a separate, complete ELF file embedded
> within the FBC image, not a duplicate header. The TME-L supported format
> contains:
> 
> FBC Image Structure:
> ┌─────────────────────────────────────┐
> │  Complete ELF File #1 (SBL)        │
> │  ┌─────────────────────────────┐   │
> │  │ ELF Header                  │   │ ← First ELF header
> │  │ Program Headers             │   │
> │  │ SBL Segments                │   │
> │  └─────────────────────────────┘   │
> ├─────────────────────────────────────┤
> │  Complete ELF File #2 (WLAN FW)    │
> │  ┌─────────────────────────────┐   │
> │  │ ELF Header                  │   │ ← Second ELF header
> │  │ Program Headers             │   │
> │  │ WLAN FW Segments            │   │
> │  └─────────────────────────────┘   │
> └─────────────────────────────────────┘

okay. This should have been at the beginning of the thread.

So, if I understand correclty, beforehand WLAN was a raw data and now
it's wrapped in ELF file. If I'm correct, then this might be a
definitive name - .raw_wlan_data or .elf_wrapped_wlan_data (up to you).

Or is it that previously you were skipping the ELF header and just
sending the subset of the contents of the included ELF file?


> > 
> > > 
> > > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > 
> > pointer?
> 
> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> ELF excutable file, I can not point out a specfic sentence or phase that
> tell us the previous image format is standard. But at least there is an
> example we can refer to: Figure A-4. Executable File Example. And I can
> also use readelf cmd to parse the image.
> 
> > 
> > > is also standard elf image. But it doesn't meet the requirement of TME-L
> > > because we need separate elf header for SBL and WL FW for TME-L
> > > authentication.
> > > 
> > > So the commit message stating "Currently, the FBC image is a non-standard
> > > ELF file that contains a single ELF header, followed by segments for SBL,
> > > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > 
> > > Can we avoid saying anything about standard in commit message? Flags eg.
> > > separate_elf_header and tme_supported_image are more accurate.
> > 
> > Please define, what is the supported image.
> 
> The supported image refers to an image format that TME-L can authenticate.
> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> TME-L.
> 
> - Qiang Yu
> > 
> > > 
> > > - Qiang Yu
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

