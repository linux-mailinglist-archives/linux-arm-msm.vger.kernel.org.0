Return-Path: <linux-arm-msm+bounces-79315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD9C17F85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1EC634F04AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE482E3B16;
	Wed, 29 Oct 2025 02:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6ampo+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHbo/FUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719D2DF152
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703250; cv=none; b=L8HYdnHTZxtE2JNbf7FZ0cwCnieMj/yE3sHDfDYhkzZw+Hi1+hspXVFzqUJ5CmOdGvYQuC9qJx7iGrped/DBap2muKDtNGKPDZH7Y4uATAgUJqmTg+IIYihZRm/K/j/5+gXrBaIUS3OcGvWdkqcZDu1tEDUpQnXmRW/1qQYPKr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703250; c=relaxed/simple;
	bh=ORk45Fmwwx/X9/mAhkBQbv8lX0CZ9y4oamP3jmflmgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4obQfYPIGmSbanvLahQ4sHRHl9FEx8CXC/X3FYeSy+vLJLlkHTskDDM5Yg8oqqKV8ZUCLJi3Vcqq5+2L/jiS/W8cJvNfsOG7U6xHyYNXxSpo1d+jnDOqn9VHc8IXRUe4cL5b+wQ8v0uE0oHDHwYvFdJfOl6nQmEYX4Qg4OVAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6ampo+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHbo/FUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlOqH2554348
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5bzOXYFwaaf6ef1nwwsvGpFG
	6gZ9ZAmal1F522J4MMQ=; b=R6ampo+ZFvsBAF4jHDCSWRHW7XLMIkAVCsvkw3Vx
	p/jWr9sS9uwLn0sW7C9FfQ0CZhMTV5Dnj7NqWLW4dQF7z1p1eYFMy4mhEXcoJLzM
	HZIqEJLYa6ucI8zD4TSrN1K8Ez/JTIwUdGPxKa+97IShOaZkHRkB1KEbBZhYfnFr
	6eyZufooWZkvbWXf83vTJY7577i44wN5xPwlKnKcY85rd9NkkuYu2gX7SqMhn/WV
	rCicL0c4myCD05l3IF/1eR16s+xR8LHX3YZ7X0rYTbIFOSy6p6akQwkuJjamOevL
	nxpHbqoQGzbXAn9q42tl/JH17MI4LfxCiqcST6J99euOWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10ttf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:00:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8a3f828c9bdso776978885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761703247; x=1762308047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bzOXYFwaaf6ef1nwwsvGpFG6gZ9ZAmal1F522J4MMQ=;
        b=OHbo/FUtMgEWj0s0UAtPnVLG2GDHFw2cdZvRu/88IETV+3NLTman5+G4Ss+EfkG7/D
         uFniWmMCiSK9WjnwhTS6+ihmX+4O1FXYnjPDGnKpYIiwqwvYC97s//QXMaQ4zV838aUB
         Xlt4nJebDp6EiL1BonFo9x6Lo0dzliHqYbUHtpjff7cFvp9rVC0cDyNZXn/3tDL4fD0j
         HLCBigADdmmSDM+EHTtiW9uatcHfTEhole8ofaGYRh9NxvOR4CwE9YGb0JvpK1BJkPcW
         hpYTRXc1OGgeabmwTUYLQAkBGPcboTNFFB/WXrEfAxG3w9M5FXK17iloNFAZ2VLxMMEL
         uXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761703247; x=1762308047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bzOXYFwaaf6ef1nwwsvGpFG6gZ9ZAmal1F522J4MMQ=;
        b=cBBJCsApz5hogDwlxUciiO2L4jjUHI1u0PdLK5kFNn6e10DmxH9ozM5wqFskvF2l8s
         h52V6an7Pkwt72XCXNWOKFD13sYFp3gLVdLJhL78AMN8MOPuNfivSHRHNGnzapZlvaYx
         vdO2kQpFGxc04EKjMsbJYZski/KPXPJdpsC0qC8h+HgLMQEzpgbfeGYCQHg79yrJPA18
         1HqGdEhSYnR32bCBLGMIqrNPJ/h3taoi5x+oW4XxnSGztVC1rer8C4kbMyActqiHGA68
         Y0CNweMjVBlAlbr8YE76/UMVvl4PsQ4T3MgbRIbKIM+S2PAjzViQ990lzDRI9G+x19x7
         A4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWtWMQQO5PPF7WbZFZfh9QZcSnJGw4s6Lcb01NvY4r8m2/w42oftD0VhQAN6G/p+ObeoJsuqi2UsjNFhhho@vger.kernel.org
