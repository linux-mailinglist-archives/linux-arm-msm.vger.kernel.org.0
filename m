Return-Path: <linux-arm-msm+bounces-83671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6AFC90449
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 23:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 448D54E32D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 22:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F2230FC16;
	Thu, 27 Nov 2025 22:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFXqo31y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsLD5wLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940D265623
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281343; cv=none; b=TPuQrLop0y0yZktMrKaFVee/Slu0c6yQl44ytmUy5Xsl3ly+0XDVwN8gUMc2BFUlRsPrNBo7rKqpDoHlazaIAXWFXrs34N0HFGoYEQMTP43DgEc79d0ynLAIPtHE7A0GuWGaGmFoyKVLZHP1u1OQMk6WX8fROC2LY/Rzwy373VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281343; c=relaxed/simple;
	bh=NIeDW7sR+8DutoT9zOSuoLoQCerEb7JHgIQGMvxDnK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGCvZ3+7L0yShHEbisz/GBFS7yCCuhS03tXqo6hd0Pb8livhioAzFHroaBasVl/84PomJC2r/SZxjvUXFEVxPcg8ePZfkQg+PhR0pcrmDQrIJla3/SaacSS9B2uZyow8GM88zLUnK47IfYBon6DJPNleRz0JbaK2D82V7odJ+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFXqo31y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsLD5wLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARJNkXu2014076
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 22:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NhAtvThchhqQNyKp/Rnt8jjW
	hnuy195yrPhkYdxR5i0=; b=eFXqo31yvoA8f7U2ZMZl4VuswE4eomnYtOA06Zi7
	HVKMcJjBv2Gc6Zj/UBtNUAaQxOE1uVN8x7Z2QTe2cQD+5TaiP6+4scvW7Qmk+Ztp
	OHNPouY3Y4YNDGThg62cSMeNjBU6l1zxOahC0tDzcQdzsmMWJlpoLnpSXSWd52iw
	UP5CxUnsMuObIYFQvkKyy/zrZLw5IFtezZALskXnXbY0KaI5FNfuFkebJBJ7OkrR
	HWNVsIDNElAyNPWzGYmwUmgBMFR/PHkiCKW3S3vgdj5GQD41LTtmiq9o6/s6wwLz
	IL4k/cnn+1M+lCJUNrCrWinbv9mVHDbRDp9dvRH4Q034mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61sjj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 22:09:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so136573885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764281339; x=1764886139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhAtvThchhqQNyKp/Rnt8jjWhnuy195yrPhkYdxR5i0=;
        b=bsLD5wLp3qlIucWn4d0yTbLkxj4rha+U0ixmrS/ZpdUM9yoJucjdAkQFV04WXk9uGu
         AZcfY5YMMgx0qPI9lItdhJzaXBYbKj8WqDGLaD1UHEM4puHiGQol7TgfsjpbJe2E+9PU
         eSsSRyNN2wOFYFgzDN656sj6cTDzqrhDXSh5zY5lGC42t55dDsaNB04x21PopXk40WNM
         OPAfQf73LgZsV2n2Gtsqsx7rF0+IllRIANJl48sqjsX+iUh7Kg0RPyALPnAbyAbQ20ZN
         xXCKG7txREW/v3BXkMfVmcOJIUYvAW+OIMeHMtYqrodjZBdlaBrpAy3fUQfzYdvwbMjo
         /e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764281339; x=1764886139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhAtvThchhqQNyKp/Rnt8jjWhnuy195yrPhkYdxR5i0=;
        b=U+xO5EsBRxBcU1ZKHUxA2k6GHEHI/hv2LaWg9Is27l7ZAVdyGj38FGS/LUbGMeA0Hn
         zJ5D15qrv3jkKtOXw3jZYwKApRo2c/0HRXDtqhlLyE8uD4xO8miExhLs0A/Yp4HWnQZS
         LQwaQSJf9l/beXSfPHeoAU5p7EkiBBm9Rbg70rgyoxzWTK0Ehp8GOdEBHpiFK+yX12GY
         Few27NU3NkDt3aN5Ntu8GM8sU/YwO6Lq+ZGn2tp666X8HgjrUkhKLYXUkvaMaDxgKOx2
         jeLZxRFg/cmbfqJVpNsTcU63noUF/HpEcIf3Ve8+kszq0LZFVDimYK5nP8/POQrljjQL
         BD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS9vHYYoe71qqbgyqYCBO7D6qSjCGeR1khV02wM4gj5VJNyCU6tx1DKs/5Vz4yBcA/LsO9m12amUaaO+ex@vger.kernel.org
