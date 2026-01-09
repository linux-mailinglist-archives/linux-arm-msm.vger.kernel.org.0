Return-Path: <linux-arm-msm+bounces-88284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE3D0A642
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E7E301FFB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 13:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A9335BDA8;
	Fri,  9 Jan 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvZqVfkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRgZO6pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A204358D38
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964387; cv=none; b=fBm/v2XaZyYHXaw6R6dSPn6nR4UagP7fU0RiE0sxp1TuFm4wNnIJ859NvNcm0VYw/J5q5GFBT8n3pRhmHBSfbRl9Z5/Y6zic/obMpRCyXJAXGnQLfMqg/GuSqtMsNBWP5OOPzciqiKAgAIjS0PaeNUHCjKCY7aIX6sHgHHsCveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964387; c=relaxed/simple;
	bh=n9p+o+jjlXVzSPYGgZ3/XXWIFJwb0MeEoAQo+gx9h4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6Y3SU70j5l+I30db14cobAXa7Hws7WLjx7HgfaHDFNVL3ynj4my/BD2BHhL3QCQle2R2JVqVDZXkIjftb7uDS/DJPSnB+SUYdaLqTInQowGebDUvGo/VtHQixLmX9wu9GNPDe9hIKL1iCY74Yg4zo7kpMoH1AO9X/Nwz4t/j9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvZqVfkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRgZO6pr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2oJ81062615
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 13:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAQ2jETUJIKRwTk2kBD82NUb
	fvuyEHAaaeAEsNEprpw=; b=pvZqVfkStM/zVnvtVZTSGYW8Lp4Z2Czo4LTEsu1j
	HYbNDoy+fnjhpkbcprnglJXzh05dZnBYuvkpAiR5bm4dL0XlqcAY9sWRW+a5hnwW
	hQ01WWV/hY9rSoTI7//f30+OO+REgit4T0O/Rr2mKnfYnCUzVqp8F5adtiDgCsXZ
	Q/1bIhoZ+kzu2KUUX6VARWhCP23+VUSSv8EDOUo8Nab0BkkA4iXf0IaTSloarI+8
	+M4MmutgVJlctIbPmzX/+MXmWud0c4ch+8i46YniXUKR5uaRz1M7U5wkfq850dhk
	RkpMYtuy6Frh0Uv38H7mRhGnr//jr1W4W3ZN9QQ+itXLNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f68ams-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 13:13:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so865583285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 05:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767964385; x=1768569185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAQ2jETUJIKRwTk2kBD82NUbfvuyEHAaaeAEsNEprpw=;
        b=GRgZO6pr+SqIh3XWREcVDHHT9YlbDVO88VwYw78sCo5XprIB413vE+9xOAxmP04QPk
         puRwlsT+1lp/58LnJB8mXpZ7Cd3frjCTE38CZXpD/jbe8kwxyzPsFl3mi7qwrahiU9BG
         Dbh7eN1f4FUB5UMBCX8SBc7mceKfMGmyZNsKw9jUjerrYnN5BiuzKGFueSoaVfOGqsfC
         EblLjcPpXYqFIynTOaX8VEHxDUtaKX/i0X0M41WTN8aaEd/PRUPw38HFnVvs5cV408NI
         APjOs6tbfNx07IVeq168uY8fanSBUruw5c4LLAmDdgvb0ZvoMm9FFZ8VJOz5/st98q2B
         K8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964385; x=1768569185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAQ2jETUJIKRwTk2kBD82NUbfvuyEHAaaeAEsNEprpw=;
        b=F9GrnFGm/5IrGdOVRXn5/LN6oC+BxSSBxqwR/G0KWf5qNVNRQRc2FuxFfmMOjEGkx6
         bZ+83aHy/SRiRfddJ9c23cBehkAWEho8Rs3E+UKoJ2EWpem9AFwswzgM0c9n09LTqA8n
         a4ur/olq7y+de1MEAaXU9SzfQYYn6TfJ5lrY9SOQ0CwEkrwEWTTIGf/sRh3L0gn7EAjK
         DxW7Gyg56bBO0KH3yggVyh7ECMrl2EtSIqB+/23W6pfuwh3jb/XY7Cy+Iq7Y8Kwv5Wdh
         EJ7nZr7oLcDrxXAHBQdxWJILem1QxQTDDS14aUnnkvv0/yDuX7lchBsJRv/4xZe8fQwO
         6Pkg==
X-Forwarded-Encrypted: i=1; AJvYcCVPXc8ARe1nONhbB9GRXQ7zYVnEAh//Fe2TATp/DuOWUw5PSXT8nDd6ovS8qXkzEU9JV0KQKHXPaI9NhkQ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HTvtYwK0rFvDWCtvLVEPfeLgkxodWuNPRISb/dLE8FwMYSuI
	yDvOLPA3Mk1dG5JKDqeRCPu767P3ba4ZsopEFkH6U7mu00sjoCSyxb5dQ5uKr7z3ZSRmAogwgwn
	UxFffLCUejFeSGqnrWBVyF5mEdjIwPtWdbrFvG7fQW6HNKLng5PBc2sesGcs6M4x/RISr
