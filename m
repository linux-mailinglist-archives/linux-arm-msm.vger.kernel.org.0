Return-Path: <linux-arm-msm+bounces-86576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C412CDC322
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E44843027EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E5A330B36;
	Wed, 24 Dec 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auxYJsiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObJWw9y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E42325711
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579023; cv=none; b=tvMrlFM1r+HUHzOK6rJyTDPLluv3rDZUuOaBzEFzHB3ETsc5NCBX7R9rTtHJ5PSyhttP2dxGis03bZPL+wQn0pI3xNc/qWygG6j6foQgRHPswsH0uTKB7YBKrIrydsSNAtuWvvSPRpXt1xPhnGqOHB0Oq2Ao3o2DG5mDL5PcVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579023; c=relaxed/simple;
	bh=upAEC0z9eOTtdXbTQXxcwJheFZpgb3MgDZB4XXR5iKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoiyhN4mVuQtnmngRA44v5tbfOgRIbKYo9C1sh4Be3nioyGFi0w9CwMmVqhlFalHiErEmRrY3smKV8KHZsUcWVDTRbt2lu6ag3x9I9NTZsQzIJxI3JolF0wxtk18ezSLIZIdw6UrrSHyb1UzKIgAF8jkJcwld0KUjho5Ax5hEDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auxYJsiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObJWw9y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9f74o1635709
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q3XBoaOzyi2mpwpKKObIZOpC
	k16mU1PQ4Fx/B1pjtdc=; b=auxYJsiRSvFTiaBlY+PY151cWUSsZAIbg4LWwaQ8
	ngeqrqshksq+30ZkmMOY4Hoa2PL/mhudBfTN/aN2wf3gtnFlVkPYkqd3QWUjDhUw
	WtS9Dg8fY31fo8Npt9KKc71lYaMjVbz+5/FXhBcqnOXkBYo1YHyRtYKJ1erSA3ft
	e3oYIvymUVl2xoGGDcmzl83j8EOlhGfn0x2EdfjKYfSU4Ai207EWhmor26jy/W2G
	5f2n1BC054l+WeCf+vvEMdvnvV4GLRG2WW1Pw14GXSvZgKPk07Blut8Bw7jaPrDa
	xB7xszbm6Hu2XOvg5yAae7mPIfYftFO8HEGw77zVhpXLzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2dha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:23:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8086so138054296d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579020; x=1767183820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3XBoaOzyi2mpwpKKObIZOpCk16mU1PQ4Fx/B1pjtdc=;
        b=ObJWw9y2mBFpAxo+CCQAe1homJLLR7ced3cukS7QIyoHA6Gefkegj73qwykWtalTQt
         dipApCfobUN+5tnHFU1HnT5Lpu8qIcf2OY+kRVWP0BZsy4SZz7hMUUXVH7EucfFXOnBk
         UelsfvPTFE9Zf3DbLJbaz0TJTonMHHiV0z25kU9jIKxPACRuYq/WvicqK1c9QgcE+CBI
         qDG+4VEITHhbltxYg7J2gsNt3E8Dqo3BsctKYon1I2e5FcrAZP35gPAORN29m4gINsE2
         wtI6SOtTfTb6uzOyCz708BFaBJ8bXsKLAlU22D7zK397TLnF9dp3q12Aqj/Eiu3AUzk6
         YwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579020; x=1767183820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3XBoaOzyi2mpwpKKObIZOpCk16mU1PQ4Fx/B1pjtdc=;
        b=ag5bW1y3Gy+fWAMmV2xS6YGMk9dRvqrzQq7aUnYl6j57fp99ldBmp8uvH4JNPJuow1
         ZnD8NiJRC9f5j5G9D8aRxiFd01fdiL31pp2vdUKKqSOpkXAefR02+/SubKkvMzFBeQlo
         mHuuMGuWaGmTvEtRosxzZYLpNmyPP1sXtnbGYy6xO/pk53KP91BeymtmJivhOeAoYIXU
         5Kd9CejkHgvyNJGPNdNJXJzewiD9YjxnS4Mx0zssTiaFPvwQaCUUpYWX3tXkRQd/khkU
         sFaFsMrNr/GK0QCIztcJ23b3m9FxSiKAkQiNe9EEq4y7/qjeeHKc6hwgEg3bffcU4JDg
         5Ydw==
