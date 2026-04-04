Return-Path: <linux-arm-msm+bounces-101824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eZw4OqCY0Wm1LgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 01:02:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322B39CCEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 01:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181D5300C003
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 23:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF41349B1F;
	Sat,  4 Apr 2026 23:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8amIfe6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0UmfD9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E778A21FF2A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 23:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775343774; cv=none; b=U+vz5sQhzoiHu4k1QTQbISRhMoWNX+8FEDBtCO8Loge2y5dCpekcPDS2ys+P5GkjLU/ztu+JNruStC8TT46AeFtygI2jcCs2GFjGlvogoIGqQyfMPmXf1i39SjIR/YMZGmdrj+pyY750wZjBRJA2A5R43YHiCmvXT+nPZphTcW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775343774; c=relaxed/simple;
	bh=coPFnu8a2n+qWRhI4LWkWpce4vEalRAqJGiGW8z4FK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKl6uFnN86LVb8sl50NocxylfT39ge3zn9oU0SajkFg1jkjkQJAKkCoF/5HYj4skmBVbEHf/Bxn+OS45nPodBYznRqYZejdQZ21qmxNrMhvUwSM5FK6+uUrQ/kh+cQ9xILon5l4y13oVkmE6PAFVY4lwJgIs7SlCoghX7pA1J2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8amIfe6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0UmfD9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342XanR3989112
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 23:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hIFgpkquzAjeQNC3t8wsfdrd
	AKli3ZjO8/bY/XiA0Qg=; b=E8amIfe6I+w9GvLabkg2HvU8/xKOpvHxLB6ziRtD
	cri3RBPcJ5cFUOidi/JH1OL5+rG2gCC+P5w+K3ls5RyHtzvYiD2WzrifhLRWUD+9
	rNZVo7SvA/s6MzkPDfcM/w+DzoWbWG3ZxnLt+PIOiDHllOKvEvViRIkR5wlQaOwy
	ET3N/8FMEj1zjJSCxnBeOtWnxAc2TzfejBXZM5tNLxkqHdsyE6mQ7GshkqCm644O
	sYT46U/Uq621fFOfNeRDqOrOLFAmNlqb2SMGkN9ttlPn+Zlg/0ubnNB2LVBTDrER
	H5jRG/8DoOm0JBIGFhrPS1Tmdq2gQxmQW/kaGRC/qM7z1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhpdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 23:02:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso64358281cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775343771; x=1775948571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIFgpkquzAjeQNC3t8wsfdrdAKli3ZjO8/bY/XiA0Qg=;
        b=e0UmfD9dFmBEY6hQflakwsWWEuVhRnaZx10r9V0NbbIBwMY/8737WMvKLEyO5IBVHo
         WBf7kHe9bi5q8ZWNyW2tU4VZrAX+9hra8cvn53YOUoVCip6mPCZ+weoljYS5p7V2uTlw
         ais9qkmAWLh3AT1eob4oDHVrljCUNaDd8Ur3BOIJjratbInm7bmlPVnNuY1WxK4uM3PV
         VAjTB4fM25y063jw9FhPzas8sqgKKTXFcT1d4czAecq+wpCarGmxfMvphOiDd7JhH941
         1mLVfmVhnv/4hxE7GPUHiKRrTnfP+HsMcma4KEi9c0HQIf58TvS8b0OF2zwkQv6NXoTU
         tQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775343771; x=1775948571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIFgpkquzAjeQNC3t8wsfdrdAKli3ZjO8/bY/XiA0Qg=;
        b=RN8+qAt/mfO0y1Nj1ocROWJq3yb5bxkA4MuwEJFedNf4zRIsKfHXJqajeMcWu7mDo+
         MsNYFf65aHXAY26v1s3a/KkQpLP3TJB8a2L+U7ITwT0NkywEz+El9/rGYLvhCwt9H0RT
         SFPrZh3AVtxld8iSlkEvhw0KVkwDZ0sCDSzHGT4caClaNdzEB4SQ04Tpb60UxIk7eNdi
         AwiCb2xIdaNaMHsEivxUpID68/FWs9ECXASEmQ7FjZxa/bF4murjyH/GEBztKKTrD1zg
         FKsp+hCBe3r1TJP2Svzaj0dwo3tS0ccrC95eFMsTrwGxWoFS8fQfj4KetKHWE1I2HkQp
         OU5w==
