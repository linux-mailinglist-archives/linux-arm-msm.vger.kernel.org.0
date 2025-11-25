Return-Path: <linux-arm-msm+bounces-83338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A8C87866
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5FF2E4EB449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777F02F361B;
	Tue, 25 Nov 2025 23:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9qOF5wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwCC8U9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E889A2D9EEC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114643; cv=none; b=i++FQkt6FFUKpcJSyisI6Ho3IPYH9yCX6YnapYJzmubCaigR4cuff7Byp2vGwTeOdXqCSREWTSKRMfQqgHU3siqprDx3gOC89Q01uYXEv8nc0gMmEaD/+X4saFBkVFm0ZT1yMCTybgk/IrDQPnoz+so4FSGHUWzsZ6jpFH2OqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114643; c=relaxed/simple;
	bh=9/I+WLBxVQ34Jv2VUWOPSxKz0/+kco6uge5FdQSfaJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Egy1kw/MitGxTfIyp/7jfThZ3FMueyda80BioPKBrerqkALUvQrQc7qAf1uyuVpZTrXOZbXcKyfMkZvTKg6JrR9BxiuhY3S6y1wBWxP0IhXqZrtAykxCMMuP46o0s0bz3nrVGU1r0O9Mj/wQLLh/cOFHwLDygng68GOJGy4176Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9qOF5wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwCC8U9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APIqVwS2650830
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DpjUEb+lO/d5XqWetRnIyO8+
	USr+7eXZgV8h6ZiGl9Y=; b=j9qOF5wz4FySeSiET9C3x97eXIqY/tQcVJvCmRnl
	bIjPtCATItbKPt2hjdZn6QmuntIlmxDH1MOAo9R//VyKaY7JniDDS4aLnnlGfZAK
	HOeTtbzBLpF7LgnX0BbLTI87gYom4cK+h1xpPXQNcmP7bIUHtC96gdJ/Jc5iv8gq
	d5ScBRGUgmaXAsyrvIDfGEAUAqxbJ9TYS9t3dYVfXaWv4CYTQvcwto/mkUZW8JS9
	kcqxqiqFXVhr6OghB3de+vNbWY5jgh268Gb9kyiXvRv3BTZE1znFgi3MM9R+Dqa9
	ITmW2a+1g6AScplMLslskbGtxguGYFEeEfm6YYKA7BrumQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabt6dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:50:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b244ef3ed4so1726963685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114640; x=1764719440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DpjUEb+lO/d5XqWetRnIyO8+USr+7eXZgV8h6ZiGl9Y=;
        b=UwCC8U9gzU2TveL5fIhdjuZGrT0Oi+36abKHJ4mty06r6xKlfAeyygVZvEfmHT3Phv
         DttWpkOSIvAHZdp8ZVbaR6InHfkv5DqSyNS/BeIiuyjwDLrmwew62nK8OoaPaUsZFcfg
         W8x0OzN/b28zO+PFQi2mzW5CuO+059nJUvbr/1oOTrJnj2hOtimreeYkOTLNJAMWStaV
         S5o4TW6sWlF+oG0eIH65FcZ3JP8N05VgIMFW+op9Vw8Ob3hJk2mKqEw7e1D3GtYokkH1
         94+o5TOx2mSfR5EgKAiX/53xE+LiaJTK9sppH/H5wdBDvUAK0jRNE1CdDJBZX0uNC6/+
         Jb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114640; x=1764719440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpjUEb+lO/d5XqWetRnIyO8+USr+7eXZgV8h6ZiGl9Y=;
        b=QEnJPth/Z2rvnMQ9ltn14vyPV5PSgJknzjL5nAN/Y+SwyASEXXa06yMCgnzTTOmHwJ
         mE3Of1yj9Sx2cHyLhpHa7CQZZcP1dFR/sEjeTgFKZC6o4p6ftBJtpNAbR21g9JUO0LTO
         Eem83M9rGTH+2pjF/hMqwYECH6irHeTbjNSOuDYy1RLpmahohuT16JuCpsZ2uBAEjD2R
         iKYfHtPdRM0zNu4+sq5jb8FM8feMV6Z8JsoENwcE3d2l1l9kl1WODPHZqSDUGLAZrwI8
         ExaFISge/tuZ6rHxVGZyfV9PU/DrJQ6k+MXQlyD5eKxWE8jlUQeb7b0vOC4NxBLTGEkX
         vJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXUmY6dxsnNl7y34gtmYWdQYo3ZzCrUMwJ8eDUHUsimSaSD6U2LK0PSypL1OmIQjK7X7bfst7LgdBrdnwYA@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDeM5t03Pus3/6T3r1ttzmvBBPTvH9tc7fTu/eyGkS3mVAYpB
	5y8mWDDYd3vhSmUak0NxermfAiJpuFHqkak5TyIJ6I0p9icviabzHDjAtZaEsf/4vt3SwtQt5zG
	aA8Y9vAn9B2mO24fQEsfq69c5cevD4NApnurlFEbA4yyRIOdEA9jLwNkQmWmpZ3y90bdZ
