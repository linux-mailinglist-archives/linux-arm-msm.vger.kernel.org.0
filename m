Return-Path: <linux-arm-msm+bounces-87160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F4CED48F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 20:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E77DA30006F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 19:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746A2126C17;
	Thu,  1 Jan 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dr8/Il4Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzufIjei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11401C1F02
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767294109; cv=none; b=ZxS7Cd/L3Q8nkysTZSVT3PWh51afW7gsz76dFgJL6D7BcAUBzkOHT3CM/8TOTMetQ+DVJ2BSFNHcaa8ZNYoO+9VqzRxyPrvl9KSaXxfA7lvLnXCTLRePNXHbHPUx3f1FaAwnTS7fAlSLysc8VisqZejpoaS/sbc66oTwinMoj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767294109; c=relaxed/simple;
	bh=09SPlJS8w9z55KV9fRGuGfrJpZXnHXqZaP8GsPWBy9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEGo4ytzEMOprbYtMXbzPqtZtuMpNh3EOGlHHoe4Qn2CLos3u7Cxk4xQBnh99Ar3kUr/E4mbcQA0o51LUHwrwvL6gTcBc38+ncIrhSaFWQigORL1TfYgBiwMBRpCIJNLrcaabZAlYH3C0LEAOTJnDqOb8SFTcqXlX9eFRbZUiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dr8/Il4Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzufIjei; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601DhjpJ2154452
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 19:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tXclW4aX46rZnRIVsSHqBVnw
	Bj3pv8YCsnr1Ohovb0I=; b=dr8/Il4ZBCcfOCcIBsFy3GYTBNndjl/jRLhrBXLT
	utwX/bQWVLpSRpqya2g/N39NjqT1RL7NKGA/FrF4+/RR6IPQmvzIgB1p+8RzvmzC
	X1EZUZ7fWW+Vm6VH3z/Qosr3CA9TI41vthWICi0yxU8OLbfQuH+VzUjG+2e1Rt0D
	s0kRTAqJZK0dFX+i82aZSjcw28sbBArJCMQfaUnOTJyXMfTewVtBRzPbshjfxFAK
	E6aGAFvN00vir4T2AFl62CH2UQcRK522c47dzlcYxZhCQz6q+yKXtvOQp7/EjnuG
	zyVv2z/zOCWLE8PsS9hxBwIaBMrapLe3IFU7iuW04tXMqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vthv93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 19:01:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3dfe072dso305161121cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767294106; x=1767898906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXclW4aX46rZnRIVsSHqBVnwBj3pv8YCsnr1Ohovb0I=;
        b=jzufIjeiQWnFv7Bh0qv8wZ3zxg1aYIo+tN4Wp4hEWajA1iNV6frSIy7xidJPF9XBd+
         sme7pn6FWkjmU59zBK2de8smZ2CGTOJmsldXt9goIx0yVm/HMbstiiAJ1oIfSPJuSeKM
         e1rmWBQDQ2Gzq66hIG7MXku0+m1qNRnPVxO4aP7brCabk7aoEXeUrcHKufx1X4Hxc3Ou
         5glPVRhR5eJbkQdeZxVOwTvsCJ+IBuPNZ7GSoN33T6CK+gIgHljKxkgxq99rCmK6Tyrh
         r6AjlK+lm3UcAvMuM3hUkfvqxbo13xS1gEBiqZ4cCECUbzHvNreUnUngLMtEYTCFsTKt
         9d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767294106; x=1767898906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXclW4aX46rZnRIVsSHqBVnwBj3pv8YCsnr1Ohovb0I=;
        b=ooMud9OAOJq2T7A5FnWRDxeh4EfoZyOnruVlETHAektj1zbDnjgBxmbK7CPqhhH+D+
         2WWc2XdUNZD+7MYhfnEWhquvOjweXrLW929kUYP2RSzcTeNgrmuEvuguXbaV/qpNMe3J
         zeepP26vL7EaEFvKXA4KhZ7JNGw4QIWvXOB1cHwuvVaS6HLkVEJTpaVDYQMc03iD+pPJ
         hZFjP/CV0tboTzvwu28HL7FkEhZv+szf4VfnGooe3ILt8593/I2IjpmUx60UBikTd4DW
         u2EPk4tQakK3XVolNAQowK1zTY1ZI4O+DYsCj2DC15p7ysQoTCNNipN3PY+vZxKJVx7k
         3rIA==
