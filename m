Return-Path: <linux-arm-msm+bounces-86574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EDCDC307
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE4830213E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E163195FB;
	Wed, 24 Dec 2025 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXeJNtBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZiIAQm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5DC320385
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578874; cv=none; b=iVYsvpz9BLIv1iDLuNm9xZBp+QGYZFw07Cuiy7/mHNEbsb54cs6uUL4P/T6lj6a8h8Vu4nvCY3DQ4EOnjfxxhHO3x8h4r5pQZ6FytH9Tin9tczyEsWbywol4WHnm3VUVVzWihnI5AG41HCZxwmdLIYDdKmA3vFqxK1EQiBzJ5QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578874; c=relaxed/simple;
	bh=yRGL8r4ZMsOqfgIJea+g+Upcf7ZSTpqZakl3Koo8zo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikZC6trHUCjbqeY9XSw/2+FSeh35yqNDnrJ169nEJYX2o3/eSmFxXoWuB2+c86VaKRx7MxetK+F/qF97mjbkDXfWsFPeZU3qJPoqEfvVIzyTAyJs6E01IZbCckwdJy8u3ukdfKPMSi7fsigQHv5R3MC6q1ToabVPIJOklUq5GTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXeJNtBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZiIAQm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9XTlE700449
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJU+pblrkPsR9x3DzesoKGsl
	EUt4CYwM1Bfa87PBMMw=; b=jXeJNtBCXuux2HE/POJ/vPmZzPtiGhEvQQQeGGzn
	OevjlSl7YOovP/yxvREV6q1OFEIFbv/NPay9CzzguYGU2e7sejWMJ9V44sM57CFZ
	ObR3Uv5kvB6Em5HJoVkbybCfSuqb41xVXLsls6WvF/+B2broDRCQK1dBIOIvp7o7
	PUYZq2gYGHvIZ0anevRTG/+2joQwgcLATloGfSexgqzQMB3nX6ppBwHrPEX5vxW7
	zQBF6XhASw58MZezPZPIl5dN/7+YxtxJwVPZ78DdJxHDjfAdhKnKTDgTSvFicv1W
	2emu3NojUnd1TW4fICILLWJ6+gVr3rreA2hFoqYiC/YMCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jup28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:21:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3356a310so162198286d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766578871; x=1767183671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJU+pblrkPsR9x3DzesoKGslEUt4CYwM1Bfa87PBMMw=;
        b=SZiIAQm6MmFgnM08mtE10neZwvkVMiI/spyO0EcDCdE18NuyR3YSJTbRtE+RVKR9dC
         2HcSacIfWgroK1hFugS7f4eTOZk5f9pPd6kt/ANA0hGVZXcNyse3sfPl35nGYKRj1lRT
         PQHaoW2PyvqARPjIdMTGV0UnA9V6fXZFISpwd/xobsdEGv0H0BlqMiGizH4uCkPVQFu6
         HYjHOt/Emo4yWm9GVWtU1rcfF3D2npUUGGP9mrZXQTkdsTfXCh4ksJ/Xm99vVZK31VQZ
         8NAp1aLV174dSi1OejsawsqOX5GXB14fEzYAsljVubvZsVZtdaZ8hgqorPyy7PZekghz
         pxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578871; x=1767183671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJU+pblrkPsR9x3DzesoKGslEUt4CYwM1Bfa87PBMMw=;
        b=u9K6423KUlhN9gin7yhSp7OPw2UNrqyPRDF8yciF7fJERYR3XNRfCzfYNxgxnblJsE
         PQUfUy0IKZM079w5gG+KxILKydl0aHLoxVCpUJptudkNxmcTjB4o34TvxsTxNFehjCMS
         ciYJSnbAvaf9FXNq4lsvXUGRmc9LmRc/Iwgga/C55x5W5Z8sdgM6CPVooj+lBY5F3S3Z
         uOXwrmnvZ1nVzPTwk5xRM8bJWpiqPPn86L/YDhaDK4RyM5rum4Iiue8fCWhyDZXQ1Vfg
         EUTpoURY0DE8UeGJEa8Du7PvXG8Q3ey8f2HQEb0FCoaMZAs6VdYwhODa3sIHI7wlUFWm
         KxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM0mUuJ/AB9x8wpNKtdku5VfbWj872ipQGJq+cdwm4FCjKQG+WoY+45bDqDgWvGK9bGqLy2ApdOaKRx8nb@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxRB2SDo6JzC49EWFXBKJlkGLy5CtRWru2rAo2UdQRJT3o8lF
	whaoh0OO9KtlW0guF6Iec6LZ8IjlVsWTi6589nbHewupoVW8jhqwAnNeru94hU2qhdXQxvFL0R/
	VnnhrE+T58ryf6KVMsdYqcqTRUCEZfgT+ZZwoapd7kEz9CViUDJsEJooVSJCtOCNl0TqU
