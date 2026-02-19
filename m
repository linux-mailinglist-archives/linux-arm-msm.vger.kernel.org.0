Return-Path: <linux-arm-msm+bounces-93364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJkCNhjjlmlbqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:16:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911A15DB74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BE2E302BA47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28683321BF;
	Thu, 19 Feb 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaVJfH2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tvncm2Qb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0D329360
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496189; cv=none; b=hfuEhMLYVrd1rl+/cRkENuH09ivrnzBu9M9f4UG0ppBo+ZB15yIMU0UaaWXIakpn4bcIzuFat7xKFbTQlyBa6u8RcRm7GP9RrDq+4ODN9TPsVxar0s7RzaaDFsiPnxTRO5Woned0NZRzwV+gyl6wlmrR+2VWoqAC75jxjCCQFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496189; c=relaxed/simple;
	bh=ZlxuKUVIb1SVqc3Ha3QwyhP1WMf3XlGlPsjwG4TMhqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MtVrZYaWUd2NMrcpO6LTdfcjon0tGA+RTghN5hhXbHQ80A31t94048ShGu46RjcxpKbenjhuKdlYFfzbE6rxTu4sWRRrmbOpDZAYYLO7rJCKedsCEMvU6Tiexe+D3hmivn+DwhIWvEsWzawzveD4l9jPRQV+rAFn9bgUH0lAtnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaVJfH2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tvncm2Qb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J56jZN3319588
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ENxyK49X8RDDGbPQRVRi1Jj0dBJbe2aind76FbEKxw=; b=TaVJfH2FqBTkwZUt
	A3ZwG58kmlehDP6WXBCx9EN8/51XeeVRVltEyobXvowsXIiG9rgEO6a9KXQ3CAhY
	vwBF6pHm5OnScj2Pp3WI65Pl5hGxvbHHhQkQtRqD66h4JrEDFQqB+Hh38hQlvLJw
	Ry+k1q5SKav29jOZ3XGNyoR4AbCaM7mbwjpEG4dm0CJ9eggEXr1tY0kgtgbFnzOd
	HeataRxZTFqnTV8FHouQVdlMeB7fLZFA6QzOO5UDe2IQ3ZLquvpHPOjZUcvHdrBJ
	P7U3o2LmfNLPlOLzcxaeqc5G+g7lpzXqMk9RKixFuhPmTlsQfx4GnrXNwd66swKg
	qkxALA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv388pyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:16:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad147cdf07so8364475ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771496187; x=1772100987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ENxyK49X8RDDGbPQRVRi1Jj0dBJbe2aind76FbEKxw=;
        b=Tvncm2QbyTWw4BjcRAHb+nuDYl0SXf23IjSGbJS+qkCjnlW0Z3hKQSTvARSRVSfPgP
         unDQRxPUEYluBKIbZeSn21wZ0+PAz9OVUnDJi+GscoTT8oTXdjU8o939KGX7WyxcNqDs
         2WFbAB6jKT5RtvYvjFM4PswSSt2NPtZ6wN8yJfWLuklfAgasa8nPNNwL+aG5EXkcWcLc
         BEdmSyWVotYdJudkq9C3RqqqQcB+L8PgxwSNUr9nNmfUE6dh+GYA5ZIVAviQ5vIsr9W3
         CBQcNSQcakItoGDBethGo255c6m98/p4I0rr+jj1QdTKO7NQWc/k/+NNQYuQp0TCAifL
         EqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496187; x=1772100987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ENxyK49X8RDDGbPQRVRi1Jj0dBJbe2aind76FbEKxw=;
        b=xD93tQ599KaNwNGOyb5xSNW/uGBxDBeu1lJIfuzIKqE1nUYTlfanZKywiDhFcJ+hHH
         uaL8U4rXfIagYK0PXpES08IWTTaoUSXOzknCg7bFHo2Xi/cSodr1nZkH6KM0GB30EhfH
         9+5IkF3io9bj9fOMU/zwCcJWqYqf3N9HCDtEVhSGgU3xoEbgN9dBPsScapPbuWyAuw8E
         ZYu+dQDjuTkuvFzXl92p6a7+Vl3Q2TTyp7s+VE+IAJu5efMx7J8CdNvfSx9gV7hT3r8s
         L6xakcITcxy0FM6SbRifNKu11iuM5MCjD3AKYyR9Pvra4MgaJetRyeSKneCOat8b8E9N
         x8Zg==
X-Gm-Message-State: AOJu0YyUICOO43h9ve0XS7HVe8xVLX8oPIc0IWL7y5OoZ68v9W+Us/T7
	61N3+bEzTmHvv+G3X7Dy43xEvtdIXTORd1fLKbohHpAY9RfofkVQV5UaPGqj/91/bu15tmn8M3C
	NRoEPmmKJ9lAE5OSmnfHy4Wn/7KwOhaXtaGLBc/Nh6g1D196iBazoGxiC0U6iHMPVFuB9
