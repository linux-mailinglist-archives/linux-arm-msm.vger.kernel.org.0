Return-Path: <linux-arm-msm+bounces-83335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC45C8780E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C10A343793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32C92EE274;
	Tue, 25 Nov 2025 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAQ4+Bzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCev0qpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459B2DC798
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114510; cv=none; b=clIcnzbDZbM4EC945Y4jPin32c3UtGP9BMfbQ6nf7RTGW0Pw1wLHGDa+n93W9Ye3mVzbUqkbwOhY8P60s4he59djbrW8PJrcN7TNjgDC5h5duX9Io89/H3s63pdLtJo3yoQ1qA4cBCd5EPGaYtRECEPbVJh1p3PH5bo1RlrcUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114510; c=relaxed/simple;
	bh=1TXfVPlixmyba6i4iq08P8vC0/duqILVROJdsnsxVr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGG25024gVbuzYARrLiGlp5AbWeybZWqz/19ERX0AhUO4MPsS/cHY1o49x2BAfBkfirMXBQgC7Ws896VVwLh/N4Pfwv9P2LFrWb07tIZHuYqv51A4aZWTOzcTqGTyEOr7RwUrV3/VIRrzaktj4m2Xk7pgDAwfxPkuR8u9QFm4Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAQ4+Bzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCev0qpp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNM39B4048329
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LaLJMWzhhoL7jF0TkISIME95
	5ZsctfKtB90v8ZvJ6RQ=; b=lAQ4+Bzsij7HP9ZKcNk/rDsdxXaz4VYoKQSOv6i0
	pWBmUB3vRcQLDuVKc2r38Xx5gRNjTXM0Bm/B35rpW5CO7pg0FiftzD5qSrHoSowO
	pCa4kmJ/UFPB9mQxE77Z3Xa4EtGxBehwiZGvjNOsZ668MNh7wBuISgWmY8xawfB3
	pbj/jX6idcpKJWEC9ZebnDsmEj60pEzLuDgYQfhhaZLmic34EvZMwUsP2ShdxN7x
	GlQuKWzPTlu0On7kleXKv2x9RcdcozAyoghJNcQsVSj4De0feitaYxYU4DRyT4eB
	8RZU3+tX0PdY9r8/86vwY1GRNU+okmP3gZM+Z0HEsgGKhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2ng1dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:48:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b225760181so702757585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114507; x=1764719307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LaLJMWzhhoL7jF0TkISIME955ZsctfKtB90v8ZvJ6RQ=;
        b=aCev0qppPsXyYXWCMCEwhocBwvPwmj6yFrql7CS5fu7CtYBk2OhON79I+53fTtRt0L
         h1K53MNBimDkRPJGNLjmBX7kIKrLLYaquXiMtPweUtV7rqvbD6XhhNOtRmGc9O4Ntm3n
         nw05wNfKLa0ueqru6wbuiTioUSXOWemQUC7Acchib3hBfkhNYLAIeNRs0Hqf/UgXBQyL
         G/Z5TwY5gBl6imCwk8TSjc3jBCeSsT9urOGJ93Nu0cHYqV/5cddjdtB4deJiu7JXgkGh
         VHj+hd6k/HFO/1QncqvhPNZ9PS4HJzNA+4Q/Af+5nlAtP2xiPuRK3B8EBQA18GVgx5x7
         wKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114507; x=1764719307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaLJMWzhhoL7jF0TkISIME955ZsctfKtB90v8ZvJ6RQ=;
        b=rAajFoSjl3fA5jTpnZ9cJTM9G3DleNjlNJkZYOCTEpmftTIJZdsNQQ1y3ia2Wrbyit
         OvGrj6ckKWVUVgiF/Z+3a9lz2zGBkO6EROGuD1uSSNnubydXw15m9iIuRwM6/ORs96Yq
         2v6+Kn4UYs4HmklPr7gCpo2MXFmrpU5p2IvfxJqX1yQfhrWFx1mpJlfughtL72xKBJNj
         IWx76l8z+oluKUS3Qh/Mx3ae9ZPZ0YG4mGAvu03zWK++r+DZ2XunxA00oi31QBuEnR+o
         zijhTemJkg9pPGhmR7LUOOTRzTIEXWPKcwGojVeoyhuzQlQAJwUnPrCXfRTibMqU1mnR
         b19g==
