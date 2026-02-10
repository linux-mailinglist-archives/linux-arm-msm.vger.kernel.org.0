Return-Path: <linux-arm-msm+bounces-92469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFEWBrcBi2npPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:00:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FF1194C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 664C2302810B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2C233D508;
	Tue, 10 Feb 2026 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+izyRyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYiUKzRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA430BF6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717620; cv=none; b=Xr6B7cyvCD3RpZgdIS6JaV7lT31a0rvbNq9DMfqTxbMoB0liRGP6e2GTHGOe0ePToaE1VjEM6rclqxHPM34BY0yN/m5KUPAF3k8Z8YE5b74in+9pWxfrMZyaoRldw3FLnjeD287VqWxYh7/aJj7B/l5WbQWbrPGBwF+zrITJsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717620; c=relaxed/simple;
	bh=/VvWsclqCNUKGcpiXsPFfLztHB7A7rPaZiOJc21pNwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4jPQXPXW2IaunwfVTKDgbyrJoxrQYdV+cIqk0sOWlp2Y4g3XRnKxWSdDR1Pp3E2SK/wOKebMT7ZMQVC4iolq5LJUz+zxa0lmxdrgNwsskVb1F8eEMaRyYerhpaUbxDVlF068z5bix8+Hr2i6S2rm5aDhvj+Bnf2yscufBfHWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+izyRyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYiUKzRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z2JF2169220
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOS6ggBeTexnHosszT8D9qC6QsRq5ZmPl2bw7sUhbhQ=; b=l+izyRyvkcOCZXWI
	LOo8AUe1QbDTgK7QblR28ZUkS3sFIaDsXKUlv46QzD/x7R7ZsBwxqW5uBItpS3p7
	vxGwCdCvDMS3ayFMUDTyXmWtEmlTA/+fWAhT42T97nIvk/1hXSilSj0i85VjZA7n
	DXBzx0A2LToDWaOQIC5SDeLFHtwYU4njBPlPTuML+aEAm8RvFnN0EsQ1thQKOIbq
	2dwPTWDIFKmNNOatIvTiZzIzX6bqHhxM8hAGGeEG+h7ZfIt9hlX+B0e/90YuMkgH
	/m0qZ2E8kzO3RBD1PiFSP2Pzu+Y9GPWTPs7KciwmGhCydXlNLzitoOOdPgFevzlh
	lte2Vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrg63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:00:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so95080185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717618; x=1771322418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOS6ggBeTexnHosszT8D9qC6QsRq5ZmPl2bw7sUhbhQ=;
        b=LYiUKzRlHUgptc4OwEFV0IN+Z7Ac4YnJdES0JvDm2NjezYFe3ypSMXbafX0Q+ptKOW
         wcv/xppUq4rB2utz1s1z7P71DFBwkdCEA0IyNnJwxUabxcPtK3ZuIm8TjYOR12YJtmMB
         9hJD+fww09uFcBv8GXV7Ipkk1mplyPNVocbNQYwu+/plz9aYLa54MldDpH0WcBLczviD
         jkEeTxTjtX08iV7jqAzHsf/zb5cQQ6Fn5+VH27N1Gw5XJbnB3Bv518AJwJnLwg+f35Gi
         aYMWPy/9+kk/ZqOImFoAz5W6M2qjcFzS40OttHloIFVoIzlwSK5dWT4BgkWwtletv25N
         bPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717618; x=1771322418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOS6ggBeTexnHosszT8D9qC6QsRq5ZmPl2bw7sUhbhQ=;
        b=q3rBL7l9fkpwLHiBT022wYdB2RixTv5X87FiZnLrY5IrlNarkwSCMkuuUYC27AIPwe
         E+l7GClKzxxkRjqT1fo8rTq3oJGkLKcO57DfCu4PjVoz3aBJT6tlGsZ5ktORHPqYJ72W
         84i3i7KzikApW6V9kZ2kG9iLWWdaK1QA+qgi5RaV4fcwi0Y9K7skrkAJhWESvueS1Yyn
         5WZjkDrdcmXWOu2rDQBeJTOW6ZpPS9PE0S10KswQU1gV6kG/Si4z7JwLeqpp+eyKuvtO
         tbq+eCajhEu1OiuUVZ8EPbDWaDN1Q9b7/6sE8zLz9kI9ZPAUDWapuMqeFehGXqB/CnoY
         zRuQ==
X-Gm-Message-State: AOJu0YzDf0vwvPl0u0ZuidljcMCygUbSwPU2tuJ2JPC6zNj4VchcIgUs
	Ss5EUdWjxISqbbPVnTsgfIMxxbO9MHJ+GBWCHDiTmMbZVS/KBSs6/RhxEZ5VG6ag5NeqKuj2RGV
	3NYex5qm6L9HutDOMAVGj6yJh8BKOemhMf20L0LvtStj8M7ExfryMpLEJaAOTaHDldO/o
