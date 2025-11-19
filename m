Return-Path: <linux-arm-msm+bounces-82460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 65215C6D9E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BC853871C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672A1335087;
	Wed, 19 Nov 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjCsFkNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeiZDdJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6A335093
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543339; cv=none; b=jT90rDjmQ0SXkg0R49ywIM4VwrgvPfDaVtldCCcCXCzbzw3cUxNK3KcLtGEEuWzqaD/SKrQ3Tcdmdlj7dD3alLzAvijVaXPa2uwFHokbiN8ZhZoi+n7KJlv0Z/W503N/09flAgCwwpFS+QDSDa8ddjcyik8zvTsVdIt3WZcuWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543339; c=relaxed/simple;
	bh=jrwnzPmjdWuo+o7DXPlCIozS2cMqp4j1IJeC2T9P/qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an8I8Eia+ZKneoiBIaU2BhiytJFwADJmmPruLAK12JnNpnFMutXJeGh8AwkkKBdknd/eC+yx27/J0eAuu53sR/4kgLUqz+y7KB1CDykKct0fzZsSJhSeR6Rls/0HVgB9b/qf9aog2+t/D4ErXt+SgCa/UzrtOOemwWffxlt3A1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjCsFkNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeiZDdJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aIZ0718909
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTbtZPuzr8b614zgVfcZ7nzI
	mjQhffBU/Mc4TshKik4=; b=TjCsFkNoamUiOkS2tV7Dtuf2GEc3ApHpjs9lzqiS
	sqHHSe692rrAvrjMu6nmrmdTSwm2kkksZbqBvgtHy6rnARhMJot7KcrcOZIinrHN
	imDH+SZUDh7hcjNjsX7dz+7HNS8vpqsRsA1C0izpskT7iqCzd3i2ckvdu4c+hZb+
	JSkQJCG36Cf1FyYHdhk+N4JTufTSlwAoYA9FW6919nMEpzSL9L+MOYOmnp/cIIS3
	HAd2ewmKBU+cpeCww4rsu8xG18vVMuU/+pVwQMJNZ6NxiB3Di7Cmy0LzvC0la8jH
	aH/n3hCYt93I6BUY80NZuLxJpBzpw8ejS8EQlpCLdDieTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0r980-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:08:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaf9e48ecso169607091cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543334; x=1764148134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTbtZPuzr8b614zgVfcZ7nzImjQhffBU/Mc4TshKik4=;
        b=JeiZDdJinThZh0iSOLsSeihC7uydknra24JDOM3NjPMT0DExxkaxkaixXGSyFG5scd
         l22uGmWrasZC2146MuTmm8PU5CxqPrE2nH5p9OIxvNUGTeYte3/Zd4tmUObA9SejLvNq
         mANf2r9FOdnU0rduP/dabCnsG3F1gN6fIN8f2p+2qJuWaSqzrvDj696vlvMJbseJ7EYv
         LBRkXFcyzdgIb20dZMld9DdzZe0zU/FW/WpHo6HU+wGmEeEMW8IY4XPUaumxADqyVZgY
         6m3svfeYTtPTIUK6jJ1zXNaXJ2DRCcKZabc8exksbe7xvuEgZ6jIb+8IywGY72SCPAc2
         xizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543334; x=1764148134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTbtZPuzr8b614zgVfcZ7nzImjQhffBU/Mc4TshKik4=;
        b=V5bSBvu6ajqE/zTphB3xej5PdpQ/XOla8K7sGjiaeJnc1tS8w3FabAJDrzeP0TCI9u
         aAjb7pzjZHrWr9WDGEyJcWqOezKlI6oJ8Sba8WSve3LQ1nGdrmTQ/Jt3GOPQ65Ubl8xR
         VPGbLrQHj5sRrf7aENhapC+SzP/kF5f7TYqHzoRCuhJNSkT0uJxWhrIMLhMcCwVbBHwS
         CONFcTtqbgLwlsSwFr3AP5ivI5UYstutp8g9R8orqTAZ79GIC1K7wQutOVoako6y5rBC
         EBGCTcfsf7fQW60j7rS5OHLicvaba7aPkCeKMJTA6CbqrGo6FBaZrGMR2yE4hoqWHGZG
         YFHA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ceU/Fadu70GuTokAIx6S008+lcyzOon7j6IznW6zN84ZcYtiU8hiGxF+Dv0MvhhJQHDOBTuZruMVAlxT@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWmCgBhtuYMFYvjpPh9M4YwC5Mv5YEyxCnBAhjEabKQxiSj8Q
	lmwUJtFuMODgQAGITVh6SyOHcxrvI/lo8sUFkn70UvNSF9bVoEWUmm75cu9+y7e2DXmPWAk/zWM
	KjjG4iQu2pjHleOpva+3HrGU5xhzVYiXtNmqtG99Vcx7KAa9T4+jJGDcGaaoV68MXX/ox
