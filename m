Return-Path: <linux-arm-msm+bounces-67154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9AB1610D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF2D17182E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA8B29A300;
	Wed, 30 Jul 2025 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCRsIt/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D61298CC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880894; cv=none; b=MX45XIKGu/i2USMlMIXxAjmpD3Qm6WK0GHK867hFKhAIRvV5gWbzt05yXw6ywiZF/LSNmkdwM16TkHx/JFAshg7US1Xx1HK4Cs8yX/nt5FJgax2tOCI/o3bJVQDPQhrqkI2u3fV/f7Y8s6mwDZbxki+5l4RONa66GmPP1YFtQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880894; c=relaxed/simple;
	bh=utYzFVLTObmPxGSlUuHvJFOCt7DjeX6wik+KDLimSyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sL6C412ac3Y5GLLdVJw2RLQMdOhuHX9xm5s3KiFyNJ8vBKG1e0VIQLfSo5gB6ToCdwebq5HcL4XkKmp8qaZfq6vRRI5ikmnsaq9mlTk+RVEr851mcsZHu4gZY4GCWGeJhIxfab7MJpEOtJTUpLihhaor+Xrm+s42WjlvnUId6mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCRsIt/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbBKs024555
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCoCba3PaUuakN2dddfrr36z
	ZpUe2mMvVXboTEOCYoE=; b=FCRsIt/uDiAJa5REs5cKwMn7O0aF9XVlsTRTnpWG
	BpY6aAHc1kYOI9RLjM5cUn1Jk0cUj0rBH+tkINWMZfcSbRcCjuWRG/O1cUTK+86a
	1gMqfJo9mJWrfwS2UoBjsvAX6XvLGTW9wHXClWeb5d6Pmu3mMuWuIuB3436cAEeh
	QpGb2A2kH0Mu24U3jVuNJm7YwlN4ijxfWHJrnLTfOR2iFMoCYAtvyWHFnEQamMcb
	7WjXnK3fzagFO7XMgCK1397GX31vpWJYDv4TRpBf/8SyQAQX3oRYbyzVIN0R/R33
	fUgfCC3pxGczAfZ0r/YDyiaUwgUPNvHVdd7M/b/rXBkWvQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1akrhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:08:11 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-615b153aa54so1040265eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880891; x=1754485691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCoCba3PaUuakN2dddfrr36zZpUe2mMvVXboTEOCYoE=;
        b=IsnCm9qYL4o6ITxzHWcnrDMMyhAI4SaV8IX2yPV0PWbxJMUehIm5ndsTxxW7/pN9p9
         4tBBOGIxIjS9xLTU4Z4w2NeS9vG7W2fWpwGbjrfGKhEa6fDhyGsvGbPAD827MRBCnNbA
         pbT4rfS9pFLaqPECSMP3oelTwjBAgSj6LbxG8V1uEyBF3lQNAqGelRPgO/x38coERFHn
         rAohCQ63TXFnlsSZtUrkcB3vlNp9cgXF1y/aSrvyRS097sAoeFlBNK8QpReEdGtFJWqI
         DbTyEzPFHLgMcjFEhfr5nZBmOyFRq3BNINnDZbENMZs8Px4yWvQbgVzKwE8V47xsNQIm
         nXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj1AXW6wHZAGAa4Xi9eRTAAxjl65hW7IgWXsm4nakiPXMEeuIVBq2hHgSkQ0h5HzbX3GXJq8cBZL0ghuXp@vger.kernel.org
X-Gm-Message-State: AOJu0Yym41zySXNYa2n1qOjVK4FShX9axE3Rh62ZwFveH+lubZx9b6/1
	XzIsAlR5vBXRt962ZDjs/3E76wjy/sgIs908kBKnG2/ZJ7cz7VCb3ypzuYNzwBEumBSXgJuKbzn
	bhEbkpMRo+AtwwA6YWTzdAlKBmb0v+0P3PwUpZD0TsksCBoY3YvjIo+VscuGpJNHexsK6
