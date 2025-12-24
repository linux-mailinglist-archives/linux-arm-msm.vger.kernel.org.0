Return-Path: <linux-arm-msm+bounces-86542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044DCDBDEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25EBC3000FBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4F132AADC;
	Wed, 24 Dec 2025 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPi+nkv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVVYdTTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9D2C0F70
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570261; cv=none; b=UBwE9jV5+sHlWMVpcHrVFQLZR5plwe0RyWAKItkaxjRwpMx6uuDwkiyBQU9FVVOLnC6uMhHFFWOz7lIWDhV+7YCDv8rU1i50cJ2SAR2wTpMGwhIDPrJxYBXl/eXvkfxEIkBM27m9QHYROG73DyhDe+1BRostAIlxZ6hUfjTKgMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570261; c=relaxed/simple;
	bh=/Q4CkAcas4h1N7lcP34o5Srjcu5xfeeAGTwIdCoaygs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh4zkZtnsa3yLgRfIzOll/84/zccpQO1xeewxNoESEmJ7KWEEqJJ9nmwXhu9S+UBaZ1rZcftCv9jgQDTHjbVDya8s79WGZtC41Mh48d7xhVefv1K++tBaE0FVrcKl9hdaSQiyj5i+WfTut2CUnbGv/pObZmt1xSLTtbpvCxdUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPi+nkv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVVYdTTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO1HiaF559899
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zw3noBsFzXaFPcg5rptBWHvBfDfNjU9mdwsPZFGR+Lw=; b=LPi+nkv76TjyHtGH
	d5TNH7iyn8Nt0cygmuZ5wCxqF/eDRoUWbsl+INLNbzl/nd8PZh56IwGYnHf2ft45
	JZYV3DRNlACDoR0667E/6p5Bo9KueRphJSTeaYNFAbh7f0E35sRcmOfUqLREW7EK
	KCj88sag7dat+fLZuc4IDlyDXQIvJOQiwORvx510lGGK3jCTihJ4U+KtyRxj4aex
	RAm6auLwsnxH+WBrDOxTo24nGlUJSgOAYXM9+ZGhqJttC5Sb2Lkyql90JOTQsSt3
	uT21brPZOQnewrzQAyFBEj223LYcncXPurO5KCtL5QjYAEfuadUFcEbObhFVlSKH
	HjG8cA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu6fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:57:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso121138115ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766570258; x=1767175058; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zw3noBsFzXaFPcg5rptBWHvBfDfNjU9mdwsPZFGR+Lw=;
        b=ZVVYdTTsnLbOIHk0J+VW3wA+JErStYHcGumzSOViJk+TThcRRmCivqplFzLwvvpisx
         nOezqDUmvTh7LzcqHqBZd63d6qlZQNVwFCewAQSRemL8SFvcZ1Xxgb6XV8CPksXma2uO
         8B4TyVyljF6mDmMBu1LV3e919eUEznGBRZyRMUFzg01C+vC5qXMsWNAs7fPREodaOYeW
         Rw/m9/RXmpsBmRerOH9AS4e3vHaXQDOZxVBXsZE/BYW0luTV49CFSzHrtRPbXVYF94Dm
         Ha1AcoK56+dMDNTLKHeTryOCYF9RVVLyVqNKoU2igbfGnhZcK57XCkfwX6eaSeHqfAkZ
         AzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766570258; x=1767175058;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zw3noBsFzXaFPcg5rptBWHvBfDfNjU9mdwsPZFGR+Lw=;
        b=qPpurcy0Z4UCWg38qpODkMxqJufF8WsUkyjLvJOqp2hqcjijNrYdHfcfKU52v793nk
         6DysaJ4YnUlG+HP6EM5PqJz/fUKjq9FHtwhIh0sIWeEch2ckceu4EdxImnclKFNGgj/N
         q2iiuGdWcI6tFhMdvCNbTGXG6utrzeMwqfhL5YOxUgU3dX8pgdHc5hDuXmzBqQQN8S/5
         +xLEMKrK73bQ+2I4PEmrrI7IDqTqfJVjlBg3ekPc9LGflI/x9jMWRffrosfyCE1ZwM0A
         YsC309zEwl+Q5L35lXIN6Tj3oQFcAHEkrt7DlTZ0NnN7L3uNno8l3X3eHeVfWdQ20FT4
         7x8g==
X-Forwarded-Encrypted: i=1; AJvYcCUbBP5+NJF1ZQPd1TMaeJyaahegSwbaM38AN3YA5eFlUVo2kxr2qTeyTBNClTC5Mpc5e2Xj+USVjctLX8Kg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94H1Z7/dFUXVoOgxo99gujZAEa7bGngWbIjYTwHjXr36cPP1g
	POML1bMPoZhrGUOAgAdAUIqDMknglMHeBZbYRzdoI2uXuJRtiZ6K0qIf3RUkX4hmG79FR1KgiiU
	fnNlINDoor28SPlqb4vOfYbTtf4UnFgqd3YBPSv/El0pJIrQTdqeLgT1E4ovuEZZ+GjbJ
