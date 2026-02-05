Return-Path: <linux-arm-msm+bounces-91866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJFgMPBZhGl92gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:50:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC9F00B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEBDB301A7FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249AB35B644;
	Thu,  5 Feb 2026 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNERnH/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmoQF4gx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C26356A2C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281453; cv=none; b=sBahv452NIg0u2NgtOz3FFPiApr9bhxp1l4fspB5DK7ldpCS78uDhsqDChKMr4FJ6cbtP1oGODmptwhKl1/tzoLcedSw6v+bBijXx61emaVDCpFZWiDTAnDwjJ83kifE5O03Uue/oQQuv+z/UBaJ90uPfchTOUYqkuBI9E79uYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281453; c=relaxed/simple;
	bh=KIqNGNbcmImNbHhAF34aY45imM2NLg2uNBU7JzmAimc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JrLdRwYKtVpRkUw6AGTH+DMk8Dwr4vPFS7HpIqgePHKkcQA31j5gU1cJOgNgomLKBA1IIwjQWumomTy3A/J5rsLCGq5JYIrszaSp7yNGtkdBh/6P65fjeoldhlyn+ml3xOe3JdCyOdQTz3DPCh4B+0EdduDjuOeO9bexz4YgyR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNERnH/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmoQF4gx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dlLd2712978
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KrakDA3r1DWpbWHkPcwLM0xWLh+O4InpD78DwsJ5jYA=; b=jNERnH/InUqhcTLt
	uSnwHSimhYfrauTIZijI/OJw8fU6kYDAq0sBXGv5pjX8/hu/i91OXlgKKBRjBUuh
	K6hY0+gEtMccDGoAlKWfy/mIs8WpCH6CSbJR9fjm369fYzY3/aEnPQQX00w687Lp
	/zXYFut5DNzB/HfjfnmR/f/bWHZITIoj3HG+neOq1QyK0aI1vJcuf7DxRqUjF4vX
	LJGiVrydTincgPi8fyQq9iku9+SWtaV774E2kRcCxnNX6uQG5l4d5asXnhId5G/V
	HDrekjpNGwFrrvq7ANC9VM86YWsAOYIqRnR22OyQE6Y51EllLv79BOS4cX2/5jyN
	9KtClg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja34gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:50:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so24012985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281451; x=1770886251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrakDA3r1DWpbWHkPcwLM0xWLh+O4InpD78DwsJ5jYA=;
        b=JmoQF4gx5XXWZi9tzR7FiFucF2dXXn74KV2QlBL3nr+Fn33fHCC6DtWKbFi4hyUUq+
         mW5dbvLiK4AceT/Oo4VslTc1IZhPlzPuhsGpVjBD5xja7O3+obSsZIcHBtgMtCk1Lrnf
         pXz0MnItyBnVNiP34jk9sXjBKV7OXd2hJgSgR7nmj4GiUOG4668qWA1IaJxlL0m9FMxV
         0gkyhrspKUxs/Rt9wRKHmAH4EEvzW1qClBk14GaDpdSohrmVYZooXHlhArFen2hXHTIa
         G+wmlaqDfxnVk9y7syaYqq1MBzhcdn5nE+xoMwaKj05O79JWnaG1gO6DZK37DCQXo016
         OKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281451; x=1770886251;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrakDA3r1DWpbWHkPcwLM0xWLh+O4InpD78DwsJ5jYA=;
        b=fNn80FeXa4WwHto37+dc0qFom8wLjOmhfh+t1SpNIJp+xZB0leyXJl9paJDPVfDOF4
         dV4YmzjXYJ1HTSBzoDTINXuy38MbB7rZbe/XbJf4lk303m0kla8dl/4SRWPzOrUIcJYr
         BHMN1oPh30y2Z/gZdoN7WbHiyOdR127YvuRJ7MVW4OlxIrkcpDj+DrorNXQ0n6zJDbFK
         L1O9GEA2/kdnCa/7OSke8bxMrmuGIN5sINb3YJv0t+32NClL8osuAOS3IPVh281MyDFZ
         ZPkiMc35uFdM74H9foTqSg26UXDXnwyUaLlJz3Mj+871uZ/6+JaYxj6LzFFxC8QoiIs8
         65wg==
X-Forwarded-Encrypted: i=1; AJvYcCWsikddQmqB8Wr/z5IGorOfxZa6Cx7AsxaXssan79eNB/Fta4kmNWljU48lxVJTtrHhHg86xgFYbJwwORTs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrh0g70JhNgA+6rbfW0hH9ipLt7obKZLiNi7ajq4DLq2TN2cHp
	UJGixgYU6UD8sNWLwriR/v6V7JkN70jZ7/aE/3Rk3LpXUKOChi4KeFte1zYEPWm9XJfIAnvIfmU
	MmVB93shr6XPQ2bFlq9My2ATMjzkhRSfiout5Uu0N1kM1EQJ7kEPhlLKPhUOtstV6COLq
