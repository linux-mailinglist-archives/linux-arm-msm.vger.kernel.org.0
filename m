Return-Path: <linux-arm-msm+bounces-84378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0BDCA3D08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2409330842A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AFA314B9F;
	Thu,  4 Dec 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atdcpNZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DiagKW+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DC533CE95
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854834; cv=none; b=tWbTe5totnVrN4/iIZ3eTqyoC08g4zCbY+A1e32L/N5d74L3xeM56Ib7J+IE7PkqG/OFSaiLyv8k0OhjugQbnbdCKj41AlDy9yEaVH98q1A7BxrrJg74+IiE/dLMdJavPvo7Hl6adAGMLdDt0N84aI/V4IFrTrpvNH1ALcBDLrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854834; c=relaxed/simple;
	bh=TX2aNn6Txc21R7wkZRHglMy5X17XWRqN8kc9m8eWEl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeAOTuY/4hYU6+j+d/J6ybBJP6g7FbTxt/9Uhw/0Bp/tmMSnUW/At+njWW6Y8E02V4eklvytna10MnVcqzI8DMxBh2CaJSHc3eKJYA4YibY/9hgKOOEek5rP+0sGDaAJ1mfHNH9fQjtTMdo7iIa+WSDilvo8ZFLyp4Vr7er7hJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atdcpNZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DiagKW+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErLl1358019
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3BEgiMQNQBWEFBBbvKgKwnhgWUoTYK3fDTHRMW620o=; b=atdcpNZ7ElN5oCUw
	ivDmCWB+Qq0UBG67GdOxXAGrFh0ZXkZZbGxiMZb41K2LKiOzMdo0/8cvySdmtq9k
	Aaa2eChW04GWGi2fnIhO19ro3fCk1XGKPP19BuW7lUPbVwp0nupMbs9iB8LDY6ou
	8SlgPZ1Db0+p/o9O2Om5fEItuB6gHD7kW8l52vUiB7VZuSueyr3XmK+3dRLvDJWB
	WHfQgK6rC/P0mYsyzG0/dQVDahZseqeZXgcNxyOCLwJ9YZ6LznzzBy8StiXI4nas
	Q+LiCKnNmKEg9uKXHNUXvHmOS6sPNTLCdTxSD+VLhxpoFIUL/yxvqaJeDXw0rgU+
	SYRdzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc12dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:27:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b23452ec2bso4873285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854831; x=1765459631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3BEgiMQNQBWEFBBbvKgKwnhgWUoTYK3fDTHRMW620o=;
        b=DiagKW+PtwavHKhU9K8Gw3Gp87Bo8xyHHoy/W8V8WtuiGzr//c5MytilOEnUT7snbG
         v1uYUBDF5WFBZHJxMG1uPcj5epJQcKhYQQjpKrQ2TCtqveSGXgRS4+s0DaUgbMAvrjcf
         mbWF9vuG7xDw1ztHXB4P84P5ksF8tVT0uv7c1MnyQMLSnFn61ngfBCmF2eu7rAsrkvQj
         OA94489a9sI3z7GGwgNtaaiM+Tjo3oFAFfpnD20f/Pke95lNUTpMXetdH4BMOUf1/oRs
         IMslk0EFUReus9J62MH5gVdH0glnrC9G/Xfozi4jzHVlSG45uNO+ACcji/7b3WjoP8Sn
         t3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854831; x=1765459631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3BEgiMQNQBWEFBBbvKgKwnhgWUoTYK3fDTHRMW620o=;
        b=td8KO2PQfl2Ss5mh09nOzPNkl+zazn286Ol68g4yln6f057OkFwO+1juKp120ltUKr
         bgreRVcb1VUJjnHLGxZFhzfbqjHFAF0DAZfnlqT99DZbcuUODb7Lr6Aufv6tlyIfufjp
         iYRU8F7OfQSlQZWf46dCULs/M2hB54Wd3eEOuJ82fHwyNT6K0LO/BywY5iAsnWX+H61/
         aSg37zBu+XI5nZWWI4JkbKenFm3NwuEh7REdpVko5nfBT93FmU1eIYEJqkAEsXSWiAVN
         knxfv0L98Lt4qCihxuurkzx8lPD6Ov8GhLOfvZTMruDaliN2hcBQs2dFVdVnwQbOQ2E2
         6KRA==
X-Gm-Message-State: AOJu0YxxhQ9AW4qM12NV+Fi6DYIyvhILhBY+f9pJ+Dw5nEFhUtGnsR/r
	iXa2PoqVGBDYeRUYT9AtHZKUVMBut0z7DNXoKdzXn1xDrUnjRaQxX9PD1ZeAwfHQnlmXin59yXf
	A+UJdcVzCmIEjEHLbr2/QbiaVTpVDIH07IVvFeP43tpmzhsqp+6gKrB6ZGuKb/dxO4H6i
