Return-Path: <linux-arm-msm+bounces-59157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C6AC1809
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A331C058E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD066231859;
	Thu, 22 May 2025 23:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgUEta2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE027874B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956624; cv=none; b=UHqHNSnd6JsL3f0jnGL8LWTwtDvdZzjbGYyseeGMwx3t8h6JSCv0GiD823sZegIU1TBGMUPOJC+yCOZ0fG5UMYG6gdWK4yYaINTSQhIXPyPdqLf0G/b6smCQgQE6eIwLO1GT+3AtdPd6GR5d3kvRaROsjZZl3MGyZggbSF5xTVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956624; c=relaxed/simple;
	bh=HF5QrWdVgrSLXQpRcVZ5nAwvebrBgOa1rmbw6B34qJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVXtq9YKVrz1vkBTeh2MZdozg1KYjPce208P64Xq2pN3CyNP+Q0L4d5aBoZFjQVxX9+1Y/2+SaBApLXV1gKBrX/upiOfQWqfB7MNl1bkIMTdVP2lCl3eHWeguRdRH8o6h5w/ZOskjFg7pWDcqPzGTAVGhSE+4sHXPrpA0wBcDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgUEta2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG0PBd000727
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 23:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3S7RLpIsIxMBOGoiyFOVXm3dKhx5umFsjWut4uZe1c=; b=fgUEta2Nsa1+MVYX
	wal3WTKtrgDYGJTVrIy7KiRZy+pR8ESPx+Z6CE/+SJrp9YiBxWpc9utuErVedlzc
	XlYHDcxMaPm6Wzd9Q+drm5AMQpNjFQClG7ooxoGHDokG6UAi0EZ5MErXzy9orK0A
	Ie5jZ/AsKuC1L90Bti7xanmoJ11Ir48gDrRzLk83wQArJ6OfkDovkjeCxuClGd89
	/KxQRUboP+0V9kyVY5qao3Tw0ZHchlUo7hN7HVNvaq5THOV/UthGtf273PjYSGJA
	xSpj9e5AdyxprqlDN7QXV626ikj/cltfCFeTlWOs35Lg2Evbz7gBuYyK12zJMuQD
	k+qoHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tpbcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 23:30:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so233583085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 16:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956618; x=1748561418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3S7RLpIsIxMBOGoiyFOVXm3dKhx5umFsjWut4uZe1c=;
        b=jBcAFA1a6SoWCuGEfOJB9rMpsOXmToi2dVBR7X5P0FnQzYuj5q4cTR+th55kmsEjXG
         e8kYuqgnCRpoOAvPvfhc+VxwilzCQ5vmK5dkfW7zRI6g+N/El3DNttl7/vLXTq45K0gD
         K+n77aOZkR9DEMCuvc5uO7+MhbxrUkuG/JejaA/QFevLygYPr+Jzay3CFA5PB6nC6/21
         2LSRQBq9zb4QTmLOW6rDMDS9K60NRcqe7H6xeLysTz0/2ftbbR492hW0WESr/+3LJwAi
         aZBM6fqG5t1sA1WbI4NEOfZu6goDjZw24pBL4NKwPeRWaU3Wi9qSFgltz29jUiVKfvFd
         To/g==
X-Gm-Message-State: AOJu0Yw9NFl2hWNsf0MoZfdSZ7IiZy8buHuhFjJ2ZJlfzkfFHvtM+49D
	ONac1W5YhaGFoudasiAz3gldnkrXlmKLwLvACpv8O9Tkk8TYmuD250YvPnVgr2a+n3ufrgCeyUt
	JKjojU+TXvf9yCb1n1mFARdvQPLMFX6HmmwETTKZYF+ROXrpvrR10m6P3pP4SV+tj7ebq
