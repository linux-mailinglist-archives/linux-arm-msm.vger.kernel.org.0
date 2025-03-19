Return-Path: <linux-arm-msm+bounces-51944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC991A68B45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CE4E7A3846
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC2E253F14;
	Wed, 19 Mar 2025 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0Iq+qFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E100253351
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383333; cv=none; b=BP/qAhleB/DIxmY8viETysyMA5khXYdc1yuMEU+0BGkm+ks+mrD48CGWxQJDHLeArKYJKqqu1+OdIYx1DQgRiN85aCaXcLr0MwHfjYeAzC1rFx8cZa+NjuXfPIlCQOiLLIDzdZZ14voN3Ewj14xYxyBWqzrndSaSocoQVZTUwAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383333; c=relaxed/simple;
	bh=wpfSTsZnDE2gZ7cG2F7LWwVO4Apgpg3Tg9uLofpVtMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhaWkCWrkkI/90iHVxm6jAgi5VqfGcGMfu9h0vVuFsC4MFA6FWanhOjg5GoWDxltId5KpkDT/4WZnJ6nMJWVyl+z0wzL2l2tz3e9bpreKlKzWozFIi5HJhS/1VKRJyqifZY1HFD03S85hi/t1dWQf5edtJkZDQT0e4PUpXBkfzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0Iq+qFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lhVa020628
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/0dOj9OasG6gKfLcIcSynk60sDQkoKoKVnyPghbAjvw=; b=k0Iq+qFxXEO6zeAH
	xvrnbFAMBnTZ+mZFOiFhSuzOCeEDrO8UzKKBhbAgTGkxQ5ENyE9BEpXmk4RVV4ns
	NNoCLRBVKY0stkKl82Ylmq4Kc8IUomQm4PdrDWNY3luuNu42rGQw3f6q6eu1e6y2
	2/3PP0vZXSbnmz+xUWq9kWfY7E7do8ICq+svKLmuoV3Gyr3mD9MbR8NCJLTcDZzR
	sZU1JbF5Kh/vargUZK15AKVhSRAQ/CQUPOKeHup2+6b5Do4MUoUn/eBgCaH+fugy
	uIBoSIqEwbQy1Fix9UZjUTQGc5M9XbbeDuuutqntHe48NvIyrrUIkkZlg89/zotW
	Rj9j7w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx354r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:22:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e905e89798so100744336d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 04:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383329; x=1742988129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0dOj9OasG6gKfLcIcSynk60sDQkoKoKVnyPghbAjvw=;
        b=JM2dwvYi6+2Eu3Ma/ECQ9VvqTHIpCo5XgGtymi10P+6egITL8CIVi484gJ4/vo/63z
         UtPwswjzGuNuVkEGhwwrLLeKOCPMWzrULLQ7aRSXp3L8kymVk1/y8j9T5lB3u7qztEu9
         j17lt49O2RO1I70Ch8aKD6vHS7gbpR/OIoslRP2ZHx3W+LvrIEvGKhNeIqblU32vBMTI
         2GoJpbgn7kUvOzPYvTPmTCXXxRNop89sZNhQepyv7OvzOdL3endJJa8o7Hl+J5AvlId4
         c3DXR3U2PruKyKc/ZOlVKGli8zrgBwK8VkxSrLPndPKksUCWva3V2tYnDvqHkncR3XM+
         6oSw==
X-Forwarded-Encrypted: i=1; AJvYcCWI+8vmNEE4L6kri1WLaxoIc0cBYFgum0WaUO2kMDbU/lZUHJjSo0qndetL/U409KJfr6IrCk4P44KP5cBl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HMCweOlkhxSPXhln/cH7mexP8EN1lrUxxFxCL+rrAdt3HLg3
	RlY9/9nQT2PtE5aoELa2GcgVDIUJqVde+MF5xiwx1epXZpBhE/e9GTuh/vsG1I3HkGOYy76fTa9
	Nkvzt+vhb3tnXZPZM4GUkS0CUFqlb0NGXdssucAt8GqwF2ZLuhAyJDE1zMtlNYrIT
X-Gm-Gg: ASbGnctsNBYgXnKsxFiNvSSQKBDso+KjoSaylBkN4iT7yJNGLYp6NroHWh9QonBSqG5
	c8sZMfdkOVX1Xs91VKI1lwz+GE5w7CPbe7poXJAAMcaLsA1pSDMO5MzC1I8meOgz8noXdCS/Ic3
	iC/XHM48uc/d4Dc8m+r5dmQMy9/PsnhCv4qvdFlpvh455nydb6I4b0j5Viwn1ubcloHXkUBg0e1
	ymOzUdLA7NDfoeFY8EJarwvgdmWiIZsP6H8+feCgG2zqSfPLvrzb69wrrUFqCNZn/+MKHRtxjff
	2zKYTTNV55ZpU9A5auGf+MXq84sDOwxNscCWqB9CO2hVdUypa35zn0BxBqIMszJwEEughzExz6N
	toMk=
