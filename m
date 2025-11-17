Return-Path: <linux-arm-msm+bounces-82098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D78EEC643EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F7EE4F4E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C79330B13;
	Mon, 17 Nov 2025 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3B36CcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3gXn1TT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145433CE81
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383545; cv=none; b=SNcyEi9osj3RIOWKLvnY5mkQcDF5v5O/KR4Ys7+0RlESLLOfuIY6Lse1yhR4wyM7hqznkz65xQQ5VZLw7teBahW8Exar5WqBHgI9ZdiKka1WFyv4tr/x0iyOIVV8vIhvSQ/8IUUAx0IotzX6Vs/mhCFphCYVwrBbO7dSxoX8hB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383545; c=relaxed/simple;
	bh=zAaBRN8aUVkBoo2Ai+HPbmL2d7bftI05RskM7Mnrp0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b6SAG/u9Keli1nVL2acroFVhvTKT2bbC2J8yofs745eOUhwJCjkYFA2V9r7tUY7qFQptzYe6qYND7FqcOj8ydsQ3U1wl4vsETnag2YTpjfl2yp7w6icZsCbzxqgcKGJ5vjveJWVLbZ03de7HnuQj+An+YpFwyB5SsVUHA+6s8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3B36CcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3gXn1TT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBOIqa3318413
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuLTRWfP/NWeif4W5Wukk0z+JStEEIR4r6n4oQu+nMA=; b=L3B36CcRF/f/R6CT
	LMAM/9iI3xTMjhFkBBC6EmFEixqBQ3DsXTeo1M4xZFkow6RPcaroP7cHXzvUPAde
	y+fOW4P6RBWLnoVFxlj+JgVmydKgcmB3eLKHJ+dcnDbWuSeG3CxUTTPFWGyDdFbv
	6f+BTdLbDbtIArinalfHoJntQ6k5ZyTy9omO3uN5G5oDtiD2B5zOOqWCi2Aw13YO
	VCPaJ8wFZK1irkPqDCVoBkBdL2NuRwAmo0THt4mJQWsjNp8R4bpckQ4/hD39Q5p/
	w3PgpSqrmDR8wePJb6QYGW7FmK4h/kzymenCyl/k2f0GWQ3CfIRit0zIUOqFiVSj
	bSUEFQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5cqxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:45:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882414eeb90so13520556d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383543; x=1763988343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MuLTRWfP/NWeif4W5Wukk0z+JStEEIR4r6n4oQu+nMA=;
        b=e3gXn1TTT35IyX3f8CchP5Qd9EKERKLYkqs2clFr1DqzNZPs1xSQuD6CSMHUo0ZXv5
         o2lnjUSXt3Mfk3Pxxi+Wnd4k/vnE5AgCwt14CCUzt/0FuQH3/EsUoGiA4HuFUaRP9IZv
         tG3CTWDn87EIc2ng+MHl3lPG5O5OyCEuMsLV+T0igEnKnKrO5dhlx8YFt4vEs30u9XDg
         192HRGvMRteDvHUSngtyiXKC4oHkyI4tsfIiHGbEeCFuqdBZu8af3Iz5egxX7aJNviCP
         thUfH2hNTxpES5u2n+8hSL6GlHnIT7DcVXlHg5sxSRsC9Xbkl98+Oha7xIfB9EjmscAv
         lxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383543; x=1763988343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuLTRWfP/NWeif4W5Wukk0z+JStEEIR4r6n4oQu+nMA=;
        b=Uffz2AE2WfSjmBoMpH3An+w3SG5/Cs8d4w+4atZMQRCN/N+qk4NtpAF4HxL2EqZDj6
         L7bpE6Y0A0QEhMt7TWcEo5NG3UKzpbH1uS2dcPf7+DLjVdG2ARbpb3MA/1G12KtxoekT
         YM++PNtd+QIgdG6afSvvrBvI8qHV0MI1INgMXcfbJp+rI3f5CJu8hluaEcj5E1JRgF+L
         2baw3U+BGFCxZK/R4jVbaVUwzXv9MGMRlK4aTZWNsgaH8Huelgidh9ImfxEFTdQlP9mp
         P0S+wTJJ5a1DWx7sGqYl+wUoWft9i0Fciylob2lR9aHq8KpkPj4eY3RvvLmWCaxR3lDO
         v+ow==
X-Forwarded-Encrypted: i=1; AJvYcCX4tlYvRS43ejP9GBA+VQYot3oCUyZxLpVZlbmWOYJ2oGQVXsOG0w671bCdPhM3M4DQIUWNSIWMkm71xNjX@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBl79Y3oONjrfU3V8LRlu+atDNyApyKiNp9hF9y71jNpW12qI
	YrLhX1MJmG/3iKNDIoZW/OSRo46T/NPqh3oSwTAGVEXu8q+asxhIDER2AIApH2LhPR756rhGk8O
	u/uT8DP6KPrSokPccqH5BwJvMmWz1rkdduhy2j16RcO6Nypdwjg61TtttjpF0cgeKVZh3