X-Gm-Gg: ASbGncuf+WRcLNCDucFbBEs9JKgrcJg5RsFnQBU1M0+twL1cxoJbNs735i3chLVjB1J
	s6f303VGlO2SI/Wk8qMef1OdLhlVkk0rpQDoy2ETC8nmDk4cepzWLDxKLIHwEg7NBOXECcN2u1T
	p0zRB6AGReDQ9io9EDMIB0Rtkho+Ho/q8MnQzqmZ66AMuIHuE5U7Gg/xVW63wzzBrBWKxnaamTj
	k57Ex0QTF9J/dP+BxDTRDD7RecsVKhLL7cjncAHK5GGVj1b4ZHJyPqRNeQi/2+247jfkl92N4+X
	NUjvhTwTAwfw3NTs/UF0eQD8VGdQVLBhtmrp2Qp33uvlQxBV/Q5wg8WumSLneaXkwg==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1630329585a.13.1747956618440;
        Thu, 22 May 2025 16:30:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfs/zUSS/wDRxV0gfMgVCmzQmxVBhUAv6PGmx4J1KZxeoM12aqEKSbM8jmkq0L7vFU/1Xqg==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1630325885a.13.1747956617809;
        Thu, 22 May 2025 16:30:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502ec0sm11219928a12.31.2025.05.22.16.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 16:30:17 -0700 (PDT)
Message-ID: <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
Date: Fri, 23 May 2025 01:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wojciech Slenska <wojciech.slenska@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
 <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682fb38b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=dm-21qZVQiDOrTl543EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SxTBvfyutmWMOwqFPC9Afh5cFnNKjfAx
X-Proofpoint-GUID: SxTBvfyutmWMOwqFPC9Afh5cFnNKjfAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIzNSBTYWx0ZWRfXwkRqCYDK9MyT
 twLXzN6RRFxOvHdeO022OsK1yXeoxFPS5/6zfy49qtT7k2puO1JLXF59qwMbcVI+3Y2blFzmndk
 6NmAPe+0DGE0fUwWuQUs9iOUqSS4nopIMsfbSUixkWaN282qdH4dogH2dDn0Ak7XvDax9G8/237
 lA00UBDWijlvIyMyd+2ZyjD279CO8owtdb98KV57HNXfKmRrusw4QXncAbIqUMo7e+47vJLfSmY
 eapTWP0lLlKw8YdvDE9A8OcwqJGNanF5D0fLxBXQ946GiYyuuyKoX3LHZObbJXK1RlkTUJbGJGK
 85p83GB7Oo5BKJsH6BRzoIKgEEkexI5BPx0XUmkd9hMPVNldA6kDBbRf+DdnVPwkD/4OKlyXPnm
 qLVacOyVJ4iTcJGmsYhXu4mC9LuZI71gsDbRIqdvxzhzvZCjxp1D7raebXlXS9uyO8SoXoiT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_10,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220235

On 12/21/24 9:44 PM, Krzysztof Kozlowski wrote:
> On 20/12/2024 08:35, Wojciech Slenska wrote:
>> Document that ipa on qcm2290 uses version 4.2, the same
>> as sc7180.
>>
>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> index 53cae71d9957..ea44d02d1e5c 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> @@ -58,6 +58,10 @@ properties:
>>            - enum:
>>                - qcom,sm8650-ipa
>>            - const: qcom,sm8550-ipa
>> +      - items:
>> +          - enum:
>> +              - qcom,qcm2290-ipa
>> +          - const: qcom,sc7180-ipa
>>  
> We usually keep such lists between each other ordered by fallback, so
> this should go before sm8550-fallback-list.
> 
> With that change:
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

(half a year later)

I've now sent a series that resolves the issue described in the
other branch of this thread. Feel free to pick up this binding
Krzysztof/Rob/Kuba.



Patch 2 will need an update and some prerequisite changes.
Wojciech, you'll need:

https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com
https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com
https://github.com/quic-kdybcio/linux/commits/topic/ipa_qcm2290

and a snippet like 

-----------o<-----------------------------------
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
-----------o<-----------------------------------

added to your DT change

please let me know if it works with the above

if you're not interested anymore or don't have the board on hand,
I can take up your patch, preserving your authorship ofc

Konrad

