Return-Path: <linux-arm-msm+bounces-79785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E52C23102
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D2DA4EF96A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C699730BF59;
	Fri, 31 Oct 2025 02:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eveHNNsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZNBpl+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3AF1EF09B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761879063; cv=none; b=b4pNvum0WN/hVhT7fRd7zGOiNszrZlQFT18jHx7JVt4/McHlbCOhTYfQI1m/eKn5MxQIbNeWKCaXj3hfii/nRmxpvkq/HSVBwySKYos/Ia72P1es0qmxunE74tCpub75YO8wfLojJZ6J9TYmQOnCpHcp+0+MGp5Xy5m1BN89IsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761879063; c=relaxed/simple;
	bh=Or3vgsdXxa6Y0TNB6OsBk+vFfGuI2hIQ2144RQpNTqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMr/vkAJZELOvZp+03s6gb/OsL7E9NXdPbeI5YHOn7eKici1JprhF91YhquaHwXFERPfRiHikkX+HW87wCDueF+wzoN4HPPZoMgFS3G9FL1bdV6xwHRG/iwtRYdeb99sgA3zIhg5LKOmTD3VdICHc+6kCNIqUnkw/iVDN0ocacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eveHNNsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZNBpl+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V17sYT1512142
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DsJkS4Jj0YiOEfhK6rX+s7mE
	DdCGFC+Wm4+5HWL4rHQ=; b=eveHNNsVfcKDk2mAiXSreXJVEOwKUUuuY6Zts5Tr
	5AESW65mOBYtL7nwuX53K71yGXaxATGqw94J3pUygtlsJHBtQs81RuBEqqXujSe5
	HaabpV7FW9xwhAFIua679dZMrJ33wNgs+vyLMF217YN3vM0pgUl7AMiW04OYP+i4
	AbiiIOFpB0+ukr/+mnEcD/OmcjcNfZvn252BCCMeo8q1PSXQR3sj79AWm0IW6O54
	H3dFQj8yPtcC5X6W2BOPbu8TynatIJn1AdVwX7w3PQikCgIrdyFHyXmmZnAub0C+
	m1udYkR6Upz9OHJhQyQsc8hczsbEEAZYtUYVZ9xekJXoDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69g74g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:51:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so22179671cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879060; x=1762483860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsJkS4Jj0YiOEfhK6rX+s7mEDdCGFC+Wm4+5HWL4rHQ=;
        b=jZNBpl+l018Jl5Xjb7mVoOTRimo6FuQJZHNe4/gtEhOVCr2qHKOtw/uKD/MFSGsoou
         D5MLZw8Urc4s+6ZPjR8SXrbvWvFs7LQEdoVebRQ8mgcYEN5q3yO72ZVfXDg7RsiDC7Hc
         qCm0zfH35hmr7n/OOZArIBMmS6Z8nQuUJ/j8RXqQoyfTaHCd+HHFUi296I+SVPC3Iu31
         VJKHskgQwBsW/75iTCimcHY/MOEtFBAk55WI+h3SECmk5lSBxWpYe59fPV8hP3CKSUkX
         Pu+J0FVz97tTukKksu2HSti4gbDZtdveD5bAOXB6c4tBts0HLQLg36hxifV8YUmPRTma
         MrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879060; x=1762483860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsJkS4Jj0YiOEfhK6rX+s7mEDdCGFC+Wm4+5HWL4rHQ=;
        b=PRItXybx0cGnfp222fhpunyp3ppoYpSxkhHxy1bvDX31UCoAVr/x9eWusDH2BrFSwd
         RUkkLNedIE8gi/1FCPvnviejtfuqrtZiSB/67XTwqGjJNfqpUQAIyxRcHKs/tVe1Q0/v
         XG/QWl4a9o59bn6vypBhfT1MNlWvlGtNVtjuYSqP8TeYapiOblyFqpKafTG39qzd3ors
         KEyU9nYtmq2xo9vvXCNHcyrE1G3i0QflPPnYp9lsLNQ5wAr09/vjhgFdJPdOwmEsMOQ6
         JZnMe/QPzvPZ1wkvqJvrK/w4S8IiMyblLa2LPjiLmhXGAVyAzgo6dWtL22FUkA/nm5u2
         jX0g==
X-Forwarded-Encrypted: i=1; AJvYcCVk9y2eXtwk8D5Qp1p0U4wArX4UZgv3jfi2v6TbHMM1yEQYo8ONV668JN5bCRaiKeZuYVswHm3/O2D9I2df@vger.kernel.org
X-Gm-Message-State: AOJu0YxBypRW0oJ+sEQOh5LXcHd5FUZMuHpw9+sQ4aemq8J7Zb8G9vey
	Zrg64W+A76LGKBxqAVZEcxRDL7cM1yVdZvKV5WQ+LVlqK7/0mYMnmOCrmDZpLkO8+skVOBsPZZK
	rkkhMtcqXwWnHmz/k54s9WfMZhHJnzP4T/flicozWANlYo/ol/nE5BpO6uHQ0YmGniKYb
