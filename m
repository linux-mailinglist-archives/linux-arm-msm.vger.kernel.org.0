Return-Path: <linux-arm-msm+bounces-52639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7F2A7321E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE002188CD61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D4D213E83;
	Thu, 27 Mar 2025 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXM6KHRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F12E2139B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077604; cv=none; b=IBVUyNT9TK060tt2hr/wCubbzLDMw4dwG6JeLfwlG4awuR5714bTpgRuoYtWvpcOIJNBv1F76g+s2ShMVSKygn5bG4xI7LI8wpGMtiuQp2VVlIXRhhKoj0qIM9esIXD6Rfn5q3PJl9P8uIHL9D/AHZ8MVirjA7WOCIVJ/LxWGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077604; c=relaxed/simple;
	bh=LAglGtaGdv1Da+AjfgQ5kbIFyqZGUTUVbYDRQIrV9ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qySN07y9ab2oElp34coKf9E/cMkwn2jE/FmpCx/IGkke4xImk4ZQQRzrvdmOwt5Ygv7C66CjoooNp+GdJMG75nC+cMXId2vTcOQd0qqJSlexqE5AT+qZRopndZ1qLL40VXcqpy9JkAbaYFQKHUAbcsBPPpT792e9McoW/jkFlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXM6KHRr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jgMa013285
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7q1Wh9lhgxTjHAlCh3PBu5Ah
	qwhELU5OX4K4QSMh7WQ=; b=kXM6KHRrF1GvNnSPyWktWuZHlwYgklIbzUEKQUKo
	cIX+ahOikMmx/LzaM0jggMHXne2hzRCjmt1sK8tmKE0xdHIEN7LYRJPuVViVPK6s
	IO4aKK8otjhmf5DlpVm8TlaEqiS+iw+BJIK8BaDiSh9TacA1fyPR0DJoB9hxUUi3
	ikkk3YFTVTQplHTJ7n6NbBp3Q+C9clor4aftJ9vGdH8bgq8YGxRUuyI/JgtZUWBL
	RL/BmLdPj2iO9tX2vLKKlikX6+3hb1aVp+T/MlIyx1onmSnReu+x/LqVKETtsNb/
	7uAUrSZ0t6i3SoJfkjY1AskphZCreaj6oLkiM1uDhnQmSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutjvj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:13:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54767e507so155554685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077601; x=1743682401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q1Wh9lhgxTjHAlCh3PBu5AhqwhELU5OX4K4QSMh7WQ=;
        b=WKOcRoKhOfa1c7CBYCPYAdqkT/+w93Fqa+Ycfw/J7Snyj4uu3LC9H3ATVT3N0FpEaJ
         w9jNSJMA5F6Gc+X2iNqeYMt+9nsop590DgboA9VZsOEbFxrl6OZnRE5nUgfOvRv2fXsu
         zT8Wgus5tLnhdXGS6/wmmcdnCcYLRbKHCiKDKsI1f79mW1FAz9QV2XSRkRlO5+xglsBt
         4TLCp6/QO1vwodTvEteftYOiZniJmPuXw1FedJHZBTreX/mfkgWnpACALIL10042IlZh
         3zhaxVksVgAfqZws6Q7IJUZY1SWA7QKfaW6HnVT50AG49rgw9izMPOOUZRf4t4qs5wWM
         cM8g==
X-Forwarded-Encrypted: i=1; AJvYcCU4kcwYdQFDcmCgHbYepon/oCTZ74xzAouBgSfW8YB2FZ3trRddSQbO1GTkWMiSwttEJDnWBRH8LNB/zrqK@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLRrPko/ELPbn0ntinOhYiMOmwI7Zrlt11dT7bp66FXW7jKyP
	Goys4ZCrAqY/XhPCiQKi5Iju26jojVRHG0sFe8ACX6NBjFvCGDISM7kVgz8p86VDVgIK+jLouJd
	CBwKyMpomzdDTB0unT30VDD3/TXXvYa7UhGxsSjCu+7oMZBP8uDsSYjQ3p2150viu
X-Gm-Gg: ASbGncsWqbu2MJwXDlYL5BdWap7GJegTH7th3UIW1KcxUgfuXGKR2rnyfQ1LPrAP8yx
	p23UIQcMkfs3tK9RzF9Aa/PD+L1Y3olP75s7wBzTpRQ/fXOBrEbZZV9ZT3uYymO678Rpfxb/ZPo
	o1V5n7nvJrbI/6/ycOZc6uFtYqWcmmTVu8Gfv21JE/uU7CfEcKQAz1msnUSreSlKGuVVoIVhJ94
	q3a4FfXJu80yVZMoVOiU3sfstHX1nML3x+My3sDSUm3s+3af8IW+HH+qgIuEoJ5T54LlTklXf/X
	w0R6qKJtfdztpzQYU/Mb8/OkNJjrLw5DhGOgqmrqM0Qdcm/XvFs0Kg/3XAXL4W35IB6fM0sJNCs
	VzVs=
X-Received: by 2002:a05:620a:2453:b0:7c5:49b7:237a with SMTP id af79cd13be357-7c5ed9f545cmr411694785a.19.1743077600845;
        Thu, 27 Mar 2025 05:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2G1otVcxZQgzWqoHR02ogEilR46Q9aHG0UlLtUkpR09V1VQnKzivVt0fvho1i2HW6arEnMA==
X-Received: by 2002:a05:620a:2453:b0:7c5:49b7:237a with SMTP id af79cd13be357-7c5ed9f545cmr411690085a.19.1743077600384;
        Thu, 27 Mar 2025 05:13:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6480ed6sm2060839e87.103.2025.03.27.05.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:13:19 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:13:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <f7tgzuapeb7pwg6ygp4kpxoziuwb5jjcix5o33aoehd3dixcog@4nzt3tgcfca2>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
X-Proofpoint-ORIG-GUID: 1XPraoD4W8wGe4BVF6yshNIzvhTlnuDZ
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e540e2 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HLzW6X_U63wjtiIj7HQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1XPraoD4W8wGe4BVF6yshNIzvhTlnuDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=709 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270084

On Thu, Mar 27, 2025 at 10:06:32AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
> 
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  sound/soc/codecs/Kconfig   |  1 +
>  sound/soc/codecs/wcd938x.c | 55 ++++++++++++++++++++++++++++++--------
>  2 files changed, 45 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

