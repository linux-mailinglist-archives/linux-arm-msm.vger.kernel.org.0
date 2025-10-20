Return-Path: <linux-arm-msm+bounces-78006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A38BF14A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A6C3AB1CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5621932C8B;
	Mon, 20 Oct 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fe4jnNZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDBF70830
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963984; cv=none; b=cFVaji/y2iBQ+UZ9BDPAJ3zm21bL4X8ItLx51hgV/AWfU0GLn5Od4OD89aRrgsRaQ99bzjK5YmV7eJ155X6OMg3NBqPTJKb9dlhvwOQApdtsS1Gcx+ZGVIsoUAbzPAT6z/sVS0A7TTMD4nWWAG780a3cuKbBZZxu4cS8wkmh2pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963984; c=relaxed/simple;
	bh=r0LI5+rFfxj7D6qdrxS6AU8wGcUsrj5XfBe6LzH86mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3xJWrqAKF6dL47Z4uAfaB6uHQ6ofTzIfSS1KM1hKkQwgWTn8P3Q0hUNYpjFw6hCm00/hhVUKyNte+P2ZEZFiBl2uDDKTI3mcRO1/T2lEeTHGC+BPAkZwfr4+j/iiXJQ32MuhzIJx3YSFUI3cWX9NrSOOcZI/6YDHdKpCmNjsnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fe4jnNZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAwaUJ014183
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyNWSoXfav/4VdYirXx6+KHz+a4mFdCsFqj3qAZPw9A=; b=fe4jnNZNruhywKrw
	5skvbewk0zPu1FKbGDfM2yNBEBcbIKy3+Df5UMy5VianGU3XlFOcdxJqnmBkl8Ea
	skU7FktlekvLCllqMbxFhVmTr+CKTedDe/TPxlJiNcFFCDf3/yAA3+ZUYRpQyIhQ
	ZecuuuOVqVHZBf8odfv6XJVBgWh3LXjjFV76qey0HJYQ3JRlyN9QBqQGlngK46xu
	DNy4iV+aJZfTQfpcMlWFole/5PUa96NNDykytKisX0emyqlZ2gKV3apcFi+3Vsj/
	Q3EOiXZwhzinQ0JVENnoTv2EL9PfKQ/VqsuIo5//4nhEQaWMYvW+KysUKyGEWZq9
	q7ZXzg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfcqe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:39:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c0e043c87so19174906d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760963981; x=1761568781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyNWSoXfav/4VdYirXx6+KHz+a4mFdCsFqj3qAZPw9A=;
        b=Jt0nhDtuv04RA5Jajg1vgig+al8vgmq1FrvEWJNx9qIRvCwr4SQtj0+kQgQGToiJ1Y
         EIC0W1GUqTbvf6QZi1KqhbZ83Pclp5MRn8eq7ibKak+ud76BAnRmSYJKH8txYQf8k+ma
         b/hhgluTyNgQshjXQ8CYdDonX4Onmt+rYHrphlelXO+jxHeLyEc4WSVCfZPwUeVXVPTz
         U59mpkB/0RhEBbMXXLMRmwc+iSQc+fgNv1ngPCgIEQSWMqti25l9lioxdQRUsDaIDCOG
         Hfl01wy2AjxErQZ01BogLO8uBKiIGD86a5GVdts8Sjdf4Vsgs1/+bM2fMQaUasJi58Gc
         gXPQ==
X-Gm-Message-State: AOJu0YwWSSc+1Q35xE6MVD8og1/oNE6/WlrywCDYh6tIVyToJQ3x0LcC
	heHpF33wjhpCpHn3M5sAzqJ1CHA5xkjSGGjbB3tFYDDspt0HECjEYAY2ZfKJVUi62+m/U7TptGS
	s/jDj9TvExYQeghY6Op/7NuGqBHQzctUexP3U/nY4ewL7LdoWa+D8R8zxDIo1P34TFM7v
