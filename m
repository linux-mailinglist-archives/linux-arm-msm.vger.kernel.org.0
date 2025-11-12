Return-Path: <linux-arm-msm+bounces-81364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED6C517F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EB73A9ED3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6E72FD667;
	Wed, 12 Nov 2025 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB2en+/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxxSIL4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559429AB1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940492; cv=none; b=l2N7F47dN3NeQGVkN3bydWZanaDIDXX9iN3DNZNlgXvlF8SQKoGjaqNMzWYtmG39EmHauwValyFJ0iDzVZz0bRvRjrB4GG4NjvUtCWV/0l4h2CiPHZzsG3Y1mXlEDKeQungcU+MLu0DLOTT7jNVSLqipUeP2i67bxC+SUf/Ck10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940492; c=relaxed/simple;
	bh=yEpfRnXwpng+YAbKiDkRctzbO6mZ6cOtzRE8XZb0WYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlQ11FyH1W+PIn3up7TLcspWYuh6gtXLa3h+R2sHwVyKCF5m1E6KfVCjniBa91c7Jykh4rG95gv6BJUEcP2oKPsVACoDc3QtTCVlinFx5SoXUesGauffP7wZBvk74a+sX3i96EjbUTlMzknGb6aqNt2KrTc+kUWkQtgsF9J+dMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB2en+/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxxSIL4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6Sn8D350331
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niMngB1STMCCBtBn00XVFAnSjuGH6D0XJXQ5Yz9BtZ4=; b=fB2en+/2vl1MO2zV
	8TLZYpt+VTsVSs8oGF2+fJ5IeBxHZIQeqigEmA2Q1i8TAxVVKm0NtgwAaEc8OI3N
	Lflr+EdWdg8s1fq9Z9EJvDM1/X5oJhTFoaWjvyFLNuq1J7Rm7mWJcWfZxtqO2Lsk
	LWBqBAKY+mKKt1S+npVQLMvh9PFqyjtgi8pi6iTMln1bNDy9PoSry3UKbcioAW1S
	TJabnXJ82RbZeikCXi18jCUFFhMO1MPyiJbMmZzC9O0M5W5wYtKCKTBXA+5uAA3V
	Xx9AmNP1sp0YLmOjm4RmrGZPCN19FY6uidJjW+MUGY9twyzEecjXDrAMitLkd/XJ
	qvZtCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0nrmbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:41:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b227a71fc6so23219285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762940416; x=1763545216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niMngB1STMCCBtBn00XVFAnSjuGH6D0XJXQ5Yz9BtZ4=;
        b=jxxSIL4pUEMh1IYrt4i3IYXWUNfTS/r/nLy9fkFuaHNQScLLX5NJN33kzx8GqaP2GQ
         WpLnwwzpPylFZthYhlyd1BYwqmlW51wEGnaDC7OZFg1pJx39EAn1aXJrK6BwQn0/3Qc0
         NUBxc1ltoosd0dKlMBfyqqvmuWeD9KojgLWBQ5a0RaZKuxXyPY4XWEs1/7erekNMQKG4
         zIyhFeYOBI7UBbh/qXbFgAZ3hKdeeWatjvH0mVmmYBjzQb03cYXrcWfLo2Oov20Ss3dB
         6vxX5O9EJw4vrvcly1a/SfT4iei67oKz08dp5CJZBF7dzEOt1TMKLWyNUhTVXSj39G6Y
         WZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940416; x=1763545216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niMngB1STMCCBtBn00XVFAnSjuGH6D0XJXQ5Yz9BtZ4=;
        b=L37SPC5IIN1enRWFMbcWpi7E+JVkmUThteMsCufUplNcKLW43Jt6QBlVcRirQsY7oy
         X9HIGCOx0/j3a0KjOB7itqRMJHD6hNxNs9Ql/HMh7a6Wx9nhNq1dUlmE2EgvXXnhlPSQ
         YN4KmAIpTT3Y002JJEUnERYAIRrbE5EEiOz4Ot/Qlq2TvUnb0rP9WEEgXLsEOPrvagWg
         vk4yq0hKGUa4suJXTXVmGcK9qAzek2DoUDDeDZ/nYJWeC5c5DANnf/gtp1Xcv9OMVj3R
         tn2e0Mt8mSxqrkKjl36pToC38IdiSNHVEjL+vh5NLDOGsMbBo4Wm4xzyXWt5yW4ZZMz/
         oTjg==
