Return-Path: <linux-arm-msm+bounces-79454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F2C1A7CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D50A567498
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476F6357A22;
	Wed, 29 Oct 2025 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxI/3Mu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2WtPw4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C913491C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741335; cv=none; b=EEEUKkXRBTpkofw0FRDnDQTewC8f6wlkLZcdf2OSbt9zzD1klXEEjf71Uipgb6nCizYXl/Xs+nyrz1f1VMDJeiy9nPeaDk3HRG90LC8wXCEd+H5SLzRezXDvGhDsGiGFQttn9d26chhnW3xL59Wr9Pa4hJSK+bfCGaI4F+pjT1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741335; c=relaxed/simple;
	bh=8fFke6c0149lgV+lkfFHo2TkiBcnS7I6YDsk8uwDra4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exDWdjGL5mmD22QQSRzZENAr7o6vEISG5U8Urpk19l/myRcujYmM9C1EO333rV/QmNRwKnOKShocGCn/iQ6kidegbnkpiJG6FTaG4aRU7yEaVF6b/pMviQSYQzz3Qb8taKiziV6h4HVSiyJUm1EkRa/nmvRdmtjQMxctRMJ0Iis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxI/3Mu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2WtPw4e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBe9lM434953
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zsNFzolgSKQC2bBoDSwKUuUH
	4xZt2AoJCzH7vtyB6vA=; b=HxI/3Mu1imbJSjFZxfP9X/PST34HR+EnlaSiLN96
	4W+mFcnYBfVb/wI/Xa2LSjgxJSLxhIPy6i4Yupox8wY4UiBlDYwkdT25FHOPQ38p
	QhsIcc4uXG+IhR/dCDe2zlufLR+p4r/Qe7kwkmAEtfTVWUFg0941hRkt+r61TRbm
	G/vjPeMKwVNYsu15hF/VqlAzrJOTwi/H4Gj4ss9qS5t4Qn99KK955zZ5CtiIfy1p
	MSKNxlXEz7I0nHlPIzian4Bza1K13gFQtHmz/8rZzYnaKc5hkKyQsrLS9CJgGK0Q
	70hiHjvSoi0d+midtFxfXx2PegS9PUpbmFUdvLZYMr+0hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3j8jr4ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:35:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e884663b25so184638111cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761741331; x=1762346131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zsNFzolgSKQC2bBoDSwKUuUH4xZt2AoJCzH7vtyB6vA=;
        b=L2WtPw4eogZlnY0aWCqU+rvCp7mca0pBh2finvGp9beyLrztoecv2J5WAXr2lPj/H0
         oATQKlmzW2wL7AC+ANHT2EUfWa06hXUhql0GrveZmKY+V7p0HQQgSJxEov4l94wuk8Uy
         dNsWRFhThX69rHJNXkt8Hf9QgSlw51B5rdgxM5r0nOPWO8cStffzxK6SROmhcd8/FLgp
         C4XVVfLH7LiKeyuE7xkIQ4ny0F9wMWVMexGTtDwPYd2+wP2ND4pI2fOlmL5fDHBuqslN
         ZnhkvAWQF3SI0jnV13zwBHKisFqTlcERNL5J/zd4W86eZLK5oDVVHRL/XsrY8cNFr6f+
         vNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741331; x=1762346131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsNFzolgSKQC2bBoDSwKUuUH4xZt2AoJCzH7vtyB6vA=;
        b=H0+DVtOFye+bp+oFBGKDXpxDeItmzo3l1uWfnX8HRVG21nlXsW0TimP3d4p65tPP6b
         bCrCO/23qwsx9EZBdcu5+3Zgxsr/RQezeJrmtRrGvjCc6ZEhNKfkgNRLlHDI7d2DyhgX
         4lEGnkc2rA4hchWtt801IL5rQdNecPUqZSvQBvhdwItJn7brpIFuqMQoAT9TETiD1pXW
         eStg16dFGek6fGCfLciL0EA+Ei5SXODTT6NbOYhatonhxhg0EEG3IVld51GnAEFGxGg4
         YXm8ABo8342X3rCvG47ttm5083mu1muS64oaX85xDgqcQl2Spt3af086mWcmKmpU3JxN
         48CA==
X-Forwarded-Encrypted: i=1; AJvYcCVH7fHc75woUmGORpu3Sxr5Fna8vbdjX2bg+yUirrtQTUOouXOS80oaZ0+pjYx3lPP+wX4Fx0BBwwU5fhyf@vger.kernel.org
X-Gm-Message-State: AOJu0YwRWspGYVEKeQ6TWdGwp67udlIacovcIMEz7Pzdg/0DM6s5YWDL
	vGbAVHJnQWVKzKIM4G+kxzN+P+BNSi7a6QWfJFOFiI4yHf5tYNu3LgBCORsGEbO83UgFZ/1qbIK
	EK2W6QVYIXXoYvJ/QPcWP1hZYQ43JjCAzbV9FbC5f2HP1nEFgrpBFMJkQS8GjzPXMH9ih
