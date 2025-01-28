Return-Path: <linux-arm-msm+bounces-46398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A17A20BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 15:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA5AD3A33FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BCA1ACEC8;
	Tue, 28 Jan 2025 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peKzCQpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E733199FC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073084; cv=none; b=WSUg/DbkAYOcFbgCu8HXlmXT0W0BUCnskPPMHK/kORs4YtLbHX4MAJoRllDmEUU1K6vQbtG0/uzrayHTD/zPz8c4M1fG28UtpbhKUjaw6GpR8zbMZmYsKT3H88dptm99SEwbP2OfHOsBNeBqNl2aSNeOxSCjkiNibUWCgnbcqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073084; c=relaxed/simple;
	bh=B+hb8jpP1mvGT3LDCXg3sZOTn7fzxlKCUfEVMc3Y/B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtq3O9T+nymajI4pETpWKF3PAylbtLf6f/iVlST3HlG64vnU8KQwetvGpl5jmc2YHnwi8x5LC4ZX82FdTQOZ1mYXGTrbxa/4K+sZFp4+MfYLCLqwZKfi17skGfHTmTrWLg7ASLdv01jdrxSsM2xQjMCxCpQdDXRsa4xL1HDiOvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peKzCQpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SASiOE032656
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UMR43c/jZwfvNr9s8zZtBja934y3YR1OZKo429o/44=; b=peKzCQprejoLto9Q
	5ypoo4ujshVabraqfZiZo+yP20Unyw8rvv9JCAIHm7UrHk7G0yUpnNoBBoAgutWz
	Lo4Tu7HqHysO/jFrye5amTwQ5guc546NQPVhHR9pRqsJfKqshgDB8E5l0ZOdXWj3
	vFTFvRW9q34lyMCtPGfDIiEjKTvwj83peSLdKln0qqVRr9cSINL14ExcWi4bXghz
	kUNz6KVewHeF7oZTYa4ZS15J7VCw4UexPEQmoeQOoq99n4Uox/Uhu+PVi7qVsg68
	8FAM4159O7Ppn86IW/jgi0D78O6f3FRYxLG9UvBDKaCriQ56rsYmk9S10UK3t8sn
	XRSQFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ewh48fwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:04:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8f15481bbso10198696d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 06:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073080; x=1738677880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UMR43c/jZwfvNr9s8zZtBja934y3YR1OZKo429o/44=;
        b=enUoStdUJcosY17Wn/8sAO5AB2QY8ATs7EMzeyUnr0HycIG9ZB1UgG04+ZqzgzwoMU
         FYH6EcF82rcLyDOzudG/lWlLlmM10pkkdN4aGldthcG7EX/H/5RB+u33ILsfiG7++QXD
         IPgvZCF7s1MAZNAI56TAAhFhhlrFynETynBjxLZM7xwu2S6WZOCqqbvVaRIdKdvLvFB0
         i1PQpIkX1O9gYOXCypZsIXx3Io0stD0VTBCcUb2B/q4/ab7xz0sj93FHFptQQwQGA1Ht
         XvMZzD69rrZBysSZSOa3w1ah3Ew8dmjy3GtTI1GOrN0C6F3svBkCF/iMV9AUgxNNyZ4m
         uQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvWp7dwxWSYKxB4QTnfFYOmB4of6naMmkOfzkBCor7Twq6d/9FW7t0e/rqyEFbxuEzbe7p51QU53viORW8@vger.kernel.org
X-Gm-Message-State: AOJu0YxNmuSuzd55onO+w7BdmENTjt5mENDTzty5xo7EHqCmh5dssR6R
	5fYoiWG3Etq20buIOAwlkE3/6ueUp2IDR6BOTZJJpQvjW8gYSmydxHmF0+dmKW4PZsbUU3StNPb
	O+c+PkerJS4QiTKQNiu59DjPlF9Av7nQ6k1qhM6qtY32XHdpdIc6hEklY1SjEj4no
X-Gm-Gg: ASbGncsMAslov4RiY6a5MFf0CVcJUNmdPk2C/Zbh1Te7AgVYtGiGEWJuwIg3q5dp5Uk
	P4HYZbz1dRbiIj1G9gmAKO6QtMQ/JnzHABNuUrqRJTdYY7Yvs3mMUaKfgpb0IKiCGJraOY+GFQj
	PjFGCy7kh2MEroL7jgLCCTa0padtvQ8Ux0IdiRyM1t5zGRARMA20zxJ2y3dO4N83CEk+n25h53Y
	ns/a2r0mVyrYM/5jPxZyFu45EhQ8M566+KlJKZ8E+Qrf1tIoUJJ8GUaJdPNhZ3vDVehxKI6kgvq
	rJ4/X3MecwwjPtazlFABc1D9xVGw0EgYgrHE93maFiaC+Llegqv0UES7iYs=
X-Received: by 2002:a05:620a:4252:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7be6320aecbmr2269417485a.7.1738073079624;
        Tue, 28 Jan 2025 06:04:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRkcpX5xs9PHq3RPFhqCJ3Pf9W/GSsZThk01xcsePhHgLCGY21EHepC6qewYKtRhfVK86+NQ==
X-Received: by 2002:a05:620a:4252:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7be6320aecbmr2269415185a.7.1738073079057;
        Tue, 28 Jan 2025 06:04:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6a24d88f2sm422987166b.15.2025.01.28.06.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:04:38 -0800 (PST)
Message-ID: <2976deda-4356-4a39-ab80-417a15dabc9d@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 15:04:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add LMH interrupts for
 cpufreq_hw node
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250117-sa8775p-lmh-interrupts-v1-1-bae549f0bfe8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250117-sa8775p-lmh-interrupts-v1-1-bae549f0bfe8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sIJtDWX7eTUieBBrRHXaHDkQ7ilo5Kra
X-Proofpoint-ORIG-GUID: sIJtDWX7eTUieBBrRHXaHDkQ7ilo5Kra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=750 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280104

On 17.01.2025 12:05 PM, Jagadeesh Kona wrote:
> Add LMH interrupts for cpufreq_hw node to indicate if there is any
> thermal throttle.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

