Return-Path: <linux-arm-msm+bounces-65088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C01B066BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D149C565A47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3524E2BEC52;
	Tue, 15 Jul 2025 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqoYeKB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5415B54A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752607352; cv=none; b=uDB897mFO8+howacgs69yNOH7iPuhjF4l5HjMEVMKLuNhU0aqEpi0bjQUuXZJ8Jn0KhGRJpWv00E4cqATsZxiTt95XKJuxX0jSTQqD7GjwNDjMR2uxDxUriBglajeJRHUp93BgyIFE/0rkAOrjZJntYvTENUSlAWjLw4t4y9KYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752607352; c=relaxed/simple;
	bh=19KvyjqMmU2ow8TIsZWBmVsN9hw450pUe9rTmQEBA3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWnf1oIXfadEvmdlJWwIB8PuPu3U2E4ZVdv49TAOJLUw7O+M/lF8j4low+slSu0xF/INBgR+GjVllqsQ+Y6XYd4IzZMLIlkj7sJ3BJ/qadr7Ze8e9K49uZUciR4cWPvNstghacT/q3YswzZls8nl4tt7Zolhi9REAWyC/r0cW/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqoYeKB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDJCV003430
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 19:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zI0oX333gQStniWEomZTauYu
	g/oMZm960vNJLdTExhg=; b=bqoYeKB1hGzW6afVwzAHQbUcOyf3IMDjhWdfH0CR
	a0aJfMWo+p4OuJLhEuUKVuxJM0a97OhTG/hsWqRiNz/2oUGu+DWusCbB78P3Cxe0
	rhPSJLCRkbwuORdiAb+nZrdoTNoQU6pFb/WSRLlvjJqlHm64pjCCe1HXBEbqWWCv
	jaKgHzymBrI9OyJ5fjBkB0vRUoi3o0Zq1xOwARmE8Qq2WWpumazYl9zprk1Q8s2+
	Hv3ju1m99vpaOqUJb795HmnbgUhDMsGrCKqyX7NHHEw4Ki5PPPsW2oB5l+0Cyz1q
	htv1D8sztQNrLHhgfdhnbWXHzOJbKiLNRM+r5HbF32e95Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drm999-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 19:22:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e095227f5dso558919785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 12:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752607347; x=1753212147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI0oX333gQStniWEomZTauYug/oMZm960vNJLdTExhg=;
        b=h6iUkDDOUiVGutOvMyCEoGv+O3gykY9d/mzfu4okwrrWvk8FkbxEkiBIJy1Ib+PAvn
         gIoG175xHZer5IWLWx9rWDyN3eQy05x9+getYN66Kyy/PBohkgYQ+KNmhGWwF7qfUVXh
         OX9ejbvW5ECssSVamiut1G2tNfyLkMnebI8f9Xkmtzw0J+EP4VeOyVR0v3BTwXKpozpM
         vv06XbGDJIkj6vYyC23yLFVUxgrCn+0tYWRDo6wiunLzCZyNtQ+DdWh+SibPrCRIx5fX
         79TS+AGjlfmgft0gauwHahrbuvHBHGHGmiCidQkpYek8aZWhpqJpYNYMFGF/dUjI9nf1
         HMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgPtjGK4A5aUd3PlGoBg//ITN+sLC9AzyUzqkNL+MFYy/dmpptEombArxtiH5qeS0jD4zXxZfTCpdJB1a2@vger.kernel.org
X-Gm-Message-State: AOJu0YzEX0Ub+htWPB+hY3EZGUyX5HHm8d/ceHUtOjw922FKLytmOU0z
	/5yFFavXK9InNhpnweuZ0bf/3OS5fpdMUspU2pYgQk4dbGqpvB/DxTugBxZaOWNi8GcDhdROmEE
	djufaKB4vBUtbZdQIUoeh//uFu8KcNbVamarO5RP2lv6fjy4xd6ZuDD88uWcqq4Kwey5r