X-Forwarded-Encrypted: i=1; AJvYcCUUMW1T/PX32iZa6hUlREeXW0clvq/qLF3zfrzoVQFMBWP0LhaUH7azxDXpc+ItBGL4eFtDd4ZPh3fhdA6f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52XyIWHGO+XAliIRGHUvZbjz2tx18LVJHevqC4TSGxfYl1/Fa
	DwPUk3SIFGIJvI+4QfrHBO8yjbvjLijqWq6VA0ES8Punto/eCslBilCUYn/Gbpg8Kih3oGT3LM7
	nE5V4pFAwdWXh7hf18pJaPCbqcT5YJR3KJaXoc35vTEOwP53G/9+3LaYZP/2v14GrnvK4
X-Gm-Gg: AY/fxX56R29euec5h198hCmB0RKcxxLn6q+y5cgO75HtD2TAY0lSOYRH5orXUR9R/rU
	CsVBm4342eZUVt/PhhHh4Dd80KhBAtYf9GwewSernslQh1YRumRmaOzFgT3GEq1BYgnM6UL5zf9
	GVroXtkUlDjKz57Fk18BOIPdHtMdCwMbG0ObLBrtVSCstZWjYc64xyGxHd2/iMW0P2f9tg4tKRA
	WrW6CKxgh9T/su6RZb6hk4qB/S0ctm5ytIaHdhivLgTZguIHa+9cGlSLqxXXmAkSAhauutsRF/b
	GqF+pxJxnY+npKVPHghgCk3uUOc3eSE+ZNp/Eeso36at8DDiMwFn0A78CsEgDBQL5rk5IY/K1Ho
	RE0LWOpI6FmNXTlGvpTE/H6MscvWta12lkwX+Z+9DjFfic4nvMwU+evoNaSbUOt7zqLP/0uxT5G
	Tm6hqwzkh3Sm63ft7m8aT7NQQ=
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr320279766d6.35.1766579020364;
        Wed, 24 Dec 2025 04:23:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGh0XS144YHN0KqGLh6kbJ62tw+ca4eNND0XVbMUMIkHFtTbkRRfwuu32QAZyuHdcnFOuCog==
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr320279326d6.35.1766579019913;
        Wed, 24 Dec 2025 04:23:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ddd39sm4857503e87.42.2025.12.24.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:23:39 -0800 (PST)
Date: Wed, 24 Dec 2025 14:23:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Message-ID: <doohnt42hdq6oxw527b23ycnbb42l4srbkhuejhvnhnspu4vde@qoqqalagso5x>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
 <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX70Ay/71WYknM
 PxN28b1P1E6ulXbtKHpQNasaeu8edqFcdRtw4lGRbZUqleD92a3FYsvQY8mkOXOLfE2pSpDrfYf
 2VL6vk/A8wDs682dQE41wckXFuryYh4o6eKd4yJinZ3oUJ8O7ahsUlZEQtey3bgWBtnnEj5YKN5
 DAcYawSvQwWUy6HJnnv1YUmAhSjajCxYPPp72GgwlASVjm/ee5nSCWDuRsymbUHLbdbVjUxr88/
 xINdOox0EGTw081cvzhYNBdipzbF5jqXXRHCCwj2Y5lgLrIE/wfP3qCwGUyF7X7cKJhGISRLpEO
 PVB+ywA6Aq5SHB0DzeYjAN4/BcmLIsunGVPMl+VrKGYr7izuFz01QKlUcXmqh/ewcFMA7Zy90ez
 TZ/ptLTDclecgsaoHwoSC5DAFtSiTyXF8nULW/Bmt1NnJWHfilw+fnp+OU5zPVnpAsHko5qbLPx
 N5AzSdHa3VUGdATWouw==
X-Proofpoint-ORIG-GUID: pJwNqaJTbsXGdWVUMT23TZZWxyELR3lK
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bdb4d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jtJCHLo7aIGmxyxyT8UA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: pJwNqaJTbsXGdWVUMT23TZZWxyELR3lK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:45:21PM +0200, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node and mark
> it as reserved, as it will only be enabled in EL2 overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

