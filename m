Return-Path: <linux-arm-msm+bounces-80946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5EC45A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5596B4ECD2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E2B303A14;
	Mon, 10 Nov 2025 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="De3hlYXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQ70CQvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6158302CD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766725; cv=none; b=GtJ3C+SL1VprvIFmfUTv+5jMJqFUb8mtOPLyuQ74pJayunnQUwxLhQfdajC1yWEwJtsGJQ8FqBCx8qY2Oozms6iMNbN9Wa1Bb0e7LaEBsAVCRpxnbGkYRFUWudEcHzA0EsrjB2l3OxxDSBR4KWyG8w9wBjKD9gKmQbQWC9hwasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766725; c=relaxed/simple;
	bh=COyf3y4165U0Or1tBHla5IFTQQP+OVd+D2o972FPjOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ny9rVjMhtMeqD5uhimnQ3OVIBZSu/7euxdkndo9qe6YuTpmhv5VjT7sc7e0KcDIFOR/o+AlyBasPSDfAq8vFRPnFWtOPQROceIDACYyIPUX0n9sll5exB/3ENjTc/KV28ACocKviFfUFTePhr9FBXkYKIZ9EWwV8qN7trnh/Ch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=De3hlYXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQ70CQvT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8Zmg81576829
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3iwEuhqc+bI7sXi89DxMm3XXxk6P/2ZSBmsCLcSxb0=; b=De3hlYXTJX815q68
	l/+QzQ2fH/XE7rLTP22wGBHzJQJWsGNAYpVtyb/uuLSZfTyd41L2bcEsBwjcWWaV
	Ckba/GKSWEXwXm/hZtXkptD8jsBKxciL6wCWhxblVxeQ3Cceda0hJTutvF6GPnTB
	ZMXGz/sy3dcu3+LUFqrm46I0AJWRZWzTzqLbw2FeG6b/OMhZYkFjC5mXHocgnOXY
	5RAotxELpgokyTiMe9EIUQIvBRGeYbekiWyrtRMZvwKDuiu6EPvLThEPJWnXYk+i
	G55vqwkNQAQfyW8nB+DoO5ZoQNl4IdfvqcMKZO6irYpZ8sZvcRdYL2cTOqhldFnz
	t88cBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuem5he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:25:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34361480f51so787804a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 01:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762766721; x=1763371521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3iwEuhqc+bI7sXi89DxMm3XXxk6P/2ZSBmsCLcSxb0=;
        b=CQ70CQvTPgsIa8aevdLGHf8VYX3JjfbHOiPv6Q+Buo232OumQcsmiGDzt96xWzHqFH
         wHELCJglpSWQnAY8ifysov0w+PFMJ+ec/ouUQx3knXyd7TDAvWR/O6hG4DIeN9FE1Sht
         sQhqYSkp5x2GcHAsV3ixTOESnMGHyKhJ1SIgzPLBFLKAStxnwVO3VPslxqPoLYPu4jBv
         mQ9euobhtQ2/6nWKJaURAG/m9neTuoZyZ1GmhPzUTQ8adpr4N4xAlD1mnY+lky+nnT5c
         PPGls1mblJ22VYk5dlRVozkCwVc6KRmuCesYWbh1MXuEmgW2N1LlnOlNR8dgaRAMGr6l
         IpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766721; x=1763371521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3iwEuhqc+bI7sXi89DxMm3XXxk6P/2ZSBmsCLcSxb0=;
        b=Yu3obtd69L/J0SRlJj/N4tjpDQDpe40tBC8tLGKeWd5l55xHT2SSDgNahcHtRjA/kf
         RdNTeX8RyIiQx3Lr+0d0ymtRF3j4LqDT5Rr1vmGRPGQU60u0Jh6G0pvvKOeLYOgm/Sdi
         PMc3vSRbyjPWFNfD4BVsF6r85d7qtEYAIcWFx47PC9xGf8pScp7mFgHBO8fJKH05eJI/
         sv4yQ2U/3lPK9OXFQBFXMkukj1nBhdgZ/uEqcK+0ksV9gfhYQ8pW21F9WjkbjMSMxXBO
         O3UZVBz/PEZlU/RED3MDMCDWonfB8MrstKr4RaxF15ufWBVTM/TnmWVNLnP+zgmXakiL
         UAew==
