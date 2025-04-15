Return-Path: <linux-arm-msm+bounces-54408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0EA89B3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D5417F6F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67C828A1E3;
	Tue, 15 Apr 2025 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBsuZkQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A054758
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714588; cv=none; b=jsN+/pkqvMpe1xHCJ1L+hHZV2aRoCJPYshuV5fZehiAAJ84RoXdunWyVIZIyf3oGdZuhCm9omfL5rh9gRQ2HJ+Ca+HvJV92UCpViuP7h6tWzyYRPqzAjfrAWhidyIKEIG1SMuHKOLeJmb0VZNRFI++GPbGM3a4YphIIERmwoQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714588; c=relaxed/simple;
	bh=wXBuDbylQUrjB0iM7PzlB3G82KLfsU+48WBnxvvb5B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0kUnNSe1vhLNCcxKIaRg+iddSWdcDsSTC0UBeHBi4md/9z7i3kWvTRcP7K6t/2fXY0INd/OkX7qDPRwmpqJH4ZZJudZh65K6J2nOQblqfV9AqzQveh7aGgQyOL5SrPdgF5C8lU6ilQ65oha2dHY5Km1CFoenr6I1DQYlwY133E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBsuZkQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tvfV025669
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYKTS0S+EfVR8OXMdy5BFppRLvfryGbDjZTdsxWF+eE=; b=aBsuZkQr1DMcXLCI
	rytWWbRCdXja8xA/4jWh47Y6EilkkhJHM2XMGgpZmAI5zopLrgO5slPU9v98Ha0p
	MFXd6+5fVf54oT2iSUfYjKRRLhEGVh9bd9ekrCiLN18BdykOVWQdTCjDeOt396ny
	JQ+buPAXlyfEOc/ndyZzN4iZrYJAuAm1T5+uDLCVK2xZEDMv3CsuZKn0pLwqrhq+
	wfoXjPi4W7EW8/0m27k33jf5MDwi+qYTNRxO7er+vo4aBsMU1ftmSKt/9Prb0eY2
	agx/JQ/8G+nxgLH5XCQjyEpxusb+l2pbJVRlHu5C1OiYIexyDDlRFDLdliniKkzK
	N5Va1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qsvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:56:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766ce9a08cso10693611cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714584; x=1745319384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYKTS0S+EfVR8OXMdy5BFppRLvfryGbDjZTdsxWF+eE=;
        b=owzOiQjKpPGg6WuiDCGnmW6dqWrAVBW+X8LLt5iL3mrHvgjsFEs4iIqIIWN2AV/gJ7
         BDAz76ssgEjHs24TYpSqFyl1UIouTHcOxEqo/6NADZlgfPVL/mqtcumIA2dAbTAG0Do/
         8h1BW3761RZCgMO1VF+o80GV2g+jXv7QqAWz82vEDu8DiFE6MUIOGBGP4NacX+17Shlg
         TnKCwjrDulX6FR0TXWnAIVHEvJVf3GtKZGpSQtz6+d+77yvllvIZtGkUe4+EJ/GLxLRC
         Q9N4FFVCUv/K2G+I9NR8i/vlXQrXlAt1THyqxoowigZqiDY4eZuuM80E4ndWFyV9jYaf
         4uWA==
X-Forwarded-Encrypted: i=1; AJvYcCVy9UjFVv2+qn0UCERYQaBgFpucfi9uGSZ4VXp++YI+imCg17b311i5pu/LxwZSHxIcGfTYyQ0GLszD1UHH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ugM7SI/O9YWPc/qF0issyrem6KqB03aKlcxB36iovdmv+xfm
	9UwbHro4piaIh050BtR5FEBCpb/n6XQif2mPgiQ6Uz7Hey5bUW7VpsuNmIU3b5dn+t/qQdRLge9
	mVj1RvjlyYkdnQB18FNPnKDByc6B5qTIKWwFJRjsLMw6j9/aeVpHsWXlt6Wt+NFz8
X-Gm-Gg: ASbGncvAWZIH1ZYlhFfuzaVG3mmMn2FjnbllI706mGBjkWpNa2HgmnKvP478pCC66C1
	PWNPoKUtrKULJMDmjPI6uHCSTa5o8VFujKjx55dCy63r61qWOdb/vWJUZI8bgACUBh8JuSODhzn
	F5vf3Aw8LNZ9rPEtueoo5GGp3TyUF5Z3+sqEiB77dqHjqpJEgipZ/yTJakhko6et1p5/02Cp0Yh
	NKD/rzPRp3J5BqahJgPhWgB2uoKI0/5bGkt4cXEmuGOsb6WOZHT4NHokT0K0gyAhmZMTvyt6vAa
	BuCGPGMU+p/rpqC0X1+reUgjHxRzOCDnpxocDYpV0hOj7fgj/8ZiyYxQhbRPRxqcYjQ=
X-Received: by 2002:a05:622a:3d3:b0:472:1d00:1faa with SMTP id d75a77b69052e-479775de243mr85517501cf.13.1744714584462;
        Tue, 15 Apr 2025 03:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRD3bma8EpKjMM5BlPikOo8DgdDwXPonYsbL4+V/MN8amtSG4FuhrIiyJDFizYQehdJGRF1A==
X-Received: by 2002:a05:622a:3d3:b0:472:1d00:1faa with SMTP id d75a77b69052e-479775de243mr85517281cf.13.1744714584122;
        Tue, 15 Apr 2025 03:56:24 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f069dedsm6604397a12.41.2025.04.15.03.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:56:23 -0700 (PDT)
Message-ID: <3b27f345-c961-46b2-8846-c7a6ca78a19a@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:56:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/4] arm64: dts: qcom: ipq5332: Add PCIe related nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
        manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20250317100029.881286-1-quic_varada@quicinc.com>
 <20250317100029.881286-4-quic_varada@quicinc.com>
 <48361e2a-89b2-4474-97aa-557fbbbdf601@oss.qualcomm.com>
 <20250415095023.dxipm4hd73jxoe4n@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415095023.dxipm4hd73jxoe4n@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0eo4zYjmVd2MXehGyclPoCN6PClxjrEK
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe3b59 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=P01nhSEvYWan2JYZi4wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0eo4zYjmVd2MXehGyclPoCN6PClxjrEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=686 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150077

On 4/15/25 11:50 AM, Varadarajan Narayanan wrote:
> On Fri, Apr 11, 2025 at 01:22:39PM +0200, Konrad Dybcio wrote:
>> On 3/17/25 11:00 AM, Varadarajan Narayanan wrote:
>>> From: Praveenkumar I <quic_ipkumar@quicinc.com>
>>>
>>> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
>>>
>>> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> ---
>>
>> [...]
>>
>> I think you're reaching out of the BAR register space by an order of magnitude,
>> on both hosts
>>
>> IIUC it's only 32 MiB for both
> 
> Checked with h/w person and he confirmed that the BAR register space is correct.
> It is 256MB for one and 128MB for the other controller.

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

