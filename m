Return-Path: <linux-arm-msm+bounces-62216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E17AE6650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C754D188E7ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F114E2C08AD;
	Tue, 24 Jun 2025 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbul+x/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AB2BFC62
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771540; cv=none; b=TrEndG2z/9FLNnJVHfIPj8oNLrH0cFJEW/I7xLq2kHX2hY0P239DYjrOIPDzyl4ybputWRFhsk1UtmSKumtrownD+fiuJQhElVi54cy8Gbh8it5oSYfHGZsQsYTkfKj/pRMkcda8yADaqtgEfiaU/njm9GyYBqg6fpnTGhlIze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771540; c=relaxed/simple;
	bh=O//ctg+SgVaxYLIL04Z2pIwS9W/cpXKX5+4dHW6Gpu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1igYxHJBlqOYurRkXgTxcCyLd9jHNIbyiMrghqknZNbDonqxkdsfD3IsfXpTJVemvyc3HNdMQgK8yZQqmvSMSLRFgCcvrurOrFePoTiTTZMDH/zjf8KTRlvAuS8sxKT5dmkO5SmVE7Oyg6h4vWsYF7XcrVjhC0zmg9NaT/gLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbul+x/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O83KUQ020776
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puqnTEAbiwXXvejvFqHMQDxLMczv/myXUOZnE8pspZY=; b=cbul+x/5zDFIJR/D
	zoSVQtmbiMSfUxpe5Joqf9z4WRN/GHRJKQ0dBU6x9qEJg99OMKXfIcwBvH3b1xKS
	ptuT422Jq2dJXuUPeXfMMZZ9nGfBNR7xzhA1qR/x7DySHcMDkT4KHsINHjPxOesO
	WOucqMNUgflVUTjdXu+Vmb2qpVLOlqXYYceD8zYGd3CROzOoQYzyBk64myVEjB51
	v5IqA74RHvP/s6bU1ajNvJFPg8ykX9B+aczmvV7f6QqhGuZGIydJrrDG2aIZVKzy
	z9thC8TevL2Na/Zn9CTrgN8KaVMLSN3ElMgDT1pVpSxE6T4Xxn/aTC2wwa1cOIz7
	tQn4Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3v443-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so175588785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771537; x=1751376337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puqnTEAbiwXXvejvFqHMQDxLMczv/myXUOZnE8pspZY=;
        b=AfuvLH+zeuaw4xIrY+VQaL0LE0B4L8VScCiYgpMDkoChCrqz1uKiM93dfw0cqqPYN+
         KMSb3pVPDxGz3sEeIq4eikSN9fYWruttW6jcueqWp9v3IwmDTSKB2i05TVt8Uh86Dlck
         RZjgNXx1DEEVK4Qexw5OzYh10Lyd6+LT/nUReUBfufd8wK3t/bu3jnximUByJsPDGPgg
         Q661lSsePjN2UbfZbep3Bub80xnvlE2qM/EhBT6Wxk89Eo55gM+EmQ6vUTid1eah2Sdw
         KGkI6b7UmYZFcm9SU/syBhjvuTUVNdN0sZ13PgPqQuUW+Kyp/FC1jU2BlQa9heUALZtU
         x94Q==
X-Gm-Message-State: AOJu0YypDzttGbOsK4LH4WmDLyvN5iLUDAZ1izqrOY3d/aOYJZWNLpNA
	GPSoFd8Ef62gnnAQAJiQVyIWYjV3C0OPNMkE98bzvTVRwqe0ys0gqiLjBK0Pm936bJHVWWiEzqz
	dV47XEJgNiI8eccdYLPIp3Aw3+8absJnLS5wYVTQ9Lruk6+tVY93byxbgDCFgnq5XRJlLZradCS
	7e