X-Gm-Gg: ASbGncvklkc9XQRPQl9Aytd03/KI18DJVJ219iDtiuPUfix5Rusdq0f22tK5Qp6mGXR
	4NjabzR8edFR49fKDiOZmFo563PIw9NsAXqJ3lR1eKJh2/31PnKw1jFMrG9qYxPFrT/3yKM0JpK
	3oSm0UjfCMo2nFZK6xNSh7zEWgolx9qUAIPBQEjopt9durQOZF9yuc6Q7vwqn7bC6NkU8zXNGVw
	EOxDv3lnYrwAr1jhTfMhgLUesF3tKWju6pJZVHOzNAStWL7EOCMK/634pC9DJA4y3JdldzUvv7B
	Ax/4Mob+663T5edhXtjhyeYK8+HQjbF3f2rneX5Mx+aOsMFQUDjDUrojweilIrtgNT4nXNAgoYf
	GUqXZD8BfyteKhhTDQQfN6GOEtro5fXvuqaR4b/gC1z7Dtg9VpJ5Q2MhzoQPf+2evDAEpIa0RWi
	t6tC9QI9UippURvT/YvqDFXAQ=
X-Received: by 2002:a05:620a:4623:b0:8b2:1f21:ccdf with SMTP id af79cd13be357-8b33d469823mr2113205885a.48.1764114640362;
        Tue, 25 Nov 2025 15:50:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBnTPo78pU39U83yKEF/eAZt8NiiG5KXac8B9fVr39yPz26x7dHZeyUAP6bCjxbAjm4iirmw==
X-Received: by 2002:a05:620a:4623:b0:8b2:1f21:ccdf with SMTP id af79cd13be357-8b33d469823mr2113203485a.48.1764114639859;
        Tue, 25 Nov 2025 15:50:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db81b35sm5418440e87.22.2025.11.25.15.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:50:39 -0800 (PST)
Date: Wed, 26 Nov 2025 01:50:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] arm64: dts: qcom: sdm670-google-sargo: Enable
 fuel gauge
Message-ID: <vpqzef5zggibkmfcnx7movs75s2twu5kreo5lxsss24o65isvi@yr4njzgttq67>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-8-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-8-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=692640d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EencKPdTMqCUiY1uXwoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8qlZZ1ITLl5q_8YkkcxsSTcWpzNkPp7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OSBTYWx0ZWRfXxgyc0LptXRZN
 8v4GPB6oxS0XGER7ORNfNIFsL9vleDzcSGhIMHzTNhopsZhEMNb7ABOaksR/gHsDpsny/12EcK6
 Tbu9kFqbHwCZkNufowhJGchBhaEqnVbpKdBeWXRCqRlh5tH8GrMp7cTCVenVIg9pVVM9SSf8Q/G
 thY/zvn2etpusE9dStfaHzK02i6VdiZJ59JUk9AvOY31M8H+JisJItLBvEWnCrAzHdmN0KFLtLk
 +opmXOIyptUdYyvcMRwjgTy2qmjeeMnlgPl/TLIurKWtYs9XPeDojRwWUKTlfAZd9zwqeLr17S6
 6YtGhe7zQZBM9uFZaUcEdeqYsNkHMTidGN3Z/XLwqnZvTVfZJrLUFjJl6lTIknhajlNAzo6b190
 n8dQewlykFR2O//cmN6I+rFZD2ChYA==
X-Proofpoint-GUID: 8qlZZ1ITLl5q_8YkkcxsSTcWpzNkPp7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250199

On Mon, Nov 24, 2025 at 10:53:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The PM660 fuel gauge determines the battery charge. Enable it for full
> battery support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

