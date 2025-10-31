Return-Path: <linux-arm-msm+bounces-79784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F07C230DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDF33188A3FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6E30BF59;
	Fri, 31 Oct 2025 02:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLMrBcDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jp7n3XvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B257B30BBBC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761878793; cv=none; b=maW9X46a7v68YoZ3wwUfPtPyIgAjmdnIkWZ5tpY58SE4pCIJ5p/VPmSqnSruTN8sjEA1efZ1IftxEiraFtbRGUjs8b4iH6yoFxbg+kSvqouNOOjksR6MyLi6mqX588Ch1iCqrDNuRvhOzhSKOavhIyOnZi7u+734+6GM9RX8YIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761878793; c=relaxed/simple;
	bh=Qu4QSbV2XtSbfDV8VqAU0A1+l5WwqdMrJdktutHmg+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TERQAubPSvTMcF2GLYsIvO7iR6FYZdk+oPs/yjbanJEII0vSJOBP80OKVk8EGOLGEaVqn6T1xbCuvxvr/x8S6JIRWlw9ItdqXU4uWaIvxc6L2ib9NxGUypI/+vlqwW+zx5TBdQXNHc6sj4totTgHPcPpCulPoPIOD3BwdJxssIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLMrBcDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jp7n3XvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFEOss083957
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NFGqDp1m2CdSv3QB44B0+at
	avVoajX3Ebv3PN+tFIE=; b=aLMrBcDKOkjo9SE8gzH3PyCwxvTqQ5WjlCsRsxeW
	iW3xYgoQk851uP+2iX+G41FV1D7cAI4gV9ETn8BGE/SaOUSdmL9/h0oeVrN4SwfG
	wJif2mVk1aWNplgPl2By+lnc/Xhl3dlxr5HRS4LZU9reWX8uD3GJAGfzbXEUFTpr
	RLR0jIHxLHt/sFREFKftMHn+kFGCcQNKu+q+KoFv6htWLPWgc4XPVKpZsJ0gB21R
	+YhrImjkAsXtJXjE3KXKS516VHt6mtAz9mdCvNDURHY9hNf4/JFo69UfJ343oH4i
	QdIYA9XeX+EoSZUZ/Qtkkuocb+UQ1SQiIDI1x/WmgIZ9bg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ag39nwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:46:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e892acc0b3so43843391cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761878790; x=1762483590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NFGqDp1m2CdSv3QB44B0+atavVoajX3Ebv3PN+tFIE=;
        b=jp7n3XvHDb0IV//fb1NAzVfcn/1irlQw7xBIg0ECclmVgBn53h+ZUnLERIJX1ZmB2K
         +jK1P9cgAkVegImq18l1GhRjq5pFJVI4R8QbzaLc/ZFLUcf45Bt+dnEHXJRzgNU3R2pf
         8DVsjuRmB68VX4QB0jboszN8VYpg9kh7hphLZwnL0MIAPDkl3BxZxDF5h50LV8MVU3Xm
         H9nndQd7w5pl2fMo6Dq8UeItGKVx69GYzqeYDxX7/EN8ZL1F+i6m4W4Yn1sF8s0JQ4Vr
         lX+Y0XF/G/np0YGYN8vT2Gz4WjS5nLlRPiSxZ1HiCYShlqSdnMuPWb5+LCNK9Jls3gMy
         Dp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761878790; x=1762483590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NFGqDp1m2CdSv3QB44B0+atavVoajX3Ebv3PN+tFIE=;
        b=OSNh7i/JjKLXFXW8dND1WqR5JgFWCgmAXLqj6t5c63855TZdnIO9e+eRkArFpn6O4c
         rLOZS2oF65k+rAGTe/e6P9swnj2ndqvogcmKM+w6HTD6Buo7qZoKsYP2TNn69uxq7v0d
         rjEANomdMmyZz343GBZKP1oSgdfWQa++AT9vLuRDJTxMv7m/wpoSlqiEA9jlP5zn67kk
         m7VkGVZ01TpAXfSD3iIdIIR9WcKBvTlMUpOCgkfNjI3xA/ZfFxLqpGgkSSZa5GhXEvYm
         Jf8uLTvbvUV4IaVsreVqZ52f0pHJ8YoxuQLueFpspMC5jAaj24xBYI7VGiCvjpWrkYLL
         inHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG9NjbIFFwcAjACk3RFq/LoJ0WfOZDVLMkd2ZQ2HzmgvNhfslMUr0M6SGrJvYymzWB0SeDh9Zc8DAWr/ES@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtIi41ISZHonTue+IISxEbp5XE/TfzmwgYaDvyuK0KRmTk0qn
	pAFqt5NzElUqM7PyZkZehu3LWCGBh6lrJNMlB67KFzTphx/I/FkKM+U4Xx4oGvV4ZzfPfsmQboN
	oz7GKA2VEFGdwyyc2waxndaweiYT1YUlhuuK/mYAhn7dYuw/RvX8exU4mjY7nATWTDGkL
