Return-Path: <linux-arm-msm+bounces-79551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A413C1E236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79F504E38B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 02:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BB632AABE;
	Thu, 30 Oct 2025 02:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqLa576G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cg3GdP8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92632AAB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791610; cv=none; b=lSFUXXJgyJtoWBKGveXiWjtGLQB9urvtWGPvV9hKkJwTfVrKCakj/ekek4HW8T2HUr0SjAFlB8/ewotuocrVhpVtaaK4Spey/R+G76gxECVMVYsJ1baWqGExrdvBdvN15J4De1wGrSzVmrMiwa0PPCuj+20dLo6jhdcDtTsOeFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791610; c=relaxed/simple;
	bh=fXw7zBhHIr5vfTBHJdVciK57oiNhDP1bmyB8vN6GywI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgdZn13TTgx0b7c/PFJw1olmPtZoNmT3ommUyoqYkR/4ZOfB//bVTgor0YBIH6CH8ti6KafCsapybu3Pi+q8b9OtiOBpeh9a1i9juXYTScFfrZVHd4KjgumAS3SP6VXEHraK1WypkhTnCiHiqDBQMYQb2+rGD/ltMYUC0TBgcWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqLa576G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cg3GdP8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TMKFKk569233
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ntHK9vxhminoglXJfxZX7o01
	Uc8LpengHLNaWyUigT0=; b=KqLa576GQs2Sl92ylUs7z3iLC7DxRQ83BJQ3wO5T
	CMRGAlL/E5pXBXJdFvDZ61vloRvIKLWoOomhGALMgT4ibA/PZP43eStYj9YqYmct
	cqpesaP4pBoc574NM8I/JNjaSbFm/DTRTWJjCpcM9ZkGVyEN2+H5EpV6CAuVJSHT
	kfDI+XI7Fh5iqsP8AVgRuZKoCJr84QjeI1YPWqTPCeHvjcDCCtkmoYE8H4zWFsKS
	U4vIEB3hqq6TUgP3pyXnigJ8NyJPfV+wvMO42Jj3gkAgAG3i/pkj8EPue2KKwKxv
	aK5e6s2znwbo0VsbvyarSvbk7BYiRK9H4KDCtpFr7Xrc0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bj74v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:33:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso11680921cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761791606; x=1762396406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntHK9vxhminoglXJfxZX7o01Uc8LpengHLNaWyUigT0=;
        b=cg3GdP8lA3nf7cYguD4YII3FV1NoxtoiXAjpD/oN1KF+u2iU9ofe5qY4P0DzBdppDW
         UsUbykfgX6/hxzssJJpypQjz8Po5TYN4T0i77+c6RJoJKQHLo4Na81XtcIG0tF0sqRTl
         3cbSGLrRg4IGm5nXVoe5C3fuv39+FCvLO3I3EEItdJzjJyB5X0orIl7d9hhISE7WyY9T
         QadIpIuva2cYZtCkHTsn3WEUYjSZPAj+7hsF1nS6uoQuELQMg56hZxx/E24Zo2wiZoSP
         QRBUCNCXu9nn/hOshiAgX/GIxwCehhzwhiORRDrMxFlIaphzXn7l1sWTJsAWdjDHui65
         2xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761791606; x=1762396406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntHK9vxhminoglXJfxZX7o01Uc8LpengHLNaWyUigT0=;
        b=Xy3Jm3MUW0GEbtMt0UbSl+C8VREUwNIzEd1WrhYlQO+T8GueN/ItanNPIRTJtzQOCK
         BchdkX4vO+y1xPG1Pu1tbyeD6Uk1vg/Sam5KUYWKsL385WOSBy7AfhkMX2hzVIg3r/JG
         g0tCSEt4ArhFQ8dcPZOTHOPbRvG6Ke4AgrIq6xKMrWyiT7v6fCLiVob85Fwq0+0zwrZx
         2iUc1v3p1l9JiUAoGCx2rpW+xvsaTwlWVR0Zw2WUcU+TNsMFfKOJhfdNY2DSFCQKefiG
         +NBP9hUAxRAB4wjCNQjDarr5a7lTFLLtGhnxZSJSFe7K+Y/m4tuL6a36oji7IgPCtV8R
         bfhg==
