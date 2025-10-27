Return-Path: <linux-arm-msm+bounces-78916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4DC0E17C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031753BE197
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1F61F4621;
	Mon, 27 Oct 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpQxaR9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C23211A05
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571852; cv=none; b=jlAsgd7uBb6PaP0KamrOqL1wfaGIyybnFum8t0+N6eOZY5w7bVT1JBpLPwZPZN9Z88VI+dwNTZWv+qZwNztUUiYdoivETYbBdvG8sJAmJSzjwNbSRSW71HnAFQXLKvTSTdvsEgwlRMaPYsk0GMlUbH0/icR1B99vvQj9QCd/Dzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571852; c=relaxed/simple;
	bh=0+NW3qoSqIVkjd8t21tsQbDlCJTokrAnzATLDXILBz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uS/YDrSFtcenEU0TRkdzxL3MKh2EXUkBZxieb1ilcxANHqkqVw/zvg/cEA9+ssilxW58xLfFSmvgThjI0pMAa0Ffh5Q8O5aKcHg1Tj0YHhK6z1gU3groulC6OY6gGh3qtpR46GbdQyYSrh+AU+DAPiwtLR3I/LQIjClZ7jJGies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpQxaR9N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCfKcn2779912
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VuMvAMd2Yn5uPAiVWdHf+qc3
	ZLlZWtjBdo/nxvtzJAA=; b=YpQxaR9NbkuVebTOxqLZOKApJ8xkEoYp/PY3AysS
	RJuRsULcLLPC70w1zr29miA5OJze9zBxX2T53Ayx/QErjy2BFl9qK5jJmgOdRI00
	rxUbNn4VGB50UexWm3YXEE7JqQJUwlD+iK32YOlh3xexsqpJQTpQ8SJdACw/SlNU
	qFOtCSKe3p0wf6T68HNljU86vrqd0204RCMg+5EDVm/QmkHv7s83BPxGwB1UU+ek
	pmu1zlIKtXiR/icB+rltZMLYZd39pQ3kDXQe6hkpvNRQhkhfrLjX2pxBFHLzp6lC
	6kwAq72L6rmLSENFaVfgz2Jxb2+cajhz36Mi/BQzV0eT7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28yar4mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:30:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eba930d6ecso71533711cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571849; x=1762176649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuMvAMd2Yn5uPAiVWdHf+qc3ZLlZWtjBdo/nxvtzJAA=;
        b=X6pdlvno2y8+26qC+lRaEDeRyWjzNDHAc8BHDaVaBupVmyOk7XMlgdTMMM3NiBDGIc
         TVeApGNhoDoB8HJD+1zXMRPVOh/6t54me/ZTJqSorog2bZH14SlE3cn7AWOo840gYJcq
         PfJVU8Jd1pli7YGk9qhGJ4qbOcC/s9H0b1DJLToazDDtqiZ47w5ym69cDM5FC5iAn9yx
         NjoB/NdgfKPPbD47kqTFYtkAKj3YkuoI2YepalHlnkGAcDcDqsVCvMJFNc+JXoK8uvIh
         s3eCrZjPRgINKxZpLwkVTxKNoBuVFCVIoN29x+nCSKxQUH282mZnbqxqEZvykDKknxTI
         3o6w==
X-Forwarded-Encrypted: i=1; AJvYcCV8GgZZuf6HEaSjtCFv7Dq2nCtX2izk3jp5OjaijVBmRts09UWL8N8D1u33oGhr2nmRbHXGVeNdVceCrGFj@vger.kernel.org
X-Gm-Message-State: AOJu0YzKzd2b3fBo0S3i2EWoN4YhibFUXexEbkmXByHi7bEZX8SU/2rv
	b5cHThiGAMnwbnfO/t3Hz9npuR5VKlZ3R+XEpoioW87z+0sNYZj1CKRLI5R/LxqHqDMGDTW/ily
	gD+BXpN56Gbxx2UXihn/ty8Ku9GUQ9pg2FIv4RI7AqmxqfDoweKq1u5GeqNWp8Imr8DubT1YWpq
	7Z