X-Forwarded-Encrypted: i=1; AJvYcCVeYuYDX+o6jqVEyLH3ZWHDpWfixs2UFgg3lbePz9e8KgFE1nPeQLvLRggP2io+PYCnLXpfd7uiTS5i6m+O@vger.kernel.org
X-Gm-Message-State: AOJu0YwHnHqC32tZ8niRF6s+Cb3bCB3Mky3KVl+KMKgz5a4KmjKnSx9b
	Y09ZKYiz9606lSmskJ9whDMOZW4Td9QLf+SHm9YMaM2VAzvSdg4pdvRDVAXoGS9Kxj6YxcspOOl
	39jFk9+gkC4rBAwemyZayV87a4uv5HlQrigttcunZeO1pa7+JOIbSXfhUMWCS1xkNlDoc
X-Gm-Gg: ASbGnctu5Sry3jZ8zNYhwGHCP7DCxbqGf3zzS+BPbZD2aVFu6TJMdEVRFPIgC9z943M
	axuOb/5cWqLTyEdSNajFkJ4g6WoTv6PJ4tO6mLrk8nFqy7oWHWzYxq7scQdOXHLETwR31RI+wyV
	tmbxxpkh3gubf+/t1/3KbSHnh/2VOKDwbnpFkOO57NvHVluaWCMxZwqqMG4aYFwi0a33skb4zbV
	it9O8ut1UJmsvAnw/iUI2kYZoeEE59w40xXlNtDvYs/LbiTFbLD0xEXtsUHzB79ZV9uHAZIwv59
	/RE9oaXTIW37i8YfKns+3TyKdECpeVNPO1kGKWMT1ch3m6zvTZcHsJ6gmxANO8bcBpSa5Jhd9cV
	73W5keAODjBQYVzcxvgRm1UB6i7ZCYvhyaX84194ff200oJyeAS3nar7ADUCNBte6giHfwCwbFQ
	gOOBQ01lhZvMEHJla0nh7OJME=
X-Received: by 2002:a05:620a:450c:b0:8b1:1585:225d with SMTP id af79cd13be357-8b4ebdbced6mr609942785a.82.1764114507486;
        Tue, 25 Nov 2025 15:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6Iz6guPEwafR2wvdP6krEPpb9fwqNVDu16YYRJcFruP0aUiA6bZ6DvM6LUsWD8DjhuU93Vg==
X-Received: by 2002:a05:620a:450c:b0:8b1:1585:225d with SMTP id af79cd13be357-8b4ebdbced6mr609939185a.82.1764114506973;
        Tue, 25 Nov 2025 15:48:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbccd9esm5511505e87.92.2025.11.25.15.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:48:26 -0800 (PST)
Date: Wed, 26 Nov 2025 01:48:24 +0200
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
Subject: Re: [PATCH RFC 5/8] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Enable fuel gauge
Message-ID: <rtkhkh57hnmq4vb6nh6wh2no6z52tamt4tiiaplxpon3jrbl3g@pe6cm4hmvj4p>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-5-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-5-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926404c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=B0FhMAULOlTCn5wgl4IA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-GUID: 9zaqbhPfB5sDnq17FJMd0L2NUcQblfhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OCBTYWx0ZWRfX/pRiugrRlDSD
 ebSQPwYvhHY1MeaLImI0/EmVeWAhkA4/JBj0czunIbklxzn7KbbKVR7u6r7leaQIMwEBCvkjv60
 Eur3uFSphNi3CPJIaKRryLge/9E91EvySoJCkMO31SUo2FVIbLF3p/WqOaHPiNDccTfkjwKzVOz
 rVTJZdbTDDnaEYyd0mVI87fz/QeCxpLLiPTNq3bTZfgaPdc369u6nEjztnt4HzgNfWm77Ov07hs
 dk2pWzmiZMCvF84zuLE7R+t8wrehoqunTos7vUTEEi3a7NtYfEclgiuzmqAAE0YE9rKjfg6ADyj
 KvaTI3gFLLae0DfH3MB1HLkRf6HogzVBGAr+19MXfGwAqp+Jwjp3kgBA2IflxKTE4m+gd5jmAk8
 f4TndaCriT34KL6ny06H4ikZB/etow==
X-Proofpoint-ORIG-GUID: 9zaqbhPfB5sDnq17FJMd0L2NUcQblfhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250198

On Mon, Nov 24, 2025 at 10:53:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> Enable the fuel gauge and configure the associated charger and battery.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