X-Gm-Gg: ASbGncuZLUoekWfuE/we2WPnC4hD40+OBG/Em1qLEiQvan65ld/pfyHGHnYC3UajRGT
	r9kZnbXrWpbK7XIa0ShYJB+grn5Jq9OQfU/1IcOCFfB9GLAq6ZHUv3t80Uh6eu1cVt+BNsli4j8
	xu6N2j41Sug57a3qb+w6WCzjkI1YWg/XI0mw5RI4yWm3BIgU+QTkwK8x5VCf9YFzlJUeLfpQWy+
	qvY35RBBa7UWHg7sGrt9yRf5MClIwSFtxukxXzqwffmGmXFGX7p7rh3jg36M1YRWbnk/JDNYHSI
	tL+KcDWzKzP2nqq8Ir40rnducjyaWAoNQw208uhcBzN1kT19eH02In5iELB4wTeKgk1FBqd0e+Z
	K/Y819wBy1vdoBaUlvmdXZT8MfeUACPhZC+4m1KLcYYjBNRFfwG6xvwxQtu6j6amtjw==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr551525985a.1.1764854831148;
        Thu, 04 Dec 2025 05:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGh56UAJuRB86lSXEDyhdK2SsF2SVo4nMmW49ZdAwHGuURV14ptAGvZyHWhSX4g7LeBXYetPA==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr551521785a.1.1764854830596;
        Thu, 04 Dec 2025 05:27:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368dcf8sm1271135a12.19.2025.12.04.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:27:10 -0800 (PST)
Message-ID: <1605571d-9199-41f9-9624-305357324b1b@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:27:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-1-80c1ffca8487@postmarketos.org>
 <6ebf4056-c6e0-495b-9e67-ca8d9dc8eae3@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ebf4056-c6e0-495b-9e67-ca8d9dc8eae3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=69318c2f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=9YTxGxaVBTEbm7DE2cgA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: mb5uOo5ME761EQwybYtMdvjaHfMoWe7u
X-Proofpoint-GUID: mb5uOo5ME761EQwybYtMdvjaHfMoWe7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOSBTYWx0ZWRfXwhLsS52QiTD0
 KNA/Eyjz4pTB1+SzKauBL3yUdaG80OLS+UYzPd6bcwlL9Id0IeYfrAkiaailIrGM+CLVMN/UoUe
 3gBnSFMhuKDd3NoX4dyC17dx0QI+YF4ZfDERBtxgN8eKuAtcgIpMjdV1qUSsVBsEB8+meaQIZ4j
 4X1xo3/e/OesxHHcYh+iov+1DSPBZ51z/Rb4HOb8rZrCQuMx32kzvgMJfVJqn7F0ozdVaysdd9d
 XfM6V6KolkKoAg/rgTRvBkEgKgnjRFWPr5aA/op5Xzk3Dr3njlXLySNKmMT05WDM+H/ej5mPc8Z
 r77K0BNAO4ED6W6p/bAVUdso5TInVQnMLhBKmHoI+w2KWO7y/JCsJr2kFSYNZRwQNwxYi0JNAer
 UU/eRD1MMimkei6yGPGBjnAeS32nkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040109

On 12/4/25 2:11 PM, Krzysztof Kozlowski wrote:
> On 03/12/2025 10:40, Paul Sajna wrote:
>> Improve adherance to style guidelines below:
>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 144 ++++++++++++++-----------
>>  1 file changed, 82 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>> index 0ee2f4b99fbd..b8ab64a8de1c 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>> @@ -38,11 +38,6 @@ reserved-memory {
>>  		#size-cells = <2>;
>>  		ranges;
>>  
>> -		qseecom_mem: memory@b2000000 {
>> -			reg = <0 0xb2000000 0 0x1800000>;
>> -			no-map;
>> -		};
>> -
>>  		gpu_mem: memory@8c415000 {
>>  			reg = <0 0x8c415000 0 0x2000>;
>>  			no-map;
>> @@ -99,7 +94,12 @@ memory@9d400000 {
>>  			no-map;
>>  		};
>>  
>> -		rmtfs_mem: rmtfs-region@f0800000 {
> 
> Why?
> 
>> +		qseecom_mem: memory@b2000000 {
>> +			reg = <0 0xb2000000 0 0x1800000>;
>> +			no-map;
>> +		};
>> +
>> +		rmtfs_mem: memory@f0801000 {
> 
> No, you are doing much more then sorting. You are changing names to
> incorrect ones and maybe (tricky to say) change also unit address to
> buggy one.
> 
> @Konrad,
> Why are we started resorting the addresses BEFORE we came up with proper
> linter? Why the rule suddenly changed?

I don't really mind small cleanups that are done as part of bigger
feature additions, as opposed to fixing a single file for the sake
of it

Konrad