X-Gm-Gg: AZuq6aImeiRS/mE93CMQJ//kHRgCCV6ZeX0lmTfBzYyJ7JO1Vhwo/JdQUgLvs8gNyAP
	6ERatV/u5+EPwSEuMKTGhyupXYTbQCi2r8Gm1ke5+LRvXwW0fpeklAPBCy2R8CWV6Y0XitwCL/2
	hmySA8B+eJvPUe/9XKMBZloVdWa2Ny4RuosQNP8iDyo2ABNDED2uZ2O1Y9YqTKLWOVGPU4LG/JP
	Iif5EH8t/sZ7u0+ch3qoiqLb+9ivAZOcTJ6EJJbWYZPmCfoKdohzQEqztZVwqJcDZkr+5Q8Sjq7
	ZKgvUavhAcPXb5BzknhuLDMhPgOm5SYL3aJ2Z/6UvK14I4cfofsmoKzhQTriQFRILKSly90Hm+3
	KzreHdYXSTVnv7ZHO5YXiJB3LLFzAp3R7M1ojrBVbjyIQvYL+k/8K96C2IHwzDcSA86+LJSF6T6
	MHk7k=
X-Received: by 2002:a05:620a:2584:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb1ff75685mr108025885a.10.1770717617641;
        Tue, 10 Feb 2026 02:00:17 -0800 (PST)
X-Received: by 2002:a05:620a:2584:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb1ff75685mr108020885a.10.1770717617129;
        Tue, 10 Feb 2026 02:00:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7e6577sm488931866b.30.2026.02.10.02.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:00:16 -0800 (PST)
Message-ID: <6f506caf-4910-4d29-86c6-4dd57aa559a6@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] usb: misc: qcom_eud: add host mode coordination
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-7-elson.serrao@oss.qualcomm.com>
 <f8169943-f986-4e9d-9d3b-a470e57f5e6a@oss.qualcomm.com>
 <0fd2cff2-176e-419d-9e11-a98150266fee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0fd2cff2-176e-419d-9e11-a98150266fee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MyBTYWx0ZWRfX2wPpNIw+vHDx
 cp7cJaSAtNMygTj5XsDFSow3BdJTxTJ7f4eIceSoryQCNfeN/5ukWzyXgQAGOCxU+KaetRgCdaj
 xGjf2dnagqbSPO9Fkt8dfDRWLhy91C9SlAWl3zz7OMYnCllbBtmY9bFJ/2gvVPb+iXjNQY6bXwX
 K3hokVeRIAre6GUISS9E6VWA8fxqHrdEZt74KPImX6yFQYrj3/hZT/NSzhcLdL/3F9GqAWfykOx
 snDUylaign1Qc659K3EPX+S5FJmCVxsigw1CW8xu9BS5eaDOqGvngQhRj45zcuwYZfVja9NeM0r
 fUxUDVcP3MM+aLMf0VezZSLwIHOoLhUf9c7nm8Z9kFs0vFmK6fGtyVqeRe5nWSbZUNVJG+r5x3/
 Xr0xRQZCxkO/YAOnM3nypiiHJVPdAM8eeupQj8G7vUjIul1v1OiD24u+YLTYKMEPs4MedplfbiX
 WqV4nIA+SrnyWjdMCMg==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b01b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=IqIWAEJlBQ2RpOI2llkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _muCI7BDbI8ua4-Uv1Z0bQq87YnB8a_U
X-Proofpoint-GUID: _muCI7BDbI8ua4-Uv1Z0bQq87YnB8a_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92469-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F5FF1194C7
X-Rspamd-Action: no action

On 2/9/26 6:37 PM, Elson Serrao wrote:
> 
> 
> On 2/4/2026 5:29 AM, Konrad Dybcio wrote:
>> On 1/27/26 12:38 AM, Elson Serrao wrote:
>>> EUD functions by presenting itself as a USB device to the host PC for
>>> debugging, making it incompatible in USB host mode configurations.
>>> Enabling EUD, when in host mode can also cause the USB controller to
>>> misbehave as the EUD hub can only have one upstream facing port.
>>
>> Perhaps that's a silly idea, but would the device itself see
>> the debug hub, being able to essentially self-debug in a way?
>>
> 
> This isn’t supported by the current hardware topology.
> 
> When EUD is enabled, it enumerates as a USB device to an external host via its
> upstream-facing port, while the SoC USB controller sits behind the hub’s
> downstream-facing port. As a result, the controller cannot enumerate or
> interact with the EUD device itself, and host mode is mutually exclusive with
> EUD debug on this path.

OK, I see. Thanks

Konrad

