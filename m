Return-Path: <linux-arm-msm+bounces-62779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7727AEB7D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD7D4A80D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2B6298241;
	Fri, 27 Jun 2025 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V08rrKPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E092D3207
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027732; cv=none; b=B3Gs9uT8ChIFWkDzJPTdSUAOKDx+YPMZ6n1CiU9O9rI09b0IEEdqraP/6+3TBzed1n3A0j+17/ORgeLn1+p5fuZs9zODgO4YqyXQkuw3VVF0uY8jvB2+pfZyIddZcBbCgaW3TIZ82jlBdZNpsllHA+ChLtY2jjVoR+Y5u38HxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027732; c=relaxed/simple;
	bh=Qo/Y9vysAF4/XtHmYuHzfr7cv1qLfdc+GSgIJ07pEJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVdMFfnARjbgu1uMo3+Hb6JNW6axaYMJroAzqz6P+YAQs1zCzJnj42LZm74FPkjP2LwOHCb71HcdCXeqDdW85ZJ3nj1x7YA5VCu9vlrqmPWm1mOtfDMnTxdOulkIWuQyTZ+UoJZCpasXFAVwIiY/CIRZwmqYCf+xIoqAYc+HLrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V08rrKPZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBOQBd014370
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5B6rDC7Vr1OqFX/DSU9HEATQTSwn7MiEoOr0N6M/z1w=; b=V08rrKPZT13wrgdz
	4jx1J6fimFSHvTE8S4wAZQYB5RA+DfD7y44/j60bFBuzMhMduIFlLftSPFu5ON33
	GNDY9CJU2yOsrz35vQkRd/uoUeLLtETUEB3qcTptQP0PJsmQbjwqUrg0cTpxIbNO
	55tBd4mImV429y91v3BM2JahCwEtfMQXSEPbgqchjkYD4zEEqH6tfN13A76puaPT
	baF2x4E+tnis8Jeassao17Mx5/70wBQ8Ogcsyeu1I3Ld9d9pfQ0qUjVqfZCc13EG
	XJKkmwNbwt3RZ/ULnbtHTJvvvfG/l+0S9k4MLr0bSmwuFz6UOMvhcBV5IlBKF+qV
	BhmCEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn0m3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:35:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so190455085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027729; x=1751632529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5B6rDC7Vr1OqFX/DSU9HEATQTSwn7MiEoOr0N6M/z1w=;
        b=Rp9wjNDPA7YfYlvJUBUa8cgbBE3KUFGxI+moxHl+qbB90DQMyEixFZ4B3m1EoWOe4y
         lpz3oa2N3PsoQjm0yJLcy09Fcw0cmObXAb8A0am2QGLJ+1KibHUj9uK8hHxv9llEwnd2
         5n08DEdjYJFLzfwXO9P6Z+6Hj2L/uLwTcr34lSsnj51KcaJcLrxDOj74MpLtu5ClUFrd
         t8yi9mfvtGerZGC1bgVgnhy8hrlqtnEKI42gxjMIonlcAxQhjXsQWux8Nev9JIHAx/E0
         e1bPrGn6JJwBDuyc6/tHNx8LlGY+mp4Zp43NTyh1vdG6O2R1CAnq1FNlbRmUgptS8HPT
         eEQA==
X-Forwarded-Encrypted: i=1; AJvYcCU799V9Dm4vur2MvzXRoWzzipv+sRAYVr4avEg2ex+FrYpv7TcjsKsPh8JxIzrNJ+mBT+CY0pDeZqmnj749@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCTXzBc9RsWRHvfiMVMKxMQMMbM9rVMfzWbvvDdQcTzL+Jo9z
	nHTzYhTn+35gDg76Z/Fp2JIKCC+DLP8JnmcPO2wcK3dnQGpISnk9ymP541/rApI303+vcgSPfNh
	DNg02NXRcMbVmwYFZHC3YfW1Q016gwx2/ZmSwEkrloVi/2/uE9BuV+x3ZL/u7AblTL5zh