X-Gm-Gg: AY/fxX6hzU8msgf7mRS8R3a8yvYqhD4TTSlb8d2JC1Azvc/l+HpzT4BTpRpPpvjwbHp
	IrR7wWM/fmUpY1QuM9OI5ftsKI+8Lni085zyd0LV9MGfr1GQr5VpNYfLTTJiCg8of/mRUlzycZ4
	Dacr8pD1S5CQJHVfy/VRFiAdWngAVbiDaxJaRUnetIFM8sqgzoRr2J5Fcbw8duE2q6SXjY+G5E3
	xQiLNb7748u3MACEgL5yWLCwsMMBjmz2MnNjjC9lVSWIkee+NuZqayllmudCdxz/ABbX2z2SxMW
	Q5bG+S0m5g8sBO2w4CMwPvkexr4Ktjn07bl63PqThp7IUon0udV5N65/aZCPsLYKNFOWk47kLAd
	4PhWHJ5ZGKBY8oPs1oVVYh5Q8KelsEfj6fCqs2uxRxoQpDfJTm37D2eSWNJhNrZ3emywh3wK1V1
	ZevTVgeZcc9VhRrLw04cBdoY8=
X-Received: by 2002:a05:620a:4089:b0:8b2:e15c:be60 with SMTP id af79cd13be357-8c389429edfmr1392058885a.88.1767964384748;
        Fri, 09 Jan 2026 05:13:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwjJitLy9yE1EF3Cff9LL6AgsYBdvt5wBqevXDELT0x/mrye2ZYfBbYvnaBJsQ/NCBbtfEeg==
X-Received: by 2002:a05:620a:4089:b0:8b2:e15c:be60 with SMTP id af79cd13be357-8c389429edfmr1392051785a.88.1767964384189;
        Fri, 09 Jan 2026 05:13:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea522sm2781417e87.3.2026.01.09.05.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:13:03 -0800 (PST)
Date: Fri, 9 Jan 2026 15:13:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: hamoa: Move PHY, PERST, and
 Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports
Message-ID: <xk2har5jvunwc5lhue5j7nunrcnecnljwxz2l7cnxu4sdeyixe@bcflvpgmugyi>
References: <20260109104504.3147745-1-ziyue.zhang@oss.qualcomm.com>
 <20260109104504.3147745-2-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109104504.3147745-2-ziyue.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=6960fee1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hO0vvW4Z7aDYz2clpJ4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5OCBTYWx0ZWRfX/YAuA0y5v6tV
 DG8fRhPkLyhzaeVKEjQav5/RoTBaadERPtPqsn93Zyx3WWW7iFxQribvkfGbaMUx+HO0grAAItJ
 K/2kt2KMxj/4k/A1TbmkIYJVl+ursZZUTossENuZEZR7eIOwiArq2VRUp7DeJR1buUtKlLiljUJ
 PDviUp/2VZcra90ATKTKMGLLSA7eGnfERADTq3fwfDFWwr/os5Gs1Se8CcyJwz+PRnX11vZ4o91
 k4VVI5plVYsQcrEpxjAJhPsSVOTmrt4PPKyRscLL5HB/AilEqW/h/XvszmSnWpa1148dT41dHH1
 Q0MqtvkDy3KB2omP5wKrYQwrLJtOWHbeYohqhphIdkjgiWpKi4KxeIxo8ugvLBA/DhvK7nOSojB
 m5ekd7sQEe47A5RDj9mYYWduBLuXS0Wea+AcW/k4LT0S9GJ+NSL/tFJzfmY4FgM33UuASCm6RBa
 x+FrifZF+ON05O5iEGg==
X-Proofpoint-GUID: uRABWbNOq1vNHttYp1biVOu93Rt275i8
X-Proofpoint-ORIG-GUID: uRABWbNOq1vNHttYp1biVOu93Rt275i8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090098

On Fri, Jan 09, 2026 at 06:45:02PM +0800, Ziyue Zhang wrote:
> Since describing the PCIe PHY directly under the RC node is now
> deprecated, move the references to the respective PCIe port nodes,
> creating them where necessary.Also add port nodes for PCIe5 and PCIe6a
> with proper PHY references.
> 
> And also move the PCIe PERST and wake GPIOs from the controller nodes to
> the corresponding PCIe port nodes on Hamoa-based platforms:
> 
>  - x1e001de-devkit
>  - x1e78100-lenovo-thinkpad-t14s
>  - x1e80100-asus-vivobook-s15
>  - x1e80100-asus-zenbook-a14
>  - x1e80100-dell-xps13-9345
>  - x1e80100-lenovo-yoga-slim7x
>  - x1e80100-microsoft-romulus
>  - x1e80100-qcp
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi           | 42 +++++++++++++------
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 24 +++++++----
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 24 +++++++----
>  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 14 ++++---
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |  3 ++
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 14 ++++---
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  8 ++--
>  .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 19 ++++++---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     | 21 ++++++----
>  9 files changed, 108 insertions(+), 61 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

