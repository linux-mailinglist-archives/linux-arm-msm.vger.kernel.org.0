Return-Path: <linux-arm-msm+bounces-89257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80BD28393
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C451C3059A45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1899031E0EB;
	Thu, 15 Jan 2026 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f06KBkMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zt2zWDmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363473218CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506403; cv=none; b=kDLSrdiB1eGR4byqTWshPberaQsQCgwrn8RiqADZVtYN2R+Kpl1g2zXlb6NyIJ8YlxBVOBhuAGKqtGO1e4/oL23xYBEBVcZ3nGr78ADfKXLqjRKIwdNCgk3J11xWXBcollhfeuxLB4V1tpYS5dgGUOv182vMg1fphb93OUcEEwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506403; c=relaxed/simple;
	bh=SlZvBrVStosAk4VCcTNoLWYS9K+1OgGBwDNd6kx0HbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG3X7l9BSEOR1OJbfQP3nxJarY/kOtlMJskMEB5gyURZ+ayG2wtJJvwupy1jBm3XSABclmfMwwfgjglrLbcPFqcV0OEX90ouW/so86/NdZDgSjieMYxHmGmXBePS8MU86aTw0dW1v9J8P9PG/N3Cuu0LZ3MuukMd+s2SYYY3fNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f06KBkMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zt2zWDmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY8c92817378
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=; b=f06KBkMPuuzUpZdt
	hc0GhaR7F5/UUSvTMARYQMKYFhN+D1bHNCumHk4tdc0JvUmZQVhRxDnUkw/8n4cw
	2apWznBkt1tC+FyG6i8w4iI4n6vEOHvDfmdVOhlIVAM2kT2TPE8NF/tID0BHW/uo
	/ERKarByIioVKl83NGMaLietPKePFQFKpcqQ298Ppa9s301BTEfHiP0enoCbHue6
	cm25FGOU+puVeWqGWCAV4/WERQ8qHCwU3+FLL5zDQcgpUZ/E3E1CB1QOeYMCi77f
	T0LZF3x+Mh8mX2KZBiUiWDH33ZadB4IcDiYZ3AES5rZVH18UxaWAwhF6MuOKUpmJ
	smnxSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxhu4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:46:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5329ed28bso314025985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 11:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768506393; x=1769111193; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=;
        b=Zt2zWDmF9yLVaj2Tf2fhB+/0pCh0FW8vWZnkyWRroNzJvJD+dXcphCg6n/Z/PcSQkp
         iADr6u4ZNFd7RXB8UPTBkFWrbeHZmjjRx8kDTOMjTJDgRq7mQi3BTB+bTZWpqvVFJ2hy
         xWaNa8WCMrvaErhVqkngHXhHggDQOtzcHLCpEetLnWl8Kjisp4ZAhFqBwKHm8jU3kdAZ
         EPBFd2KKxKWgfBWi5of/dpu6JSvg9c0A3wo3Gt0TbEEeQAY/rkcDZsJffmDyN61mQxg9
         GS3kyZhsrWSrG9o/OD0Yh+tz8bUqLsQOpw7zVIQqU74el4GPibYakvYNhk79vx6X+EUh
         pGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506393; x=1769111193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=;
        b=vigkzH6L7hxNrTBHAUOCk5Ss5AV1kf2W6v7Oqduf5L8ugIyIAWveWEb9cFL0woGMJ2
         rfG/TJmEdzs+hwgAAcMW5asnK72s7Wy4jwL7Jrcw1/m8BCc+ZbHiIveyUyEN6uuxtKHz
         HYOC2TGgs0HSbqNDP2lo9RZbE1a1YrAyWBmo/pkj00W49a63NzTyu8LSTO5JMe55TW7W
         mJOm2EdoemqKcSTXcXdkdsijGBJg1WIshJghHq1GIqRjqHdAvRKNAjF2a30d7KECZF0v
         14EsUa+ml4ZxgLIANxM3cCBaSSN49147cZUtyEBeFZC4LxEoB6nQrstAyI1BSBNkS/NK
         AFyw==
