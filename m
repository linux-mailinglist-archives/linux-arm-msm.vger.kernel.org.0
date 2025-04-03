Return-Path: <linux-arm-msm+bounces-53125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DACA7A84D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 18:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C3D162CC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 16:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769152512C9;
	Thu,  3 Apr 2025 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNU+qUAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60B250C15
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699518; cv=none; b=P37Rzdi6eEZOABRl0nNYoELJsJxI43Llhcl+ePvCpNWAeym7UpOxOQtaN/cwiKR3a6q/F44VkSMlTu3Byu8Kkf+yv+O9IkRXp39FhR5qGYW9RwObtNpSQjns+3zEdiAMSaswK18CbdjrQPnDpCpOlzvs4O+sA99ScVkfUXnYiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699518; c=relaxed/simple;
	bh=0NqP9DX0HIFTHJ5NTqQ8NX8tz7pAXi+EU0H/s3W11A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPeaM27n+MtwEMHTAF/L7PapbnpBx723vxbOPcq6Isi4eQg6cJa1wvuQNJktpZlJpaJon5UrpwVcuMnSwyg+oJGbzB8BBnBinSWybMdy9biKUa2/r9szmHqHN5/zVr0AGYghHpCHS3BB3SlQ5vI4N3Zm8Xe8NtxCsad2HMz92yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNU+qUAW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533FV6Ke020889
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 16:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2dgaYl8vSEyVZKfiY5f6DaHX
	ABEmfyq9Tw+8HuhnSmA=; b=WNU+qUAWNmje9omgjXxYfLmJQw/XEVK54lJ5+htd
	TLOmOcIDoOmVxS3SgmBPWSw3mTm8NEerfMeAQtSzfQrnVjX/DNYOcy4JxTrP2x4l
	8EDKsBLLbpWUH1dY/yQr+lC/acpEfWIl8rT52C0cSnMFsb1iWyM8R8viDwwcVs3j
	9g8jDIRNCZ/9ZK1Hemo7Ogr8PQKFrDHinY/ovo8cIxrxu+76goS7IukHc05YZikW
	9M4PeeISRA3FNt68j6rncXGnyz4pmsbnc8w+aycMuX8vjJBjvyhpMC9C0ibHHpeh
	vgNXAyJFinY2jg/lDquunC09vi1zp77HBrBSTObvm1Ed4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapwa6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 16:58:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ba3b91b1so223708985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 09:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699515; x=1744304315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dgaYl8vSEyVZKfiY5f6DaHXABEmfyq9Tw+8HuhnSmA=;
        b=wnFZw9gyCS7vwcXbaJH2olK7PgBWCzUzVcpDLwWM8OHDOgqf/yShowwNYJFNNk3c2s
         Et2PzTJdjl8d1TrLxnDmHXeuqzBvg+WOl3uF671HAlHXW483qctvIhaB1+KCCTVVc8CM
         qW1njxrRGAWUwtLVrq2SV1tAeJHriwem0g7uIHqzM0wHvSboCfP79Ztft2e9eFBTWIUT
         vrubYMKvpwZAD+XciervgT17qVKRNJ6cLVU+T6zLmxyQiXijgj9sAYS25rbJiGmUfXI4
         66kBOEJKQ643BFY6irncdWq+YVXIguX42Gc26FPeYLCFPxw1MkaHDhYIlaeQYUTG9gI8
         /5mA==
X-Forwarded-Encrypted: i=1; AJvYcCXPU2xcMI1D/dMuWiKwY4yO4kDYHDGNCwbSZg0IuRCvODsT7ijbmkLrJIePbkm33BXenM6/M3H3vwxcEGOi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6X4LOuwFuuHD6idgugutFjfRUuu47rzoS6DGHNdRcmuGjCUCy
	r6n8doYW0r6dOCWi9AgDyBtpjQVpOm3JKIBcFCG0NRHeVwL7JaITBl4jXsndAkhlqOQ48GlTtK8
	wjwGwTMk/JZNl/sQ4tklejIKXZFKyFRPtX6uED3VER+0a2FhWezT9VqZJoWS94xBx
X-Gm-Gg: ASbGncvB1s6py7JdJt/SCCwDzDPbFdpnxHdvteCJL5J//7Uf6FniB7oexO7d94KWhqo
	r3Ft/XzhBN/H9zh8H0yOkRvzdV4ckDw5WcFKiYvElfgGPGKxEWPwPefM19HB2IE0uxHzbEFf6Va
	P8lFhLZ2qFJTI+MHXYHYJOPW3Dra1TvMBigk7e2GlwU4oJwepiGe8VXalxJ7prFLAFHGb/aBCAi
	FyYzj3fz0Q7t5lMrFF1fap2zhbq3sgTk5pVw626ew9SN+y/eQxn6SfXXUbLFVYiB+vRMSVrMMnJ
	do0z3ESnGRSiyHjnTIYZYlL5LMsDya7581YHB6vGv/SsT2Y9/XhPteX6zfIMa3fjR2vM/n8jecv
	wWdU=
X-Received: by 2002:a05:620a:bc9:b0:7c0:a9ee:e6c1 with SMTP id af79cd13be357-7c76c97dd00mr614498485a.7.1743699514703;
        Thu, 03 Apr 2025 09:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0uBZIG3jHzySQ8GZoSAjqLW25E9Q0leBX85z1dcbzKDboOpsSrNL7fP8dDkKIc7LiUKdHBw==
X-Received: by 2002:a05:620a:bc9:b0:7c0:a9ee:e6c1 with SMTP id af79cd13be357-7c76c97dd00mr614494685a.7.1743699514351;
        Thu, 03 Apr 2025 09:58:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c25sm204051e87.115.2025.04.03.09.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:58:32 -0700 (PDT)
Date: Thu, 3 Apr 2025 19:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Message-ID: <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67eebe3c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ICs8RiL17kISZ0AAbrgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ixtBN9Pm0MhkKXhIwu6nXD8xbu3x_7yE
X-Proofpoint-GUID: ixtBN9Pm0MhkKXhIwu6nXD8xbu3x_7yE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030085

On Wed, Mar 05, 2025 at 08:49:37AM +0530, Vikash Garodia wrote:
> 
> On 3/4/2025 6:37 PM, Bryan O'Donoghue wrote:
> > This series is a re-up of Konrad's original venus series for sc8280xp and
> > sm8350.Why this is enabled on venus driver ? Why not iris driver ? This needs an
> explanation on was this even tried to bring up on iris driver.
> 
> How different is this from sm8250 which is already enabled on iris driver ?

As far as I remember, SM8250 support in Iris did not reach
feature-parity yet. So in my opinion it is fine to add new platforms to
the Venus driver, that will later migrate to the Iris driver.

Otherwise users of SC8280XP either have to use external patchsets (like
this one) or a non-full-featured driver (and still possibly external
patchsets, I didn't check if these two platforms can use
qcom,sm8250-venus as a fallback compat string).

Bryan, Konrad, in my opinion, let's get these patches merged :-)

> 
> > Link: https://lore.kernel.org/all/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/
> > 
> > The main obstacle to merging that series at the time was the longstanding
> > but invalid usage of "video-encoder" and "video-decoder" which is a
> > driver level configuration option not a description of hardware.
> > 
> > Following on from that discussion a backwards compatible means of
> > statically selecting transcoder mode was upstreamed
> > 
> > commit: 687bfbba5a1c ("media: venus: Add support for static video encoder/decoder declarations")
> > 
> > Reworking this series from Konrad to incorporate this simple change
> > 

-- 
With best wishes
Dmitry

