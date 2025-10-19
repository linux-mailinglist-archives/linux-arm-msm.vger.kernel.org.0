Return-Path: <linux-arm-msm+bounces-77930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B7BEE980
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840713ADFE6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1B11A316E;
	Sun, 19 Oct 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A60wrfVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6A82EC0A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889753; cv=none; b=iF5+S9MR24uArRx4oKNzl/TmsbhEjSuhX8F129uXMkfdSRoq2wre8Plp9uPpijWZR1h6vU7w/YCVbMjtlZTIPtQk5OXBhdsM5A6VZt9V253+X+UkNZSNbz2dYQWk8nK7VduT02c/VPfCY3EAhG4tSN+a6BHvbmUSwpT3HgllQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889753; c=relaxed/simple;
	bh=+xf9X2P4LBJXHBq+W5F0WMYPtUAcqU/5yUdWFR8RWg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8vIIxWyi5AqAojSUjhOgyTR8eYnVGbDu99q87/MngPRcxPD/nKewONmvy+KpxRKOFCweMukZCZNdFUDuj2KmREd/rI6fsuq7VR28zUUpGYrtJmMnBV1z/aL017mFiMidv/VYVH4nDfsRFynIfrmNU9hQv41i7y+JTchj/M4O9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A60wrfVL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JFrkEB029612
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yrSgxSLSjug2hqzstf5hGIeQ
	dvScIsYA26L3fjhfwUQ=; b=A60wrfVL9zZXiJo1IpYz5nSiXDhJggSOBHOpZkcc
	tlEyseTYqS/ksvdbaDIM4xqXhH0AI8SNEg5poSQa6MnO0U3gkv0/wHZ+LW401cjl
	TbpqwHrALb3oAEU3qn8lDhxRWU6UjE4aA0EP7S7HhCQ95vm0ShrjGSygZnkV8DfV
	u/1b75DmFFnSSN7r4zNkl5rIOQexFxo47+aLiFttYBRZrGcB7lugIdY6BdlEwmIm
	LVu9DQpsYbPjUFdm8qtASQ8ptQKYjFfAIVun/PdmA3OcU46mVZNAH6SlHqa/kAyy
	xkh0MQo9VfIfM5eqvPM/87ayI4rlCiexYTCfrN7WlcCNqQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pavm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:02:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54bcbbc35d1so182822e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889749; x=1761494549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrSgxSLSjug2hqzstf5hGIeQdvScIsYA26L3fjhfwUQ=;
        b=vw1bnSDN8PWfFYoMvW2WFlQgrkUthjo55Ub077PYEVD2L/svNCCnciDFX7C+OeeqrK
         cVaJQmAwwixTcHA+kEQu+mRF60IABgi+nu7+tPHUPrzcG8BTR7EdLdkhnaj1Js2Fo2CO
         uOdh26iVO/srBsZ0zCocciPZIFaVzswl5W5u6NGRTPufcbqZ0x/SpyTRZSmFhSMRxtec
         prV/o42UlXCJ4NjQ4EqnwvMPFmntxWQcjlso4gcoIbfsSaysi+dNOenOTdbUc5wlO04O
         CIH7oTTjpB7DtjLZU+XGx8osvrewYLZZARC7003Bqu/qdubpBxhtOYFAz7FUEZkb0dWg
         /Dow==
X-Forwarded-Encrypted: i=1; AJvYcCXauQYjlZc4lCbu9JmTP24aiM7JSFkJrTbxCAThxX8eYTKdazltIGeHlcyGL5ma23e7VKLXYCLn80ND/cL0@vger.kernel.org
X-Gm-Message-State: AOJu0YxvXE/lsVZB9tcB1yQJ4MQGo8aQE/GWd7GCFwS1/4Td+I0jGjqL
	Xx2nufI5WdmI6jgfbhayaH2+fQTVHpWYRGB1UjRS1iK9P2K6mMGc3XghPhWhiQ1cMl9lKuK9gAg
	hMLkCiy5Q4VCJap2GxZuNCe+8frztenhepnzdJqh/Xnr54f1pE58QGOEqP4GgXGSFcahD
X-Gm-Gg: ASbGncvpAI3exd6/AuWfMBWBU5wM/EwVJlExuNgHh8XRL2rCpGGN0y9EUzYMkEu0HSU
	dPMX7/5m/BTdwrSIoXsnMYpeACzH8d72Vzi18jPejOEYlOCdhSiMbWbB8op4MEXUH0iGcMXKiNu
	jx8hBc62DG9eNqx/Ech75m1xvcMcd1nAAKEX6hvD7+Gjc+GsrDY+bpXGTAsoZH7TGnMsU/dh6hD
	N2dHkT+em7vApnm4HbEmmeSa/TP8twVEg72MK+I9g1QGPa05ufdeYBntpaOrFFh81roIhHa9KNB
	2XqpWrq/krscYMDDDUsVoUN1ZC4E0n9Kofdv9GLT0M1r6UKZyO2CcOCICi7e46Txc2SxhzwSS5V
	qzI8ykFa+fE9WXpkdOncA0cuxwEL+tKvv8Esmqm64pYr+AIslRztz3K+m66tIVadWpA1GW2JtI5
	TqxkNrLbXU4aw=
X-Received: by 2002:a05:6122:3d05:b0:54a:8cfe:193e with SMTP id 71dfb90a1353d-5564ee5fc31mr2779097e0c.5.1760889749466;
        Sun, 19 Oct 2025 09:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX12e9u2jTwAw/ohWphMrO/Z/+CwpFfiWoBiRqZoykAWDjj50XtmQqV9+4tCn2aAkVSr9v8A==
X-Received: by 2002:a05:6122:3d05:b0:54a:8cfe:193e with SMTP id 71dfb90a1353d-5564ee5fc31mr2779046e0c.5.1760889748963;
        Sun, 19 Oct 2025 09:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9578a51sm14051151fa.42.2025.10.19.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:02:27 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:02:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
Message-ID: <aruuyvtzi2notuxdoi6mk45y3zybu7dpttpteqrektszkhh4hw@uipxhhy5nar4>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX7hA0R0vDreEL
 6NUZ5kLZDsd25m3e+jcuG7Y7kr1/wMLQsi3WCPxFYtXOgkQw1emwEWo3AWE71kqBzeYBOZ48Oi2
 k0W+hRaEJmWypiLO1J7qAKfNug6rux59X2nr5tcmA2NDGWFng0uMtzjNAtgzC2Sd4vEicmo89jV
 7/iOwFQ19UhftbjXJTP3XpAQzYM5aJ5c3RkqNLQwfUBtoXBmJl9EUtQ4EnzIJ7GeL9f/kbZ20K1
 MNQCjhY10sS+zGRyv+DXA2YHqJ9GIDbML7nAP2laDDsu2KAdLZ3McwqVGFBHq/NgV4JhQN5Ntlr
 5/F2YGG9ex5Q738XCA4kSQPf6ym5R3TkxPETVKpMRD4cRvMctes7iAb6gb0mo0QSnjwOuvH+mqG
 lkVM+U6nwnmjY6SZ8Y0yu217YZY14Q==
X-Proofpoint-GUID: tzFEXk4WA6yYfLUSqm6iSWEjcG1BWzbs
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f50b96 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jqVs4JzIjkIIVyEy1LMA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: tzFEXk4WA6yYfLUSqm6iSWEjcG1BWzbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Wed, Oct 15, 2025 at 09:53:19AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 113 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