X-Gm-Gg: ASbGncsOIokIGgs+CF1Xb8ZRSDAuxiMC8NYAEahC5RSCqm+QuN7jv5zrFipYSVFiArO
	uA/iM7w3rpc88QX7crBzngXI8HLH0EUW40nxwLQYGnCGEzJoBAPK5na4JnGkEsHGiDxAzwzlnBZ
	Gb/JTuSOYGHrLm01Hx8zf72nwiK1jZJVaZku3LHJbYLnr3fxQJblgIf59ipO8YGaT7LJbq3mRUu
	XwsD3EbE9UXWSEa+wR72Ay2rH6nnMLIJeBtdgj791yNm5jYF6vjcmirADjItFYSa86h0aaiz82f
	cc0QO/cj0r/H/IgVv3iuduZhbzli/KYgIlB/VUt5dIln97Aunhgtg3EjKWNtENLd41xLDpm1Wkw
	5JL4=
X-Received: by 2002:a05:620a:1b97:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d3f98f6cc8mr773216385a.7.1750771536994;
        Tue, 24 Jun 2025 06:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdrAg7gq+yCMSKsOWWwPNIbmt3jijAcQ2jxJTGwCS226EaL249p7Qlaj5TFZ6lHgo2gEcMWQ==
X-Received: by 2002:a05:620a:1b97:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d3f98f6cc8mr773214385a.7.1750771536510;
        Tue, 24 Jun 2025 06:25:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b75b0sm864445466b.126.2025.06.24.06.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:25:36 -0700 (PDT)
Message-ID: <cdf8428f-1407-4482-b946-804ffcdae3c7@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 15:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
 <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
 <d31bf707-0f8c-4f55-927a-a08c5310b7be@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d31bf707-0f8c-4f55-927a-a08c5310b7be@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX5ozWYsbjFVJh
 l+qZrKjFGH19J9+uMabERZqb5d0b+ABjsnDcafaz+uQdiuo0WGccexzr5IK68zKXrn97AnLBw+Z
 CYUo4gwJnu3CBPc4xIHNnY79mSBiVtTdWcO4/upQO4a7WRjjA9lJj5TKRxX6/wgYPhkDdK5eUw1
 ZJ4J3lNF1EV0ErjX/i+Cw/2m7UPvuvrh2br+GeHOEnbzeU9LUU38H9nOIHk24yI7Qphol8ICKj2
 T34o3NbZz8/+ElBlI0E/5T+Rh5U3T7sbG/M4HQTh03zhHp/6mKzoApu7swC4CJCslGZ5vezeLmH
 bnviNZv33M24xSiPd86PKyR6GZNUdkqVhAErXI3cew9gtfWsAEHblYEEgRkqloFceSY88eRSOkC
 AZnFfooNafGTpAZT3f704lf0Emz2jLDWsqmd0ZNU3mZwAYDuw98BbAoCHrNp3DeI3WfQ1A3F
X-Proofpoint-ORIG-GUID: ZYf_CcVScI5vJb_j2qMYIqpKQKSL2gpx
X-Proofpoint-GUID: ZYf_CcVScI5vJb_j2qMYIqpKQKSL2gpx
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685aa752 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wIXcl6-ah0yuBUIPcu0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240113

On 6/23/25 6:44 PM, Luca Weiss wrote:
> On 23-06-2025 2:39 p.m., Konrad Dybcio wrote:
>> On 6/21/25 3:19 PM, Luca Weiss wrote:
>>> Due to historical reasons all msm8974 boards have used the CX power rail
>>> as regulator instead of going through the power domain framework.
>>>
>>> Since rpmpd has gained msm8974 support quite a bit ago, let's start
>>> using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
>>> for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).
>>>
>>> For reference, downstream is using GFX power rail as parent-supply for
>>> mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
>>> modelled upstream.
>>
>> if you use an opp table with described rpmpd levels and bind the GFX
>> domain to gpucc, it should propagate - check it out
> 
> I don't *really* understand what you mean here. I'd be happy if you provided an example (or better yet, a patch) for this.

sm6115

> 
> Also msm8974 does not have gpucc, only gcc and mmcc.

*oh*... right

You would then have to somehow selectively bind the OXILI_GDSC to
VDD_GX, for which I don't know if we have a good interface today..

Konrad

