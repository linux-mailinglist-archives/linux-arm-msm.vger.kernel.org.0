Return-Path: <linux-arm-msm+bounces-85686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D475CCBCD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FB4A300F9D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F4B32E724;
	Thu, 18 Dec 2025 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuAFF9Tb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBllY8to"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E68327BEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061395; cv=none; b=EbgtVR24KypGAglwEt+2L+5RprJLdtbnKtrd9921itB9MqpDRxkgGDXaU0YaX/HWrgse6Yj9t43wRv/o8ERYLlwtzzo5eURSw80k71X+cIF8CLcx/MXVqZDdTbjSusH7lX+O2h7tmL75cy+McFesZY2dRZOy/Tc8MvDt5sN3wmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061395; c=relaxed/simple;
	bh=N6Fwu/02jHGWILxP/x075uFHRVTsVFTEP+T4nuGJIyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0SNkeKtcWh+Mh2ej1WcFKZChwglI9z0pMsV+jGVgc/4cGYzDsfOLx7qiJ2S0u4It+vJ1q/OQ8Kw8STBWr17rVB+g68atCeI+jIkAp9VbAa7lVv3qYrAY+G+fE7Laeu37dNZdnOyjXELFdhJmq5yZmrmCVLmY2KEgMVm9C8+3RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuAFF9Tb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBllY8to; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8t6h24189266
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWStINO8VjIt2tkQ9MDDp1GNmAfTbmSuVdib2TxwRHA=; b=TuAFF9TbBl9yIRlF
	S3QmHcdPSuOCcK+EVV2ctOkArzrqx5l07acmcA0KLvMgSHzQ4On0ohcQgvi/dJvs
	fzaMMoycMUQkqZynecIYVx8xFIyZQOJBsMEmSejWMc6DxvB6BO4yuJR6qLSMeEpw
	c6kA/6Z7vem5FKjLYDIo1+PzbgSKdYQrB2W1Pge4zK3d4hCdBhtQgpGnveU4z6QV
	h7eLma6sop7WDi85bL2N5X3GjlXgI0oGy+cD00yQc9WaA5WBRTLcBalrG+aAOmEE
	tI77Zrc55ZcTFWnBMIX921ElQ2gGFvric9jjHRHVyVKdFsbDZnc1bjNpjh/XCbsG
	WzaCUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkhya8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:36:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b609c0f6522so999873a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061392; x=1766666192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bWStINO8VjIt2tkQ9MDDp1GNmAfTbmSuVdib2TxwRHA=;
        b=iBllY8tonUO4re92cEXSYzenBWhmTFD0RjeWDWAZItDGkYolW1FKsv6vmkz/EHPUtm
         iKsHYdJwE81fEIekSQyZKFvSejVYCgJQCZ05xhqcN1264Qsk95/rRUgEh+oCmZpkAzPP
         ERbtgXPC1dnEfnRTU2OECSiAnMDoGcZZfKJsAQ0mOlUBQ5JPTIP/2NLBs6O7qrmKVusY
         3otuu8hTQ9cMnbkEXFuH7kmuZYJd1mkoCwxu6qgsrNELVFwjkgQqCeoTKU/D4eKHzhKv
         hJcCN0RvpzKSx2oz9tfotAwm5IErs5AX55ifOQE6aNk5SDcDR/3+tk+mdkSHO1vpRaG8
         jI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061392; x=1766666192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWStINO8VjIt2tkQ9MDDp1GNmAfTbmSuVdib2TxwRHA=;
        b=w0YyjfYpYgYJa8l4D95Le3ZW0EGNpXDFd1SdTKLZuz7M2SUSA920+yJNkLCyKWOrfA
         OBaT+7s2BTWvmig4OkXe55s6OKqp3QthGZ+ibmUjDvGFnciU7B11yhLQI64ZoOLXKm4B
         4YiG9p9KX32vrAU2kgHnDs5DnNC3vMJjXnke/V1BVaqqsLhcgorBIQxa/CrBfHZmkbUB
         K98V39SUa5EaQ/vZo00l1Pj2V3GjgDA28Cg2zrIDPmPmLFKyygMXrjefrJZ+f/9/Kbkp
         45GRam3Cs4sWk+ILm1jrJQ7YyENoX/+ljEp8JDWrQxJ4YRnhsOinAKgMmnrrpPMwCyW5
         gU5g==
X-Forwarded-Encrypted: i=1; AJvYcCXCYS/1mBU72eEKM64Td+Pw0QZ/Tc5l4JrAad87DR+w1L0tok+GIAyL9mtPr31t7Nasva0HNoUBX0Qmen5G@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1CvNR6U9/9N1/e2tsCPBSaD/ouLuYRXE0ZhTwIAiC1q8F5RC
	nxSbIPKWXhvre1i35gHTPHFVYItz3sPpIJYH4LiRmTslHX2blNoSvR9OnyTPNveF320m01e/DHK
	4qtR1RvcGbf6uQkBeGKcilDlYj1T4q5plQBW5aIfuGRiYLkAqYoWxne8g4kX8EV9cu8HF
