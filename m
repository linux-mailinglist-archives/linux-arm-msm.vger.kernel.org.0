Return-Path: <linux-arm-msm+bounces-56138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CFFAA0EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B64A4A0F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2042212D8A;
	Tue, 29 Apr 2025 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J12JJMR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968A18A93F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937166; cv=none; b=cqTANrinaskEqMgHZgbIGZaso4mosnvHBl3/e6J68pKS1tJeg8I17uJxcMB7+wmrVvQD5Z6o1NkRGLnESbYVpixuAiwarhG2H4Xn34wqdMU3dWZeMhPZ1BaLEcInu+62KPIfX3Iyl1jOL/WBs2D7rE7JzDNtO3QxoQEugFKXYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937166; c=relaxed/simple;
	bh=CAjD/KK2jdzq9tsIIkgeEOC7cVQjgSZn3t9Wd39MQXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4g++2vnBa+Fo0hvVtoR+HPbQZ7xP7CtPGLIc1pr7msSrs4AyhMZh6WI7YkONmyn337Tyakn7+fNriYESBZ4AVR9xbPd2XeIlV/RJiHnJL/RRsHmshdCDJ1UN/QgG5Zc9Pb+ftDRqmay4gl+rZwOqV9p6Q0Zp1jecLjLLa5Oya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J12JJMR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA0npv001335
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bPriHSZx3KQJP/KsDQOWzlOT
	mChm8sjxQPQzHrr/5WY=; b=J12JJMR9Q7NMWgxDtjREBVcwp4RzpJ5+02SMlUX4
	qVgDGXteJgupzg7oZ5a0Ewx2671aEd1SzhiO9/H8SGrnSsAstywaK+KnSTQCzMKm
	OzVftgwcJoCv0VCRLjooCp+6O4EDafmLLWX51ffh7cYkAScLWyaM0ZePtOWz8/ya
	Wj6QrtpRz0croBpfkTmRT63iScrCDoUAgHAan7vVwxILXq0AbfMLgLYiACH2GKKZ
	G0eyAoprIyDtOryovl9CY5A80QgjWUwM2hdCS+PhY00qa6C9kcwh1dGR0ulSkhIj
	lnAzHx9VnmbmM2ECcHfPNQIhrus7mEpk/56biYdFgdo06g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mudn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:32:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so1006203785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937163; x=1746541963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPriHSZx3KQJP/KsDQOWzlOTmChm8sjxQPQzHrr/5WY=;
        b=Dm8zZE1qg59UWS+aL68jMxbPFeDmCJ6ekLzttOhko/NQnhEsTgOtsMB5mnWlWzgVeY
         MtSMTDacHlI/FOXkb0NTm7Zh/R8aYrV08iYxVFO5aBDxWd1OZemQL7PYaPGirivP9qqi
         LuWontyu0IVzAIcNLp4kTMeFruTrIot0UF+GTBU0iOY71eciip/2pHqdsG6u8U+PNLLW
         PAVW8CZJRCQLGusdpQczdKMyFZ0ts5LV4opCLlzO2uAcQjdfuFrlQXpAjl/pE4bTpTSJ
         T/Gr59BiFQAwdydBxIJpAbaoS4m66FhAr24vZWkmAxNejLgUxvPz0lg7i6OKETuI/HnY
         LIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYFMfq4Cis3O7ZtrLE7eCb0Ew9n/EWCvVwmR3TnBD/SqyXCrfHVHYphZM9dWUQmmXu4kPHiWNWQjBwVuy7@vger.kernel.org
X-Gm-Message-State: AOJu0YzcKtEZeNLmz+XEWV5rT8TDpx3em6m2gh5PN4lqeA3nwnGVCZ9Y
	CLyIjY9Ob9etl+/QhPwQop0WPS7jI+uu2WR0wGnIWl0OnFMTTrJf7suedid/dAHXiwLhEVEcQiM
	XLEVufdy/9Scfsy0GOGHNEPQqkN90PqTL73iHtN8T1rbnsqTBZo5T4K9zFLHWD9Gd
X-Gm-Gg: ASbGncuwhUKhi91Fu6X1SrUMXJlqeMfdgWZT6chCWOKECXal+LZHFiOV95fh0BC2cNU
	CQmvC9ybFmM+OsP/Z++HRP2C2MrjyPNYgxjwgj1M13c+bfa4XEGvldQA/CJ2hDEfT8/mPNQns4p
	4drHNL3GYoTuQ5++qEGnxkDvjHGo2JQr6ESEdyeamZOM+Uyebh7L4zbelKO+7WnSrTVrnLOelO3
	TplbEYPt9fVup5241swTMlSvMZRo5Vg3lNisnAJzBLggmrLLL8WjmaWBBWmK6QiKavPnvk8NpMr
	UGM294QJlPuTpO0/NmhRhJuglAXN8LpfgkYml046Dla5i+/8fqMinAuIjVEN6JVgKKvjUavlCM4
	=
X-Received: by 2002:a05:620a:3184:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7cabdd823cdmr635638785a.23.1745937163133;
        Tue, 29 Apr 2025 07:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWF2xshAzyNqq5fdOAsbkOvEB3opt7kXShCLYeUNW9cmZ74LfQEMRBALbW7HQGg1CwIOtf9Q==
X-Received: by 2002:a05:620a:3184:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7cabdd823cdmr635632385a.23.1745937162672;
        Tue, 29 Apr 2025 07:32:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9eb8dsm1880507e87.135.2025.04.29.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:32:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <oibskwq6gk234lu6bymqlrtgt2yd7o4qbpk46snhba66uqbupi@lwwcfmgp7bul>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
 <20250311-b4-sm8750-display-v4-16-da6b3e959c76@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-b4-sm8750-display-v4-16-da6b3e959c76@linaro.org>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810e30b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0cLWEtKbF7AIdJ2SciEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7-RUIylnLnkcSDnfcy2TOeUepegn6CMr
X-Proofpoint-ORIG-GUID: 7-RUIylnLnkcSDnfcy2TOeUepegn6CMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOCBTYWx0ZWRfX1aSSanzAs90V ytAQDBYq5czo1E4zpat9JCJidCR0Vzx6CzpTWTalNqX8TSa+MwqOTy7j7myCXC4iEjWoruNqyjE ac29ZVoCDxnkTr1v1yTZYitAiTMLXUZ2iDZrbl/JhWhrTLaYFgyHqE2GC4e2Xsf8/fJQi2+/GzL
 7NGVV71m/1jCNVV9pQQXZ2OdT63U4KRwk8Isuk1ya+V1HZIMl1wH2AnxtSXzdudFjsIko6d1fTU tVEpT1mEL2Ih5ZMLD7h2kbpX9DZ492PmOKxYM3QvS1M+MOKe42VhEZIkTLegjry2xvparKAIhMF aAfH2t9xtjPxrY8OWkXDZ9cu/0XNAwXAV0+XrYLd+trL97pY2e3QIPiEWaz4UY/bWN1JIYxWp2k
 ZaOrY6Ey8zqGin/IExt2dgUsIEjTAU/TBjLstwqM36kpAY3U9ki3NuDNQLQUPi8whr1HltJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=829 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290108

On Tue, Mar 11, 2025 at 08:02:06PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out,
> setup_border_color and so one for this.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

