Return-Path: <linux-arm-msm+bounces-66126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61925B0DFFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07AFD1893D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B041F2EB5D1;
	Tue, 22 Jul 2025 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzMJhF1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A228A1EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753196519; cv=none; b=IkUZ0BQN002tmjeQi0JHxeHASwq2ttIdgNHpijSgC935+QX2wa4xYaL+kbYYEq7XM4ahl9HlMFmB3eGLPbTjLnF4Tbf6lBjR8E58UKUaZd3zJdK9xZ7FOcYzhpuIDNFtQUCWIGPVtp4IhpykQBoyFAGV0cqLCNQ5bDmGCzHRbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753196519; c=relaxed/simple;
	bh=YmHvIykm13Ip/tOjb7KoHSGXfOvcdQou2fZ6EnWYQTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivPmHqcHF5Et7TdzIfC1zUmcssjDY0ST389Y0jnKC2hZz7U+OBCsm1HixO3atzLaRM1WHpxQf45mJ4fx4yzl+3PISCJ6GsUN3191Ok+NzfY5Bnk0Xk9J7iN318GddxRXMSXHTlVdxVlHBlrnProwIp17cUOvEghlrIN+gE4x+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzMJhF1r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MC019P016585
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQea+0bC6PD6eejJkZGOzWEWHSsdYyQtTKTo+7Hs0x8=; b=lzMJhF1rrwyfBKv4
	QY1FUQIGo7zdaPMs0+mvmgS6d50hl6NvrGiG8Xj+h0xnai1fCIZBeHDW+URvCzG5
	213nyitbdgiTo+ItZ6nS0EDKPX2BXtutwA+YowM5xMfh0p4M7FdShhhjs40+Ew7k
	y38edEMHc0tMqSZzLlayxhVpQqc4+eLJpcQv08khiTp+f8tOXoeAU1f7mZCG62ZJ
	bTMVKMh+f96wMDjQXvWCYDfxHLGCxX5F79zJXQvL7EtneKg02OyP1yiM94x9uKPj
	gdUEknpoPV7fHkG8O+gOMNWfiwXcMVpHNgo+CGcjDnXUNpajAcFmd8IUJGa+Ok0T
	PmJg4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s1xmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:01:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7047de9a9b1so1325386d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196515; x=1753801315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQea+0bC6PD6eejJkZGOzWEWHSsdYyQtTKTo+7Hs0x8=;
        b=l/eI7L9wfqRUASpsNPO+v23DoBfB3ake2RVlAZiVWXQjTSRlckPl+5mx4zL11+2Lmt
         diFVphCjT2sfDvOORAi3tQP/uU+Fw96tLu5wN1lYr1Z0lg5S16DKcer2/ISqm8A7Yxj0
         8sbJg9hoKEVxfTPQAlMMoBmPdPzBxV8bSJlSr+sWjC+cImsjzEqQ6rT6SSe6gIp/RUuI
         nC8HnVTLeeReUWx31D9TJ4olPcH/+/T51swvmJSjCgVtGwDKxffnXjWkfAWdDCbeK27y
         1fdYNLAKjSWXRUx9ryB/c/2927O2b5UAGIfPYBlJD3UZza4CAapkbwCPOa09mDNWlNSz
         cqIg==
X-Gm-Message-State: AOJu0YzJ5pTxEgjjxq2FhZ3tzMuVPi76vwMQVIMWlW/RHcuBvqVQrWmg
	n+pxY1cK2KKyQMhdOlssYWWIwtbggmVRbuzswnc2P+5zWcHko+D2IuXzubCtaB+2I5rWI9M+ZDm
	UEEQiuoJbrp0j0dvhHBayyj1BNJrWk/YzOCc7I37sHA0WPxfhOGHw7rvS2sWR+b7G9j02uFd1C4
	kK
X-Gm-Gg: ASbGnctUgNIoVS7qnyjPMidA816Twta26X5lXJz2CHHzjUSngZyucflmSuHK6BumRH4
	xa1dz8xcJL1oF4kIsrbtB5UsKVrsG0tBLtxE+SgxUnC1TjdPQZagKL+/cB76/EzNtTCRxzvcwga
	dsneZxaU+E65zN6hHMNKQB30ZWDyV1TRBpfG+cridKp8wGwwpkzhnEYcFlV7OyX7WvunVqVuCxl
	n7S1EOTCTCzKxnSSPJv08WdH/42jH8b0fRfyTV7Sm3JMadWU5V6bx+P7GfEINRNlf0/yAQWTpet
	XVznTY0wl7kd0wRkj54qn3U1GIVfldhEAGZ6/8BHoqoU4/q7vPg65/S7OCvTjgPfJ3rMPkpn7oI
	6Z6R0rq0VYQRA2q1SnV4m
X-Received: by 2002:a05:620a:8089:b0:7e3:3419:8ed with SMTP id af79cd13be357-7e342ab82c0mr1516900685a.6.1753196514599;
        Tue, 22 Jul 2025 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9HTTcR+tQSzuEDJ8+Kt0u51iSbuGAMBmDowZbgYVk1n01G8uxA0VUwMaUyhdWRTPvV72rbA==
X-Received: by 2002:a05:620a:8089:b0:7e3:3419:8ed with SMTP id af79cd13be357-7e342ab82c0mr1516895185a.6.1753196513449;
        Tue, 22 Jul 2025 08:01:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310aasm867940766b.72.2025.07.22.08.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 08:01:52 -0700 (PDT)
Message-ID: <88a22bcf-2c31-48e1-8640-867727c02ea2@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 17:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyNCBTYWx0ZWRfXxRBH4/utmsjo
 TvFCIsck0tOcK/0iCiypcAUeoySCmQZDVmiYtdcbjyhv1QMMCN5MXn1lR9mFhl6zinTYVOXQVQT
 hF+ddFMNOYthB7XrfxgoZ1LaUxXZAvNAc2XBDW/irZmnlqe8pLIDWaAtIU4uxoCc7aUuv2J9woQ
 lmpg7bD7NSTdB2EO+IF1aW4zehzWQKXBC9jnlyX75PP8MsIeXULb3j9o+gZlrZ54mC+cEozieiD
 OzdKcZPn/NYyWgLNlGu2x9YKaTT5VJFrivDXWBO9HbEH4Mtq3vAvnW19VrGfrOOSvMhhm2TP503
 60J3l3y6mA/cUezLXETKnPqTgdmiWF9DpngOxgKu2tL5SNiD/aKuzX4V5NzhCSa8NgZtnMRTSIt
 sY8eZBKPGgwG4KH6gYL9d4lo8MiaVGtBX4uSs/JXWFBZqhWkZh3YWoeHljsIn4U+q0bDndhK
X-Proofpoint-ORIG-GUID: x3QKNmvLEEJgkDXJ9W45fOcCkJNaeUMB
X-Proofpoint-GUID: x3QKNmvLEEJgkDXJ9W45fOcCkJNaeUMB
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687fa7e4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ziRkMoTaCqJTGmMilkgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220124

On 7/22/25 4:49 PM, Wasim Nazir wrote:
> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> collectively referred to as lemans. Most notably, the last of them
> has the SAIL (Safety Island) fused off, but remains identical
> otherwise.
> 
> In an effort to streamline the codebase, rename the SoC DTSI, moving
> away from less meaningful numerical model identifiers.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