X-Forwarded-Encrypted: i=1; AJvYcCW6yW071lFXxjItenXbLXz69Vubixto+Q7KRC5TVP/zeHYZHN2mjfxaqjomPu9vc3WqfC20AEFbyiciLTra@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEX6d//x/cCa87Uagbhu2+rJI6reE3qLXTtpfz+dM39mWSDEF
	2S9gkBRXHRm522I5+sqwx0pq1CkfIoiaa/ZH5XqpjwUlzrNrUwUqOqiCMGULvvJyYIk7OeBe4Iv
	zz0AYy2FY3yAT8ycq1DzCsV5s7L2duF74u1mlq2784wZkYON2pRRDvK9I7U301l+Zrok5
X-Gm-Gg: AY/fxX58kNAwLIulJVC388/mdGjCnDLJBCqANEcVHZwtU1vHE+sqLHUyHJIpH0vXO+E
	q+CRITeR1ThuNow6JCZvGLB4ywcNJE6FF8sljhepyiH0vCsFEJzXLIMmKDeS1rAvLjxDiOCmFNh
	TvQEli21aJ7ji5eSp1Smo0DVkPNWqsk6vPEHTOWtPtvqsF4VdgLgb1324bPUYSZgo/rEgeZ0VC/
	hAc3EWlt0ILLavFxyqUaJJsGNgmMbSWf6Qpokx78ArgUUE2x1ylmhuQ+pc0V3rxs0EeKK+pASWW
	kg7JnFx7pzJotjJhP+EmsedgO1sbwC6PUqebOKMRsRkGdkxzdEJKCBo14nooS/8EtQeEPECKoGz
	KZCh8Y7F/FQGCbtLTFREYTcs+Nvke/D4VyZchZz9FXP1aYKF4t4pfONMTtI1GzqLXJ1hqyHEAmf
	361GRkmnJ7NgIFJdkjEk88Zro=
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c6a66d1590mr97232085a.16.1768506393404;
        Thu, 15 Jan 2026 11:46:33 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c6a66d1590mr97227385a.16.1768506392844;
        Thu, 15 Jan 2026 11:46:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384bc471dsm1191491fa.0.2026.01.15.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:46:32 -0800 (PST)
Date: Thu, 15 Jan 2026 21:46:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=6969441a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=9hB0ncMiyRH3-G76khgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: a6Y_EY619tLePUJO05OYpyXEoJIQZXWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfX1yKopHfb4tpB
 tlw3Zxvw4jSQEaZC99EfTQTys2W/8EJjA6ZW4c3NnkDWpn5ybSfgUCXmSp4yGooLOgF2QedPvBh
 5l/WQUh0Ysnx33Im/W3sjUr8uCUqwwGhVvxgjv6LSCtr+TZCiGz3AtW0FRO0yXQTFguR7JqbtLG
 Uw3+PtYwJuwKl3dHxgyzx0f9JeXIT9yLlMNeSU7v0uiLLYNwmQnYcgy5/bVR6YGFYaJLWDAK+9h
 bCs35muskueBPWUoRZE5z/vsVo0k8sLJxrRNSzXSG30VQlQ48D5dD9PEIkyheOL4947AJAvovii
 NkT5AaMl60SWPDGsMddYhzN01dA6+T9rMFtJORJaAlFXgScsxqG2mh8VSAdWlhaNBkUe9NQL4gf
 aOBRNU2qE1snGQx/xeB6w5B5uYFKIjKbeoNE4aYMSWw72M6lkoTRU5VXJbio4u4PhCj7zdNDitz
 SaBuE/sIRvNzXIvwWsA==
X-Proofpoint-ORIG-GUID: a6Y_EY619tLePUJO05OYpyXEoJIQZXWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150154

I should have added GPU maintainers and ML beforehand. Fixing it now.

