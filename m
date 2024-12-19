Return-Path: <linux-arm-msm+bounces-42857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E049F86E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8DD1897338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6411A3A80;
	Thu, 19 Dec 2024 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XG8ri+B/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF531A0B0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734643536; cv=none; b=po03/z8Lefq/NSsCpKg/i6cOLz61y0UXdU6bv0CI1olxzjXTvCuNBDmiBXVV0LX85wZh3Cd7MVw99atmMohurmZgfw32hUEQFQhr2V6KkHKOg1d5MHNxwhmx4ywqv11hiZ2sfRZyOtwr3fEEUzj5qEIam+k0yGRgbQkFMyjg+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734643536; c=relaxed/simple;
	bh=8slQvS2w/upG8XcObGxk3QkoQhnf4VuuON6Sm7XmvSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8zl28IhTj1/jvPIhrltnQ+edtwDCsk7dKDqB/Ob/YKbfb8Kfsp+T5YOSOB9TK9YcMkOe6v8jnjQk7Zb/kr2Rh3tOLl2z+HoVIEG1Kd4LWPWhA4PsU0IY1SX/+esCgmG5CIpeN2D/3Y+zUqfYSHOCjgUf07PkJpWPEEbsxjmDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XG8ri+B/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGIgSX005366
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGc0Uw2HQF7FA2fB+lXZBAhvYnwlpJitKkltHLZFEDs=; b=XG8ri+B/xmyVbOSr
	TAFToiaBrUAjlqq1cg8cTGJ7XUy4L6kF03zLyxEVowvfM7hUCYbaS4nP1HHca3gV
	Lmgl79YPlaQRlVQ1Z4kV2Ct7H9OnUIrhwfNKUIulwPBxK7jPTtXrS4QJIWIoq4Dg
	0NsWdm2IlQ2qWeIW077zWbsKRpv5JCEMJ1PSx7z4FEj1Y/9kkqJK0E3RfKTPIWTu
	cntDU7gNxORKzHtGcDGScX+psh7G2uhfuFYo4CUVbakpjPmSQ/gyclYf1PP1xaRu
	sqCxBUULKCopAG000tKDTUhmmVyemzENnC2jhDJ8Sv4t30yYQp3UdC6kRLIJU4hc
	13ajcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpw60qu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:25:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f8762a69so1920326d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734643533; x=1735248333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGc0Uw2HQF7FA2fB+lXZBAhvYnwlpJitKkltHLZFEDs=;
        b=imy2mheTrSuGvlONziXkLFiAuxRSIlAly8QdUHItsAvWMoxR/6tBXG4DPLPqGymtdN
         vrXr0S9QbHDCTHxXFhXsF+sxXOlzcM5GPGdjUJEuPY05g6OImEZ8HF5r7EF1a91mXqRJ
         VPMF0kgQHX5RJuCpf3779OygHTX7C6tePwvkECfb3Tl/3BEzLG/R44OoYRPa53WcOVZe
         ENATiEGTKSS0gr7H7KU1y/LvXjPuICKCpP539BTFS7Z3q8p13sIRVa0Tc5KuHh2dWhzr
         F0Ru73lALh+aH8PuaTe9vnxwp0Gwq0AOkOmS90WTaeFMF4ROKet3bvcuj9WKZW1Cl/be
         UDyA==
X-Gm-Message-State: AOJu0Yy7cOIZWcN3ZTV4WILyijy6EWfoo4kaAsgtvevOyY6g2i6e5IZl
	p0QoP0XDYiJDJEOqCAZxdvieeuEQip1XgDQGhe8FHeKWpzyUrLtr1zfPI35z7VH6hU/1vkcHA8g
	FTCWZSdCIskiJq2Z2qfoqY7TmHrnl4/IskuZZe5syyDQ3ywiaStNH01kWDvel158J
X-Gm-Gg: ASbGnctsS0r7cKc/TckHAm0YREl7n6geqy8Az3lVp7R3DibvkAEixLHV/vqOTjhuG8u
	F6b4jbYreWQxkZ+uQAASpB6QisLp30G/NowQVn7u35JhrQSzivyCr2uWDVth6BEHnfOWHAoscLf
	TNMP4xEmv/sBbMQP0hxFF9Nm3OvEobHdtIcMxTwqoyORydtdN53Q1KrzQ7EylsjV9vxlD4Q/vb5
	xmer8ibuKTMZ1NsfUfliPdp5Y7jFYSgK3nSn1v8HYqmT+J4SEBZSdkFW2psdq2TEyTme2uUno5V
	y3uMNPUmcZaRMgSOoWlFZFDD8IpkVMWLWsU=
X-Received: by 2002:a05:620a:240f:b0:7b6:6765:4ca2 with SMTP id af79cd13be357-7b9ba7bf91fmr22453985a.13.1734643532784;
        Thu, 19 Dec 2024 13:25:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVsG0EpsxpToxiwu1yQ+bJZVFwl7F4KFuaL/4r6a4jGHLEyVn/+obSwx2N7ksOm9c17zWVTw==
X-Received: by 2002:a05:620a:240f:b0:7b6:6765:4ca2 with SMTP id af79cd13be357-7b9ba7bf91fmr22452385a.13.1734643532420;
        Thu, 19 Dec 2024 13:25:32 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedaf9sm1053356a12.56.2024.12.19.13.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 13:25:31 -0800 (PST)
Message-ID: <2b4adb2d-29f5-459b-bd85-d5d12876f7eb@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 22:25:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: fix the secure device bootup
 issue
To: Jie Gan <quic_jiegan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>
References: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _yYJhL-IChFLZ50A1jDwi6Ha1lOL9PrX
X-Proofpoint-GUID: _yYJhL-IChFLZ50A1jDwi6Ha1lOL9PrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=815
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190169

On 19.12.2024 3:52 AM, Jie Gan wrote:
> The secure device(fused) cannot bootup with TPDM_DCC device. So
> disable it in DT.
> 
> Fixes: 6596118ccdcd ("arm64: dts: qcom: Add coresight nodes for SA8775p")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

I was thinking, is there a QFPROM fuse we could read on both
secure and non-secure devices to determine whether all coresight
components will be accessible, and enable them based on that
information?

Konrad