X-Gm-Gg: AZuq6aKLrFs0hl6ZgbDZkigr8l6lGI+P9dyA+WO5/VKWx13OwT/Wbery12qPbmmLZTS
	BMcZ/0idgZE/Apt75VWi9atbvTXa0qrbITSdgEfa5o5U1Br9i4RQC+chYMxPiG+UMlpDsf+CanB
	ihPi3QcOQlNtU5PchK33F0AgyG1cCw+CDUjFZcuQfQvfP/qrbsUAURc1SAjjDlU+oMRKkZeADMD
	L7ZwlzkAZhdWQe+FX/GewkWwMiUJT88ENOP4pnhbCM65ATSuJEb24LB8nRHgNUzbF5SOZNLqi1C
	tZBoa2X22Sc+0IMyTTyDyMUsjMvYxl2alUfuNC8yybLtdcMce6Tx4r8VPQjylss4a2sxmWhV5Wj
	J2A640eOJ936tHp6l+IdmR0w92w+ZQ2BIczc6HxkLE/Njw0tyROAANDF9mml6Lw4v5bU=
X-Received: by 2002:a05:620a:4611:b0:8c9:eb47:6e9e with SMTP id af79cd13be357-8ca2f82cf1cmr575523285a.2.1770281451026;
        Thu, 05 Feb 2026 00:50:51 -0800 (PST)
X-Received: by 2002:a05:620a:4611:b0:8c9:eb47:6e9e with SMTP id af79cd13be357-8ca2f82cf1cmr575522085a.2.1770281450620;
        Thu, 05 Feb 2026 00:50:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f4csm212078366b.6.2026.02.05.00.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:50:50 -0800 (PST)
Message-ID: <b2ac0e48-392d-4c4c-86fe-81348b58f336@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 09:50:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: andersson@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        qiang.yu@oss.qualcomm.com
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
 <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bT69WzRaGhhYGeHGxzbS652O_ckeLXa9
X-Proofpoint-GUID: bT69WzRaGhhYGeHGxzbS652O_ckeLXa9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfX90I7rDQubvlJ
 vARVTjAq0OjN6wzJxjVM9KQWyZG0C1qi+qwjofDYj9rGLdZ4+82ledIaBJM3MKGDbjZbRL5evHm
 FbBDYuYpz8r+1IIqkYDVTg3xdJkGjU2NixW8exc+4lAI0mwV50nlCh3n1AbkS9lJsvKPFuSNPVy
 qW8KYeyvO6+f+1FH8K+iL46I74Kx/p1JwuyUNI1IVltOHwO0ZIeSnVS1ypfYvCGX3GwbMCLL4ik
 AOFsqLrGcUsmgJXNogA7OB0CsPXskpNM7RjdRUjmg+LKwzARuYOMmzPdKjaieofAqy87g9zGG0F
 +CQAI0r1+baZ6zdX/3dDV0SAlBIggX7UGDmheffjMBgh/M7HUsd5IxuL5Hp52qNhUjK7XbiUPUu
 eyyuIVa2amX8tuJ3nub1EMPshxcgVPMV6pza4MxJ+TPZoYsPgsI3TUg7ek89pDVZhtzXWXoUunD
 zXmHMGtfGVnfGZ3HsbA==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=698459eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LKcR3ohmTCdqcgAtF80A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91866-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40FC9F00B6
X-Rspamd-Action: no action

On 2/5/26 9:50 AM, Konrad Dybcio wrote:
> On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
>> In the recent times, devicetree started to represent the PCI Host bridge
>> supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd4207
>> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
>> the Host bridge drivers still need to control these supplies as a part of
>> their controller initialization/deinitialization sequence.
>>
>> So the Host bridge drivers end up parsing the Root Port supplies in their
>> probe() and controlled them. A downside to this approach is that the
>> devlink dependency between the suppliers and Host bridge is completely
>> broken. Due to this, the driver core probes the Host bridge drivers even if
>> the suppliers are not ready, causing probe deferrals and setup teardowns in
>> probe().
>>
>> These probe deferrals sometime happen over 1000 times (as reported in Qcom
>> Glymur platform) leading to a waste of CPU resources and increase in boot
>> time. So to fix these unnecessary deferrals, create devlink between the
>> Host bridge and Root Port suppliers in of_fwnode_add_links(). This will
>> allow the driver core to probe the Host bridge drivers only when all Root
>> Port suppliers are available.
>>
>> Reported-by: Bjorn Andersson <andersson@kernel.org>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> This is not 'required' in bindings and device_type="pci" doesn't uniquely
> identify root complexes (as can be seen below).. but I suppose this is the
> best delimiter we've got
> 
> Perhaps it could be made 'required'?

I cut out the line where it said:

if (of_property_present(con_np, "linux,pci-domain")) {

Konrad
> 
> Konrad
> 
>> +		for_each_available_child_of_node_scoped(con_np, child) {
>> +			if (of_node_is_type(child, "pci")) {
>> +				for_each_property_of_node(child, p)
>> +					of_link_property(child, con_np, p->name);
>> +			}
>> +		}
>> +	}
>>  
>>  	return 0;
>>  }

