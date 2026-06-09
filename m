Return-Path: <linux-arm-msm+bounces-112002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AcLnD86jJ2od0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:25:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3A65C6B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FnK2zGrO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NV7SPSmn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112002-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112002-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A40C9303074D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 05:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720273C0600;
	Tue,  9 Jun 2026 05:25:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7B2ED843
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 05:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982732; cv=none; b=q0AYkLeclcVCfq+VfdDCiUq5w4kI91MN/PhihG5IKnF9J6GWd5iqBgBAnCE7i4w3wfkBeJhMqSTQjFFWb9pKKUfF6T/tbx/gz3OoyIEpjfo5JHiCu5I+PuDJcsIRJwGY9Nut3rGv1BcJVOzCHSW0H7f1xd8m1CENvEhtERtnPcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982732; c=relaxed/simple;
	bh=yiN7XWnx0Z2qPQ8zgQNCDMbQgdUAfnp+4+ETkmNbtX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IC6bkyPCNDJUXSMhmhrKXZnaZq9Oa9Iy2hwWkJTjSGlYY5dPFQjLcPll3kypJjUNVWKlyuHPt/PzhmLTErev24mhFn0LbENBSwqi1esIfELwfy8d4MTR57Ca5a/j1t6UtqGODZzUoTFp2So1jdCLwu3Ot9cQcZSc3KcDx3EZYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnK2zGrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NV7SPSmn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593xaRL1478534
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 05:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMw4qOFoLAlY1h4kX7c61gcRF9/WXhnsAgkdv1IGCnQ=; b=FnK2zGrO8d0CSVTd
	MQTU9WHATx9TR1vmvQ9erw8THoAuuzwgeerd3hFHph9qz8j5v+QdvG8+LNElYqlV
	nonsJ0V/XyXxHOsphRMYj21YjNo0LbuLDYSP+E7huo5DXU7a4NbkRU+mw5UZToWS
	bgqgVKznDGp3W36L/JWj8F/I2CIlJh0d6fIoSXx5jE3IHCpzzsa/mybjsOWkTK8w
	UKnNybOK7sg90nHtD5MPDqR1utJClzcfmq8OHpLmu0P/SxCVrqB2bLQ5UIZp0BF9
	uiVny1nKZbTsB+esX4mvrqDH9SicP1lLUmJudzvthpBFQ1TnVP2LrYGhhUYUv2Op
	hGA8pQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0mte5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:25:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso53212875ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 22:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780982729; x=1781587529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMw4qOFoLAlY1h4kX7c61gcRF9/WXhnsAgkdv1IGCnQ=;
        b=NV7SPSmnXWJdW2v8bFmYdUuccGiNknuQA9YvOFT4rHNqlStqCkyfqb1XDMCRrdz8C0
         4GjmRWBjOPDtCsBaJOUGzaz0yWFMllo1G26GWYDffXtixjh40tir0D0AcD9Nv9bgIwCq
         uWXJNzPEHTLlXPIfizx0k7FtuxFQ8B2J8k5nBYczIO/1qim6jkIUWhEEbGE0vyZg+rTr
         YvjGZl2wdHvN0Qu2pAcYDN+Gaw9rxXRI4MHNqvl1Bw4T3KsLHC248CykJ/x3YXlPQhiX
         5OCrplCz0hVzms5rNReYBmbt/WW8o8C6pWxHPGrFE8ySoasRtWD91KR04OjbNzzpsDyD
         zCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780982729; x=1781587529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMw4qOFoLAlY1h4kX7c61gcRF9/WXhnsAgkdv1IGCnQ=;
        b=isvPZ/C9IkhASqdNvlvKMEZyhK37tBLHWn0UDXkkbqVsnb4jTVeP4k/8tdIjAhx/Qy
         7AEMOhcP2/liMPA+LNo267hWVat8gwiAktt7P7tixirfbQ2BCk1iio6c5rIzV69C3Jgz
         3upVr4zBBVOlLH4AgFLo7MUDGBwKwdfes/kLJra/v3SUfePm7+xj1FDz5fN18JFMYNFo
         bLPID15U1Jgv6ruW8ZPjBNy1Q8vHR/d99K84snIwMo8wjVhNzcQpsR7LkdrjIMbU38/Y
         dBGEnsxvMlm2k5xRBDgr60/+iTTxioip47GaklArctopsmB6MEGaxXKPu5uAWH5PXBsR
         y24g==