X-Gm-Gg: ASbGncu5qfLU5/6qQbrKwIUKvh/kFQf0pf2wRIp4wLq/eI3YHEsbI9p+MrjUZkNAmkT
	oO7T12xj77k536aDw69lfNOkZau3XA9TbMO4uPdFKEGUadeUSZOG7/Oq/2qpE3aThMPvvvP3NT+
	2LI4uHEey3HC38dukbSyJu+77peKoIglMj4jtcNogecl5YWLQOx4Awcw00MPvw12B1F29eYLVnn
	tJEpz9Kdz+e5b0yt8t7DVxL2/4PFcyEmnZJEdNvw5wtbAMcophsle0sdmcknNtJK5j1anGDLBQm
	HoXGwuitHyrhC8rqEwLd5icYcJJwaCPFos2LOUsIpC5C8YRn+ajRBbXZAgfMOrIwfi3vV5/xM/5
	MT7/xiHIY6js6FatC6679YMZ3Khx82yib1+ZHsda5A9tasEfP5FT1nz3k4FYpfNxklP/lM9mQ53
	DyjSAf8jJ2k1eaNo6K2/IfGv0=
X-Received: by 2002:a05:622a:1a8d:b0:4ee:219e:e66 with SMTP id d75a77b69052e-4ee219e1ccbmr132271871cf.83.1763543334098;
        Wed, 19 Nov 2025 01:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvGrTwGWgt3h25w1spAqf1PMbfdl26WuMNR8Rh1qTaBhxRDJpt0kYDPqbU3TG80HYKB1z85g==
X-Received: by 2002:a05:622a:1a8d:b0:4ee:219e:e66 with SMTP id d75a77b69052e-4ee219e1ccbmr132271461cf.83.1763543333526;
        Wed, 19 Nov 2025 01:08:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080casm42649461fa.5.2025.11.19.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:08:51 -0800 (PST)
Date: Wed, 19 Nov 2025 11:08:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
Message-ID: <a4wd4u4qh7ldiz6qzvmse72vhsuh5i6erpbglgzgnz2zdo75tq@xnwmwrij7rqx>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao>
 <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
 <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
 <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MSBTYWx0ZWRfX3R7uiEOlGAI4
 DkILR6alhMSdQxzNlGwdYXFd1jjLsJf6QBn/Sb+UPV7tZziZhTO8VeCHsH8PCNpGS2o6tBmHLJZ
 4Q8SPgD2Uw1bavWtPNUlm9gygfZ10pUnk1hFANShMugQSxKeRcYJJjZBux36NvDSnjNSUsBZbG+
 bGT2OQuqsv6+La0C1su7HxaV7cnh4Pdmf3vMxxdS00JH/yoDm8cvHR9LdtAm7Veq5z/HTdGuLO5
 Z47cvcx7tY1K4JyX5sghxGRc4lb9VgizxY+5Mf9RNwdf7lv1ydEPPe53Za6ojHFXr2kWIvsoYQ6
 3x/OUv5SCTCk1SF3fHhlKJTt1hkk5ohS5ffAzHiwj1F7jsA+qSznLeXfJ2Dv4mS0eSBb99xCaSX
 TOcQ4YJ/4jL7tzfojj1PIqbLEcHAeQ==
