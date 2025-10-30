Return-Path: <linux-arm-msm+bounces-79742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7399C21AB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929901894AF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8347375740;
	Thu, 30 Oct 2025 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C75Z2qjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWOQ8fUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D06375733
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847340; cv=none; b=b6BGbRajq9LhO/8E8O2zI9mZDV651f8oelf6O+WcYJC9v/+97dE77uVHTX52uyabmLL1dK3qPydEnNRamIzFcyKyZ7fzzSiSrhQMjziVQaCXsKhDwZ24ohqP+/3q5jApYH7CGPvje9B4BR9Yh56b0fJHUcSKAVrNLVMeW8eOgDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847340; c=relaxed/simple;
	bh=ebYkUjTkInC6W+kEnq2zOzMCHyxPH/pnXbtdqaHTyik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSkoco/l/PZzbiAYU3pQPw0Emtf/PdWFiVzPncb/tg7tEayirEBuZq1+VYfsvNH4epd3YDGSHtB575CFh6aZml49xDYZfluuand/ByaZ48OY190nu4Sn4VnWbl2OzgvB9Yg83TMc6mnHWLJ/sWLoCJKqAhjQBmmZr254LirGNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C75Z2qjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWOQ8fUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFjITt1693583
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RheHgo5pVuvCVdocn9ENbXAi
	PLiZAdlGRP3oP5F0h2E=; b=C75Z2qjUoMsGdoIq+At1x0n8FOS3Hrzy2R6drmju
	eNqHssKq+SuqRZeOGqSu57BLljrDLuBxYjeKsmD0dFqwlNSvzfdkfX8W9+tdbsEW
	ouK6mQDYttHoYvDvx0yx7T3sSLLXPhplvhCrPcKWuIhLLFPYjt7fpZrFHVepawsB
	omVIbrXJeqvvdJ4BV0H683ffQ1TuNJmdIoSNdmeBJcoDatyfP6lx+w47fZ76RrLI
	Hhs1GZA4zelYxuuM3xs7oS92TSNgIUWtXzVbrbI/9P+HKz/oP9nNcYPLRcNrPRk1
	Vkhc9RM9nf0ocH9ooR3sK5flM4VC/Q18+0v1vVohntiouQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv37jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:02:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-556a28eb409so2704706e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761847337; x=1762452137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RheHgo5pVuvCVdocn9ENbXAiPLiZAdlGRP3oP5F0h2E=;
        b=UWOQ8fUn17GSmkAOubSCYYtBMjoywiltdlQbiEikLAJHKJIS5m/HUx3qP1tD5ogqyv
         QYr0FK58f8D+Z7boS2RFYCnhmRY6DTlOjJIhO4dcTQtCd8Nly9IBGP+oN2uJEjNHin4J
         BHCE/arwZ8+Jglu+DB+aWdrZ3txzYSmedzxweYUBV2rQCOVk2DPjjH7rhbvAkOv/bFRN
         7jPhz83pWUlQiPj5dJQrOjCPRCBzMZBLGxE86YQ8AG+Mhm9b3BANIK7eKxcPOIk/PeXR
         fW1usY+xMuNg+gBT/LOt1S3kxPGHXE7CDZ2xMxqe9YT++spI1fKar28p6Bdahm6b5CVv
         G0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847337; x=1762452137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RheHgo5pVuvCVdocn9ENbXAiPLiZAdlGRP3oP5F0h2E=;
        b=a6e4hu+yjTqJDoZiQV20y0Ne67m5Sxkazj77s304sYJxKuTn1MtemRkP3zk248q/6X
         t62BFl+cGmeoFPHc7PT/cISg5bqKBPqv1G9PZz7S2hKVJbtgd7t/mkgnzpusockVgEbV
         5KRqG6D6GKF7KF37PprQuGvim7Q613GYY93SK9u1cpN1hf4MtE9Esnph7g/eJAs3Yl2G
         cRQr3lvpFYa3UGEGcGWGSMNYta43zp4JyCZWI6/N6vPSx1wSGQbZQ3WEWwdguUB/gfIh
         fsoW+il0q+oXxMw9U3+wHJaXxMB990cY6XToTtRNc28wYmix0zBk2boqjM7C93MIdNwa
         rViA==