X-Gm-Gg: ASbGnctplT7MP57kezb0bDJzx+06TP39szColsf3By4xmUmFZjOJIyjrR8tquX7RKFB
	IvO3HjCqx879MpXlf1MIOXZ/RbahDEDV3S+wU4fRTUtsbAlLdOG5WRGnfRzONOWbFRCPw//YkIa
	nE3IyNfcKzSxhMreOv2QNhFUQgPz1kuj7vM4nKUp5aI4Ab+MedmxSe3NRUW2A+Bbqgmx3WUHRAA
	mkOlM+hH+YspE/T3NDTbBC/uevHiD52iYDNPg7Jpot57n+yRvNTAXAHS5MCnsuQZgtCTNMd9BsJ
	WKoNQyJMXa+vZEAIqTw36b/MRforhpe3gqRK14AakdrBxIAygTn++5PUoGY/RsrqIWGCK8qKlt2
	au1gETgJjm0pE7OIL2goB3wx6pcu10JmmqQ47tzD7Oth9eMNmYk4Hkh4wgVc4
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id d75a77b69052e-4ed310a7896mr22747891cf.80.1761878789855;
        Thu, 30 Oct 2025 19:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW+R7k4Z+WWJ9w992LN8TRCm5lm7xZV0CFcN/lZYH0/QcEjNEF7RkEkCbgI/lUUmwN9IKgHQ==
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id d75a77b69052e-4ed310a7896mr22747661cf.80.1761878789388;
        Thu, 30 Oct 2025 19:46:29 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed352deaf3sm3405111cf.29.2025.10.30.19.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 19:46:28 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:46:16 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aQQi+KA7KfibvhBu@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
 <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMiBTYWx0ZWRfX0wJPweTGQyo4
 uTKgY5KKmdnSjM7Qv3zyxdab3ikkxBUJbRME2EgKQXdJPgqRNz+I+/ZjPhrpNeVYEBOXm6GWAfI
 FOJYudNRpgER7FGRbH1tR5ETG4+mXcjwAMW6u8IHVrSUqsE9lZehgjU0IcqgFYfppZH9ytekPth
 K8EgvAzQUlQ/dmVgXImmAyZIKK33R6lQEVqvPkX4rZ9x9oWurj/Biz9dOHkNTEI6yRSoWxE8+V5
 p5LJbPGQANPhCc68OLbXRvw7wmpjTfGuZeqMK7XHl0gSnAigrFQZgRIw2nT5zUQDHLv7X4pRh1/
 +F/Q7HMGWaSsjA8h9C2Y9oZ6faV6POAptzgNfk8OlSUy0S0ufcfYXg8UOdyto6Zx6SJUarWmqJy
 BwuX5drwXGjsAPt197v6EgajbSF5Lg==
X-Authority-Analysis: v=2.4 cv=TrnrRTXh c=1 sm=1 tr=0 ts=69042306 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EkNEsoD3ZKdRnMbS8bYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TKXcD4HqeKg5c3HRjzarFJAzP-_BrOoo
X-Proofpoint-GUID: TKXcD4HqeKg5c3HRjzarFJAzP-_BrOoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310022

On Thu, Oct 30, 2025 at 08:01:10PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 11:19:36AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > > > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > > > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > > > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > > > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > >>>>>
> > > > >>>>> Add DSI PHY support for the Kaanapali platform.
> > > > >>>>>
> > > > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > >>>>> ---
> > > > >>>
> > > > >>> [...]
> > > > >>>
> > > > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > > >>>>
> > > > >>>> These two addresses are very strange. Would you care to explain? Other
> > > > >>>> than that there is no difference from SM8750 entry.
> > > > >>>
> > > > >>> They're correct.
> > > > >>> Although they correspond to DSI_0 and DSI_2..
> > > > >>>
> > > > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > > > >>> new features. Please provide some more context and how that impacts
> > > > >>> the hw description.
> > > > >>
> > > > >> Thanks for your reminder.
> > > > >>
> > > > >> Correct here:
> > > > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > > > >>
> > > > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > > > >> just some register address change.
> > > > > 
> > > > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > > > in the core and in the DSI / DSI PHY drivers.
> > > > 
> > > > DSI2 was introduced in 8750 already, but it was done without any
> > > > fanfare..
> > > > 
> > > > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > > > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > > > patch is potentially wrong and should ref DSI1_PHY instead?)
> > > 
> > Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> > addition of DSI2\DSI2_PHY compared to SM8650.
> > 
> > look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},
> 
> I see DSI0, DSI1, DSI2, but DSI0_PHY and DSI1_PHY.

1. From HPG MDSS 13.0.0 chapter 1.6 Architecture
I see DSI0 DSI1 DSI2, and only DSI0_PHY DSI1_PHY 

2. From ipcatalog memory map address:
I can see: 
DSI0: 0x09AC0000 DSI0_PHY: 0x09AC1000
DSI1: 0x09AC3000 DSI1_PHY: 0x09AC4000
DSI2: 0x09AC6000 DSI2_PHY: 0x09AC7000

Look like there are three DSI_PHY, but only DSI0_PHY DSI1_PHY work.  

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry

