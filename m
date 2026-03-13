Return-Path: <linux-arm-msm+bounces-97480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JUUEvkFtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFC2832B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7065300F95A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0456537CD42;
	Fri, 13 Mar 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en91guIE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcJCygq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609938C406
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405685; cv=none; b=BN81iiU0BGbEgFDr0ud1CipRo6EaiAYb67dzA79HkZ3MReHkWAxD13dG8ybwSZ+L7g9Cug+i65xe/+F/BRQcN37efdKZ2jHJZRjvLyWu+9Oklg0sLUve6QPkZWePW/+VlHLfJSopI0DuViYl9Msdu0XMrVQSb0gCaOP87EjGHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405685; c=relaxed/simple;
	bh=93fRAfe+M0UwAu1w0RFIgYxUtQJMPFt4/lW4UyUjK6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B47PsrOBf9EzMlGnTutlb/aRrcQDowKSfYOIiguai7cuZniE3ejDl1hwLBnLLCODyUhd+fqjdiGxt9Xxp50bvRuOXXE0jmihMuyqSS+LOLeiBybeETUnM1jDyFuGR9X68flZ6kLjKwNOLTuC7xNbQbAJy/HBXoIUW8MiQ+8H0Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en91guIE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcJCygq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7pGx1749162
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ARqNHfgmw+FzkOHRhQHIR9FE9jKNtuPOMxUqU8/Zws=; b=en91guIE1xJVHGFe
	KuQf6veMM6uWUiKz8haYPV25bd+QkJwLteLqsCNyi9e7bmKdn1G3ozdA9DMQtUuj
	pVOdIC50C6siotGCWcI9EvHQ1Ce7sw9QC7yzsOCRiGI8QbeuF4dYIsw0mOuCrWIV
	FXLzudpJB1v91jCGGzFFBLqh9HNZ/v/NvAiOiLtXnMlpLR6wTTFY4l3ftu8rJqNc
	XBOiFN3/ygBliefszT4dg4R/KpUmpiuN3lo808C5/FMqRYJk794gfOxmJa3Wly2S
	YcX12ePOMdgwhUxp305Kn6BTfVAbQYrwV3psbTfYXFmVNNalxjZ162f/bhj6Ohqj
	xp5IsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gf4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:41:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso104844385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405683; x=1774010483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ARqNHfgmw+FzkOHRhQHIR9FE9jKNtuPOMxUqU8/Zws=;
        b=JcJCygq+olk67OzuKs/K88pUc871OLjBlZIbOlYNCEBTy1oWd7tAw0UwQPdhgEWG4j
         gxB4jBDebAz8yZURd4sAJYdxdZtg7dwA90ZDPenFrOfiAgY68x+vb4aUVTWa3wLmy6ls
         3h2dUUKAKOI1uZ+WFXL11tiwrR0J7TG30LexIq436BHX21v+PYPChCo6qqW6RTNJUhtI
         hXUgYFS7vBIE5RNfKsP36yIEizefj2AV1eZdGnlgjx4A7NvcMDXErLBOt+AizAiyQ0Gi
         OYG7Pg2havp8gmpC8dUgScz7ljtityH193pJDLH9ssMdodvFaV4uSBdUq3x/GUJTrdfS
         HFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405683; x=1774010483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ARqNHfgmw+FzkOHRhQHIR9FE9jKNtuPOMxUqU8/Zws=;
        b=MG430pLY8PQDcAyziH07NapTHlK/IP3OADPlGzeMPm4JwARA0uxyHspRVqBsk3/fIB
         46bMyGHdeIoxxKV55EE8HYAoYPzvu1RZJeT449tBN1SP3VSn5AwRXQYjbzDcTKxXRKhB
         ljDGaVXoVMluELuDHZT3o23+xW+b+vNCh2B51TwfF7TUyVf3e8hOT1X1ZKZ0MmbCCxtu
         T/AxpwHypxMgmoSc7tev4Tz9wTtXUQUVWlYxnZHsOABuLj7LsuMPgf8mAJ9QrI5lqbRO
         nBYozI7VpRGyJzq016++QevFleg2vDYP5n8GMfbKnusX20AE1cz2TjIgDPRNYMWP5k0t
         gnKg==
X-Forwarded-Encrypted: i=1; AJvYcCVrcnKvJ9BjJUTwUSKM90/hTl1b1XHtpuUX5Cq48OqgBAwzLZIH0c3Qywh8kpWQh7PIZzOhFdtTVnvzrqHK@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOK+iR3NXgtB3OifKiHO1LdrY1+JPMusWSMKiUTYbSNycQtty
	omcofGH8YAwFhbaZrA1u+a/DrqbfhhRbmvkErb1BXzaIVGTtVHWRkL0YA6LA9t3cackFpBVa4Xs
	Epmr+MOaNQ4chDhBd7yIQyYXTtvQNm/WJSXkCAKlOtU/V5xZVee3SU0468Xprax51l+mv