X-Gm-Gg: ASbGncvXoYqU1339Rliy6OpCSeUSxpOKGti4LTfiN2bCOtMxo77VdOdj5jVKWOepc3M
	l5r2TQz1/bfoW2ybM28lUjoHGlWn4wXsvOOa5vU5SEJhO9GppAcoMu70S/OuoafZDwJ9TuNaXYR
	C6xc8rZXj2MOZ3Lld8Jy1ECkAJ2qjTpwWzImntsScQ+LUmn+iPWaFHxPY82/UGT8pBFoRBqpJG0
	Q4O7hV7p0jnPc28CttQw4OeJTZ/i5NzNxeVsWmsyvZFzU20Y0+3m6nJe6y+Q/m344WBCiu5bIhr
	tFJKzjxVpCuSfGMonwUQpR/UeEg20nXsFXDuYjHUGter9nWbhgWz4YMEO4xZUFjTBPPEMv4CLYS
	6T+00ozmUEcx5jq+v4TRffeUe6/zDTxgMVOKGU7lvnj3IDkoTsVzcfk3g3dCtaooIPpZXayCBZ7
	U+JFk+01UNkPPW
X-Received: by 2002:ac8:7d4c:0:b0:4e8:a9f6:360 with SMTP id d75a77b69052e-4ed15c9afdcmr29484291cf.70.1761741330786;
        Wed, 29 Oct 2025 05:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJGkujipYQz/E6q183ffjavTVh1UaVtvW1PPo8+MkU/PVJgSAz9nur4gBHFIa/6cE2OuOjA==
X-Received: by 2002:ac8:7d4c:0:b0:4e8:a9f6:360 with SMTP id d75a77b69052e-4ed15c9afdcmr29483741cf.70.1761741330083;
        Wed, 29 Oct 2025 05:35:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ba4sm3794759e87.22.2025.10.29.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:35:28 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:35:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
Message-ID: <dnup7gntevuioadecmslch42ye7j7ioamoqq2www2ytmz4ymws@tvka6m2e3js6>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <c83079bd-ebd2-49fc-ab62-1fba08276cc4@oss.qualcomm.com>
 <51f10d4e-3962-4c20-9d5f-afd0ac3f598e@oss.qualcomm.com>
 <289d000a-b142-46cf-ad15-07ab8ed377c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <289d000a-b142-46cf-ad15-07ab8ed377c9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA5NSBTYWx0ZWRfXzGjDpqIk+rwK
 0nvzuovU9bXhyGpbO5CTNI35lX8+FGYq0CdrPhbXhhrIZ6zOmc8p94vne4mMY1QO/yQJrQP37NE
 NpXDA68lvXR+IGPM4ErZzV1DoUDaH7RHb5o5RRITauVf0YpWYhWL+U6mrN9ckUC94mafhKIK6K9
 WEEaIJ8LUt39Fb6WEmG2S6LN1S8lVQ2AiWIsY2bg2S/CVt92FyfNv6ePKplj/MkTFU4mzSfBWoJ
 6xceAM+A952u1PncMgPQTZTdKgdFfF2qobiXAhvRovWzSESennmCfLTWZ8ghSCXwYbtjzLusxxU
 9khuGUOTXwKpWzJ9indOS1B8kQQkp2XYIKHlqYouvFaAbh1nsBZpQhutYaf2VzVCphXut3YdZ0S
 IEycNdgboqdnmLrjrlG9g8ojnTDaWw==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=69020a13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KyuLurKa1yEd-JaHsGgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: q_NLQ5KWD5orzWV30NZxCBmb09hBHcnM
X-Proofpoint-GUID: q_NLQ5KWD5orzWV30NZxCBmb09hBHcnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290095

On Wed, Oct 29, 2025 at 10:36:45AM +0100, Konrad Dybcio wrote:
> On 10/29/25 10:35 AM, Dmitry Baryshkov wrote:
> > On 29/10/2025 11:33, Konrad Dybcio wrote:
> >> On 10/28/25 9:59 PM, Dmitry Baryshkov wrote:
> >>> Historically all devices manually defined GPU zap-shader node in their
> >>> board DT files. This practice is frowned upon. Add the zap-shader node
> >>> on all platforms, define a label for it and use the label in order to
> >>> patch the node with the firmware name.
> >>
> >> I'm not sure this is much of an improvement, since at the end of the
> >> series, boards still have a &gpu { zap-shader {} } section, with the
> >> inner one not being referred to through a label, which reduces
> >> duplication in the single LoC used to assign memory-region, but
> >> doesn't e.g. prevent typos in the zap-shader node name
> > 
> > By the end of the series the boards don't have zap-shader{}. They use &gpu_zap_shader { firmware-name = "something" ; };
> 
> /me wipes glasses
> 
> You're right, I skipped over the last patch

R-B ?

-- 
With best wishes
Dmitry

