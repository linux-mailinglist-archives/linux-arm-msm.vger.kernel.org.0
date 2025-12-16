Return-Path: <linux-arm-msm+bounces-85353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B5CC497C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 18:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD48C3043811
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFF736213E;
	Tue, 16 Dec 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwUXep0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZRyWKf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1E36212D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889517; cv=none; b=u7XDukrT6rMuvE7pUMpfXcEFSbEFsvHPV8QdJk9vPZGE56P7eV7ko5p34iT9MODs5iACJND512G/5Ne/CcNUh3kbjRKDGS3tnYUF01/rhsN6X1LBJaQT3PIfUvx55iCPzhfNza5gJP1f0XTqkjWdRLnlXQ0XLQ2g1ncD4uk4Xbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889517; c=relaxed/simple;
	bh=tRIiMKhp41BqNNbfl5X2OReBMjJipqr3xIlpiTiWNOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TBIP5iokIClbaoI6PmtOQFfcXxH/yt997ks6W4IcBAmFGY8p2mKAKgBXZATyYikQizJr/+731e8eAPJ4Muvujuvsz4bsXY408/uwTa7W/wgYWpNgBB7P/3rPNN8H4oE76rUEr3HiIK1WjWM5Ktj2qB/zVHtKIhnrvgUpAnFV9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwUXep0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZRyWKf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGAM6sm3829376
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jm44wihhj4RM4JHsScL7TVMZz6bYHdf3D2hcC/pTJlM=; b=HwUXep0ZwRa790rw
	RQVnnanb4E0hNzX+R0ewehKdwjjmSD4cWXpDSoiSkmrOT7mH/2v2TexYkj0/YYei
	h9FSWukOmL5O4Vt+j9W7rCL3ixuNQOilBn7zX3vpPxdspXryU+M2HGAms6+BjEeM
	H7ae2AUWMJf9xC0u9H6QzCssXmnIIaHRU5+MRib352wfXfWUrRFfgDunHZOdIhFA
	zh/zQowC0nuOo6eaDus0H/fmWpkjE3w+z0PNcwpKxYmlZOC7hJxv8mtZkZcUDCLU
	G4AUHVrj4PKiOOfc5ZXluNYwYLO5usBA8krzRFhXws6iuZTjkhNWZA+D9VQbGZw3
	50joYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35m2rh3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:51:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0c933c104so10608505ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889513; x=1766494313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jm44wihhj4RM4JHsScL7TVMZz6bYHdf3D2hcC/pTJlM=;
        b=LZRyWKf6EGXrCiZ2kP/rhgy6cj6ugN/oH/VFr5imwMvOCkPpSBZtFiueqjt6aJhdtQ
         LHcjhT8Nvyd9ReDNi1HP2MXV7mxjOMFtwXk4A/uImGBwtiKP0lCBAQDIP2jsMc/5Ua9k
         mnKX8P9SeFcnluf5L8+imXKDg0+Yi6jBbJgaITtdXEuIsQnT8CeA4sBCIkmObGfuNqEE
         EeXUvFwNZW2s5u0YY92NKyZqQ7Wev/RWuaxysqDQc0U2BwBWsgTJYAre2GC+VGHaQUX8
         NXP7G4R+lTNNn5jhDJUruVSlCdjzs8YUiVy/Z3HVYgzvgcK6zMwztucr+M/EaH+amIxK
         VRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889513; x=1766494313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm44wihhj4RM4JHsScL7TVMZz6bYHdf3D2hcC/pTJlM=;
        b=hvUnTy5JrYYB+AhxARhLFZUp7YKPUcRU1isL0V8NaKTV2aRdDw3HWtsDcsaxar+NYP
         0aFLTHL9qKRsb9iEaKDw82tXiFMiTwBquNpvzPi+vP1sUiMSzX+zGcuEJXC6/xXAjNvb
         ehDl0ecP+sxxl/oxyR5R/vUDYhPqvcOZsYV+dFAGdYAScuOrZeWgM5+xl3oMNPpe8s8s
         q3EObntQNfrCghP3nSVRYr3YxNEztSMqkVcf1laNO3+NXfeMBZKPO2fxX/GRuZ4pD6w4
         BH2n8h7WL4qXhaYKKhUI50wzMPaxOgzdR8yvxuyNXhcj05C2i8lMS+sBS5oMp6XrBgGi
         PyPg==
X-Gm-Message-State: AOJu0Yx8K9fwUheg8vZzwCBD7+1/az+DZgwV5OF8GJXHqhI/h5pMIVih
	dNLsoxiHXM4vhT2ejV4kaLZGtcFyTtA62h2zBcXSjB7wota8pJqxjH8R/FId/cpLAH6RwspHieM
	kUx6ZlE3NoK0u1kn1FwcbQ91bvINzo4dEjYPXHz/yUocPPX2LwSEmq6zT6w3Gt6I/dNt8