X-Received: by 2002:a05:6214:f04:b0:6e6:6506:af59 with SMTP id 6a1803df08f44-6eb293a85d3mr38241536d6.15.1742383329584;
        Wed, 19 Mar 2025 04:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCw1YsChezouQrX0CQTaQf7FoaYQwINmikZafgVoFKKRYnvBgLn+4C+qNfNmpsI3oGmG0vVQ==
X-Received: by 2002:a05:6214:f04:b0:6e6:6506:af59 with SMTP id 6a1803df08f44-6eb293a85d3mr38240976d6.15.1742383329114;
        Wed, 19 Mar 2025 04:22:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c3d7dsm1923219e87.102.2025.03.19.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:22:07 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:22:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <ybhc2ogdrbzadqzukupqqd2mnouuy7ggjifnpecu4ydnktgwe3@iwahgjhydhyo>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <6717d816-02b3-4d27-848b-620398808076@linaro.org>
 <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp>
 <89a71ef3-518e-4a69-b959-5bd03f0624d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89a71ef3-518e-4a69-b959-5bd03f0624d5@kernel.org>
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67daa8e3 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=Ea8lILSLKeBfcNHBp3oA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dOAMr1xIBaEXnzZJcwoXWzwOw7er_Dkq
X-Proofpoint-GUID: dOAMr1xIBaEXnzZJcwoXWzwOw7er_Dkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190078

On Wed, Mar 19, 2025 at 11:33:41AM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2025 11:18, Dmitry Baryshkov wrote:
> > On Wed, Mar 19, 2025 at 11:00:34AM +0100, neil.armstrong@linaro.org wrote:
> >> Hi,
> >>
> >> On 19/03/2025 10:46, Baochen Qiang wrote:
> >>>
> >>>
> >>> On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
> >>>> Hi,
> >>>>
> >>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> >>>>>
> >>>>>
> >>>>> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
> >>>>>> On 18/03/2025 17:35, Jeff Johnson wrote:
> >>>>>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> >>>>>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> >>>>>>>> single_chip_mlo_supp")
> >>>>>>>> the line:
> >>>>>>>>      ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> >>>>>>>> was incorrectly updated to:
> >>>>>>>>      ab->single_chip_mlo_supp = false;
> >>>>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> >>>>>>>>
> >>>>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> >>>>>>>> crashes on driver initialization with:
> >>>>>>>>    ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> >>>>>>>>    ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
> >>>>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
> >>>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> >>>
> >>> this FW version is not upstream yet, why are you testing with it?
> >>
> >> I was not aware the driver supported only a small subset of firmwares.
> > 
> > Yes, this has been communicated by Kalle (and now by Jeff) for ages:
> > using any firmware outside of linux-firmware is not supported, unless
> > you have been explicitly told to use a particular binary. Firmware
> > coming from the Android / Mobile might use different knobs and have
> > different expectations regarding driver behaviour.
> Sure, fine, but that's not what is happening here. Look at the replies
> from Qualcomm - not responding to actual issue here but instantly
> rejecting a patch for regression just on basis of:
> 
> 1. "series under internal review to address MLO issues"
> 2. "when all the necessary driver changes
> (in development, public posting in near future)"

These two are invalid, I agree here.

> 3. "Generally we only support upstrmea driver + upstream FW."

This one is valid. Different firmware versions have different behaviour.
Android drivers, WIP drivers, etc. might have different behaviour, which
works with a particular firmware build. Upstream driver is not expected
to work with those firmware builds. At Linaro we have had these kind of
issues and the response from Kalle has always been the same: use the
supported firmware if you are reporting issues.

> Instead of talking about actual problem, I see only avoidance of
> responsibility and just sticking to whatever they have planned internally.
> 
> That's not how work with upstream is done and is really disappointing to
> see.
>
> Remember Tuxedo computers folks who said we want to control usptream
> process, thus we will release source code under incompatible license to
> prohibit community from working on their own.
> 
> This is the same Qualcomm behavior.

It's a different story. If the commit in question has caused driver
issues (e.g. kernel crash), it would have been a valid issue. It causes
an issue in the firmware, which is not supported. If I were working on
ath drivers, asking to reproduce the issue with the supported firmware
would be one of the first items.

First reponses are disappointing, I agree.

-- 
With best wishes
Dmitry

