Return-Path: <linux-arm-msm+bounces-53694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78352A82ED3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7442F3BA392
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 18:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03A426B2CA;
	Wed,  9 Apr 2025 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIfyPnCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11F1DED56
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223660; cv=none; b=JNF3EaGOP9SnU8qHmMjUWxd5rYXxeZXhYpdD/9MksEB1ythYn1SP85/xpYAARB7zHJ+GRbTNnLXaj52PSoGsRkxAG/hVztkPF3yRTUs1VRpK2Cs1BYHHsnm5R1xQlke/tSSZxGfzZMRKBfMUxJBqxw+uQ66/szkctYE9xKsTgBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223660; c=relaxed/simple;
	bh=QFB9r7z5dMdlFE+zQao4IfBH8uhmLX9OrvnpVlAWGnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWxgCsvPtmn8RJF5hA4KgnIzNzaTLjdxaBwbYt6Wen5VOiSRd8RaQclKFaClb/LnS1qb8ixrloZIhFUFKC27rZirCi95x/9VPcjziAQzY13TpGR/wy226da7TIXHjarqxtONhoDK3GhMig4lCGZXCcKgxNNSqfV9uGiQJuGH4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIfyPnCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HkEWG002332
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0FeNQoeOgTEfF9ey7V9m+Rk9CoBm7/BgK4wKzyg+To=; b=CIfyPnCWyOqCKAD/
	F/snSCxaK/zCA19PbByK9nd98LJ2JqaZLBihQQv1tcLS5g15WoHbqY9M2HbzNCvR
	CNPs/HbHuJPVzPIXv76WxAxvjxz1dmRy+HUyajlu1qKzCuRzYvjQFOLPgN9Jfh2v
	c0opIGU2tlJF+/+w7ndflFkHrhR+8ilJ5M9r1AxPBai2FuWgnD46Dhbj8SJP/ohT
	Gb8u1U3RXTt/m1GJYEtqS8QtavHb8XwMmSzD0Zwu0XuFqXvMsQpUa2Tk9X17zewu
	St2LjnXmH1KecLa+IKopcxsgoJpA8VrUhQaKRzdvoypFvOQk9WsNWfCsB3KNCLpw
	EPFNFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1m8tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 18:34:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so449485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 11:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223657; x=1744828457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0FeNQoeOgTEfF9ey7V9m+Rk9CoBm7/BgK4wKzyg+To=;
        b=UyovUCWaC17HKT5+KBXjzEWKORk6P+5dXKACuOSR3BqyEZ2Qd35UTneqkSDRQD3+aM
         RQcziRsYda2XGWCDhCwFEpcot2MTcy5Wej7tpau5GCblkhl4cK7FeGZQ5sA7VG/ZrcPT
         VPbZvTIuJS55ntL4gbaZ/2vW3BwkdnoyhCI2y+2Rgf6RYsAU0mUd0kOjENmSdxJc5E3F
         oKwvbhBw6iaECFozjx3Ls5Sx+ANytaYAGo8ZjQqmXlyhI/639Pg8gY9p7sGEZrEjhzR6
         QISwVFi9yAXEecuQ5INjb0X+ZmDgCDLmqZcCiwhzETPr5PhMR/UzuwKq3FXVjLrFQRxR
         n8Hg==
X-Gm-Message-State: AOJu0Yy42g39vUqtgBMvV6L1XENAmMxtsKKiCOObRYtSWHf//1E9G9Yh
	HeJ56wbnajDJWR5+jZiU81AAVmEXBynqDH8/CheDHsU+QT4UhSzLe2f7iTONR0/MrYLaxNyZh6q
	Vib5KMr3nVx/MO4gBw4DqTDsSIwefwb0lhqJV18J6QPAldA+UmmbPIPZ8Qsy78bkg
X-Gm-Gg: ASbGnctaHMqZCf1yyXlTb7QZx4QvotdeQJ1veb2Yn5AXeymGMPpHKLDZ2OUV9mK5U9C
	Kp0nayHcV9OH+lmSD3NDM62hzuV8DpEqVA4LZkijvY7fMb2PxJvByczRwoXr0TrmS5nZ3i5iuy6
	UqKFibH4z8DfMQQ1sQAZSXfS6ssXxPI2c4d6FKMkcpFgdjSCaqodODMXW556GofgNGaKDa7P/kC
	4Wf8CXOknTaFcWuj4L6HxcNtUEdO7UjYX1+gYak7ML6fbzsCEe4Q+vwFhc0gVy3cKGTWZAY4XRl
	HPuA3L/heCNdrvgk7ujqlYSsnRSpto+g1AcHfBvuNHFFZ1+7D2hX/M2RL0YtDlDu3w==
X-Received: by 2002:a05:620a:2703:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c79ded4340mr169119785a.15.1744223657371;
        Wed, 09 Apr 2025 11:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSFUsI0lq0CHivUmmOGJxEdsH9s34vTHIa+QcttBA4nANZHeV7gUbk78k257Wljic2w+r2hA==
X-Received: by 2002:a05:620a:2703:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c79ded4340mr169118285a.15.1744223656999;
        Wed, 09 Apr 2025 11:34:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbbac4c6sm1108553a12.13.2025.04.09.11.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:34:16 -0700 (PDT)
Message-ID: <95a8dbc5-c759-4e4e-ab5e-4fd6b9eb4625@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:34:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ODiHnranjL3YGCONVrZoFl12RvTMpujn
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f6bdaa cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=CBGSpeRjDxRW5wpHoFQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ODiHnranjL3YGCONVrZoFl12RvTMpujn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=717 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090121

On 4/8/25 3:10 PM, Dmitry Baryshkov wrote:
> Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