X-Gm-Gg: ASbGnct/Q99oqF2nuiaK8BV23qBHV1xb4ClLFQ6tfep3bprN4KlkiehZ/b8L66KJcLI
	8txtdlF69tADJCsY0r4/kNgOnueT6owqSfBO/nxhiT2fzfqK+6veo8gw9e+tylg+Vg+OFJX8cba
	DZfyQCkl1t9JH/RNf9NSUpRnKjf5mkvNakhlOcrwheDQaQGNoA4h3whVIzyMdGQqDFnJjEXJf20
	6JxGV5UAamBprVhvlajVApMzPHsED0xfXv2YLPJYhjE5IwOJm86154L0cxMZFHLpr/n0q66bp4i
	m6svspoA5cUXyOkDeb9bE+W62YNEhlIX2TgJ8jvtMRGYSqKAgmbiqVWP/xeKnnFi5lle2L//o5J
	MXGcGBFx+SaEfQ1QK33cWVbE4BRozNogBy5ok6MHN5ARAYgpUblvtDW7FY/gl
X-Received: by 2002:a05:622a:250f:b0:4ec:f5cd:871e with SMTP id d75a77b69052e-4ed30d84c4dmr24792541cf.11.1761879060389;
        Thu, 30 Oct 2025 19:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXYqZxTVqoWzxiWk3B/+KdG7WVS4s1P0rx3pIBR/sRe6vbtf2x7h6Rv+eqmkdkShyGqNrA6g==
X-Received: by 2002:a05:622a:250f:b0:4ec:f5cd:871e with SMTP id d75a77b69052e-4ed30d84c4dmr24792241cf.11.1761879059921;
        Thu, 30 Oct 2025 19:50:59 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8803606f2besm3522226d6.23.2025.10.30.19.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 19:50:59 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:50:47 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aQQkB6Ma2z3c6iyh@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
 <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
X-Proofpoint-ORIG-GUID: -nW54Z0v-SBYLA2KDc_4g7ErpdoRIJw5
X-Proofpoint-GUID: -nW54Z0v-SBYLA2KDc_4g7ErpdoRIJw5
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=69042415 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9FCQf4pbOLePcO8AN0IA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMyBTYWx0ZWRfX1hehegUc2SFg
 Iuhh9SuCg24pvv7jnXdAacxdf8beaQB5nGhhCUopXFnbWakD5s8nsfj39oWvqwQZmZuzAhYJU4d
 AyXqrMxxs6nVZfVIXxcIgMkwxTfmdZcSJCjPPuJnzdg/SSXkItnG3QgmbyS9+eRNkJ5notRXrcz
 /JWspn152iXs0TlaY2pJo7982QQDTj6KgpYVh3C88VGvwM/PXtXBrFXS0asIWqaiQamAeOz6+Vi
 vBXG4BWDVy0VLldL7v+XBrDxksCP+02+9W1Gkw4WECgwqZ0UWQGTBkvRTtzbj7eqKl9v8sZCCw3
 7Cf+SRmljbHOXk6aB/xWRtaGBad4CzViHtP6LS1yup2EndtFsuZ/Sl+RhrDmfYKMxzAhfNpZlcY
 rGLJbgXbbYOHi8L8q7EcPMoQbyFA7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310023

On Thu, Oct 30, 2025 at 08:02:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > DPU version 13 introduces changes to the interrupt register
> > > > > > layout. Update the driver to support these modifications for
> > > > > > proper interrupt handling.
> > > > > 
> > > > > So... Previous patch enabled support for the platform and it has been
> > > > > using wrong registers for interrupts? I think that's broken.
> > > > 
> > > > I want to express DPU 13 has different INTF register address, so need to add new
> > > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > > 
> > > Make sure that patches are structured logically. You can not enable
> > > support for the hardware if the interrupts are not (yet) handled.
> > 
> > Kaanapali Dpu interrupts: 
> > INTR_IDX_VSYNC,
> > INTR_IDX_PINGPONG,
> > INTR_IDX_UNDERRUN,
> > INTR_IDX_CTL_START,
> > INTR_IDX_RDPTR,
> > INTR_IDX_WB_DONE,
> > 
> > are handled by irq handler, so here enable dpu_intr_set_13xx. 
> 
> You have enabled DPU 13 in the previous commit. And only now you are
> adding support for interrupt registers on DPU 13.x. No, that's not good.

OK, I think I should merge this patch into the DPU 13 enablement patch. 

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry

