Return-Path: <linux-arm-msm+bounces-95296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPKEITQbqGmgnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:44:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB7E1FF340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24B2F317D906
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B94D3822B6;
	Wed,  4 Mar 2026 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSL0wM1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSCLfGDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AA3451AE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624333; cv=none; b=tOkcpRfc/5QfVkbudFIW6aRFGyA9Da4jkPhCHMbB3cS9bqNJxJaBwan1XBYgcwMVJx7mgpppqB8EfIw5bm9/wUYdkLKLilLix7iEhLdoQK9neHAwYnEJkGeKnxhHGnarIOfaICb25MBrw4G6vNiStNYSu9qmcMooGQw11pTvUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624333; c=relaxed/simple;
	bh=l6bh5XWAasO94RY/6sUCz2WpmmPORG8OON9BNvl4xc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdM/s7kKmpySf7s5vbJf543ab9NQCd/yZXxhI5dHkXjuu+KLNfl1KAmaFnT2qE4c8mZ0HhZ+1ob2jfth7+HhjQ4QdMHgCqJIk6suFQov6xBFRiasdy6znkK5NNuRnORREivTGJNtjdxAwbTKLRWDbQQWEF5jdAQPygg3Nqmemtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSL0wM1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSCLfGDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQF42275097
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqLZ7zy150XDn8eFdd/n8UKFzqubtTHTXXk4X/DH1dE=; b=BSL0wM1idZ1CpsOR
	FWziAK2gynnHOhqGVWRTUnHwvWLOb87f74BMp5YVzNc3vPyHoWLQWIghdspSxDkt
	oz2X/xoc6qJkvTIybQcOHQY781JkRQ3x3XLCLOKC0htwk02srqeQZ3jhTKQ52LJc
	rqS7ZGkzJ2O+tG4no9SsFHpn/cQ2CYJ/A9m8NUc+d6dfvdJYbTcf2TvuEUAGz2fI
	RjCqgRrm9GyoYHbn1bSBLtS2MaXa/r4fDCn9Nx8V/FVQi0R3tUVDabOLpzT5hO1r
	Id3DpOpnzOtZTf7K6bGib6SdXS/5jCFBrjo8nJJxaj9H00Ol38BpN7IRlULHzL0u
	++NVaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msnha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:38:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso526219585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772624330; x=1773229130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqLZ7zy150XDn8eFdd/n8UKFzqubtTHTXXk4X/DH1dE=;
        b=CSCLfGDNWTYGnQg6ri8od6U0NAb5QC074RiI22gxRYCL3Au8toZLAq7T6ceff6mCRt
         nSTvj22s6yBv3/Ype6JzNeJP6eqYnpAXiKSbilJ/pwv/s66SDhtQz/k8gzSWoTTLIizx
         7fSqvtEWYcPPNrVMSetQpo9m7t7RS92PzJl9D11D14i6ILr7WiaOxQXkT1l210ILv+o4
         Z8gTHZTZP4gJtIU1Y9UA54mWETDnXZWK6pGWhqqFne8LBx5iZAN58AgdQ4vADpxhq/on
         CQi8e5VdgcjqWm0K67KhVosPG6UE2rMocegldzIpHAVZhG9hpZVSzyIxgmk4LqJVsg3n
         saKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624330; x=1773229130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqLZ7zy150XDn8eFdd/n8UKFzqubtTHTXXk4X/DH1dE=;
        b=K3sdmtm6fQcuMG2shLEnsq/DbUHcGaMQ18EtoNFwZ0iollQa2bf+epjgNvNM6qOIX7
         +0ULxRnVyujV+FHIvhfQkAeSPcgvu/D/Nd0WQDp2RIkxsdPGVLRpJTQYWgNUGtjFJKXQ
         MOgZ8ruf3JbT+oXRS5Twvvv/0WWWcgsoh32tVD6opjRhTxUJJsmPhbCZh/WI8+RzhB/g
         wUx1LaBksmVmJQbjL84Agtj4hr/e9o6fR7s8EH9zD5R2n2nAkUMou0PuWYh9BJoeh0Ye
         TkFCU7w660ACIlRtt/eJia5kdwdYRvq4gyh/np2nKrKf16YkpnmELJXIFo5c22C0jbsd
         rCNg==