X-Forwarded-Encrypted: i=1; AJvYcCVbUbbQpi0p79AeKkhs8Gm7oDkKqG49Z6YTs31ZXMSYkZCr6+yKzI+qgCTb854OHQCiHMNWixQmBH5YKORQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8JgBcj93Vv2DUUyebTlJIkENQrz50t+YGXGXuK6oR+sev7TIF
	ERZXSzdux9KUKIdQptkaHXG3kAetDVBvSsiO8iCoAGNRCL9xhJGiq8tY58Mjk9u0ywyNhEQ29nQ
	zCgoTpPGLtzlBLzdH2fyTJsHdInesMFhbb2MASwikf9MkJ6aR8itL+R52UquQAM+bX3ho
X-Gm-Gg: ASbGnctkm4QKyLn894jciaJ474l7WZ3DngM7oWZvzDG39UoenKNoo5MjJc8v1Ed/EnC
	dcxnasWZnZwVw7etLZOq7cRRnk4TJJJDNU6vZmGkFdtgM0Bq0OIDLEDUadbiTIXwy8sHwdC1Luo
	nBOCsIxlGOft7w9d0How3JjcpsERi1WXjMYgWX/7cmEBl0hOLamOTWnIOHBOUcBE//fLudzQVxQ
	UOOXxdCqBAtWUC7tktKvrmNwi93GyBzWhMx/V9liy1OR7EQdeCCOiULMaVEQrhEzQ1bUf1WwqMg
	7j2eNRJYEmfZuExjYXBat/k98cpQHy9SqeuY4/RIvSvcA//u6Ww4ZkK7QQU9KIrVOXvrju+uM36
	o45MWcEusODWQ3LSdwWpfNDn79RQVB4esJ5gjCi7fygFA6rjq3M25l1oP
X-Received: by 2002:a05:620a:444f:b0:8b1:95e2:4827 with SMTP id af79cd13be357-8b29b6c22aemr196980185a.0.1762940416313;
        Wed, 12 Nov 2025 01:40:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/UBVido4T7ElH3fCCu3qQd1JXXvVZZsxAdEl4gufrjb0+yrWlo30YT4rDW3v1gJasBUixsg==
X-Received: by 2002:a05:620a:444f:b0:8b1:95e2:4827 with SMTP id af79cd13be357-8b29b6c22aemr196979185a.0.1762940415789;
        Wed, 12 Nov 2025 01:40:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf4fd021sm1539442166b.25.2025.11.12.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:40:15 -0800 (PST)
Message-ID: <9d296c2b-da69-4b50-8774-9fae6b360f89@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:40:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP
 table
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc: mukesh.savaliya@oss.qualcomm.com
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wX9oZAl4fmTdZcDOKzaYDjcFYKDpWbNf
X-Proofpoint-ORIG-GUID: wX9oZAl4fmTdZcDOKzaYDjcFYKDpWbNf
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=69145649 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nWGZzGPzcphSW76LlmIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3NiBTYWx0ZWRfXyfZhwI3qepMI
 zaiIgoTs2sZua+5nZAkkxtan8RlfgUgcp0chsehI6lsePVP8uRKegh9QwrffWBj1QdL7Na43qdB
 5zQU6iSYrTvfOgM2Wap6zGTXq68BVmt/1WSqzZw3e41cM5b8gBReVk5/OFcrSnCMff4X6svcZ/v
 xoC83GkXKB+6w4WIgBEmHuTGHqsdw4BjXMmBeiNExBDByYsRVhZ+6aLeIcu7b7MKTYPAMBOhqV2
 qK9CA2I5F3YWf+Brl2Nq8o99y1LKtJRZML2V15BrMrA54bVqNJFKP0epblkI6jz1jurdtGZBTlC
 SZUWxsVAK3WdKESPEnO3ddmh7ay7q5qiLEPRdQNWOTFsDq4z/Ci+MggEvHIiY/w0wM1WdTGperw
 ox0zZWrBaj8OFBqhhDA9UZpBEcfBfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120076

On 11/11/25 6:03 PM, Viken Dadhaniya wrote:
> QUP devices are currently marked with opp-shared in their OPP table,
> causing the kernel to treat them as part of a shared OPP domain. This
> leads to the qcom_geni_serial driver failing to probe with error
> -EBUSY (-16).
> 
> Remove the opp-shared property to ensure the OPP framework treats the
> QUP OPP table as device-specific, allowing the serial driver to probe
> successfully
> 
> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