X-Gm-Gg: ASbGncvGAoy9jykClRXrGmwW6Dhl/I6ZK9vTOag5n3h67crlKJ1ptJoFNlWsvnkHLjx
	Zx1li4EvZ5HwUPRFkwCAAG7LqYKeLaE8nn2XGKHgfAehw56SmwaDP5ur3pq7fA5iP7WoNMf7XcI
	J59yNao5yhi7wqZ2ys4ZYrivXLGLkG/CrHgW1xBPS2K/JABetEtgeLZxfwa4vnHJbxSGvpSRGyy
	cuk5MG/1OGyWoYyyBv8j3d1kb+DpzlV5n5ejhUtp5wz6PfHMicR+OM+DSbtPjt6LkGhGHAVwF0U
	9ekifOtQipOLyBR6PNtG60X7o1HxADKUKa2AECC4UIJVpKt+PyWw8kq6wrwa/7s7/WeD5jqh
X-Received: by 2002:a05:620a:29c2:b0:7d3:f906:8652 with SMTP id af79cd13be357-7d44397de59mr425854985a.12.1751027728356;
        Fri, 27 Jun 2025 05:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLG7VXVkZfcdvopkn9k67+75T7P739XrC3+C5fZEhATwKbfj5hRgaIazp9JTVb6Ss888RxsQ==
X-Received: by 2002:a05:620a:29c2:b0:7d3:f906:8652 with SMTP id af79cd13be357-7d44397de59mr425850685a.12.1751027727809;
        Fri, 27 Jun 2025 05:35:27 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d51fsm440779e87.62.2025.06.27.05.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:35:25 -0700 (PDT)
Message-ID: <66c71817-442c-4a7b-8d10-48e6751c8e2f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:35:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
 <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
 <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iM_5_KYf67-mlvciuUqRSFlJEwF1mGj4
X-Proofpoint-ORIG-GUID: iM_5_KYf67-mlvciuUqRSFlJEwF1mGj4
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685e9012 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=14MXtV-COIB55QcvAqAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX8G2V8RkQiZFu
 mtP7CwKudOdrCpwU0kJYhCj0oZ+ENHZBi20r/3/YUzls3ia+JjC4/30xKypbJEUwM5bpYv9ENZx
 oQUT3SxSlUFtvKwbXlaaDv902VgViZOWC3GYVqfeqajs9CWDObLYW8h850JRJEjfsDj9Jtd8g48
 ZAgspWRxos/jCVYHwS35PYdObRXLQjOXg20zDogLr7Pp+BExRVGDLfc52BTC89g/lJy0RAOj/0V
 C/YWHnRz/d8emCZMTg9B1zkpOGn1INPTgf9Bx/WdTl3QjUvnPdXoKZ7CIQLEevrpDUy44GoB2pW
 5a1OvBoNW2H2aaGV6+TD+LVdo7bkW3yCPX/OlXVqITZr4X6MXuw1uOtO6C18k9x8PHECVodOVHE
 doU46iHgCF7YpnlY8YL5FmNDkP4duvdnLd5umF+rlt0Hwfis84oJbuOqzCxyDqIYFd2HH6BH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=961 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270104

On 27/06/2025 06:52, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:06 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>>   1 file changed, 29 insertions(+)
>>>
>>> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>>>   				qcom,remote-pid = <2>;
>>>   			};
>>>   		};
>>> +
>>> +		cpufreq_hw: cpufreq@18323000 {
>>> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
>>
>> Why? Other platforms use a true SoC as the first entry.
>>
> Dmitry, from cpufreq-hw perspective SC7180 is a exact match for QCS615
> and that was the reason to use the same.

Please look around. A quick `git grep` would show that every SoC uses 
SoC-specific compatible (although some of them are definitely 
compatible). The reason is pretty simple: each platform might have 
SoC-specific tunings and quirks.

-- 
With best wishes
Dmitry