X-Gm-Gg: AZuq6aIkdPgfESslZvBNc0ZAc1I2zlK6AKV0G/cp7gKH3gOQeq4KQExhvRjoqI48vxF
	9u24350TM4Fve4Exl/hq9tqIhgMEfPx9X7D0Rf8+hXB/8fEfEaNmz7H9G+Yhf1ZATm1b/6cFJqZ
	zeXNvadupMsEvqEEzGhbDIqNCm1oCpMwoaZ6tczto8skI5snwyILojZOh/LrsWGr/j1Xe88kutL
	XDTxMVHV+16B4nQlJFstLRnBgV7sOKsUu2UH9J8I6vg2WI/Ed7hzF2WYmm2fXyh4cNIweu6pe9r
	rs3GYvu1QtDBk+q7x5cCU6FqfGdVdh0wS4z7by+q8aoQsVYaGalNk+a4HNrS1qteDcW9RMrEy7X
	+flLOiigwpQ2ySzK/DdGgoOP59rqdrGTP6uMi/1MFqKR5Zo+LUM/tB6A=
X-Received: by 2002:a17:902:f612:b0:2a9:616c:1705 with SMTP id d9443c01a7336-2ad1745d9cdmr173111475ad.22.1771496187061;
        Thu, 19 Feb 2026 02:16:27 -0800 (PST)
X-Received: by 2002:a17:902:f612:b0:2a9:616c:1705 with SMTP id d9443c01a7336-2ad1745d9cdmr173111205ad.22.1771496186575;
        Thu, 19 Feb 2026 02:16:26 -0800 (PST)
Received: from [10.218.18.194] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadd47csm157600955ad.65.2026.02.19.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:16:26 -0800 (PST)
Message-ID: <aac6bf18-0529-416a-b10a-c72b56532010@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:46:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Enable PCIe1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
 <5f62d384-cd53-4e35-87c3-67b45241b90f@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <5f62d384-cd53-4e35-87c3-67b45241b90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=6996e2fb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=yW33yQ_1kbtctqWuQ_4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ImwdMUFgf5ek6WIToqKSe8XpPP-5yAzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA5NCBTYWx0ZWRfX2PWYbmkCJBNk
 46s5nIfQZEeU5M3032rYPhRrJpNF7zXxpatocxfRry/jjTrDmDezSBxizvz7tkFtFZb9W6FaZqm
 YzROkNdNkUMNwy/ZHP1LI2m55uuL9tACz3q6sQU+3SL9Ybl8l1oQ+dUMfn/oa3rJxw1jzpU/kyn
 7kcx5tQ3MgkOLgOIuW/IOdf2lcTUitfMjQdJL5MRTjxQxEhNDxfMG2GTaLjXKeqdKMX4mPaRlF6
 kbuZoAFT9ZgaAOJ4Tp+qhFp+DkQ1xps4dvIuQdrl7BF8lWhwzSeiBsxq3DVcSIncNu32NaEOSrU
 A5sJKJLVEWXIn7lqwYPpwrniu+WqaLqzY0SqAgnbj6g1gH0r1tVtv3YPhjBq9OE1Nqj4RuVkRJP
 df2tyVEyj/3zuEOR6Q5ivVi0MSlXGPh3sERhVqrCy9HfsQuAYLb77LTtqwQ13/chixpjgXOdsMu
 OUhBWujEm4jEmFxfqXQ==
X-Proofpoint-ORIG-GUID: ImwdMUFgf5ek6WIToqKSe8XpPP-5yAzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93364-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5911A15DB74
X-Rspamd-Action: no action


On 2/12/2026 5:49 PM, Konrad Dybcio wrote:
> On 2/12/26 1:06 PM, Sushrut Shree Trivedi wrote:
>> Remove PCIe1 clocks from protected-list and enable PCIe1 controller
>> and its corresponding PHY nodes on qcm6490-idp platform.
>>
>> PCIe1 is used to connect NVMe based SSD's on this platform.
> Is that a M.2 slot? What key (B/M etc.)?
The NVMe is actually soldered onto the board.
>
> [...]
>
>>   &pm7250b_gpios {
>>   	lcd_disp_bias_en: lcd-disp-bias-en-state {
>>   		pins = "gpio2";
>> @@ -920,6 +931,22 @@ &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>>   
>> +	pcie1_reset_n: pcie1-reset-n-state {
>> +		pins = "gpio2";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		output-low;
> You're asserting the active state of a pin permanently this way, unless
> the driver takes over, please drop this line
If we de-assert the reset, it is an indication to the endpoint that it 
can participate
in link-training with the host. Hence, until the host driver is probed 
and necessary
resources enabled, we keep the perst asserted so endpoint doesn't try to
participate in link training.
>
>> +		bias-disable;
>> +		};
> Wrong indentation
Ack'd.
>
>> +
>> +	pcie1_wake_n: pcie1-wake-n-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +
>> +
> Double \n
Ack'd.
>
>>   	sd_cd: sd-cd-state {
>>   		pins = "gpio91";
>>   		function = "gpio";
>>
>> ---
>> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
>> change-id: 20260212-qcm6490-idp-24f7b6a1812d
>>
>> Best regards,