X-Gm-Gg: AY/fxX6MbuB1xqNxS37A7lZUvyxsOl6/h7nLFdL6qNQPhmpQMzPtYkvbHooMvML925D
	nRR11n7YCJdMFoJ1vzCWMpEmAa0bUcW843zf+DmXJGdcKJzzeQrKvP+kdA93FZRKmmD+Yl+aCn1
	iB+p4IsnHtWnBasaOl6pU6vscesVQNeYqBLKI28ihLIQnJzTsCM/FDomubkFxsBWT0daw+BHp72
	EJoVVYWw+BOVi/LcrWOsKq3LLP34fyHBs4V10hqxXwFLe8dL8J2GyDuuwXmKwLAz3I44bjvh1rF
	5bHcQ4N2z6J8iDWrYW23EHKbtZaPWK48ak89TpjarZ/gBCihmaKgJtSFyxCZbi8JQU7KYjEUFSW
	gQKfmXcgCgvAQFEKr/WeHtJ+ujC9kEnTa6AVuD8HlVmt8Prz/dgM9JIEy
X-Received: by 2002:a05:7300:511:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2ae4f618aa2mr8420759eec.36.1766061392223;
        Thu, 18 Dec 2025 04:36:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+og9GRk2PIzggAQXSMRM0jx1IQRNbD2oL7bNLCMah3e2fNFBiifZMT/Vg56MpTdLwjFGKVA==
X-Received: by 2002:a05:7300:511:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2ae4f618aa2mr8420685eec.36.1766061391019;
        Thu, 18 Dec 2025 04:36:31 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d83esm4850017eec.5.2025.12.18.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:36:30 -0800 (PST)
Date: Thu, 18 Dec 2025 04:36:28 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUP1TOq09gzmUGai@hu-qianyu-lv.qualcomm.com>
References: <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
 <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
 <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
X-Proofpoint-ORIG-GUID: eUhLZNmhg5bYS5_zlLmV2msuxoodOPQq
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6943f551 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o9eNwZ9_oFxu2MQNvlIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNCBTYWx0ZWRfX4w/Wl+ml6T2M
 BhFUie6mlNNpCZbuzKZsyr1Ag9jHSeMbGGJ1nqI6J4WfqR7CczeAX+0/K0wxdYt8SISrymZU/Cv
 w+oXVGkP5WNBKoqkTFPfmhafeJ0I/XISQlUtBSiPVa/g5SIloNTszJDXlg5crYaJIlj6yn0NhTb
 HLP/heQocN/SbBH5i2dToDKC1xsMf3Xix5qJfPirtmBdo+zDWWTuV2ZYBZ7j/LST98tVk7y7Hs7
 mNe1/OS54Wew1b/Jgb6/DpFFHWNYbAsLxN3cYrIiPLsM9fioQ2m4ygR5kz94Th4JdlOgyKByx7H
 Hm9d9pYb1144HBqAdc19kN2epcr3cqxK+cHD0Lffc+r/3L3L65yC+E+GtUzhOzzCy6SnDsVdGsU
 ToD/l0RuzCwdFi9xyoG8u+TddcbyXA==
X-Proofpoint-GUID: eUhLZNmhg5bYS5_zlLmV2msuxoodOPQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180104

