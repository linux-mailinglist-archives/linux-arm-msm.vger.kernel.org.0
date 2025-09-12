Return-Path: <linux-arm-msm+bounces-73332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6EB54D65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 974E8188BC8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8037B2DF130;
	Fri, 12 Sep 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6BIixRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22E2750FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679047; cv=none; b=gujINs0JpRS0ku9C/VHjqaRXhSj4DkOQMI17lxqDlTWZqw43vZ4+LjGgRXiPY1fD/iGrO5iomnwKWlOC53X73iFRkKI90zT0/zR6VY5E82e1mW+fARwNpOPdlRkVHGxqTOy+9NjPoATSbw60XaWJ0BEC1+gdztm4kqnkhfOy+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679047; c=relaxed/simple;
	bh=xXwLkLYFnottH0uj1XMiPgvWdFijfaxg7v0hh7NI1jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmTSrWQddWGuTwP/E7HPNg/VuyxOTb49KCECFD5dPpaEHIOXJbbUGVI3VjA5Pflgdg2K/gXRC0xTYeH/t9GbMy7Ottt6HwWIm3RC7kJbhgSuKwRttmm5Wj/xuZ0vmZ1AiZnTv5wqBgqwcdfWQ34CSCSTga05xUuajTBKtSkOA04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6BIixRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fGsm019755
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NnyrkzB4u18LRqNkoWf0ndPR
	ZH6XykQ2rOusGiQJecA=; b=U6BIixRYSgDlGbrcDBKVqlzqS0Af7/HksXpssARb
	muet9XY088mhCTEqPh29mMbqImu6KpSkYJyT1M5W1PnfW5x0pyJ1xvO/ij2kaSij
	k7xs0/2yWBcoGM5nT+T0uV5hgcZP6sMqHhS1BS2b+6r7c9E3bUA/fYtOem2Cp5+W
	qv4IJzRS2bBURYLzjn0TdzSiy8E/VfkXj4l+gjCeugU8PJICmsV8ybck56LqVTes
	a2U74zfl5vjhG564d2Q0mF1nHmbB/OyAxLzeewXIVYtYN88dHS3RcNZpWhsLUUzQ
	YQjn7FJJzjznjTLVls6ig44K5RUMIuX/tMX96W3dDe/onw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t38808k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:10:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f290579aso41892101cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679044; x=1758283844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnyrkzB4u18LRqNkoWf0ndPRZH6XykQ2rOusGiQJecA=;
        b=Qt/fASSy+ovnlanJ7JGuKBhX010F+iEYSyI2RG7rKbPc6F18szilh8iJKUSkDTA+Rr
         Ef7CG7Hk/JKoaeoU+qaumrDbOjIzeLBR0pXZc5LSmjsvrjhitNSH+DeigGLGTosFRGhF
         8tEbEQaMkgo3PKGDOfcRp5yGa9kVRBxNUXiOuyCUIabnnSRwd1hc/etwA0nuQqMG75Fe
         0ZtnxtCFAMLCuY63B2XGDeZspIOUWxorJNCg6meeHUR5R+7IopYTD1oMTFZSolSc1Ztk
         pd8aB/B9zdyglkaAirC6Iw99SCMGbr+0qbPo9HAFSbNyP0n1qVrMlVnlxMZaeZOWf1s1
         U3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUyTVd2VALaxhjTCz2T2bhDz1esn5DGIAYin9ac+O5d51k5oo0OT6yBpTe+n5JBAdgDGA7gDCPWllCS/nNL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1+aFPNsKU6M6ld4oLbuBklP6kl/TN3PsmP1VwPan1BcUPX2H
	3CyrrPq84q8DZQuU8+2BK1Yi67i14MRaISEejIGPc38SC98gZfzWNz6rBycdRLUGeJ1tRQ13DrD
	61YGhpMRFk7/4PzUneEbope9aPyI2z/EWFCh3CVnsaZXkpMCQym89+DORBEkiTVwi15F8
X-Gm-Gg: ASbGnctDjTAdFzI4FSHU8mh+6ieoIRMtky9w0N1UbqSVJ9QYHiBRzYSylKV6ygzC2he
	jXEM1VyEV0kibheIZZ02GA8wwzJx4mvtdPAM1fZb999VnMXd+huWTd3CHif+WyJrktWrrvxsbQu
	lWK4eISgsYJx1KmlJ5HrRpn/uuzygQu8rc5dcWO9FPfHbPmrjtXADN2soPQx/NWqXiHVQuBkO2H
	G5axBoZZ6SflRiJ2vWp69tF2TJ12A7xc7MJtzieudfQUMx0gsdLNaGC2FsfY3f9N/31eXYUBuhc
	Gwl66DojnI7tVR25v3ZMLlL7SssBxxHzdi5qzLU7xdmg7DelVHJvYrgM0d7SwFjyaBadLeItI7J
	m541FYzIuO0MLxeNUfZlSwxV9uQ+xeQMmqs+B5/xT2VsVV+mOBEPs
X-Received: by 2002:a05:622a:a17:b0:4b3:4640:13f3 with SMTP id d75a77b69052e-4b77cf98445mr37107181cf.7.1757679043749;
        Fri, 12 Sep 2025 05:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2hXwtWFU78DBNvsjwVtqD2w0onEhQqn5H+I5mFQLCVEOiGDGwbwcAr1yHapP4m9rqMpxtw==
X-Received: by 2002:a05:622a:a17:b0:4b3:4640:13f3 with SMTP id d75a77b69052e-4b77cf98445mr37106281cf.7.1757679043091;
        Fri, 12 Sep 2025 05:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65a32f66sm1080568e87.138.2025.09.12.05.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:10:42 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:10:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9OSD49dgvNP-TUP-goCDhOqbmIqMYwKz
X-Proofpoint-GUID: 9OSD49dgvNP-TUP-goCDhOqbmIqMYwKz
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c40dc5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AUIyt3r8poIyOMLCWoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX0VSn034SL0KX
 LWC1CMeqOSKDY5JQNlpbpONT6CIk1fJPno0nQ+HBvgxJ1OAPKUkq7i/nR0/GbpQRyM+pCQ0tcoD
 BwBd4sViZRrKi3ZJHutAlXhfam34Xbsc31qtbPHQKsOO9wtOdatQGg1waf3FSlzM6rut16GMH5/
 Ed742BBPcv08Mzr59RaMldhuZtk40v3orGvb2B/71iCnlsQ3FiXOBA5vOZSH1MFahJS8QPXGyEY
 os3uC75yyGjsI7kqn9e6mACU7dgSOnq4bRqRliguwdt+Cf3MF6TWzJV0e3Ux26Zi6hQDa+mgDOp
 PvdIzdfVHV558H70WBiGz0mTPjU32e+jQHGN7v2m66eRU6LIpaXrkczoWPgP39V8wnSlc+hSW5S
 yP4nM8j+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> >> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >> SM6150 shares the same configuration as SM8350, its hardware capabilities
> >> differ about HBR3. Explicitly listing it ensures clarity and avoids
> >> potential issues if SM8350 support evolves in the future.
> > The controller is exactly the same as the one present on SM8150. HBR3 is
> > a property of the PHY.
> 
> 
> Ok, will update commit msg.

Please red my response again. What does it says to you wrt bindings?


-- 
With best wishes
Dmitry