X-Gm-Message-State: AOJu0YysKmIwr3mOrloJ+x7hcikZHFKUKS9US5O91pTPTJH8PyX7Jzhm
	u0pthfQueIQE43hp/x+VeGBM697T+cJ8aEj0Nu1iP0at+U6Cey1ltcEremzEnhQmFLan8fALPqh
	yguBUnZyp/UcrWZS0aOUGBm7SfeZZhTgKXVRiXW7NFoZ2aCogx0STHMydP7xtgVMwvgI8
X-Gm-Gg: ASbGncudI7/AAkg6wg/l4vdVyAd+aREB/2IA0tYvA/icojlkgu8mPSg/l06g1x7hv2d
	Fu+Z5Fwb+qD1lpyXgVse0xUxtO9rv44XmNoJw3r2VosYzI7DrrP2tkiil5asc4R8T8Ng4dXQSOV
	Fxx5X9uv1soW4navQt1AcqAXH1CUMuVKD+qxEKJr6OoSANS/mrGgl6HCLjr8CXlrpbGKImOgFt3
	de/xSenEaaBWDfg6HCAw6GFIez8LAuf3+0yC/bo6bGCeO3SYyZu1Y5mT7PYxJz59qRwMUn/A9KG
	B1CzNKwbCu+A3xzAT/pyFDFlHsxcPdeMtI1OVrIwvPXaA2tv9R0A2u06O1FjMReczwFimHPN6Ef
	H2Ra1GcKxus80nEWkfsnG3wGahjf8ZcFnxK63a4jVCj5kDNXrFLKzHkMkdyhUg5Nq
X-Received: by 2002:a05:620a:4610:b0:89f:9693:2522 with SMTP id af79cd13be357-8a8ef62221amr176130085a.73.1761703247205;
        Tue, 28 Oct 2025 19:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRJWEWBjcsXXkAu9QGAiqjDf7yt8PDhra8aQ88qxBQFgifGl7DRhLvxMb2Y2wrCbtbr5g8rw==
X-Received: by 2002:a05:620a:4610:b0:89f:9693:2522 with SMTP id af79cd13be357-8a8ef62221amr176124585a.73.1761703246623;
        Tue, 28 Oct 2025 19:00:46 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f24cd592bsm964396885a.18.2025.10.28.19.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:00:46 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:00:34 +0800
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
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <aQF1Qp6Lmru2oHC7@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
 <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
 <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxMyBTYWx0ZWRfX4FuCt0/k46x3
 YzTvJe/SFpE5UJ1Q1Lfq35botno1iyoNH7zCo7B5LIE41ex/s0f4F8sMYNhiiQsmA8HNV51gsIS
 ghhHNus3S+CrYeUtj/H67FeTbluYYBYu/7nxevw9F3W5aqS/MLd0m2WWQr2iLJVPBe3kEXFtweg
 KBFfJm6S3ETBWeYYuaRQHFg+Ri6KYq67nMVHHOE7nP1UiBBr6Q5YqEqizoZuNiXWHa4UDIqjbQK
 20ccB+QvcMrLMbvEdciHAUlawLr8HleOi2dHJaRtqgChOoyJWMCJUjBjBIX7Ozj8FNzEr+1/KD2
 KfVQvNW0nhcqQXLzB5kOQt4hgJv8ZBcHtH+BBJpM+vs4BTul0L+xwcifx+IXk26noF7irnNMKoS
 X9nlKQHqUT6Xtj1h7NiJv5cmP9/hFA==
X-Proofpoint-ORIG-GUID: okikG87n5VPWs2g1t5N4UeqQPF88FNvo
X-Authority-Analysis: v=2.4 cv=EKULElZC c=1 sm=1 tr=0 ts=69017550 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7IK9lZAqeo-zbWUCvDwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: okikG87n5VPWs2g1t5N4UeqQPF88FNvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290013

On Mon, Oct 27, 2025 at 03:30:43PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 02:10:29PM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > In the subject: DSI, not DSi
> > OK will note.
> > 
> >  
> > > > 
> > > > Add DSI PHY for Kaanapali.
> > > 
> > > Why?
> > 
> > DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
> > But some register change make it imcompatible with previous version(SM8750).
> 
> It's either "no significant difference" or "register change make it
> incompatible". You can't say both.
Sure, will optimize commit message.

Thanks,
Yuanjie
 
> > 
> > I will give this reason in my next patch.
> > 
> > Thanks
> > Yuanjie.
> > 
> 
> -- 
> With best wishes
> Dmitry