X-Forwarded-Encrypted: i=1; AJvYcCXVey2wkeIccdLxk/LS8tflZ2UUztb1SNoEye6mPszbE8aD/q5kdPPCXULYXaC7b4VK7d9o84ed6APXCWtD@vger.kernel.org
X-Gm-Message-State: AOJu0YwdiccmmYBHFDLrTsGsA9QpEYMOO+xBJxoPt0EOwfJons8DTkdQ
	ErFlCzOK8icnXejDW3Iu12fYaSH537HjGihUOUIWVZ1EmpRsgNCguf7kz8QXbhH6Cc+y1uzzaGH
	t9guNLyJh41sz7FCA1cvM2dOOuMj3oaj0Y6y/u/DjviCw6utbQq2d1A1zrjplWUofG8Fd
X-Gm-Gg: AeBDiesp5RH4ttAznoGRlCnHQxjkd3RAUMGvlgrUKUPCpkscP7CGq1X6lrYMY5I8GIQ
	QYD76gfOhBlDmJV6FbqlRc0oi0p4lBL6fWHzVytfseB7ENG8NVHWR/cVdYclJruoyqfS5atN8PV
	a5o5O6Yhi8stS4BW5bCZj7SWiqpYrLeLyp5NdsynfDujvJLANK6pc+y7YStkSunbQm3RbfE3uzl
	pCGfad3Xh6IkluF7GTGmnwxtVnzPzkAhUSyoWszv6RCxgi1DiT2l1tf5Q1g4QeT7LtnUkrs8/GK
	W09U1T09xtEodgHoL0x+4CWRNTTv76gRkhaxaG19V4O9r+mNzexdqXpQo9JlAle4B6z8+40GEH/
	rUfQAUxEfPF9fUk2SMGHEEyHeawVtLfODSEgOJaxMGfHjM/phXPfK5tLdzbNVFPZ1FusIflnrpL
	+XSXeKfe2D9bGia3hftnKluparu2Gaj8zJXY0=
X-Received: by 2002:ac8:58cc:0:b0:50d:8699:ecdb with SMTP id d75a77b69052e-50d8699f5fcmr13552901cf.48.1775343771221;
        Sat, 04 Apr 2026 16:02:51 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:50d:8699:ecdb with SMTP id d75a77b69052e-50d8699f5fcmr13552411cf.48.1775343770627;
        Sat, 04 Apr 2026 16:02:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc8e0sm2417132e87.58.2026.04.04.16.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:02:48 -0700 (PDT)
Date: Sun, 5 Apr 2026 02:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Message-ID: <xujhwsk3ne2nlzs4yefb7eiscdiqa65xllu47skbdk4wgrjw4p@eicdyca5gz3w>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-1-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-1-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIyMCBTYWx0ZWRfX1+R+JYi3m+I7
 6oLpN59R8NuSGMMCV7D+5y0ke7HttyA5gl4GImg5SRP1X741s2d19nyeKfKYAM3vnKidvdw+1lc
 2/rsCiVQomHccel2k5XYKSoQap/kIV8cfnmGW1Y1u97UvFVK2pUCiP+5wZLVTQWZJ2ADfPAeWXk
 qPSUmMUq+r9qZQ1L7x8rq5Uo4iAugUvXkGwsaqk4s3nyjXineC7EHdg1rCmfzy9SMJRZ4Osl2hI
 uBp3KS7atCnzXJMXJrnUXQwrFpB6i5uFbCTL4/hUbIz3LIjgFTb3lMgTbSMNYXNh5NoB1iTqcRW
 HQMcgzaSBfEjc7Jn88KBb4Z7DuNoy9uMapl2r50BYY1+3moflH+54gvmeS/pKz7REIhg7Q7nXkA
 mT9DrLXIxjZOTIMxwuk9tOEhUNWAoFQO2keUKqiMhWfXoJSMu4P0xFrFsNaFv1iIKr3VZ3mDK6r
 +AHjiPhajd/dmyTWI1A==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d1989b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=P-L8s1RTvU6d3TPFcGMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NLynqheVRkAcFX0dpDguSARO9ZoW2byK
X-Proofpoint-GUID: NLynqheVRkAcFX0dpDguSARO9ZoW2byK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040220
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101824-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7322B39CCEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:45:12PM +0200, Krzysztof Kozlowski wrote:
> DP on Qualcomm SM8650 come with nine address ranges, so describe the
> remaining ones as optional to keep ABI backwards compatible.  Driver
> also does not need them to operate correctly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