X-Gm-Gg: ASbGncsNDusRM4WsUvNTo78v14vgmSr56kuOmXY+WinaqOaPR4LoYPF2IqC8mMW1zxj
	YPLpoDVaZajBZmZ3imjKl3QufvyHCx/cpQnHPk1t2whZ8C8RmR5Ebcol5jUWEn8A5pvS3u4fnbo
	O+fSvfUrikiH1n6E6Iri6UyxCh4Wupgw3E0ytySolVhZ4bTUcyNvcaZJQ6sr2+J4mQa3BeQnzSR
	csv1iR3klKegSwTuLhys44FGbUk/O420brBcEY2WQ0w1yXtGpKivcqJo99/hbQPlmZ3RDGJywxG
	a1JZW/v0zN/le9vrDGABgl05bvPdNQZr+m7R3ES7qC6iAxnAKUxxzxdjyt5EjoZeEEFeuI6qUGJ
	3v92h8XaN78HdGV5jn+MVfv5S4uDmJuFmV/M6w4FoHeTuJsTF2dCyXWGQ
X-Received: by 2002:ac8:574d:0:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4e89d1fa0cemr128679521cf.3.1760963980900;
        Mon, 20 Oct 2025 05:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/If/fFIJQ3q6nPyTQg9KjwZgT9ia5w0Iepq3jOLMuoIfrodQuufPhmYoIi6icQqulsQhUJg==
X-Received: by 2002:ac8:574d:0:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4e89d1fa0cemr128679171cf.3.1760963980277;
        Mon, 20 Oct 2025 05:39:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb6298e1sm768532966b.66.2025.10.20.05.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:39:39 -0700 (PDT)
Message-ID: <dab30485-498e-4cae-93eb-b2f40f928465@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:39:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
 <c605434b-b0f4-4a9a-8b28-cf1c77d5f20f@oss.qualcomm.com>
 <35c670f1-6de6-4f78-a452-fcffc57ec93c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <35c670f1-6de6-4f78-a452-fcffc57ec93c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bnmdGyAZK7D3mnfclErIWOjtue7jrF_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXzwCs6y+BL5Lp
 xrLnCn4Ou6wAxMos3HEcI4P96pC9kNtOirxKlW0TT7M65Nacounfwj7zgoj+TwoGZvGiBE+rJco
 o+tsgyZFkdR5MtpLL2iEqT2cGslzlbSoxchCuqlb7tHrjVh9NRmQbBbTdy92JDrv2q/5oRvrXrq
 3ng+arCYUjmc/H1rais+JCFbRYmQS6l0AdS5jl9AfXoOM1ubg9K+7R7Thk5LD9TZReOr3ZDdWTp
 R4zRxaE6aO2be5X8BBQynK3jbm2dNu+osIovrivFSVBN8e8aH0j0bN/iM/91n0AIpWHCRHkUe5F
 IRHU16LYqWnN9B9DIy/OlMu6JMdFta1OiBw2ICc7DtgZZgRFOVDn01FCyXWl5MCPYF0wZU9FU2i
 ub5NxZBjkPxgjP1/F1fbev1h2R1y+A==
X-Proofpoint-GUID: bnmdGyAZK7D3mnfclErIWOjtue7jrF_v
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f62d8e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WWYcvNe4FWpTLsP_R2gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/20/25 2:38 PM, Nickolay Goppen wrote:
> 
> 20.10.2025 15:27, Konrad Dybcio пишет:
>> On 10/19/25 6:27 PM, Nickolay Goppen wrote:
>>> In order to enable CDSP support for SDM660 SoC:
>>>   * add shared memory p2p nodes for CDSP
>>>   * add CDSP-specific smmu node
>>>   * add CDSP peripheral image loader node
> [...]
>>>           ranges = <0 0 0 0xffffffff>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> index ae15d81fa3f9..41e4e97f7747 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> @@ -16,6 +16,20 @@
>>>    * be addressed when the aforementioned
>>>    * peripherals will be enabled upstream.
>>>    */
>> You can now remove the above comment ("Turing IP" is CDSP)
>>
> Remove the whole comment?

Yeah since it's addressed now

Konrad

