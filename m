Return-Path: <linux-arm-msm+bounces-79322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242AC1812E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0C42347B2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737862EBBB7;
	Wed, 29 Oct 2025 02:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXWZjrTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqNFCzEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFC2EA470
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705473; cv=none; b=c05VubGxMTkEt3uSJMvfyG3nihUv6dIfm4Z3JNcN4hlsJ7OlCU/R6k0oTbAjMN6lAFJ4Uo3pdgLaPqvHKei0HePWhVhXQEjsT9vw2daQ+CnHJDREN4C0vYniGkErdiKV40y2dQyIhkNL6xM7cmlcm1dV5CrcRTqZ29c+kRM/F4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705473; c=relaxed/simple;
	bh=d6h8BwPEoEpBaR4PWqheH1siX+Dt2vQwXa52l0/ZV4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeHbLv7Be9kwYu245HKmPqPULTPrewSEl6HG1EYCCWVanbsWEj5DrwXZBk5xeFsGHSKQHGpG0v9hajP7EtRkyWsRW5sJyoPidxA9lY7X8W1ZRR25h1vKjhzB2/s4YdxBYyUPFeYhqubhqLyswtiaVOuNz2ekUg3jEfgT+19lGeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXWZjrTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqNFCzEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlNws2609642
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0MU0AfPnpKaX0wUSQTeDsGNj
	N1sxzIkts1un5DkBdeY=; b=XXWZjrTkn25TznXvh15LPt4hslGwgyTqqhgaIoo9
	g1g5zRJeHdSi0QFaO/L3QjbmehOOUxk8KtC2znoLu2m8ELsz0ZoJ+ZRJar39N853
	/l5eir0IJEUeBPSSfgp3hcyaj9CFyhRnZiTfk8T4g3fHU4IhX/IYMPOJ/uLDjc/m
	HaEt0hmAG82xW6Es1oQBJE6Z3I6j7je4GMEMCddzMq5kPx2vavfhpitjkcZrETfu
	hDMWFsX5wWyGjwaLbaa6zdCf3luotzUpnkzC+aZ65Q2TUEbWeR2zDBOEgujahb8X
	NcYh7tKE3FQdNis2yudm7dE5acfM05Tu6pxvdIkT24F6Tg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a00x94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:37:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-89e83837fadso1316052785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761705469; x=1762310269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MU0AfPnpKaX0wUSQTeDsGNjN1sxzIkts1un5DkBdeY=;
        b=hqNFCzEFfA9phW0dQ4Q5+9wpdK0bwsZIIpFU/gMeiqYAXZ2fE1BnrnWCuqCcnnhYeE
         X1SXvH3ZCiFD7yc0y6KqJThbEDT9hpC4a6tLr5LOo4P14dvyZr7Cwqd0PLSlBXpZuu60
         +zhSYtmBMyUoRvurb2vMUBN8T513GITSY008ms7QJd3uTSQWnwzZnOsAhjZPnRs8wiyU
         lfDZiEqbxOS19ENuLoET1o2XpG6jvOJ0BCM14yFRrLIrxO/9so7oQvt+ltkb3STWTVj5
         b9AK/5J6D4rD/P4TVhWFcHzj4jSyObJLMb49OFvz/0xslEnXdecyb3WHD+ronqXCvYfd
         Hlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705469; x=1762310269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MU0AfPnpKaX0wUSQTeDsGNjN1sxzIkts1un5DkBdeY=;
        b=E+KD6MEPGt2sI8JrLkyQWZuquOGtQSTdEcPsQT4edv7unZzAoCDCwvidIF8HNtXl6w
         nkuamB9NVq9A1q53UKBHM84fJ/9T4fXJDmfiWuVs1eLCaii6FALKjJ9a/XVZucu13r9a
         N9DgmBtxar5w01fD+TqvjIXyWdZ/FnOUGTpxz5cBsfUpguu4eG2FqON9zU6WUc5VXpGE
         sn8teYnbNSQlDL5rV0FhnZl4t065OisvYzQ7G6k+hICVujfXaxHw73Okt9XPVTzYoCoG
         K1ZO0zYPt3HjkoEzCQ1Ht/MVIziYlMgGH64iXMe97oR34amVO2fwBzNYDoblTaweDP17
         4qiw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ISl14TSM+JjLplSuVkj4aKcc3+/IiOuC61Rf96tgxh/Tfm84Zr2sb2uvJSD8jNEtasSGJD6udy/ghB2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDwoaokiE35/iQ2FJ00DpILOeq4A/n48ww0ywB1CYVYF+oHWA
	xAPKsSfukGI7/XsuQrxGtPy+y+adnMAPD41TmmQfkscbeLzJz3eQRbYezX2vpg40AvPQiUdv9Cn
	LFOkOTjcd7h2Ewv6EWXkzrumK0sjjivUQxDP6KGJnoEmSThVxEgfcugsZIB0GvDg1/9f6