X-Forwarded-Encrypted: i=1; AJvYcCURmPcYyXF0xmVB9F/vlr8zuoy0xSTmx6Tfr5FOYaxbDKnLDBumH7IsSoUYpoj5C7wdRsCBOTLe5xJKMDWk@vger.kernel.org
X-Gm-Message-State: AOJu0YykifH0/457WDTjPLVEkKP13x0BTen3kDGzaW6H9LBD448ubQ/2
	EQxvWJQk3AU6BJ2rEXlOJ3x6deBLFvUTpqM4oRszhkjSNUR8JVgHuUZ5eARrVK+JnkUpkZ81f1t
	Tb6udj9t6gkjwvtliwXjHkNbV4xF54id7RUn9tNNqKqSQ4UA7dzKzABEjxva5pkiKtRbT
X-Gm-Gg: ASbGncsI2RKj+Vzj5BK6UfTWSHwGzxd2/nrBbZmAYcIfLERPDvlmG/449Vx4x6pPxYb
	tnXieTJg83EEo1yt4eGT4hft69kA/J9Oe8Xelgg//86kDOeFTHd2XQuixM5q305cQc+PpVg9zX4
	X2nBjzf/vEiQloW8di47/1joifO3kp8SJpWEMFYyuRr6Y0IyGFIdVgNpBiJuDrZcRrTksB8lrNo
	o74kHf4oZ64+UfSeT+ieOUE1Gi7m9NjumdLN6vxfKo5FPv3nS7t1qS7aiU692RD3DrSURMHJEXO
	ahBQc395RSQekWBe7NyGTdk5Hbnnk6peIUmkrddKWiupXJsUUpN4MAzODPBSmoGGw+nmy9tmPtj
	0uFHgZvlewJbp6NVKfaWifUyBZFkDUZurhtIfkJOMTgQFI6Kyya8J3yC4V01wC4hMHKcarSMZnA
	==
X-Received: by 2002:a05:6122:1b8f:b0:541:bf69:17ac with SMTP id 71dfb90a1353d-5593e47e35cmr384143e0c.16.1761847336554;
        Thu, 30 Oct 2025 11:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTUInpRsTJOc8SKFIzEahxJdQTKBRduSeEFhBOHHqnWR1cf+EOntfXk2b22CcXF3blRRpO5Q==
X-Received: by 2002:a05:6122:1b8f:b0:541:bf69:17ac with SMTP id 71dfb90a1353d-5593e47e35cmr384016e0c.16.1761847335762;
        Thu, 30 Oct 2025 11:02:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee092282sm44025471fa.5.2025.10.30.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:02:15 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:02:13 +0200
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: t8HwfxIUnsgX4kH6GCOklRpQdud_z6ax
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6903a82a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4LvRZMndKBpg9nUHPPEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: t8HwfxIUnsgX4kH6GCOklRpQdud_z6ax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MCBTYWx0ZWRfX3Nk2fqyEx85s
 awq+7lvWe0tf4a35ze/Yn08gCj8VfUJgwGUpkux9tRWanT0B3ag1WOYVlscFoPjvN9c3Ws90aC1
 n0PXa5PYvW2kyrURw/VHd5ma9UPcRqnwd0ZcJCS6sPw4mFU0k7uDJ6bm0Ln/VIksrKoZ3q1Zzos
 8zcS7sIZX+7j6Glh7++YV3hf0ciZUed8HEuP7r8WdWR+nQEF2L8KroYPwyxZKA2JaXXH6KncYJ8
 O5B65XljJU5Ydvg0Sk++a9fvtVH8Jx7i6kQGpszRa6LUZJe7aBIe+3M4H2ZAKlH+hJ+f/GTJUkd
 XNMU+c3mcSvrEab9C7vkXH3Um2qFLLDJ93Rl9xedsuc4NZawl0Ewv6Cjk3y37I/ULJ1zHKEZaLk
 2jvdFSLiI4cEBSSlcasGykrWyK5fCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300150

On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > 
> > > > > DPU version 13 introduces changes to the interrupt register
> > > > > layout. Update the driver to support these modifications for
> > > > > proper interrupt handling.
> > > > 
> > > > So... Previous patch enabled support for the platform and it has been
> > > > using wrong registers for interrupts? I think that's broken.
> > > 
> > > I want to express DPU 13 has different INTF register address, so need to add new
> > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > 
> > Make sure that patches are structured logically. You can not enable
> > support for the hardware if the interrupts are not (yet) handled.
> 
> Kaanapali Dpu interrupts: 
> INTR_IDX_VSYNC,
> INTR_IDX_PINGPONG,
> INTR_IDX_UNDERRUN,
> INTR_IDX_CTL_START,
> INTR_IDX_RDPTR,
> INTR_IDX_WB_DONE,
> 
> are handled by irq handler, so here enable dpu_intr_set_13xx. 

You have enabled DPU 13 in the previous commit. And only now you are
adding support for interrupt registers on DPU 13.x. No, that's not good.

-- 
With best wishes
Dmitry