X-Gm-Gg: AY/fxX4j06o3hgERwSS4UWq4gyH4DvqjkPc7luT0mVNo4eoLS5LFaIfJhAL5O0qYNYg
	5a5gErh78ppUOn60gtXDmiaNHLmhOdUN+8aZvW9NxnBduMeNc/sGEwb7xQjGdLGso+ZtSPWHnWb
	nGmFhRp6G39TLv/3z3Skdhgu6WwAjc4BkNL7EuUchzSkkWyCk/blIQLB7H8THadoOGNr27HFEZ5
	lF+gPo4vaMP/mbOCPnOWDT3P/RPQgtlKVxRsGAMR2hB0JZyoxna1Vbml4lgbCtzm1xEK5o3nI5P
	xPhFBBkDrlaDyOw1z3MuZJd2LIBTj6o5kVT5+tFH5wmJlyJE/HLZhrwzyjbz0JsMiSlW2hr1ML2
	lTDYcvRnYqTMGR64Dnj9K8f4fyURCCs52blXcV3KpMcTMPpG4tN1Fyx7slCVy4r16CA==
X-Received: by 2002:a17:902:d48b:b0:29f:2df2:cf49 with SMTP id d9443c01a7336-29f2df2d160mr87575735ad.5.1765889513390;
        Tue, 16 Dec 2025 04:51:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH5R2IJVmgwrckoOlvC7HPib4GBK2WycjnU4NfhH3i63s5yLgs2JnL5r/sqPg8D1ibp5y7Og==
X-Received: by 2002:a17:902:d48b:b0:29f:2df2:cf49 with SMTP id d9443c01a7336-29f2df2d160mr87575495ad.5.1765889512887;
        Tue, 16 Dec 2025 04:51:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29f6cbsm1705679366b.5.2025.12.16.04.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:51:51 -0800 (PST)
Message-ID: <be83a344-4345-4417-aabd-39565f76dc00@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:51:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v3 0/2] Adsp fastrpc support for sm8750
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <quic_ekangupt@quicinc.com>, vkatoch@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, chennak@qti.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
 <DEWCVSWNA1MN.10IT82HICKO8K@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DEWCVSWNA1MN.10IT82HICKO8K@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LpGfC3dc c=1 sm=1 tr=0 ts=694155ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=BYvtZF8_egfN02wk1QEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3EPMjWKPyg8YyIFKPzyTx0naeTuc6eyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfX1L936E5Pbj4G
 YBBAZ8jYHsokHK5nxWECpi8g+HOkyy1CviBXMsDetS3RLODEaOs3uMZHtjTVJpW76LUqtaaRSPr
 ifGmUgYmZv+TIam6v1j7LIE8VihCqXigIs82ykoo6BlVHRSzIhNmj+58PBTQ5j7JNhgUmuMhpqO
 gDPEP+dfbF/4x2DCge+0P5LMAVdSmn8KYsFCN+t32Rd3cMKUL1Q9+WX8BCflgOBfIpYUxKrB1AB
 QxcUaqMETx3ZbqsrqIo4PdWRtzV78J8dUQGIS9evSIwzIwOIPeITDhsrMKa/2+Q7OVY/8iRjcC1
 4lV70F5EP07f05GFOqzVieh2B7yg/gtxSOJtXql1uRwIbM3ZomR0Hkfov2LrGKfh2NBs2jkSvIN
 Fayb3rEGKrHS4sdkWuQTCwLsRj6Jfg==
X-Proofpoint-ORIG-GUID: 3EPMjWKPyg8YyIFKPzyTx0naeTuc6eyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160109

On 12/12/25 4:50 PM, Alexey Klimov wrote:
> (adding more Qcom folks to To: header, who asked to send this as soon
> as possible)
> 
> On Tue Dec 9, 2025 at 7:37 AM GMT, Alexey Klimov wrote:
>> Please test these changes therefore RFT tag. The fastrpc testing
>> application under linux doesn't work for me but I was told there
>> is a setup available somewhere in Qualcomm where this can be tested
>> (perhaps android?).

[...]

> ========================================
> Test Summary:
>   Total tests run:    3
>   Passed:             2
>   Failed:             1
>   Skipped:            0
> ========================================
> 
> RESULT: 1 test(s) FAILED
> 
> But the result is the same for CDSP (was it tested prior merging?).
> The same results are for v75.
> 
> Adsprpcd works with audio_pd though. Maybe Qualcomm can help with this?
> I don't think I will have enough time to debug this and narrow it down,
> also very soon I will lose access to the device.

Please open an issue in the repo with the above details so the FastRPC
folks can hopefully help sort this out

https://github.com/qualcomm/fastrpc/issues

Konrad