X-Gm-Gg: AY/fxX6hbt8LzRXf1/8kfwAmUTUQGoEzAB6SgjEbqnKmTKeGtuBIUSY/u0oMfqyK7bR
	mQ1+PT2QDv8UrhZxW2G4d5dmxXaN8LNVlMpbHsiQ1cISSTBIiH0ta/qV68OSvVo2ohCMUcpPjZz
	h7bBldTHf4kwuVUEL1XDsb7mspEQWbhv3QbTUJo0GqjHvc/DE7nnvK+AIxzVjhrtAo2z4YSdT0A
	FkY0vswt12U4GhRq7MnhktgrkVyL/m6DwQDuol10kA5+BHqD7K+THqBiV9qcLKG0WlGbQ7yXP6C
	j7YnelEJl5vupSLW9kctjnwy1x5je1BPLJf7VNcQmeB2gV6AozpIhr0Bnj9ZgcIRo9CsHNjzFLv
	cetdLw1rErXluyseczrQA4zY9mobfueA5sNml5T1Zs+kJ0G0mN8CGEb0Bv6lwOA5HjksFBmvJDe
	k09hoffLM1qfuKowcxKMBi1uI=
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr291355976d6.23.1766578870755;
        Wed, 24 Dec 2025 04:21:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEewmP76uccHHzyVy3OhdDBMJHCuEKTJegmcNQywBFxh1mQ+oQJFZoLdNe6WJFOzeCAjmoFOA==
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr291355646d6.23.1766578870329;
        Wed, 24 Dec 2025 04:21:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm4864481e87.0.2025.12.24.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:21:09 -0800 (PST)
Date: Wed, 24 Dec 2025 14:21:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <6x62fxpyyy3bmtivbfntuqym35ao4x57jv3ijrkg7wwpjioh2h@pykzc6zilao5>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX8TRrxcN+ifcD
 XJaaN2Z5Bx61dW3jg4snl+wRz9komKW//KVDz6jrOYqnZFogkJHSoJaivG0lmtJJ9Nfjr0uGkzF
 Q4EDWZx5j27/EdNFr0zk0Rl88uy+Or5YhTlgigd0sXWeR0ft4DXZ8uoTs5VEkbpMLw9W9Xhhw9u
 cHF6R9k9VU7OS3zhZaXRtAL4Owh/pL6BVdLzRM4TYMQBN9rnxEeMel6zGwsNDJPr0qsBR43hihP
 gb8Z07NVNgd2iVpLtwOTrf1oo2jIleoVvp4pYWr4pjIFgUz2n3aC1GTnq5ZkaB5+f/C0nlBM8wA
 vTt6KP64JvUvIAx+wkKlE4D6BVKJWo45YfTZ+aL7woZFx4KgVIqC2a2V7fHT1DQKsxPs0Qyg1xH
 oLWnmrMEsZ3R2Eet2emtifFYVOijhL1b4DHRCWlyjioZk2nhJOyCQaHVu3LGET/Dav3QuokAXN/
 F6XlZuM81kpNKxFVD0A==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bdab7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: LnCjNMWECwovTx2b-YbjamplB_FQO0s0
X-Proofpoint-ORIG-GUID: LnCjNMWECwovTx2b-YbjamplB_FQO0s0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:22:58PM +0100, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Does anyone even build this code before sending it to upstream?
> ---
>  drivers/clk/qcom/gcc-kaanapali.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

