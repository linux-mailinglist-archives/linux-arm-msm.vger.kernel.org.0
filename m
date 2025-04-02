Return-Path: <linux-arm-msm+bounces-53058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E0A7959A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 21:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F9C017106D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 19:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146D11C84AB;
	Wed,  2 Apr 2025 19:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBDTP1UP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CC1C8604
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620754; cv=none; b=LvejISLLohCMhc/etrzNkMleMuVKdwq31T0YWrtMJSy4XDOstUlMxIwi4rE+N0tSBtmTeRv8n5/XINMEAvMb/zsp4r5GqOx4l5InpRGknHHl+yc4fxTDPNHS2h/sq+3J5taB3cm2UTz1r5voaYI5oDHUsc66z1OF9s6t4or9tRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620754; c=relaxed/simple;
	bh=DUJSNwx7FINamTyBYdMyeNWT2agExVQ7nXIfWrce7Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XW5I0Y/pyrpz9vU8rhvsaDcl8P8+Pl3piDvnZdkCOYvIGbscciavhNHRQB61HPbT1qLKB8oOmTj7CnaEygaonSMn9L7YlnVuU7u4t2CYsMB6uKme2aYvYNQ+fgXxSFdeBReT8kKyuiWNjswEyPWpn/3D3zfOXoJelwKkWT26cME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBDTP1UP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532APmBk000927
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 19:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aNv+Exi/x+6zLqx3K598mkaN
	UBCpfHCqFlxecl+OZYQ=; b=aBDTP1UPhADmOUbn7XNTxM1ATs/b3BpxbguCZ0mG
	BTl7b614oFagq5xG2wiO8KkGXLRP+mmQ88ymN1Ubwzr4Z1UG9/j778JSNhl8doWz
	wvFcJNxxZYg6HcH0mdp7xPv9QucGji32dIlKV8/YRok2nLaTzF7/SdF3rujmTku6
	Oxg1BS31rIsIzMjlH0os1UWySW46TpOQgy41mGK73fp9ZVIDfDq+ma7s+WP0sZfm
	7zt55jBgd9hKo0yFItk42jSIZtMV8z7pF4EmJPDDn96WpbgmqJlBzDt6eQh5rJUL
	GXpvazGdqrkkaXoKIzMg58aIwfI/juc65r2MdFTHPjlvJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qmsa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 19:05:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2a31f75so25611185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 12:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620750; x=1744225550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNv+Exi/x+6zLqx3K598mkaNUBCpfHCqFlxecl+OZYQ=;
        b=n0n52TNRs5qq6XK2vna8AkG0I5ESuHkCWzIZBGS4VeciVyhACcmE+KiH/4FlsULm5W
         fk31RvYnBFjIjRjO6YijwRf5wXqwfLRGN1Zw7WEZS0g8T0ASHFGgMff/r5g3atg2IOOD
         QEyGYBuvnJJxLgHfff5uTLNV2sfEiStmvaPDxD4U409oyNdW/9C61Vw+aQr+j6bYY1Ib
         DT1g+4aW2bj1fWUBWZYd5l6sNLr0BaurnZfXTDQY+n92a9PSIjfKV+ueFuCrIaEWIjPm
         AKGoYxy89X+2rqgtmk3n5d5nzn5coBCgm3YLfZylWzSVsrFoGqxy143BzJHTWHHdfpCw
         d8dg==
X-Forwarded-Encrypted: i=1; AJvYcCUNgsCdLifFjyRpwVB2Gz4lxwm0++sV1r+KYiOwvNKa90d9vcDSXAXOSDViTQnHVITD9rmBt75C9SV2Ce0X@vger.kernel.org
X-Gm-Message-State: AOJu0YyExk69wT8IXlClInjqtNYhi0W3mGW9ABU7MHw+uJjq+EL03Wmg
	nv0zIYj9k/FLYiT21k78wYSY4Lut69mq/gbZAPnN9oAyJSCV5dyFfiCuqNcV8OpKyp3eM3OQhr2
	TtnytEtKPh08fzsj3i4kjokVdcdS7evHDG+Ze+GsX2zUD2syZv9yQEuXUSnf+ZD2X
X-Gm-Gg: ASbGncsnkwrufe+osZopIRZxiC/GVRuaxcmSw0G56q49DvekJoml7yh+jCjMWFKINqd
	GE9uq6XAgxAIWF+3F/EClZAg9ru9nC+GL25HnTECmYXrsi8w515sFunZdEf4xiG+9u4C3qxo3T3
	raDuKYq+IMUKDBWzG7pw8g9QDxWj1uIFwCINkObPlhPuzdu3299IBb+luArgEn0xJpbqScMfacx
	RRcFDY3ujtGIfEnJsKj5/TGgCvQ873sdB72WROdTfL+ivo0uFFnGvcYfEzwCMh3o2eEHZbsGK4g
	M/80VfynzJKv/VBBydFWvynhyYPnqBSxS4BXivznL83w3LfvantM09QChn/exJtY7H1+IYdIZUd
	xCxA=
X-Received: by 2002:a05:620a:29c7:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c690896fddmr2672064185a.48.1743620750155;
        Wed, 02 Apr 2025 12:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8J7P7HnsNUJiKk+d80XC3m2q80+v0m+GfXwPH2siZjMmkZCvyDbrkLkhIfmK680GiWDm+lQ==
X-Received: by 2002:a05:620a:29c7:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c690896fddmr2672058285a.48.1743620749776;
        Wed, 02 Apr 2025 12:05:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959fd16sm1753250e87.215.2025.04.02.12.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:05:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:05:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Message-ID: <pqmol3quk562bjwnwyvtlzgukabl5rc7uzmco3b2ossrcn6jsb@kypjeag3zrh3>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ed8a8f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=D80HWN4mW-IyzX5GbT4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wcNawz0Yl36UtbWZo45rrve59Md53tWJ
X-Proofpoint-GUID: wcNawz0Yl36UtbWZo45rrve59Md53tWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=660 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122

On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