X-Gm-Message-State: AOJu0YzOmwqK+MBzSFcZrZBniRH0ZPrq95oe6LVs9KCJOFn3zKqPuEkU
	ltcRqU2cbn+CxRDpT/ZCIoou1ReEmmwXAGI5bTuEqZGzL1G1gtKDX/QvNfi/E0DawL46kv8NYjO
	5yGmF+VggtTYRof4c+/PYAnRHUvjcME9YfylgEWtiIiflD1IkUqQRE5VbxFK9P5t+o5mV
X-Gm-Gg: Acq92OFyjX9sbQACvQ7QKPQZ2ISdfoHL16citoPbqkwpsrVCcqLMOWoxnX4MlE7Coom
	lQA7en+Nz2fHEyN8AljhasAgkoJU95QfHh1maPhlIUjisBulQNNJEIAYaHbjANBhIc0P07qhti7
	cyTaeCeYlYTsXaAhee2HYCrFeKWFiM1oM8mjmXBZ+55l1znDgS64OJG4nOzIcveG9ljZV1jW8aY
	OG6rCTLahmfiGlPWf89/TB3IU9HWsFsyLnH3kNFTl+xN5+xZE8OwxZBz/CWNlNxAS85uTjLSew5
	cM2Ojlb4rFA6TuS+f5BU7yQ1ly1iOAf8iHSuLGqvNNHuuQOU+p/3h5BwJbiIJjLH5edS38N+EWQ
	70+GzvrpkePvH6rl/6Ih0SNmEESb949pYbUNDa/nYdKdJWIfn7LbCtl90A6xJ84flY1Pg2wZ2wZ
	sk
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr212713125ad.17.1780982729002;
        Mon, 08 Jun 2026 22:25:29 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr212712845ad.17.1780982728546;
        Mon, 08 Jun 2026 22:25:28 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c250b466d3sm66516115ad.62.2026.06.08.22.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:25:28 -0700 (PDT)
Message-ID: <26374aa0-1db0-4d90-9cec-b546df598155@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:55:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <c59579b0-8c88-444d-947b-615a623f42ce@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c59579b0-8c88-444d-947b-615a623f42ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0NyBTYWx0ZWRfX2bqEv0T3MCre
 cAD0MkNLaFtTrS1QcYpLNDfnLw44AWsNdC0I51XLlasVgucxmoqaRgPn7iQgOv8E3k7KnO4z6S4
 ON7PVFi44Clvsj4+ANOHP0fh2i1sh7OsOYcI6sDKO5t2ibPQ0i8qvK0k+GMkcUtsXsFC7Zh+dhl
 kiStyvHWd+XMShOvZc+csohBbXpD7ePTGMtm8HMtTrkos90y/SKdCpQHDNjLLwjhIIBIODy7+KP
 S/4cVJUK2efPphlCVB3gjNiEOg8OLRqCbktrlAYd/piNXY0tkGHk3CSZN+7Z0mufRRsl4w5f6+p
 uPQZvJPIGq6xJBlmJl39ryE6619PFCORhpYkkNMskiyqb0xZeIJTLngQZlMKDq0KfZOZNHYWmAX
 k/K21bnK5MAZyFfWsw2FP8d2wbiwNhm4vAktBPc75JhUc7TjDtrZEGBqK5uyj04Nfw4snC8+kEy
 9dAQaCtV58o1Asyr4iA==
X-Proofpoint-ORIG-GUID: MOY_Ae2BeJRoiZBTQWJeTg_QByhcOxBX
X-Proofpoint-GUID: MOY_Ae2BeJRoiZBTQWJeTg_QByhcOxBX
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a27a3c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Pny210M0Jru_JXUMdrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3F3A65C6B0


On 6/8/2026 3:52 PM, Konrad Dybcio wrote:
> On 6/2/26 6:34 PM, Kathiravan Thirumoorthy wrote:
>> Follow the new binding style by defining PHYs and PERST# (now RESET#)
>> under the Root Port node. Avoid mixing styles and move these properties
>> to the RP node.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>>   
>> -			pcie@0 {
>> +			pcie1_port0: pcie@0 {
>>   				device_type = "pci";
>>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>>   
>>   				#address-cells = <3>;
>>   				#size-cells = <2>;
>>   				ranges;
>> +				phys = <&pcie1_phy>;
> nit: other socs (like hamoa) do it like this:
>
> pcie3_port0: pcie@0 {
> 	device_type = "pci";
> 	compatible = "pciclass,0604";
> 	reg = <0x0 0x0 0x0 0x0 0x0>;
> 	bus-range = <0x01 0xff>;
>
> 	phys = <&pcie3_phy>;
>
> 	#address-cells = <3>;
> 	#size-cells = <2>;
> 	ranges;
> };

Ack. Let me add the 'bus-range' property and move the 'phys' next to it.

> Konrad

