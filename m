Return-Path: <linux-arm-msm+bounces-78911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A932DC0DFDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16DCA1887F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F570283FF4;
	Mon, 27 Oct 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nV6DbO+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBF23D289
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571302; cv=none; b=k4BZlRBJbYenZWyAWYRa3h8iYH97GgvTvcNAN1Y5hjjGVU4J6iMj3WZ9RghBfSwDVJrO3tz1XSAxfXfbH4S2KWigiJpsjM56mKc0Y4Y/cSQim23cnwYIDxavHVupddmhNB6aJNHkrav+m8xXoywiKQAC5XQ/wlmMOqy0OQOVSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571302; c=relaxed/simple;
	bh=Uva773iEdDpkBIyZYVwtiOdB8QTio/mSXTL2xqDIo3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbiwXx8bu5OFgw948oIQT78PZO0WZeayNn3NaDkHV21neAY0Iffp8V92UWSRtygf6C3heeGKPBX6QnFXNxhcTeob86oqR7UjXXJ/BmmoFxr2VJKDHVpM4e2+6N70WiO/VpytAwOMS4BZctrNX1A15FbmacVq9gYOCGdzCNsbwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nV6DbO+3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8KU1D853418
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rIQxrF/LR8wD4VYuDzgo4pyg
	T4/SDSgx44EBgWbrJxA=; b=nV6DbO+3V3TP7iJifABgm+p0yKf+ze7sCSnR8z4W
	+BN6EBSgDdRRkclO2PDXuygXbH34Dx4lSu/beNQirSR6yoZEvRyAsqYcaqq0PiYJ
	6KRhqhsLBQZ8h+GRrkVCFqaAWkbBc7CMiV4dPrW5U490eESJjA0/qwb2TsMGivG6
	oQxqneDieGlsqKFKokuWXfaAEaRNV1glaMSgYMV6SQJp1r+N+IBZ+VSZKXReNZNp
	rW//c0Hs7YSQz7bClrlydJx8F9Yhglv5+zMQrdHE+QZZ2uyZorQGBQs5a6zT15Lx
	MhfdyTCU3WC4zdn7UWwMjnm6RLEbYFJgwfpSWmFEgWog6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1t30t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:21:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb9e480c15so46324731cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571298; x=1762176098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIQxrF/LR8wD4VYuDzgo4pygT4/SDSgx44EBgWbrJxA=;
        b=FXvxQ89vsK1gSfw92151nCw/tFhuR/Q4S9v9/OGrfh2R9pZ0ZgjoDlULmSEsqvXBrX
         rGPyZmvqSlqMGM0eT8dPL0pnN4EGAxiI7gAQG0IfD6sugWRplOwv6yw40lUo8Gw7QAxn
         WQ05PhbS628k9pQ58IeAvDKYBYx3l6J1VOfp9KaWB1rWjXr81hwbtFriXXM5T9TStotq
         pUc4fL/dl7pIpo+o9sgFgzC1tn5fotmTUo0d/WkE1UMgsE78d2kl8eE++y63B1B74qcB
         DOackQ6i3eCY2uiMuvrjs8+gK4F6n2hcF6Iz7KzNoZxv+VS9leaa10NMjnNo7ntWqs1K
         E4CA==
X-Forwarded-Encrypted: i=1; AJvYcCUmi03bp/75xApzE2YkNHnvmXLmgUqP8OwUdUYiDV/3nXFYlpPiKhMtpdAiMRQcES9756lXWycf/0jhm6q/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1nHQ1KntBX4GaKqwS48ykhkHPZd4R24rY4asChzgsaXY3N4z
	718OAd2pyIKrqCC/cSogszCuMd4EwAMM4UPoKY70ahIL1Q2wnV4VGOn4RQROkoJvBh1Dq0cqpj4
	FvcHWR9LWlabyfNnoz2b2RW20+0Fia+cvWgZexIC1soJPQCMcFKd3EgAqWbi3M3B6EsN/
X-Gm-Gg: ASbGnctvQwuJa7KJPpuH6zNmPbv3wAOrlC5DK9VV0bu+9SXxQnTFf/qP8v9DbMOuBij
	5C9w3OmrnF55gvbLeMA2n+gCyGB/MwZIpUJebukRp+6pLqCp6Pltpa5l/ZEYUCoQqN8bi3ftxGF
	s89mRDH91DapsR5E9Kk3X13t7UlcnoaakRf2ymAJTeHDZSsAU2fySZ+0SS08ahDOhGcOFEO9Xg5
	jqw34CurukEWar/rL0QoRUHA7XxwbSQyiFYUHL/yhjItZTk2OayeDAG3QFxvZ2iDdho/sD2RKGB
	wUs1Y51HzXFbALprDHdFx4zO2VhkRSkhlLKxF8jBGQBoGM2HxUIbHDUECQJ0chh77ZiUle/EFXV
	rbm2a1sZgSD2FCWBq21XfJCUuiuFEMMug5d7pt3q40MWo6L5bVD1sc1c/WuD20NRYTMaeqIheAk
	XXf0VGB4i2WwOu
X-Received: by 2002:a05:622a:4c12:b0:4ec:f035:d60 with SMTP id d75a77b69052e-4ecf0351008mr67146071cf.5.1761571298258;
        Mon, 27 Oct 2025 06:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHsY3iHzVCLpUn7wkz6y9duilAb8cRKkxlio5523RK3buC8sPqKlAaBcxT2E6xXHVj0E4Anw==
X-Received: by 2002:a05:622a:4c12:b0:4ec:f035:d60 with SMTP id d75a77b69052e-4ecf0351008mr67143811cf.5.1761571296230;
        Mon, 27 Oct 2025 06:21:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41bf3sm2291171e87.20.2025.10.27.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:21:35 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:21:33 +0200
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
Message-ID: <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX/cjTcfgRPM6v
 qf9a+k6rhPrBmFu5qFF/uFryBakd3l2Ov359e6A83Lh3cPizMw919W24M9VzKGfxJayhv4EGUjv
 +Zd6Rz9CwwDuDofy/iGCCNmg313TD0WoCzfckK7f0Fce0wbcZMzsa4mUJC/BlpS745V2WUomn1D
 FB0ZWK2c4P9FsXch8PxN5NpR5V2D5jaZwxIdQUYH7WaiuZ3jz0M0XEwyj3EVqWSPZ2i+Swx/dwC
 R1YbSw2etBvTGsE6VOcAev2A7cwuKNB2ztGhSpokTBjKf5QxccRUYEFnhHiDRV0RQioZlR3353p
 NgK1OlvA3NhgovyjsNhZNZfVGVWGxDFQFdvVr0V9kmQxFP+KXsBPAo5Rdr31qgxLh1sO2RHQXST
 2Q41DbTLEr730RgdHhBZEh8PaR9ewA==
X-Proofpoint-GUID: HLEZ2Sz8a-Q60sstN6pHFG8KN2wzh-Tv
X-Proofpoint-ORIG-GUID: HLEZ2Sz8a-Q60sstN6pHFG8KN2wzh-Tv
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff71e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uwcRXY6SZ9cHZavlex4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270125

On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > DPU version 13 introduces changes to the interrupt register
> > > layout. Update the driver to support these modifications for
> > > proper interrupt handling.
> > 
> > So... Previous patch enabled support for the platform and it has been
> > using wrong registers for interrupts? I think that's broken.
> 
> I want to express DPU 13 has different INTF register address, so need to add new
> interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.

Make sure that patches are structured logically. You can not enable
support for the hardware if the interrupts are not (yet) handled.


-- 
With best wishes
Dmitry