X-Gm-Gg: ASbGncvbRjHxrw1goB5n7EeDQcWVWRp9APzxTVq9q1WwgueGK0KwFC0fdw8xoDLPte8
	7CxGRy8thqkiImZZYsDtoWTcAhEbAIaTt2/wEhUkmW5m2Wgx+UwDsle0fcrn3l8Ho9n6QrlD/Dv
	9IvqESgiOSk31YKp76WB9zFLIJ2r0f5HpiFM6VOv/roz7Dhk6aiyUuWBnItz5hogAYkl3GzUjcM
	2g4XdN6X6qIBOKTzAV/krVSpqLYKYwjzf2J+wSZa/OG9N+92kvu4n1A/xqG4F7WSfQMMlfj9JtQ
	mpIWRsf/2gulZprOoDbrfUYn7/JxaQXPQh3sRFd7XjcuMr2Mi9L0ijHWFBuIMdkkuO16ju3goDn
	+SMu8+ZzoO3h3B6CUrKu9ORk/P9NQ/0qKy6ztPayKMfgF5U3nKJS0
X-Received: by 2002:a05:620a:2992:b0:7d5:d0a1:c907 with SMTP id af79cd13be357-7e342b368a3mr43517785a.30.1752607346973;
        Tue, 15 Jul 2025 12:22:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyvyU8q1VztPYAnznpjtyu7x55IjSjmKm+4cZLhYOyyteqfz9dyaEsAo3ZVngVC3/SzLpLbg==
X-Received: by 2002:a05:620a:2992:b0:7d5:d0a1:c907 with SMTP id af79cd13be357-7e342b368a3mr43513985a.30.1752607346476;
        Tue, 15 Jul 2025 12:22:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a0fe70bccsm1067203e87.30.2025.07.15.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 12:22:25 -0700 (PDT)
Date: Tue, 15 Jul 2025 22:22:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop
 nonexistent hardware
Message-ID: <uvw7usijkllom6cox4fkhrxpckqf7gk65b4hn244hpmj62utyt@zlbxwwmj5t6u>
References: <20250715185636.21758-1-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715185636.21758-1-me@adomerle.pw>
X-Proofpoint-ORIG-GUID: 1Qs-HVkzcyCBkYhXVbY8pFrKObjNoIWw
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6876aa74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=9pW74NbYAAAA:8 a=e6LoFHyyGpLHkRjQ_EwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=67o8LzlnqLyy2xoPAWJp:22
X-Proofpoint-GUID: 1Qs-HVkzcyCBkYhXVbY8pFrKObjNoIWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE3OCBTYWx0ZWRfX6YfgO8zh2Ykc
 Yswl7iCMuyqZpE9J43hVombCkU5U5k7R8+Jm1aD3P4F503indbIG/TGnQ3R8hSiIRgNgREFu/df
 kCeZoVW56Ncyc5J+HRbtHrYmZe6gdvJ1+Fhsm0a2ernjpWDYeUQNkGGxeqpPeRDdzObBSvu5OZF
 DpegS2q4eZFwaUCn12frj4F9aQ9y5i+lJzLGr/QLEsiU+GYweqEtSZI4GutT4eWXWx0r0Q3FTcl
 GAdwi57CFeQUpAPPJNr7px2NunVPx+JVF+JjRfdxu0r4aBGYkTISSqO/RLQb6qToNicwsgSFT8W
 RO3SzthbLaaEsg8i1z8JJVt+bUCyKoHFaKA+iZQuZ/XiooXCaqezrVPAG6uKat5d2gMa3kSIGhi
 xQUovG+3cqTBxVJuObBFq52mK5TQhwxjOtrjWoM8kNWrjw9wbZ/sN2xB1XmKOZLwYcDytYB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=873 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150178

On Tue, Jul 15, 2025 at 10:56:36PM +0400, Arseniy Velikanov wrote:
> PM8009 was erroneously added since this device doesn't actually have it.
> It triggers a big critical error at boot, so we're drop it.

Might it be that there are different SKUs?

> 
> Also it looks like the fuel gauge is not connected to the battery,
> it reports nonsense info. Downstream kernel uses pmic fg.

Separate commit, please.

> 
> PMIC fuel-gauge driver uses mixed stats about dual-cell battery,
> so I combined it into one.
> 
> Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>

Please remove empty line between tags (i.e. between Fixes and SoB).

> ---
>  .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 95 +------------------
>  1 file changed, 5 insertions(+), 90 deletions(-)
> 

-- 
With best wishes
Dmitry