X-Gm-Gg: ASbGnctAQA6C1ZYAwOSlC4RPLuuL2jmjazoOV9rseKlmokGQiVV2MsPbVlFwr63+7gQ
	6ZLrdMIwW6Un+T++WjVEsmFD5L+NttNeGzDyu5016aNqPYo855qh3/5oFj81wiHunZwXyzeE5DN
	mBAJ/T5/Zo7uJuoRXbSHYAMi1RY+nquXF6eizGlpJ6DARvSxLU9gzW26JcN5OdYlEDInnwhkV6V
	MgKrSzshvqLqCgFvJlB/7wcuPj7Ygw/cTfkOkbBqQSl1P27GN1YApF+dyqyJhfa4QODeA0R7Flr
	oAfKF/TN8D0c7Ig0MNSBRNRS8hp0neGH9Vsw5USbpxx2nEObymRi9EPi+u44/3JxpN8INfKap7m
	fYNuiDwHwtIrZrG75avPAL0eH/z+XEaKqVxbIVvJZ6yQm5B3tzUERs/7GVlZmUPuF
X-Received: by 2002:a05:620a:4412:b0:862:3e8d:e4ec with SMTP id af79cd13be357-8a8e6954aebmr215709985a.60.1761705469452;
        Tue, 28 Oct 2025 19:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLoBX0vUikArQtQfx9YHtcyAX45KfBodi8D7Jo3dT7imVYdDfzHcZOA7AEQgVHqJh3CLxDUg==
X-Received: by 2002:a05:620a:4412:b0:862:3e8d:e4ec with SMTP id af79cd13be357-8a8e6954aebmr215707685a.60.1761705468912;
        Tue, 28 Oct 2025 19:37:48 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f24cd5617sm963961385a.19.2025.10.28.19.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:37:48 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:37:37 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
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
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxOSBTYWx0ZWRfX8lx2wFY9v9yd
 44tMr1b7P+y98/voxWfd7CN71e0Mr14AqXN1nJuvs8Zi6QPcyl9avZble+yLLwMcijgqU4PB9wJ
 z4iNj3QlbXRyY/XtmpWblc786fRDXdCgYb+gJx9+QL8zZdF430ZFthz70wtgV7al5l35IVizGJh
 QlSLi0NnITLUWJjod+T4H2asSCYX9xYPK2miKwBfj4ZYtwUYJUItXoXFskrQ/R4emQpXsO4aaK0
 fk/zakxCVhozD4NZhv5Tm4eGU30tf7ieoLfX41+K0A7IHaob95zcaDDoyMWPcsEvHaAKqXh0RLh
 6IaklWFPlYWsNIQUphqBgQKOpAGCLyj2QHgm4sUHhuIBSdjyNhQmwz8varC8wDL/HEN3LoqAY9l
 n6u5R87wf9ZCRj3rYx0dHRo115PFxQ==
X-Proofpoint-GUID: GxTCwhObqHQqeR-ArPAaIVBXqs5QzgZp
X-Proofpoint-ORIG-GUID: GxTCwhObqHQqeR-ArPAaIVBXqs5QzgZp
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69017dfe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yK9oDwkn9_E4VEaIOE4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290019

On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Build the NT37801 DSI panel driver as module.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> provided certificate of origin, then you provide certificate of origin
> and send it to list?
> 
> Please correct.

All the display patches were jointly developed by Yongxing and me.
So every patch 
I do sign below:
 Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>


I am the author of these patches.
So author is me:
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
 
Do I need to fix this sign below in next patch:

 Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>


> Also, all other patches in this series are merged by DRM maintainers,
> while I'm supposed to merge this one. Please send it separately, once
> it's ready to be merged.
 
Sure, I will split this patch to push.

Thanks,
Yuanjie

> Thanks,
> Bjorn
> 
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 8cfb5000fa8e..537a065db11c 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> >  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
> >  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
> >  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> > +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
> >  CONFIG_DRM_DISPLAY_CONNECTOR=m
> >  CONFIG_DRM_FSL_LDB=m
> >  CONFIG_DRM_ITE_IT6263=m
> > -- 
> > 2.34.1
> > 