X-Forwarded-Encrypted: i=1; AJvYcCVWxjrv5PFOvhcnsrFzkJgKOK0lseVSEYZCQOGk2KQlFvYeeYDgkKNrCxbf5QqiC1qAZJjdE/RGjecDoVkw@vger.kernel.org
X-Gm-Message-State: AOJu0YyO5rxNLkDg5/vcImzo2FxG1znvsmV8PKfAGjOJsJgmMoGnjsw+
	gTjTpJcdqm3UAjSGvWZQWD8ynRPB8iiSZL7TpYIfbMfGBoefYrQdEXGifL6dh8okJB8m9DBcFoZ
	osMgJpupobVVrgEAvM4aENVenE/L3rvvYzz/BtyGXELG8tIX6hetWBwDq9HoMwxhS2JJ8
X-Gm-Gg: ASbGncuWmhY1FYh5VU1wWW+qTwFHnLuRdloE+PNqdwTRhEzvFTN1GaexAK7PJz2a+aP
	vZEYXMk0rEdcfq+nWx4j7KCsGSJsY7vvexkfZPO1MWjo/1zcLO++XG+U25fe50/KkRnPIjk373k
	6skQSTlJqSfOwZUA06sHCG7GnwoVZ7w8EO6NSv4ohBgUyCFzMeBLfxLK5UUvWXIvkshEVEs/K1e
	LWFyEfM8pd1wq6nWkGAJ5p4W/0CwuMgmFYmlnpb9nyOP+/FnyiYbjtXfHDzxo989naxycfsEfQZ
	/MB146IdK+Sa2zqq7xerBOuGSDWhhhXBO4udMRw0hbf4Mw6qfVT+IZLYNGT0ElbHhXaVMfLiHJd
	7BTkoYoAHgvVSDgLLqUvGKwYcVNd6nT/prvZNaJ9hI5+i2H/dwIWXCKE/swPn
X-Received: by 2002:ac8:5acc:0:b0:4ec:f9a1:17bc with SMTP id d75a77b69052e-4ed15bb1f61mr53768171cf.5.1761791605765;
        Wed, 29 Oct 2025 19:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH62Xw8UczlTHR5mIibSKtnyEtT1gApL84hMtZ++sQ4IY5il5n+hfMOijT0cJsyTI5gYuh+Ew==
X-Received: by 2002:ac8:5acc:0:b0:4ec:f9a1:17bc with SMTP id d75a77b69052e-4ed15bb1f61mr53767891cf.5.1761791605240;
        Wed, 29 Oct 2025 19:33:25 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37b51c6sm103962621cf.5.2025.10.29.19.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:33:24 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:33:12 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
X-Proofpoint-ORIG-GUID: WaiVz_p3MIEf0W5RYcTe6HsORvDJhCG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxOSBTYWx0ZWRfX3SQG6Nl1ZbwP
 NijuM9IU3308smaaa3N5k2pNwkO/8kXsiE7Ac2CpBCdS9KYEtmjpkj8zTioRzSeTsE9SDc7M0Bs
 GCfcNrANvpUJeS7dwPn0rQABiz5ii3ipFG06qMmIpqvJ80SJVmaVthvSO7iKz36LVolLeJAIQqr
 jFlJNlxgLxa/AJU+g8cEpWKVR7wbC/tG+3kFZwnMt4TcOm1f122bcROMGQ0y4ddaum1JRTRRrt+
 LqotMJN3qu6uLh6Y6zznB4oXBcwYJm1NLVQ565YNDdO4AK9uLzYTq9ZqHaJU8H+HOhfR34/D3vB
 +boX6c/dlAXAqWFNS33dwz6k7XG0LpUQjFtuWR7fIVcTlJWPXfBWJgPP2BHIBRElPN/nwwWH2I2
 LQP1y8eGFGX5HV2ux/uiQ3eRURR7ww==
X-Proofpoint-GUID: WaiVz_p3MIEf0W5RYcTe6HsORvDJhCG1
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=6902ce76 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n00Os9SHjSpe-nC2C8wA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300019

On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2025 03:37, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>
> >>> Build the NT37801 DSI panel driver as module.
> >>>
> >>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >> provided certificate of origin, then you provide certificate of origin
> >> and send it to list?
> >>
> >> Please correct.
> > 
> > All the display patches were jointly developed by Yongxing and me.
> > So every patch 
> 
> 
> So two people were working on this absolutely trivial defconfig change?
> I have troubles believing this.
I want to say these patches I am first author and yongxing give me support, so
I think yongxing is second author.

I want to express my gratitude for Yongxing's support in every patch, so I included
both our names in the sign-off for each one.

However, if my intention causes any trouble for maintainer, I can remove Yongxing's
sign-off from this patch.
 
Thanks,
Yuanjie

> Best regards,
> Krzysztof

