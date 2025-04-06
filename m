Return-Path: <linux-arm-msm+bounces-53322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD05A7D047
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970BF7A3909
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFFC1A9B29;
	Sun,  6 Apr 2025 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Me17cOZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C271A7262
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971328; cv=none; b=s0YtABL89EGFnsatR2XC2Az8vRimtt6HTCbKl3sqIpGFFTgKxh7czCbi727nPV/1sw0eVObKFo0tVxROirYgVpYg+1QC/aIiDzNugpc3BDy4Y67r7IFDa1zwGdOnXxgBfeTok/hTisA7bsOP2AMAa38+e92vDBwq5axmK82W0tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971328; c=relaxed/simple;
	bh=A81uX95oMFxONVvNrWH5nS1mE3bpiuEpqGQpMugrdLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pk4rAgevW2j9o5El2cr2EeK6bjBMkzSZr1Y9LGpERizg/VPViE+Fd7RHWwUdd4KDLgWvPvrH4OZM7jHtjDBXRnMIlwBFy+mjrNKhF/69bSnvgIm37jpA80DOdNJH4q33Mv/0cIC39l8dfEt5oSYCRiiPiYQaGSvZlBWU3+ITids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Me17cOZ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536HGEsP008866
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Apr 2025 20:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9hEZovZtqofwawxuXtkqvN7
	REpxq0I2vjbNcEw+6tw=; b=Me17cOZ+W44KKYp4BURhucz729i0wrQN+hJZ0cLd
	n5MSiDSt0a72VZOawUP6KSAlOCRT+UVqdvH7UP+uWJ519NsX7mni1nDWD/SnB7o+
	ZXwyU/41WjOduRVXz7tSMmNYCeLyAHx1kO5Q5vg4SZHbTOdVoSi+SW4pHKh8+CDr
	E8sG24p+5WlpXzcIXNLT5UdGwXYdoFU4AJ+CFilDM/xc57PIiVotgZrvgch8Lg6N
	7JW6QukQZaUppsxwmS0QF7XvHaW7BZyxLokBW48+TMLKUmfvoWxV889DkR2ADMOi
	xTIeA8EdmWDqhfXcd2sfdLncd8paFD8Hj7LBs6zOwSIqMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3a9fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 20:28:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c57f80d258so1274020085a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971325; x=1744576125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9hEZovZtqofwawxuXtkqvN7REpxq0I2vjbNcEw+6tw=;
        b=lQ4+Pe1lA4v1CG1CYh3Jf6oK2jlOm0rOkhxFscgxtnMFuBdieudAUoK5qaOrtD1xkK
         d495M56XQ7zvlvLKEc17/6ZcGTBpsuz2Ex2EB7WywZ4taZeGF0cPNnWyhtfO8W/+GFe8
         to9ybXbknsZZST0sfWQCjPW1tLM6OXuKZoAv9tP2WxX5rMPKmi7R4sSiR/hqMPu5kpfW
         +zUV9XrBRUiUuzO5yMm79SMlBhIDvMYmEP8Hon/oBgyZpdJ2mxwZa8kVGW0xhGvti2z8
         9vLKqT/JZm1O3Z6YMOfVcrtRHWf1+rXapCBrqo58JSkR0cAngTIkuTcVwMKjbf8PAVW6
         KrLA==
X-Forwarded-Encrypted: i=1; AJvYcCWo6m5O/x1Wj/feFY7GxSZZLnru/eLCWIwIT+ZXbQbr5KXLPc7URNGfJkrP5OOxkH7wqVpg1LavYJhee4mI@vger.kernel.org
X-Gm-Message-State: AOJu0YwveXeTuntrAsS5MQ/yEmw5VVWoDRqaOwGmHg4W31dJXljBozG6
	xpiz5fxC9TiXb6O8GUPFrE79EiEvZOAAD7iiAOaBIOXS2YyJ4BskJxKOj650r6e1qaHHFWGNCEJ
	u8HquLPwElLnOsqa0QCGJCsp+9ZPiXS+jegXJqbbfJ0q92rXXyUMC4IIjkBQW1kTB
X-Gm-Gg: ASbGnct4s2q7sjv7D72EqEqvROeZ9oFWmkgdNqbkPQq0QR5/SuV5yqOp1ftatbuhYLj
	U+zh3WVtwKsuQaySzclRKBtzNZTGPM+4gPdbGfSy4ZuhA0Hz9tXKl4K+IulVmVr8yTcy1LiIPrB
	TKb62j+fRMEQaPzP6YX2husHrJI78kukmmJqPy5XTFl4iZLgoNevhkDOW8RSY2Tm17pd8Aihk2i
	Xdo+sFZRMB2nNHDQa4DGhc/YQkkRgs7jtUsZARp8bs6uTrr2Vvi06ggNSry2ysyDDCVPE6ARIXJ
	qFdxbWbSi9CnTSQNc5BVJAm2gcAGlV3EqiKsrtOZjrXs+w6U2PQLvztMeB3z0QQfeBmDPxWRFsQ
	Dai4=
X-Received: by 2002:a05:620a:462c:b0:7c5:6b15:1488 with SMTP id af79cd13be357-7c774d14db2mr1237923885a.10.1743971324940;
        Sun, 06 Apr 2025 13:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9UUyq6qkkQxOWD6CwrlpfJ5e/PYEEP6vNGF6p+AStqeIzx84JWJa26DKizvrPqVPj3TjI1Q==
X-Received: by 2002:a05:620a:462c:b0:7c5:6b15:1488 with SMTP id af79cd13be357-7c774d14db2mr1237922385a.10.1743971324677;
        Sun, 06 Apr 2025 13:28:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab4cbsm1076647e87.51.2025.04.06.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:28:42 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:28:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] extcon: fsa9480: Fix wakeup source leaks on device
 unbind
Message-ID: <gwedkebgf7zq3xqckvk27m3f4dabduhwtxgpivy2nl763rrlzp@6elpflrqk764>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-3-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-3-8873eca57465@linaro.org>
X-Proofpoint-GUID: 1ANUFnKKVc5bPU2FfySiNRcGxELjZjFX
X-Proofpoint-ORIG-GUID: 1ANUFnKKVc5bPU2FfySiNRcGxELjZjFX
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f2e3fd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=161-1wwXmLm0-wC2vyoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=693 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149

On Sun, Apr 06, 2025 at 10:16:41PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-fsa9480.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