On Thu, Dec 18, 2025 at 04:51:18PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 18, 2025 at 05:21:54PM +0800, Baochen Qiang wrote:
> > 
> > 
> > On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> > > 
> > > 
> > > On 12/18/2025 4:04 PM, Qiang Yu wrote:
> > >> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> > >>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > >>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > >>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > >>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > >>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > >>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > >>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > >>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > >>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
> > >>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > >>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > >>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > >>>>>>>>>>>>>>> authentication requirement.
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
> > >>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
> > >>>>>>>>>>>>>>> - Remaining: WLAN FW segments
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
> > >>>>>>>>>>>>>>> headers in a single binary:
> > >>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
> > >>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Download behavior:
> > >>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > >>>>>>>>>>>>>>>           2. Full image via BHIe
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > >>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > >>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
> > >>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> What is standard about it?
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
> > >>>>>>>>>>>>> header and WLAN FW segment.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
> > >>>>>>>>>>>>> required for TME-L image authentication, how about using 
> > >>>>>>>>>>>>> tme_supported_image?
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Just elf_image?
> > >>>>>>>>>>>
> > >>>>>>>>>>> Is it too generic for this specific use case. Current image format also
> > >>>>>>>>>>> contains elf header.
> > >>>>>>>>>>
> > >>>>>>>>>> upload_elf_image?
> > >>>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > >>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
> > >>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > >>>>>>>>> used previously.
> > >>>>>>>>
> > >>>>>>>> What kind of ELF image was used previously? Could you please explain
> > >>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > >>>>>>> that was a non-standard ELF image and the new one is going to be spec
> > >>>>>>> conformant.
> > >>>>>>>
> > >>>>>> Previous image format:
> > >>>>>> ELF header + SBL segments + WLAN FW segments
> > >>>>>>
> > >>>>>> The TME-L supported image format:
> > >>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > >>>>>
> > >>>>> What is the Second ELF header in this context? ELF files usually have
> > >>>>> only one header. Are we repeating the same ELF header or is some kind of
> > >>>>> an embedded ELF-in-ELF.
> > >>>>
> > >>>> The "Second ELF header" refers to a separate, complete ELF file embedded
> > >>>> within the FBC image, not a duplicate header. The TME-L supported format
> > >>>> contains:
> > >>>>
> > >>>> FBC Image Structure:
> > >>>> ┌─────────────────────────────────────┐
> > >>>> │  Complete ELF File #1 (SBL)        │
> > >>>> │  ┌─────────────────────────────┐   │
> > >>>> │  │ ELF Header                  │   │ ← First ELF header
> > >>>> │  │ Program Headers             │   │
> > >>>> │  │ SBL Segments                │   │
> > >>>> │  └─────────────────────────────┘   │
> > >>>> ├─────────────────────────────────────┤
> > >>>> │  Complete ELF File #2 (WLAN FW)    │
> > >>>> │  ┌─────────────────────────────┐   │
> > >>>> │  │ ELF Header                  │   │ ← Second ELF header
> > >>>> │  │ Program Headers             │   │
> > >>>> │  │ WLAN FW Segments            │   │
> > >>>> │  └─────────────────────────────┘   │
> > >>>> └─────────────────────────────────────┘
> > >>>>>
> > >>>>>>
> > >>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > >>>>>
> > >>>>> pointer?
> > >>>>
> > >>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > >>>> ELF excutable file, I can not point out a specfic sentence or phase that
> > >>>> tell us the previous image format is standard. But at least there is an
> > >>>> example we can refer to: Figure A-4. Executable File Example. And I can
> > >>>> also use readelf cmd to parse the image.
> > >>>>
> > >>>>>
> > >>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
> > >>>>>> because we need separate elf header for SBL and WL FW for TME-L
> > >>>>>> authentication.
> > >>>>>>
> > >>>>>> So the commit message stating "Currently, the FBC image is a non-standard
> > >>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
> > >>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
> > >>>>>>
> > >>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
> > >>>>>> separate_elf_header and tme_supported_image are more accurate.
> > >>>>>
> > >>>>> Please define, what is the supported image.
> > >>>>
> > >>>> The supported image refers to an image format that TME-L can authenticate.
> > >>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > >>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > >>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > >>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > >>>> TME-L.
> > >>>>
> > >>>
> > >>> So what makes it different here is that you are now sending the two FWs
> > >>> separately as standalone ELF image to the device for authentication by TME-L,
> > >>> but those are combined in a single image file in the host. But what makes you to
> > >>> combine two images in the first place? Why can't they be separate ELF files?
> > >>>
> > >>> I think you can avoid the hassle if you could just have separate ELF images for
> > >>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
> > >>>
> > >> Yes, they are two separate images combined into a single file. I'm not
> > >> sure of the specific reasons for this design choice, so I can't comment
> > >> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
> > >> I don't know whether they're willing to change.
> > >>
> > >> Baochen, do you have any comment on this?
> > > 
> > > Hmm, sorry, no idea :(
> > 
> > I mean I don't know the reason behind the design choice.
> > 
> 
> Ok, then I guess we should try to get rid of the flag and just check for the
> WLAN FW ELF header during runtime:
> 
> 	/*
> 	 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> 	 * file. Hence, check for the existence of the second ELF header after
> 	 * SBL. If present, load the second image separately.
> 	 */
> 	if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> 		fw_data += mhi_cntrl->sbl_size
> 		fw_sz -= mhi_cntrl->sbl_size;
> 	}
>
Hmmm, for the old format image, since the data at `fw_data + mhi_cntrl->sbl_size`
is raw WLAN FW data, there's a possibility that the raw binary data could
accidentally contain the ELF magic number at that offset, even though it's
not actually an ELF file. This could lead to false positive detection and
incorrect parsing.

Maybe we can caculate the image size by using the info in ELF header? The
old format image size should larger than 512K.

- Qiang Yu

