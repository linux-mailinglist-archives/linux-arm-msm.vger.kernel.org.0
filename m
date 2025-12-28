Return-Path: <linux-arm-msm+bounces-86701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CCCE0398
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 01:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2710300B2BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 00:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18A71E520A;
	Sun, 28 Dec 2025 00:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GypzUtGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/yKO8dY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130AE1E376C
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766882291; cv=none; b=maErRC0It+TREMuwMhUnh0UjlcWWm1AboH7x3ik9KZbFNIOOhiUv0Bak1AEzchvxsMaErHMIdXC96sTRqEKpEzC310bWlKbWXBdRHR35prbhtXQq+9Bfg/tfPKbXN0Y0JT7kSGuEBFpxXpCF33rmaQ2fiBaBYDUgTr6FboDEWuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766882291; c=relaxed/simple;
	bh=KltGxXX97LmJ5P5GtnhK9RsKVIbBn5KUNEG3V2YDrnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmjA4q8L/r5ThrI9gssIpu+JCOPNgBGDh+UUttlM1bgKZuIhTQA3K2qOD3vpFuX+nwDAsmXcL12mSqPxaVnxSGC3+A64TRI4aw+BHus4vdqUB9X2CMKV1qBesjqFx17spJO8er/vq3Dyd8/laDx+hHe6nJPcv8yfvQthk0wozEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GypzUtGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/yKO8dY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS001hO2901658
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7EkANEqa3SI4bBEeuMLrztjO
	HQ4IuumG4EM5qbnQwaU=; b=GypzUtGXZjQSavQQ0BE7Oto/cT9Sqkkrl+3R6pwZ
	HJfUKyEWlDkl6rmwIlVMg1j18+wB2MvHN6V6f1sjrxW1Lf63yvHqe+aH/lppsHnP
	00QwT872JjNaXHgZOZWIMEXKzEE8peO/ly+2m2pP9OWaoLfwss9jO2+WPEyXnOR4
	kXuMJzEmSn8j8qAG0idA6k2qi59BnBJRm+4mJii21jSP+cK37JcUTx0M4M3yhtjQ
	ZeniKD+o9rIIOeCpkiW9vwDtHLQgHz98XzX+O8nstwdhd/mQcblZHJAXGbm4nqRi
	d4tuQOfPyxTYQw2SGKkx3Gi1QuXSTlqDjVLWweLg+bK0qQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8mf19bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 00:38:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so180200281cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766882288; x=1767487088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EkANEqa3SI4bBEeuMLrztjOHQ4IuumG4EM5qbnQwaU=;
        b=F/yKO8dYhHMGPl4+BNWk42QVbK+pclAG5tq7VqZVlE5B4aiyWX9h2qWU181ArftQ9S
         Mllq+jrf3ql4eeZyB6q+QNczlGjrE4vVZG3Yz/EHSeaiaVrvYgPB9OhjEQ41uvK+z3oD
         qUtqaA0MH2BrIV4j3nUA0Txq+cuDR2KahNGHKLbReHlcB2nfn2cHNTyfcxQO4FqLz+4G
         qDV2/fP2wvv7O/Im/FebVO44/5fOoIG+Vkcul8qeNxDzOf3l96Y+XnD/RaIM7mlNVJsi
         Hsa0dhN/q1KO8gbr6oTl8lAXSl9EW+TLOM2vbe9QxKLs93zd9yXiPH6lKQcqkPbZWrDT
         a8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766882288; x=1767487088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EkANEqa3SI4bBEeuMLrztjOHQ4IuumG4EM5qbnQwaU=;
        b=oFsPLDB0D/v8t+yLS3MuI50mQnXbBB4FhW6OA2DZHgFW78WqodqcMM84ApMnYwZWHJ
         4LxOfy7CvaKd5YJjWSoO9rLwZ1M6tJbqfR6vEszDx4t5uBXkiJFXWy2kj3bLF8SFTFjP
         KE4YtX1pp9B3DzR+SrCnuug8rKnUyWHd2He6caSQNPYu/1fNS5PWP7efSW86na66iHtq
         tQEbFgI1CUNa70a5Hl6UG8ldv1E1mRsxNlzV+/5mdMhLx1BK+n77Lp/vfTVMY8N8Py2J
         8Z+BN2GvwEzhnGNK8QUjj6160nXAUG/v4SIiwf1Dm4EE/U8n8UOwvesziSc4G9KmMi4d
         1/YA==