X-Gm-Message-State: AOJu0YzxV0OI8yZlCm896/eZ0vG6fGvYT+xAzKUp+gfXkkiPh7Uc8Btu
	M7sPUpyaOTATiVONULuFOYUh9hU+bqf1xTszv4TzZJyKeVJISbf7HEoHJLcZsMrMwTUzNJ2EF95
	r7qxbnptMmTFdY4J5KHwO57jZaphaq7Q5gZahAjqC0hqduLC0PDiMTGf5kHobstF9OUHNi7XZpS
	G8
X-Gm-Gg: ASbGncu31r9T4jNOWV+ZtNSrq2kCkbuNCkTwjkPqTM03iACxXrTP/JZf41z9Nl19aUw
	corZq/v0QQ9zmRJ17X6avzBgM8s2GpVV7O2CV/TDVrT6fuoWgQZpYw999hmepO393AcyrsXP6aL
	vbIlIOTIcAc7ZYXYBwyVa7g8sssso0UIlBJU8u5F2NFzJGT4x6Rzw8QoLt7aVNb6C96whHrCQNy
	cC8MgvVJyDvpesDJNeFK9brvMAvvgmPkmtkvE5EL+MAgOnqoT4fNHgxVHZWpfQuDlqo9O4XrLb/
	tq3vQQyCvNvwgbhF2VxZ44m1ijkHOQ0uu8YiilT0EVrBTeN0o+Wodkv9BQAVQPrUDzStDuW25x0
	Otk4EDlR70ZX/hZZh+JtpY8oc8tPSZ8LvQa47PotcQEJR5qbTwOMd/tdOcE5vOUFpw6co6VV4x8
	9b9v82RQENKTzvPRcfZ8ePO9M=
X-Received: by 2002:a05:620a:4805:b0:8ad:5014:53e3 with SMTP id af79cd13be357-8b4ebdbcdefmr1543808485a.80.1764281339286;
        Thu, 27 Nov 2025 14:08:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQAb56l9OVVMhfQpDC/4iSeGajYoILCeOgLn2bqtmKWHSq6kbrPIHOZAaMz3q9pQC8OAL6Fw==
X-Received: by 2002:a05:620a:4805:b0:8ad:5014:53e3 with SMTP id af79cd13be357-8b4ebdbcdefmr1543804385a.80.1764281338728;
        Thu, 27 Nov 2025 14:08:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236dd782sm5593281fa.15.2025.11.27.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 14:08:56 -0800 (PST)
Date: Fri, 28 Nov 2025 00:08:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: shared: fix a deadlock
Message-ID: <pq6di5nia7kcdiqsitcr6p42r4jyejzlr4wzqsmz3hes5igcy6@3r3inhvwozga>
References: <20251127-gpio-shared-deadlock-v1-1-a36a650c2db4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-gpio-shared-deadlock-v1-1-a36a650c2db4@linaro.org>
X-Proofpoint-GUID: -7nKUXNmwa326lu9lB09v8vrXKhXP57O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDE2NiBTYWx0ZWRfXyv+81CwwTXBX
 T0u3kM9RdP6d7Yx1NuV3y4FUwRWytKoUSNyqhhsCiSkQJ6GPwcW85L5VmgH9p3vG0K9ia/mvdpa
 aS0Xo6mvsYX+YlPNpfSduflD+6GES+i4T7/E+2yc5KCq/IlZvo6l4Uz2jLGO/1eQD1AhSogkbKd
 g4AWRVQV/vMHlVuMoP4SSTXjjoVocG1AuxyVwOA15RakP45bmmaiLsuuLqEVV+NKmOwNlIr77oN
 5H6IbPIsjbEAkVADNb+cS5RWjSL4m6jIocD5lLsp4xOWPaYLpdpJE28Dcsgik/v+gnwad+lShMs
 aAdufL7DT+V9pYrXO+i6QjHVl1DHA8g9Kkz2fVGfX0iYWp35sCw6v8upg5SoLOEmWO3xG4NaXqj
 zXG9LqUOsF4uySHxbaGUNOY3m+jayQ==
X-Proofpoint-ORIG-GUID: -7nKUXNmwa326lu9lB09v8vrXKhXP57O
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=6928cbfc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jZQzvE71K1B4g2o7vSQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270166

On Thu, Nov 27, 2025 at 10:53:56AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> It's possible that the auxiliary proxy device we add when setting up the
> GPIO controller exposing shared pins, will get matched and probed
> immediately. The gpio-proxy-driver will then retrieve the shared
> descriptor structure. That will cause a recursive mutex locking and
> a deadlock because we're already holding the gpio_shared_lock in
> gpio_device_setup_shared() and try to take it again in
> devm_gpiod_shared_get() like this:
> 
> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

-- 
With best wishes
Dmitry