X-Forwarded-Encrypted: i=1; AJvYcCV1lVlK2kiXpwQRtLWWEbee+RlM0R91jd4Q5qnStFDG5tx6EnKE6zn1fJaZZMlLVTKGvqArcgSwCWlOmGmt@vger.kernel.org
X-Gm-Message-State: AOJu0YztZpUWXdN//fFNdrQLWPCsA9Mv1xCh5uU0JyzrvS9SpSIvKmEP
	opAn238UA8cbhZz0VmM1iSqL4/jBmBgexDZDweVtLZ/9c9NJG2fSowxxzYp9/i9O8fPtSm/YUVr
	U/J26UabB45dvW4opgFRVjfMqvsSIvx5RzBcoP3Q5xWkkxs1hC7qxJGaxnqBlMz1vqUz4awNtLE
	qj
X-Gm-Gg: ATEYQzzT5qhmpCdZRroPwd9ew6oCEjCnQ+dGExnD3m/9+pfGenhxqxCLwsgzzO3VSU6
	bVHR/C1TwueYTd4TqPShUNkEpreDRCKmc8c0mGMHADRnqsayxS4fyEmK8/aln1ooX+GSR9W6l+C
	fInrMT6Qd73vqL2QERhSPoT64xM7tdOPCCcdiFyOjilOespEqMer1gjMQAiVKtIG7YFzCK2m3E3
	cO4AerfAeFm0pm7SdwtAuvjJn7M4Op/cYa2uMyses8GecTHF68izarloIr9/XoHzLPE7k53jfxb
	s1R3/hZxm1XWugxf56jenDEZZIZ/a06qlsQU3XHRy1WhOPbb/SMSi0A+JiKyALSqvzdJ28xWQYx
	XQB/BSZCkG66TvP1p8jPEl8B/3awek3XEMNAyqZ9zkYvKxjXnWRvdG3/lYz5DYncRTBZWnvneYy
	oUZ7g=
X-Received: by 2002:a05:620a:40c1:b0:8cb:47cc:2dc8 with SMTP id af79cd13be357-8cd5af1e460mr153474785a.3.1772624329943;
        Wed, 04 Mar 2026 03:38:49 -0800 (PST)
X-Received: by 2002:a05:620a:40c1:b0:8cb:47cc:2dc8 with SMTP id af79cd13be357-8cd5af1e460mr153472385a.3.1772624329537;
        Wed, 04 Mar 2026 03:38:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec39fdsm721173366b.54.2026.03.04.03.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:38:48 -0800 (PST)
Message-ID: <af30d450-b55e-4ce2-ab38-e1706abf3155@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 12:38:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
 <20260301-secret-exotic-nightingale-80f55c@quoll>
 <4cf9c98e-767c-44d3-9e71-bcc790e83997@oss.qualcomm.com>
 <edffecfc-ea3a-4c1e-9e72-58c7c134248e@kernel.org>
 <d3de0b25-861a-4261-8d9b-a3785187bfdb@oss.qualcomm.com>
 <6606bdbc-95b0-4adc-92e5-cad70d250cee@kernel.org>
 <33737c4f-b668-418c-ab03-f27ed3b6fcff@oss.qualcomm.com>
 <cc30861f-1e10-41d5-87a7-496e18bd358e@kernel.org>
 <78d08114-d573-42be-9cff-39c228c68848@oss.qualcomm.com>
 <0be1b15f-df0a-4ff0-ac97-8aaa46dd9b7c@oss.qualcomm.com>
 <7239b66d-be59-45f2-be8a-78d3803d345b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7239b66d-be59-45f2-be8a-78d3803d345b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 26Cpu6iHxkt2JpAr8tKcM6XZQsWke4ZX