X-Proofpoint-GUID: s6bKp3aCunLYcD_u9WKO3E4F6cqYmLpI
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691d8927 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=74vutVrwjju_euDmxZsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: s6bKp3aCunLYcD_u9WKO3E4F6cqYmLpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190071

On Wed, Nov 12, 2025 at 10:39:16AM +0530, Vikash Garodia wrote:
> 
> On 11/11/2025 7:09 PM, Dmitry Baryshkov wrote:
> > On Tue, 11 Nov 2025 at 14:43, Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> > > 
> > > 
> > > On 11/11/2025 4:08 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Nov 07, 2025 at 03:19:35PM +0530, Vikash Garodia wrote:
> > > > > Upcoming Qualcomm kaanapali platform have a newer generation of video
> > > > > IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number
> > > > > of power domains as well as multiple clock sources. It has support for
> > > > > new codec(apv), when compared to prior generation.
> > > > > 
> > > > >   From previous version of this series, the kaanapali binding patch(#1/8)
> > > > > and the compatible patch(#8/8) have been dropped. The discussion for
> > > > > this is captured here [1].
> > > > > The series introducs buffer calculation and power sequence for vpu4. It
> > > > > prepares for vpu4 when kaanapali is enabled after the binding discussion
> > > > > is concluded.
> > > > > 
> > > > > 
> > > > > gstreamer test:
> > > > > Decoders validated with below commands, codec specific:
> > > > Why not just run the fluster testsuite?
> > > > 
> > > 
> > > yeah, fluster can also be executed. Individual codec commands were
> > > explicitly called out incase someone wants to run standalone gst pipeline.
> > 
> > Please switch to fluster (in addition to Gst), ideally running all
> > test cases for a codec. While enabling SC7280 support I found that
> > there are enough corner cases which are being ignored by the driver.
> > One additional bonus is that fluster runs several process in parallel
> > by default, catching issues caused by several decode threads running
> > in parallel.
> > 
> 
> multi process issue is due to below [1] (tried it on lemans). Due to higher

I haven't seen SMMU errors on Kodiak.

> concurrency, we can see that the DMA buffer is mapped into un-addressable
> range (0-0x25800000) i.e 0x24b00000, and leading to global fault. This was
> the reason i was keeping 2 memory-region in kaanapali binding, to restrict
> certain ranges of IOVA.
> 
> Below solutions are being tried, again this is not limited to kaanapali and
> applies to existing enabled SOCs as well.
> 
> 1. introduce dynamic device for output buffers which are big size
> comparatively, via iommu-map
> 2. introduce the restrictions to the addressable range.

Hoping to see them posted and land soon.

> 
> [1]
> 157.511807:   SMMU_ERR_FATAL_NSEC_FAULT_NAME_REG : SMMU:>> 0x0x15000000
> NonSec Global Fault: NSGFSR=0x80000002, NSGFAR1=0x00000000,
> NSGFAR0=0x24b00000,  NSGFSYNR0=0x00000004,  NSGFSYNR1=0x08840884,
> NSGFSYNR2=0x00000000,  NSCR0=0x00280406
> 
> > > 
> > > > > gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
> > > > > parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> > > > > parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> > > > > parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > Encoders validated with below commands:
> > > > > gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> > > > > format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> > > > > capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> > > > > location=<output_file.h264>
> > > > > 
> > > > > gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> > > > > format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
> > > > > capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> > > > > location=<output_file.hevc>
> > > 
> > > Regards,
> > > Vikash
> > 
> > 
> > 
> 

-- 
With best wishes
Dmitry