X-Gm-Gg: ASbGnct4yxta6GoaXsDttJmM9Jv/lWJxHxleOxMwN4N/bfaneuFBEZwGWAL09/d7JHB
	iy3QJYhyW3C8Ngfxs3VwJ6NVgeQV6wc29a4WiMJ+FJU2W6IrxhIA9JNHXSvOdpMLVYsCyzFsKL4
	1lV0B65QftcdbD36GX7DP3ylYqtza9mNdAgRylhxwE2YsYYDyVlWBu8/IZS5Gj3A5sYITDZItJ1
	iaObpMZ9n1+39rRV57JchyQnNF/cZhm9YQF8MytVRafEdaoeSLq/NByBMeGqJA+MubT8ljQYGO7
	MOEElAKfsBeg6Vxu//0fO38z16USrteuBLi7Lnc7fIDT/rzFBVwK3yFlzyRMYUud1QUlZJDbK0f
	aoOnUWruxlo4wW0boI4lmadiDUxIvEUZ1Xb88JQm2OUun5wkX+zNng51T+yN1xOxc95MLLMQ983
	dvqWP3zfR0TH+7
X-Received: by 2002:a05:622a:4c8:b0:4e8:b88a:c6d7 with SMTP id d75a77b69052e-4e8b88aca6dmr348435811cf.17.1761571847765;
        Mon, 27 Oct 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxmrtPppf/+owHCkx0AjMgN9OBqs2zLqs2+SSWeaytTVGUaHm8qCALLSko1kZT3wz56Y32Sg==
X-Received: by 2002:a05:622a:4c8:b0:4e8:b88a:c6d7 with SMTP id d75a77b69052e-4e8b88aca6dmr348433731cf.17.1761571845947;
        Mon, 27 Oct 2025 06:30:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f7444bsm2344459e87.85.2025.10.27.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:45 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:30:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
 <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OPsqHCaB c=1 sm=1 tr=0 ts=68ff740a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dXhcXtSbZMlcZ2ZPzDcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ImYfrPCM7J2NS1WwyYmVI2eLzCtyIz33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX/HlkdHG+DuY1
 f/3YVME95vjl5mxESYLXZ76msv72qbm8K7rkQk8lW5b26qgBfP+yZvyMv77YEumdBbjmptm3Mlh
 CNLDtSeRey3N9aQvgOmQm5np/QMmGwUafV/dTvyRGMwO0BpjQuL6fhtR9cp1XEMS297+9AGg8W1
 MeAhPwi0hyHXkz+LhsNtfj/KmW7yTwGKACG+DGQbUXhyThBxPQdZ77p4LPmtcwytAltm3r3wEbV
 9mjv3MSNpouygaGL/dexrwHOZiBnUOAJQsR+hn02m2mSTes4r9DvY215KMSNXWQCJm2GlzQTWUj
 R7MS7aEYI2BJfdnHthPIctqupVUVmNFwKqDfK1+56pmzq4k2VURqEKgNc00ONew27jOb9pXkWIY
 q3w9WSw3boCaBIxq3rLFNzHxll2+nw==
X-Proofpoint-ORIG-GUID: ImYfrPCM7J2NS1WwyYmVI2eLzCtyIz33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270125

On Fri, Oct 24, 2025 at 02:10:29PM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > In the subject: DSI, not DSi
> OK will note.
> 
>  
> > > 
> > > Add DSI PHY for Kaanapali.
> > 
> > Why?
> 
> DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
> But some register change make it imcompatible with previous version(SM8750).

It's either "no significant difference" or "register change make it
incompatible". You can't say both.

> 
> I will give this reason in my next patch.
> 
> Thanks
> Yuanjie.
> 

-- 
With best wishes
Dmitry