X-Gm-Gg: ASbGncuPYcUO2d5g3n1cHCQnBVR1TYJ4CrUGQoWEwJDWORtu3CxIw2HC0fd7VZb8CJx
	wRPeclsG8krT3GqsYJ3wds6PTvuK536hAr0lXSUv9lK5CdQo0o1gHQDxyJXdGjjm/UF1okg0ULv
	1ObliQ5hy9KpDNX2JMJ+FV/9ALlcfWP5uhbPIciTfYNGOJ0kN2tAQaEDbFmr2HKjiRlvFs4VTbR
	YCGbSQWQYx3Aoby375YDztO4hTK6ZTb9F0DgpfDJWv3ctwoOjhL5Iht/jFdWVNcnrjL/2ffwxgr
	bxI6s8t+XaGU2Lk4hgevUeXfPv+wvUvDxyrD2NQBYjfYLDVhjGcZkoYEPZQfXCFFC15Nx/NeeHE
	fFBBXFCcVNahyeej4b+TNVfVH/rn1HriZMl0dai9boz4AC75lUsWN
X-Received: by 2002:a05:6808:509e:b0:40d:75bd:69d1 with SMTP id 5614622812f47-431994bf2b8mr2318504b6e.7.1753880890775;
        Wed, 30 Jul 2025 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEreN+EZPMsIb55Cu4XOPM4kHBtS5bQnw9CIRJxKiJf+cZor2FwqzapYkfyd+2FT5moObUVmA==
X-Received: by 2002:a05:6808:509e:b0:40d:75bd:69d1 with SMTP id 5614622812f47-431994bf2b8mr2318193b6e.7.1753880887445;
        Wed, 30 Jul 2025 06:08:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b79c32a10sm497780e87.106.2025.07.30.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 06:08:05 -0700 (PDT)
Date: Wed, 30 Jul 2025 16:08:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, lumag@kernel.org,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI
 registers
Message-ID: <nxayk52mhisyipdsbf5rykuynpg45mk5y5ykqxh76vzyxb6exy@h3qwqdgviumb>
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
 <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -IwlTz5oqK14kPHOElnTUUXdeoRwB16r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NCBTYWx0ZWRfXz4BeV/PY0vSd
 p5+EW2rDMLAxy/Pr0s8+Lf1acqgdCDtTDgmDITzXjD5Gun0GXHNdZxx2CRfR5mhxXZ2xq0ItAVs
 uvM1eP9FJNntYhRb50eC1J9d13bWtWBpyVcAJErmCnEyMFo5KpWO+gkVDYeOqvc0278IUEhLrpk
 7db11QC7ZKfa47se+iAbJExjJaiiGYn3ITlPymg3wf3Laxgt7pVd1+EnuPenOAdkx/XjXKhDETc
 CBk4gvb7FUK5nNZ2Uo/SFAtXiFD/mIcSmSmnfc6YKCH10vNZ11MSSjvS5TulCgBWJV28NtrXNQP
 ab+RYMIMPrLxeg8TTQAcxS5R5z4k45C+IgLnOq0tqKc1ctiY59y8oDRCghGwAQIWHYerVSNxU7P
 ngAaHl9LbvYwc5bVwM1Q/65jGPAtSbAmoDzniZ6Tj7UxNaxhpxmY4JKZZo7TOKIWldLjxlpD
X-Proofpoint-GUID: -IwlTz5oqK14kPHOElnTUUXdeoRwB16r
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688a193b cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=-gjihLczPamKDhiB-eEA:9
 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=912 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300094

On Wed, Jul 30, 2025 at 02:45:13PM +0200, Konrad Dybcio wrote:
> On 7/30/25 2:39 PM, Ayushi Makhija wrote:
> > Currently, the high bitfield of certain DSI registers
> > do not align with the configuration of the SWI registers
> > description. This can lead to wrong programming these DSI
> > registers, for example for 4k resloution where H_TOTAL is
> > taking 13 bits but software is programming only 12 bits
> > because of the incorrect bitmask for H_TOTAL bitfeild,
> > this is causing DSI FIFO errors. To resolve this issue,
> > increase the high bitfield of the DSI registers from 12 bits
> > to 16 bits in dsi.xml to match the SWI register configuration.
> > 
> > Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> > index 501ffc585a9f..c7a7b633d747 100644
> > --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> > +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> > @@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >  		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
> >  	</reg32>
> >  	<reg32 offset="0x00020" name="ACTIVE_H">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00024" name="ACTIVE_V">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00028" name="TOTAL">
> > -		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
> > -		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
> > +		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
> > +		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">
> 
> FWIW looks like at least on 8280, ACTIVE_VSYNC_HPOS offset = 0x38
> and HPOS doesn't exist

All registers here are shifted by 0x4 for historical and practical
reasons.

-- 
With best wishes
Dmitry