X-Forwarded-Encrypted: i=1; AJvYcCXhT2+TyTH5Nwk39s+fDdeFrxA2hSG+i5CXh0HQtJyrCf3pkySXRDAwGUTIvgRetGxj6PoiSPOKdabMGKyO@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjeXUjuER2KqSH4q8RD+ymhzjrPpxN/pY2+8yqFISCjkkBHjf
	Phh4iv0g12V/r1iqLbeQQEr/52dvE9tlGKEEj4mQp8QeBrK4YRv7Y3WDzUjZMtFLL5Twhip6iKJ
	fem/aC0m5PK/9mI64rXlVZp+rlYjDF/7j8aXofeojVjlOy79rs5wslGY4OeHRgCZqj36A
X-Gm-Gg: AY/fxX50CVBD2zMa5PcFXlk8k+qWFXFd03VjLHy2D1UQObPar0xu/QtZZ2Pb8CzAXMx
	25uiLME/FtLwXEg23SCnMm8HVKsEBhGioPTpiWgOUv0fcX/iMGT8L7UaXBvcFdKqE32A+ISa12K
	cIsqsQoEBnwatBTlCgkgbY7phyPy2vh9XgYTqmNfa/tUudzMB/peOyHuz5nGGK1LaTXPm/M9SQB
	woHgJSl8A84ZH/oyQ6uWTegHo919uVuckt7PF2iZxZaF0CVqo0adWIHkI1OVUHllN97HjuzuFeZ
	aSpy1ngXB9NdcOj22H8sku1GfvQ3Ig/LGXbWBOdE6/25f+1ChLRZ2WBSfSl2t8QmvG48dwWSdCm
	UuAaVR+u0oS8uGbu6vJvX+PJcRP/aPA47Qti45TURLOO7pEIOAzgBevHtMoQu4SCWMtxBjI4OBo
	gC1+SxcUh7R3UnTkqxZ9oVHpg=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr447798461cf.7.1766882288036;
        Sat, 27 Dec 2025 16:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw56X043CuMlkSOkiOcyKOJTAC41kaY6yO24gyXc8BLNaSFbhNxi8o7Exf1VHwicGAOqkK6Q==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr447798341cf.7.1766882287646;
        Sat, 27 Dec 2025 16:38:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f4d9sm7639400e87.78.2025.12.27.16.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 16:38:05 -0800 (PST)
Date: Sun, 28 Dec 2025 02:38:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices
 vendor prefix of AD7147
Message-ID: <7zg6ubizzaf3sp2qat7vp7miqw4ukajzbuupvqg3fzrnf7ltbm@kteec7xpdmrj>
References: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: UjY2lXjip7-17he-Mx7iSGcldQWthcUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAwMyBTYWx0ZWRfX0u9nmGpqIW1g
 NnXFfLB9BqYNWlzXjV+opxnzfT6uZXRcNIo5Ei2K0OUwwCka6UfTTCUk/oxxvziuSAzfvUCHR9u
 p/Auo2H37/nEd96A6f3KVTz/lfCNHKD1z/4iqZFdnGMAOw2hwavmy7qENl/E115Lq+6Bdsz77OE
 mgeI/xOevLY4bLyqai85SdFO+nLRcZUbqOUtaVPA5ybia8YPIcjMEoOEO33VpJWd9k/DP594nbP
 Xio9BblB3lETlKyU5y/8TDZNsCmO82cMCFzx/m0F6JKnwyaAdl8v7wTzX+4/ue5yLIRZBYyS+1r
 1gpBXBBwIwSsgmHJ+LRqjm+BWx62GdSmuUtaqlEpuTBiOmAwaBXmjD+1lsJ3EGKOJrRFEpgN0Fp
 AKGWg9h0syatuFRgwuM5XnSGI5DQLFRT8RN8k1P9/oHHISOyAI//g1XE+kWb9mau6vtxz4vfGej
 HEpy5bBhQYzJk6dgXuQ==
X-Authority-Analysis: v=2.4 cv=XuX3+FF9 c=1 sm=1 tr=0 ts=69507bf1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=B06sBngV3pgDXdJ4Du0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UjY2lXjip7-17he-Mx7iSGcldQWthcUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280003

On Fri, Dec 26, 2025 at 02:39:23AM +0200, Vladimir Zapolskiy wrote:
> Trivial change, Analog Devices vendor prefix is "adi", but there is
> a valid "ad" vendor prefix of another company, this may explain why
> the issue hasn't been discovered by the automatic tests.
> 
> A problem of not described compatible value is out of this change scope.
> 
> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