X-Gm-Gg: ASbGncuiXvhKo7l67mhu9/DCTiNOQyq7RLMjvTofTZjW7IB+P8Qyp6SY8DO8zWTnaU6
	IBv4k8YeWT1kUByrQr37Uigl2HT8FUJIBWqQOnBQtKu2MwJjcq2SGcKUgONsAS4ucXW8uFEn3lH
	ymaHI33SX6aJ0iIvXkYtRo9H2ne68aYa7SVOxu5uq/y5sH0YVrZvRX6ky1Agktha57hMt/5Muzl
	C6xZvxHcOUGuzCk96XZ3c6eGrFSMKzr6gC3z5ezZXWAeKiSH98ElnWmFpFGqEwy82vqvXYUpmXY
	/jBo8mbKvSqgV/UnYMqrnKjjuGayI/O2EAvyN44fdchPoVGOR2dW25GHeEW3IV3Jgw7hafhNmJ+
	BfnLXXjWHsok6rfEQDXZQZFkUQeEWVwwzjo1Z173H2go3nL8kQQDJJFb/
X-Received: by 2002:ac8:7c45:0:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee26383190mr13677191cf.9.1763383542625;
        Mon, 17 Nov 2025 04:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1/SdgjmXEVX8GzC7p9XqxdwXaxPInFwyfN61ifnpwgnj8DKGAGgVzQsWm7YyJ+/G2u7dJRA==
X-Received: by 2002:ac8:7c45:0:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee26383190mr13676931cf.9.1763383542098;
        Mon, 17 Nov 2025 04:45:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809absm1076620566b.44.2025.11.17.04.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:45:41 -0800 (PST)
Message-ID: <02db51aa-6e19-411f-875f-718b8215c373@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:45:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] power: supply: qcom_battmgr: improve charge control
 threshold handling
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Val Packett <val@packett.cool>,
        Sebastian Reichel <sre@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012233333.19144-2-val@packett.cool>
 <faa9d74d-63d3-4569-ab36-5e0ee0241794@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faa9d74d-63d3-4569-ab36-5e0ee0241794@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNyBTYWx0ZWRfX+QOVN48d8W8i
 nCnFv8M7r1Ixdexnq9G5t5E3AFPXpPaFr9J1cGequkxJ355pOYH7MbNMPSmTqmLDFVJb7NL91TU
 uITsQ5i9mn6vEp1Oz/fQLfbBaxq17Dp4zPzgMx7T5ZSFHgM8YZaTEIMwgjVpsh2yAUoU+rr+mZY
 7IKSJeGrruk702aI+g1ZpEog/Z+KC9Z/Ax5IG5g5bQtD4JSYSr9LBYc8b8sR8uZDSa78MkXn15Z
 hVdocAd5RaEtdvvUygtfIFiazgBlKuHU1mn9DEJc/IA92GP3bBwBdPDqejOwoHK/uUapkYeXKMu
 dcgEA6kNTwxtjEZwiO56RnLFSuTsGWtS4q9pt4+qisE1xa1HcPewbUTR49k7j2JFNh4bm5D23PG
 YF8EfS8rBHRdfki0SVN1VhijCd8a+g==
X-Proofpoint-GUID: friCNBFl-RsmHcGnKjQKcYuNoKJrD0Ah
X-Proofpoint-ORIG-GUID: friCNBFl-RsmHcGnKjQKcYuNoKJrD0Ah
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691b18f7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Yb_LYS4cgvVAXpmhZQEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170107

On 11/17/25 6:12 AM, Fenglin Wu wrote:
> 
> On 10/13/2025 7:32 AM, Val Packett wrote:
>> Currently, upowerd is unable to turn off the battery preservation mode[1]
>> on Qualcomm laptops, because it does that by setting the start threshold to
>> zero and the driver returns an error:
>>
>> pmic_glink.power-supply.0: charge control start threshold exceed range: [50 - 95]
>>
>> Kernel documentation says the end threshold must be clamped[2] but does
>> not say anything about the start threshold.
>>
>> In this proposal I've special-cased start==0 to actually disable the
>> functionality via the enable bit, and otherwise made both start and
>> end thresholds be clamped to the acceptable range. Hopefully that's
>> fine?
> It is fine to clamping the threshold to the acceptable range. Thank you for making the changes.
>> Or should the [1 - 49] range for start actually be rejected?
> The minimum charging start threshold was set to 50 to improve user experience. If the threshold is too low and the system keeps drawing power from the battery frequently due to a large system load and a weak charger, the laptop will only begin charging when the battery level falls below that threshold. If the user disconnects the charger at that time, then the device would be only having a battery below 50%. Setting the threshold at 50 ensures the battery always stays above 50%.

So can we set it lower?

Such decisions are best deferred to userspace and/or the user, which can
limit what the kernel exposes as necessary/deemed useful

Konrad