X-Proofpoint-GUID: 26Cpu6iHxkt2JpAr8tKcM6XZQsWke4ZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5MSBTYWx0ZWRfX2icVCSpyHa4z
 qPyWY9YUqzxKl4xQglt1Pdz50CaYBh83s0JG1GcyuRxrnMUJQjpSEFeR9cgPsL2lD4s+iK94Gz3
 dDsbdfsFDGCi0ZGwr9OiQZcUfMivMlAiDIguWAJ7oAlaia72YwpFNXK0RIVHhasRSPOxfiXdp0q
 /mzfOLqs1MPD3eVTTx/XsoW+ZML1TKJor055cYU1BS3Whko5m/HOnfVgGcgMXLqGokS7qoinYzL
 cpxff46to6WGWOeRbKt+W223W/OVhGcQ1YxoLUVdRifvksbHpXhN0anrkDuqCCHsZWQpYu327/R
 UPF5Vc3uDYCSMb/ebvJY3sAC74j3f8qSS9z4Uvss5Hff9v+qhJXpy3X9bttlx/qNflCv+Q3CLXS
 eL1vRqRB8NvyMFxaDvlHhRgHEDH3WzpcBM9ZTRB980mwaaKqvWlEV6D310Tdv/IEask/Lc8THOo
 gOVoUNXHOsXlud95spQ==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a819ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrMBDMYr2PV5ageQHBQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040091
X-Rspamd-Queue-Id: CDB7E1FF340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7b0:email,qualcomm.com:dkim,0.131.57.192:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95296-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 12:29 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 12:16, Kathiravan Thirumoorthy wrote:
>>
>> On 3/3/2026 4:18 PM, Konrad Dybcio wrote:
>>> On 3/2/26 5:33 PM, Krzysztof Kozlowski wrote:
>>>> On 02/03/2026 15:56, Konrad Dybcio wrote:
>>>>> On 3/2/26 3:54 PM, Krzysztof Kozlowski wrote:
>>>>>> On 02/03/2026 15:10, Konrad Dybcio wrote:
>>>>>>>> Also not accurate - "sram" is not the reboot reason, which has node name
>>>>>>>> called "reboot-mode".
>>>>>>> What I was referring to is:
>>>>>>>
>>>>>>> patternProperties:
>>>>>>>    "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
>>>>>>>
>>>>>>> where the 'sram' (not 'smem' as I typo'd above) is obligatory
>>>>>> I know and sram is not part of "reboot-mode" name. It is "reboot-mode"
>>>>>> in existing binding and DTS, not "reboot-mode-sram".
>>>>> In any case, I believe it'd be good to drop that requirement
>>>> Ah, and one more thing, the syscon-reboot-mode is Linux driver with its
>>>> own Linux requirements - syscon - so probably not working with sram
>>>> bindings. That's another reason full binding should be posted and tested
>>>> - I speculate it simply does not work.
>>> It won't even probe, we talked about that a long time ago on a similar
>>> occasion
>>>
>>> https://lore.kernel.org/linux-arm-msm/f6b16d1d-3730-46d1-81aa-bfaf09c20754@oss.qualcomm.com/
>>
>>
>> Sorry, TBH, I'm confused here...
>>
>> I agree that, DT node should be as simple as below for now until the 
>> child node is added.
>>
>> sram@8600000 {
>>     compatible = "qcom,ipq5332-imem", "mmio-sram";
>>     reg = <0x08600000 0x14000>;
>>     no-memory-wc;
>> };
>>
>> When I add the child node, it will eventually become like
>>
>> sram@8600000 {
>>          compatible = "qcom,ipq5332-imem", "mmio-sram";
>>          reg = <0 0x08600000 0 0x1c000>;
>>          ranges = <0 0 0x08600000 0x1c000>;
>>
>>          no-memory-wc;
>>
>>          #address-cells = <1>;
>>          #size-cells = <1>;
>>
>>          restart_reason: restartreason-sram@7b0 {
>>                  reg = <0x7b0 0x4>;
>>          };
>> };
>>
>> which seems to be matching with the binding requirements.
>>
>> and the consumer can reference to this node like
>>
>> sram = <&restart_reason>;
>>
>> I'm not following what's being suggested here. Can you please help me to 
>> understand further on this.
> 
> I already asked you what to do.
> 
> "Nope, sorry. Bindings must be posted complete, see writing-bindings."
> 
> So post it after testing. We suggest that it simply does not work, but
> you can always prove us wrong.

Are you by chance confusing 'syscon-reboot-mode' (write TO imem to set the
restart reason) with this node (read FROM imem to present a restart reason
via wdog)?

Konrad