X-Gm-Gg: AY/fxX4zU4fhGwbFd+nf83j5CIqfd/Yn+kC6Tmj8eZyyukzuiBRaS0S8GglNUX21iod
	Ly8ZHwNpZjuQwwEbqaWPPCNk5cP5Al1R8DExkjtKoR/VWRvgOiGhXDWxUndyHagmZ6PnKAAWhQt
	xLMkuhWEiPatcN1pzeMIK7P4nwkQTgcH1RPdzzQkvbxXwlstIAe/SOHdD3y9XHqk+PSO9lzclnI
	FoPwGHm/DWnR447yRe7FqNkhrFvwueL4+FTbqlUFQ+KBUfY1AmBcD2hgnc8YfSKgSF+e+jFMaCr
	kW5Zaic8l7YmnyJbKNQ2qz9LjT5FuRhrPyupT7vrLS1AYzZYrQ7KJyVlaun57g1pAG2OMqKOZME
	cygwjDGEcP6m+D/quoZBaJDI8K5T65WWoHor8jyKnUySqHGg=
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr174447505ad.44.1766570257557;
        Wed, 24 Dec 2025 01:57:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9+54wdsQF+AiT2sPrIEfFOGcNzD0VqXPNu6/Lruw8qWONgqw+u0NWES62QVhZI24vJat+xA==
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr174447275ad.44.1766570257038;
        Wed, 24 Dec 2025 01:57:37 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5f5dasm149180925ad.82.2025.12.24.01.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:57:36 -0800 (PST)
Date: Wed, 24 Dec 2025 15:27:31 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: monaco: add QCrypto node
Message-ID: <aUu5C+evZ/ECJbGQ@hu-arakshit-hyd.qualcomm.com>
References: <20251224-enable-qualcomm-crypto-engine-for-monaco-v3-1-6073430bbc13@oss.qualcomm.com>
 <f11d339f-5400-42d0-bdd1-5723083285bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f11d339f-5400-42d0-bdd1-5723083285bf@kernel.org>
X-Proofpoint-GUID: NL_VK8lGeZx_7B_YgOtC2hd72fBsWkJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4NSBTYWx0ZWRfX237u1EtsGwv9
 xBWRMdsaw878Cq+4GIV3EwI4AnuZNvLorQbLCBx01MB+ERe80/AYXljW3lUndWCJWcsEmM0MtJV
 fio9Q/LLrwUzCagEUzt/IqyjZ46deKS3OJUChnm7gkcy5R3am+/8Io+ONxJMeA/PMBobRfu+/pf
 2jvK5ZgUe6O2qqp1PjuEF/NKROx/MgAj+XpiyLe4K9qNkn1RO7uNBC+fN9CmGXiaVzAGkz4WNeP
 8qkWkpAgFcVzduy9i1srwSV1R9cO1ImvLU4/Y6HALKFZVfCWcbxBAQJGOBbmstIUA0pCoifpvL1
 Pnldbe0LnN/EH3DjsDBHMfBP2Liqny/XwPepGObKxukoBhYtIkHTQoeRBB3qJSCjGF7tuXLx4tr
 CaVXvYNafSt2/CeUF++Ue6ZMXu+ifGT7ucV46FT2U3srd1EmWEqG6iDSHrlotqiO/NAZB47keKy
 AB7+vihqQFSR10xBWzw==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bb912 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=53ezCMPwJD-X8L-UFSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NL_VK8lGeZx_7B_YgOtC2hd72fBsWkJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240085

On Wed, Dec 24, 2025 at 09:42:03AM +0100, Krzysztof Kozlowski wrote:
> On 24/12/2025 09:33, Abhinaba Rakshit wrote:
> > Add Qualcomm Crypto Engine device node for Monaco platform.
> > 
> > QCE and Crypto DMA nodes patch was applied as part of
> > commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> > however was partially reverted by commit cdc117c40537 ("arm64: dts: qcom:
> > qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"")
> > due to compatible string being mismatched against schema.
> 
> ...due to Qualcomm engineer not ever bothering to build test the code.
> 
> Was it build tested now? Typically this is implied by trusting people,
> but not here. Trust is lost.
> 

Yes, the updated patch has now been build‑tested (including DT schema checks).
The previous issue happened due to an oversight on our end, and I agree that it should not have slipped through.
I’ll ensure future submissions are properly tested before sending them upstream.