On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
> Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
> > On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > > Add support for the QC08C color format in both the encoder and decoder 
> > > paths of the iris driver. The changes include:
> > > 
> > > - Adding QC08C format handling in the driver for both encoding and 
> > > decoding.
> > > - Updating format enumeration to properly return supported formats.
> > > - Ensuring the correct HFI format is set for firmware communication.
> > > -Making all related changes required for seamless integration of QC08C 
> > > support.
> > > 
> > > The changes have been validated using v4l2-ctl, compliance, and GStreamer
> > > (GST) tests.
> > > Both GST and v4l2-ctl tests were performed using the NV12 format, as 
> > > these clients do not support the QCOM-specific QC08C format, and all 
> > > tests passed successfully.
> > > 
> > > During v4l2-ctl testing, a regression was observed when using the NV12 
> > > color format after adding QC08C support. A fix for this regression has 
> > > also been posted [1].
> > > 
> > > [1]:
> > > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> > >  
> > > 
> > > Changes in v2:
> > > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > > (Bryan, Dmitry)
> > > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > > - Link to v1:
> > > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> > > 
> > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > ---
> > > Dikshita Agarwal (3):
> > >       media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
> > >       media: iris: Add support for QC08C format for decoder
> > >       media: iris: Add support for QC08C format for encoder
> > > 
> > 
> > Looking at the series again... What is the definition of V4L formats?
> > Are they expected to be self-compatible? Transferable between machines?
> > In DRM world we made a mistake, making use of a single non-parametrized
> > UBWC modifier, and then later we had to introduce OOB values to
> > represent different params of UBWC compressed images.
> > 
> > So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> > should we have different format values (at least for different swizzle
> > and macrotile modes)?
> 
> Our expectation is that the decoder will produce the same format regardless the
> resolution. And that format should be shareable, so that same format coming from
> two drivers means the same thing without out of band data, except that
> resolution and strides are needed oob anyway and can obviously be used as an
> acceptable workaround the issue you describe. It should also have a single
> translation to DRM fourcc + modifier, and hopefully the other way around is
> possible too, otherwise its a bit broken and unusable.

Well... As I wrote, we made a certain decision several years go: there
is only one DRM modifier. At that point the decision was made by
open-source people which had a very limited information about hardware
internals. We can probably try deprecating it and shifting towards
multiple entries. On the other side, most of the blocks would only be
able to support only one of very few possible configurations.

> 
> So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
> format as a pair of DRM fourcc + modifier. Decoders typically only support a
> subset, or hardware engineers can generally pick a handful of performant
> configurations that works for all cases (its all 2D with similarly sized
> macroblocks).

This is not quite applicable: even if we try to fix all other settings,
the format differs from platform to platform because of the memory
organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).

There is a description of swizzling in Mesa ([1])

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc

> Since these formats are only usable when consumed by GPU or
> display controllers, its important that all party uses the same convention for
> the limited information available.

Yes, we added UBWC config database in order to have a single source of
information for the kernel.

So... On the practical side there can be:
 - UBWC 1.0, 2.0, 3.0, 4.0, etc.

 - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.

 - HBB or 13, 14, 15, 16

 - bank spreading (true or false)

From the practical point of view, drivers/soc/qcom/ubwc.c defines the
following formats (currently, I'd like to cross-check some of them):

- linear
- 1.0_123_14
- 1.0_123_14_spread
- 1.0_123_15
- 2.0_23_14
- 2.0_23_14_spread
- 2.0_23_15
- 3.0_23_13_spread
- 3.0_23_14_spread
- 3.0_23_15
- 3.0_23_16
- 4.0_23_15_spread
- 4.0_23_16_spread
- 4.0_3_13_spread
- 5.0_23_15_spread
- 5.0_23_16_spread
- 6.0_23_16_spread

Would it be benefitable to define separate DRM modifiers (and NV12
compressed variant for V4L2) for each of them?

-- 
With best wishes
Dmitry