X-Forwarded-Encrypted: i=1; AJvYcCUvGj/lVCnCTnkOMrSieXfyMDyGDABOOZkvHMux4mEwniRF1972i4bYtuX0wY/HbHw0ObuL73MTMh8QOtfl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7g2V74KiJ0/POXSOyOb9gamGYnTh0Svn3PI+Fs9goL3PueZGr
	WCCKrWbuJusTPjceBCAw9wcUg+V5TmnNQroW1QlQIrPyYXweELbsjlpzbBL2lr2CHCWC+kIJyIW
	6NCZqn0mB2MNWlGL1ttAlNhqryx2CPRbwAWUK2+7AIRnlGaAy803+9zLeGPbr7WEX/U7p
X-Gm-Gg: AY/fxX6lqaGHEW1BJMuyupYTjq2MytgI9jWdS12yn21oyM3HRNmjrvtL2QlLbWNru16
	BZcgqYndkqncUI6AR1ERL6eXmnRX+eUpFTtNWKX3hMmNfs5/EFZHr9GDPuOLGUQHXs36i6F4+9A
	xD0qc+0i9JZzw0KjV5+8u5t5OMkizbbwq9U8ectA7Cb2zfn19xXRMQBM+q4G4XM+g6AYsJmn9W6
	KhH0GXa5kt6p5JwwxwrHCm1Ts/pE3ruxOxa9UD1/jq3Qpinldu8NATvIuDbIoDboUTy5h/sp3tn
	ku1XK0NDw9mMzOXx9z6v+2EmpsISYmr7XULOyd1NvqlCh1wy+6+QoARxIxHXnXWxNtu5vTseCDy
	prnn6dQB3CSFmmOTWBcpW
X-Received: by 2002:ac8:5a41:0:b0:4f1:b795:18bc with SMTP id d75a77b69052e-4f4abda1b98mr687311151cf.64.1767294106156;
        Thu, 01 Jan 2026 11:01:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcT9eU1RDafnLHwpeHbUaQmXUFAUv5FdN9bvkmWpAiWSOAl+7hR4IrqdLX0iPFDNK2rR8Xpw==
X-Received: by 2002:ac8:5a41:0:b0:4f1:b795:18bc with SMTP id d75a77b69052e-4f4abda1b98mr687310241cf.64.1767294105539;
        Thu, 01 Jan 2026 11:01:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60500sm4293397466b.13.2026.01.01.11.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 11:01:44 -0800 (PST)
Date: Thu, 1 Jan 2026 21:01:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 squelch detect param update
Message-ID: <ixqokoldggtkeinosfr36oeq3pzwo3iiqdw5bvxwag7hxpkgy4@3lvrj3bdjd4w>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6956c49a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yu3_NAM81_lDL6LZg7cA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: voJrCtgjvUvzfam5nn68clrIDH848doI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX93nbypI6oDRN
 h+xOio9VgReKL5H2W5haRwc5OB5mUJYtmwJ3GdSZ+oGkUfTRE9jc2hS1X3r2HvYLlvxCeWNFfs6
 rUeGj8sPDDno/ZnzQVvy/VS+6HHgSTTvqfZL9QCG3WexKoG8UG4y74BcfS9MosRhnMm2SDJQMOO
 wQFCACyJxNzZzSR96paHWmUT0nJzJudkxkhh0LThcXzihK2s9c7m8RMmYuvXvFj+vWLs40YMiHP
 LzAG1CT/2NqexMNLvG1wwIcSFs4+cVi294P38VsYPRX9iJrGKgKqFALCtkat1JXeeWMcXcLqoNU
 J+AwoFL6S1EpSee+BSFMKGekXNeyb5mZ3CEnSw414uwfpXE+1B7YUAjNMCcry6IqPVxAk9tqFao
 cYg8ExZCxQPbX2rLOp7X1TfrF3/IsqwqqQ3dnTAh2iscoPT1F3Sa0AWiaL7wsf6ORJ2GHxPthsQ
 oV9iO3Q7sBr5/6JmqpQ==
X-Proofpoint-GUID: voJrCtgjvUvzfam5nn68clrIDH848doI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-19 23:01:07, Krishna Kurapati wrote:
> Add support for overriding Squelch Detect parameter.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

