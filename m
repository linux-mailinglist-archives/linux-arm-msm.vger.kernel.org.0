Return-Path: <linux-arm-msm+bounces-53270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F85A7C684
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 01:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B363AFF66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 23:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6CA1F1300;
	Fri,  4 Apr 2025 23:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIaWJqp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB419C578
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807774; cv=none; b=PyvuNq6a/OLDXbmHCGOlUz7s1YkXk9kSswEuGFZPEbqliQaAIcVSZYBZj1Le53TwyeAe4DwtClQLsgG0pnQlfrjo+n0a4UNtsC3UhJIwckV7BU+59tcY0kWzojbOoKKdWqcEJz729vZIugS5RfXj4CEpS+gYVHvLzy8PHe57HbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807774; c=relaxed/simple;
	bh=/dlzUhzNunhYTNbApKqVE/hjFYpfPkh5ExgCEoMWEzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfU7BtsOfrKHdzk6fLZacAezQUoXVJYeJa6f88UdEdE5npSageIZ8BeUBBzHHgHqlDxEXodvL2Iul45+1CB9LSq3/ft3z75IS5u40s8gPxkScX6G68MXNo2TPFrzNBUQNCMrWbJNFIchWhsZL2cMesj7uviokGeuZoLD8O59L/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIaWJqp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEWq5019771
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 23:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRA9/KTy8C2+7jeNa+M/5I1PVMUdhFQewhL8s+SLN4U=; b=gIaWJqp0+ubKz00p
	aNh+FjNpK6qhmfW0Do0djfTk17b2h9FJpvj/sN6wayZcBAW3taPyPJUC23+u89Wg
	0je86u2HdiYNBTY3Vj7CrihcB/K6sIZpBLENrmeKjAMQ/sZvQXilZfwhMjQatGNX
	yW5zl8QmGAMoj3tAohfivL6dMN3lCBno957RvhNSHJrqsPqmb5z+A7N/4SJ+OyD6
	kfrnKwtAJQ4CwNQZuJj147yVdbaDXZrxwVPa3/OphKm+rGsCMH36IaRecAVZUJY8
	O1TCwqiwv20tqFGUhKdOiybn0IYae7Kzoeiujl85uxUdMBksgghI431GOcF7ehqg
	qHEZsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d433kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 23:02:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so64433185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 16:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807769; x=1744412569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRA9/KTy8C2+7jeNa+M/5I1PVMUdhFQewhL8s+SLN4U=;
        b=U+1Df767Xpbiv1OVpBidcB+npl390QKW9RP8wKmfgQ+B8Gqt/C+BoqQG/PN1a6aRwe
         EotzHMQtRPi+CSOvRdXHCgE22JQzo8msWWGtMFFLGK02G7yQUnOAOZYXYPbKofi6Ba/C
         ZqFBe31C/WKBK1cqZhtarBj++LU6nj0Nk0Pt8uw+hRcxaoKqfGg/p+0ieZrXMOa1SCwu
         Nv7rq0q1gL7z1WrfDzz8rmpsGNYlX6dPz3amYz0b/KkufY8V1HNKzXEmUDJDTZNvNi3X
         g+ugHW75Ld7ZDe3RaTgVfXqKBfnjd+mCbi6vCS2QLNUXFjZc+5nzR3ty7SSBuKAMJXvP
         VjBQ==
X-Gm-Message-State: AOJu0YzB+iWzkn0uAco+c5Tk80KjoJ3RTKcAahUBb2O/9o8RUJYVhXtq
	fkh52cI4ufPVP3JPSFQ1mZatpNiXQ59eEG9gSOSDSSPTXG537SeMezzlFLXggFFWU0Hy3JVR9yv
	SyJLscjQwrVx2tfKbbeMyaPvjEB3NXJ4WzX8yRnx7Oh7n6mAmPafn/rMuYH9hEt7p
X-Gm-Gg: ASbGncvrF4jYMZIdub+UtThiVwMInTDG0mjYw2hLMQVgiV9nkL6f6lR81JhC9S/fBpy
	ciy06LZmoZZlsPe/hgRtAATTerxcfkFGF+lw/kYgohT9pXD5xDf+i1iRgSv84uBMt0dYQ99/qNY
	ELeU0/EqD/jK3PDAODkzR3OmG5VPYonc3xc1g1gYgqKvIZ7vjCvcVXdnAqXMZ8Vvj0v3ldeUgxi
	7ISm8xd6fFV9hNbXjMWuDPhBAB111fXhb/NorGlJhrSEqtPXrV9jSFWzmymH3wFSQAE3fh4lbGc
	Qfj8t97Zxa2bpPIjpf07w9DPqZu/qyQ44jIfqIozWb/i6ikGZILYDrhB8PbqaAeTY+sEag==
X-Received: by 2002:a05:620a:454e:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c774deefb5mr256193885a.15.1743807769621;
        Fri, 04 Apr 2025 16:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6MHU8Tgt8a8CQEhcefjPtj3ZIKu6Qtk7j4wVYGOhsJgBWQJhk02RvEJAWLOpHIAp8RfiPSA==
X-Received: by 2002:a05:620a:454e:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c774deefb5mr256191985a.15.1743807769258;
        Fri, 04 Apr 2025 16:02:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f66bsm321160766b.118.2025.04.04.16.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:02:48 -0700 (PDT)
Message-ID: <4adc7b02-94d8-4ce0-a65f-6cf1532c7d28@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 01:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: ipq5424: Add CMN PLL node
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
        quic_pavir@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WtbYaxpY6HXiGDfpkNUt88R4T1HuDwsA
X-Authority-Analysis: v=2.4 cv=HrJ2G1TS c=1 sm=1 tr=0 ts=67f0651a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FgJnXFQMKNkajvnM-RcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WtbYaxpY6HXiGDfpkNUt88R4T1HuDwsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=707 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040159

On 3/21/25 1:49 PM, Luo Jie wrote:
> Add CMN PLL node for enabling output clocks to the networking
> hardware blocks on IPQ5424 devices.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL
> through the internal WiFi block.
> .XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
> 48 MHZ to CMN PLL.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

