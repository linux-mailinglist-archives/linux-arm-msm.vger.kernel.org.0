Return-Path: <linux-arm-msm+bounces-62217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC151AE6645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DCFF3A78F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D35F29B206;
	Tue, 24 Jun 2025 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SegW1WwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FB2BEC39
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771556; cv=none; b=W3aIpsp2x3u0CBU957HUWcAgWEfk8qwN0TYON2Wlg9qnkqx+gkYqqsjuiiYiQKZVsEg9GOCPCG5zIBGXLQY4G4dUVFcAA9U+8Yh0hmwlsIeOfHNOMURB3S0O1GHXo9Y07gu5qXbuovlumvMhf/6AHsz3iyWlpcZwCVs65lBinBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771556; c=relaxed/simple;
	bh=PA9hvTAzLsA+usJ2+Mj9NJkIcp3aM0mxLM2JBOJeV7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwM8pFZrprXSmg6wnpy1Ub3YQSBsck2xKA86fSfdJcDrYBCnf4L+isfdt1+Tsj0PTgpPImTsM7RCm3qZ5rnFUC0DGgcTMnZG7NFUM+3RHmJj+WxDwPiq6KDFcy8zK/ikBXyjvs19+5zBknfkREugZJEXFnEzuh1opbDaQ041BVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SegW1WwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8Tt02014579
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aX0gtlsQln8GIpy3r5I1Qit6u7+/jH2GtkFLZXw6FzA=; b=SegW1WwKU9Kssmxr
	AxAzIAxHfAatYoHopqw50DZKx/SKXVX08/OIzIXOvFH83bedTMWuDm4OWxYyxXjT
	um9eZ6D5jjzearI9IN0x6AtH2E5dgqOcrT9zrGZTm+a8+XwcFIWEgUT6aNjP8FBj
	ZvLQGXC7B1izxwNaPCed8dzeaTGKp/tSvg2ALhMfUrcxkwm3MH2ndeiFUAAq8Y7x
	MzBf1vRZOG45r1aa7VWTIGLAM7BKhwkyjnD633zDniPYvZ02MRPiLQS19BI1kM5P
	dzWWh1VwFAM+qGHYOdZIPcfhHrnJyyYSuteGnk3f+j/WshOtV621ROYN6pSwxeMY
	nYxZHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpvekd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:25:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3eeb07a05so76711785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771552; x=1751376352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aX0gtlsQln8GIpy3r5I1Qit6u7+/jH2GtkFLZXw6FzA=;
        b=vUhBesSaemAALdUSNFSbwwvU/CB8av3P3rfFNXI7x9+dYEGEVglW/rZzR8eAXEmBC/
         yuF0N8NEwzKcQQ2WSXI56sQv6uhnj0Qcyzv9zGXMVPugUFsYoidnIiCAAJAoYrE/EpPj
         mwClhiV9ZomCOaLhK5AclnQX8RK9fuEPEawYWcWvpG6B48aI0/I2Tw7h5UYC2pFiumo4
         GDLu3R6bM3ro/gcISJXnTwZIDMxiLtTGcAsIITveUBGKsZ0pt/IYoSyBKXbsSvCx/6sh
         z/5YrALjP2JgW1sjgGXHlqfNdWlmGwN+MKljnGHEzc2744nUqqtH0XwNIHw4AFsuKTik
         APAg==
X-Forwarded-Encrypted: i=1; AJvYcCU7NGUp2nqj35yn6nZSkHqhGvENF27U+IpouWhTvKQ9UmWo7ddHhi+IJBdpuyVINz3ySgN5Xb2XmBSDguI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9xQfjn1lgbcKpHVtukoIKKMr3ns+UI96FTHfrPBW/HnK+C6pF
	pTdQlOuzOJQaxEvDsIuBAUSqe6xegyivUH7YhXud5OEEkIHwKKoEbaqWEFTCJV+rGMiy/aJw9E2
	lzSk3LmOHI5nfVNDnn+rZICNf3It62+vAhmeEaQnyBeGuO4dbRyjp57+ElHRF2ASJ+3a3
X-Gm-Gg: ASbGnctL4Azo06jXXlItuGMIt0OdALFfX6j10DJz70ppy4t1Z2mHriezzhIcI1R0UsS
	PLKT8V7Rw0n5cONI+8ecnOjiVRbcLvj9HsZ76vOxjjislOk0M3P3IrqJwG9qwfhzL7ITv07+CMX
	DffEHTytrWQbNRxaW/k9qJJkwz+mrZHTkjd3z9FcwePMZW9xVrtfOA2J7um5uoYIc+jxNaKFwjN
	mbi6AX95rreJqlFVhfmKYTkiMu03+4ZgLJKT7wdn6uXiDBNs1MwTeSUa0jMPF2/gI21yblHUNNe
	Pvy6u5l7N+/f5CM8jMc1Ep5HA6XR+jtWpvfwarSjzH5Xck8yDHWhexxeCIsks3XUSF9C6I0EC5v
	bfos=
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr833915085a.7.1750771552556;
        Tue, 24 Jun 2025 06:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtmqJgy1cNQYlHf9rNiieXLLQW3l8oeZCtsM+x77D8zUcwYzl97X4xxSiLnDezlRaz0qJg2w==
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr833912685a.7.1750771551856;
        Tue, 24 Jun 2025 06:25:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm889931666b.148.2025.06.24.06.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:25:51 -0700 (PDT)
Message-ID: <874d57c0-a124-4767-acac-05e1a491b7da@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 15:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
 <20250624-rimob-initial-devicetree-v2-3-34f6045ebc30@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-rimob-initial-devicetree-v2-3-34f6045ebc30@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685aa761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=n_RBVNUhXirTSVEQBK0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfXxdDks8av/+Eb
 E6EgY3kiGSKk+SjhiyRZIMOvDCz2KPgblrXGUA6K0S5MmEtQixqoM3F0ZHeC2eP07ejtqQdrgrk
 7fVSaHqMCzsVli03yCj9bzaBd+hlRw9fZlXAflDk8Z3Jy2UJia8h55SXOlTkaltivNWYVZzStQQ
 9ZvjjaXGeoFYC8XHphZ2MrISZVcs7bWgCQmFTJhUVyZUO8W3tzPFMnBMSaWQqawoiWHLxIMTq1+
 IXEeMxCP5HwTbYB/+FkypOKjJc+VfPWYILWrTCVHo+yL71TFYdAqSC7PKzb9Cbvq2vxAOOX8e4l
 YPFnlFlNFP7fyFHA46aHSYMvLOOeenLsMoqZZEqChjfkmHNTDfOtGR8i6uRsvwxn4CHix82HGFp
 emETpbygb5uID0H6p/VaTRSVHkkozQZHwptI9//JyMAcdasirzsVJXNkXO3J5r2xi1vINbhb
X-Proofpoint-ORIG-GUID: PwiMjEsnb4k__HZIozsbFyLxOb1PuqD6
X-Proofpoint-GUID: PwiMjEsnb4k__HZIozsbFyLxOb1PuqD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=638 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240113

On 6/24/25 3:20 AM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