X-Gm-Message-State: AOJu0YxNK5XhnkkGzKnOlgetsMGUZo7llC3kSDq+8+Ce7a1DqLPmkQKP
	RAhSjdYDDgW4nKqbxW4EWcysHNDhkWKN9YMuaH8+szK4Ko+BWzxEhOmDKp86TrZtl5QQMCePm6K
	wT0EJjK4oc5I8nUse89LfbnURNWrZirRkrs29i7pVpQuzRMFkF+UUjT7MybACoIfrx6o=
X-Gm-Gg: ASbGncsfMeNjChE6xsqpNNfWv4/7lJyWXj7om0GaAUKrooBMqUkK2ycONdSZfPt/bul
	XGiuTDXuAM3eBDLVgEzUYuLCkHSnneDfJk9y1ZpepPT9tLPf1kVhfUG7DuFK4SFkzj7h+RI6XVJ
	SpwpFEZ43wpION8Et5EAuaUFU9SKZSGN+lrMpkdqiGtxEJQUijmjSo8QCixztMT6UgzaHA+WSVS
	imty29TOUQBK3F8zPQapZ18K6I9tdMvvb4I5M/coF/u4uwgXL3q8pMLINyJ3yXplzqDbMl1+i4E
	IpEy73anuwCvDDNeb9F0JDfATWU4NVCRIBp/4VgrCFV9URfgn5chhLAJkmZy0ET4PXai7RjBLUJ
	Y3BTs1c7yoYdKUnSRnfX4TEA+JZ1q
X-Received: by 2002:a17:90b:380e:b0:340:dd41:df7d with SMTP id 98e67ed59e1d1-3436cbdb388mr5196365a91.3.1762766720765;
        Mon, 10 Nov 2025 01:25:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF6YvjN1MO27w0jr8y5nhHgQEsGq5JKghm93KJ5CAm3xZcf3PDc97izxyvMHS95tr8OFeHOA==
X-Received: by 2002:a17:90b:380e:b0:340:dd41:df7d with SMTP id 98e67ed59e1d1-3436cbdb388mr5196327a91.3.1762766720171;
        Mon, 10 Nov 2025 01:25:20 -0800 (PST)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68aa1edsm17045606a91.1.2025.11.10.01.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:25:19 -0800 (PST)
Message-ID: <268122d1-d629-4d8c-b88c-2999c77a1a18@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 14:55:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
 <20251110085013.802976-2-sarthak.garg@oss.qualcomm.com>
 <35e8ef89-3fbc-48ac-9b2b-10c2e95ab024@kernel.org>
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <35e8ef89-3fbc-48ac-9b2b-10c2e95ab024@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4MiBTYWx0ZWRfXzvYrwglFToSs
 DwVzQ2aRNxeU/SEGVm95Xq+N9dt/K27XqXyDG0f4WhEIteVoIBApwpl4u2YLUjhZpgWNeIqJruk
 FpiMDs2MyljRYziOcDFuBD1WINUydatwihUNYnp3zA7dwxoBg4nVu+r63Kbv+Njw/5JmbiY2bki
 Wf0scWiWqAdi27p8Bme1731qvpiIsEW/Oen3r7VRytKZEEjKu4X91teAcX9cpqBGaOTaTSUeneB
 l2PcFxFmtmhkJxToT++r4JKHRsfmIeEsIMINAo0D0Ox9WhHg+JKp6mmDt3iZaBS6disPiPHbXin
 xA2//q+EI+sr/ytCsNkCBEjYorhc0V+erGgP/nT5WuFuV3bwkZS/uvE5ZD6azbW1SEHER02sKPt
 wxhpVV3mDP+u9cfXfikpfKgT/Uf1hg==
X-Proofpoint-GUID: C0Du8KU6ohxU0RFiN3K4fqyXaXiSVtXl
X-Proofpoint-ORIG-GUID: C0Du8KU6ohxU0RFiN3K4fqyXaXiSVtXl
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=6911af81 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-MylOgvtSvH4J1e3t7sA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100082


On 11/10/2025 2:43 PM, Krzysztof Kozlowski wrote:
> On 10/11/2025 09:50, Sarthak Garg wrote:
>> Add SD Card host controller for sm8750 soc.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index a82d9867c7cb..95b210fbfead 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -3482,6 +3482,60 @@ pcie0_phy: phy@1c06000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sdhc_2: mmc@8804000 {
> Nothing improved.
>
> Best regards,
> Krzysztof


I moved the sdhc_2 node to follow alphanumeric ordering and used hex in reg.
What extra is needed ?


Regards,
Sarthak