X-Gm-Gg: ATEYQzxleLAu5+WRu6YY6leVC9b9EaOBRolrpHSYEoNOddutP0qxG2fDYVdNNrq/cWQ
	GFHtGU4k4NSCVreVicsmZApmGrFuSHmQbGkfApUq2dFm4S2Oqr/k+70eH+xH2CcrzfZXCa/NZur
	BAC+8EZH3aJyreKXOZF7Lf4Y8y7qX65bqdhemjDFPAN7JSzEDsSWFhNK3uAaVAszcz8B77BadUW
	JsOY8uYCKWRyRy/J1TcDpEMqoXV5AzsvmLPPuWiwzbuRMfa42vseFMJZsbgPLJlHRCWBQ0DGNbH
	kEJp6dV/pc3O6Wf+xpVy2gDuyiFXziAwNn7UqI7s2EkukwY9YOVKzHQ+Toy/cA1jZCijYRKqPpI
	Pc0eB8VxCSM4BAJBubkKqRjZkndpyhvfNiXWv0nj4ep1YnsXx29vqNv98Gzny8RP/kp2UWPfDrh
	hxnKU=
X-Received: by 2002:a05:620a:4512:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cdb57c3792mr324910985a.0.1773405683050;
        Fri, 13 Mar 2026 05:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cdb57c3792mr324908085a.0.1773405682574;
        Fri, 13 Mar 2026 05:41:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf02b14sm43894766b.51.2026.03.13.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:41:21 -0700 (PDT)
Message-ID: <9f01beca-50c8-43a3-8a6c-d2efca2d90d9@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:41:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
 <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMCBTYWx0ZWRfX8zsGJA+rHY3E
 871p29RKhITShTVuwSrf1XM8VXbJTLzrstxVbjzKLHdi3k+8dOziZqBlGqtQ9KYUDAGjycc4ijV
 Mv2uADyYS2vEVfl8v57Xa6FPBsaPO0mmHpPtmrJAxdXZ2qj0MlQvGLssSnxk93GPhMt1z6wCJKq
 Ihv1IDWS8h1elM4a+zMMTd1gntM0K8E1lZfQEwOZRYYclwfCfluNrc1qT5xlSNQ/4mabijdxzyV
 r61OfpW6XUuA5cKA3zRL9aPDKzhDL7LY9hHFN323R9aRneeyLgnb390yX2A7gug4yAQMcSt2ehx
 IMZiPL1GErsJk6SYvMHfxdXISFn89e4hNiUDzUlAYmwHGv3KCnne/q2D4FAXlO1rMf6ewwftI9K
 EFAgvDP+ycQOzkkd0M9QxIjuo+nUqFDwuB1aJ5RRr3E1rwOq/HkzgoEvJ5/ATkJLc/QbROBbVO3
 ONK0IrOyrDS7AYskWPQ==
X-Proofpoint-GUID: IwvlPE3MeW0ndTif3ZAhmsAF-Mdvn73b
X-Proofpoint-ORIG-GUID: IwvlPE3MeW0ndTif3ZAhmsAF-Mdvn73b
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b405f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=JgvLXVqx2Q9J9S3OATcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97480-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4EFC2832B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:40 AM, Luca Weiss wrote:
> On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>>> parts.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> 'clocks' to the PMU node to make Bluetooth work.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>>>  1 file changed, 174 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 52895dd9e4fa..cbe1507b0aaa 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -24,6 +24,7 @@ / {
>>>  
>>>  	aliases {
>>>  		serial0 = &uart5;
>>> +		serial1 = &uart11;
>>>  	};
>>>  
>>>  	gpio-keys {
>>> @@ -215,6 +216,67 @@ trip1 {
>>>  			};
>>>  		};
>>>  	};
>>> +
>>> +	wcn6750-pmu {
>>> +		compatible = "qcom,wcn6750-pmu"; /* WCN6755 */
>>
>> I think a fallback compatible would be in order, if the data matches
>> exactly
> 
> That'd give us these changes
> 
> milos.dtsi:
> 
>     -+                  compatible = "qcom,wcn6750-wifi";
>     ++                  compatible = "qcom,wcn6755-wifi", "qcom,wcn6750-wifi";
> 
> milos-fairphone-fp6.dts:
> 
>     -+          compatible = "qcom,wcn6750-pmu"; /* WCN6755 */
>     ++          compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
> 
>     -+          compatible = "qcom,wcn6750-bt"; /* WCN6755 */
>     ++          compatible = "qcom,wcn6755-bt", "qcom,wcn6750-bt";
> 
> Plus 3 new patches for dt-bindings, with commit message something like
> 
> Document the WCN6755 WiFi using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.
> 
> Does this sound okay?

To me yes, but I have zero insight into what's the actual difference/
whether there's any. Maybe +Jeff could spare some details

Konrad

