Return-Path: <linux-arm-msm+bounces-112004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sIVtHiumJ2qa0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:35:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9665C782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PnwvTIbq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BNYRjo3Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112004-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112004-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5B5E3084BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 05:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5262C3C4563;
	Tue,  9 Jun 2026 05:35:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E73B6BF9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 05:35:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983329; cv=none; b=q1di/o54ZS3RMWjl/rTnFbApIBhNPju19gO2Ro8+8sN/c37JpmtzZVf+9iyeqLXS0jz1bJ9CqmSWCQjMnJGDaOF8c8FiUdCL71vyvrs24O7ejwwIJigne2YxlAZRX9/y8NflPLL50R9BnFH4YzwazWumJlC7sYbKx1y4QHKiH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983329; c=relaxed/simple;
	bh=f8mZuRJM1Xj5UTCzYVtCxP6hZpPvwo/hvNTtsESfDEM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eIhbYl+BMKqPYHjAI51Cvm9z+dZKoU048NZR7tTOsJRpFV3k0nW35Whw1ZhH5Meikwvos1Zl1s8VNx1VKhzZwL4LOAmF6u96hZX6kruGVlsqUKDZkKwxiJtMTAIVwp7wxLF8u/fJHkrv6J10kIILS6k4pfkgRntKoa2HI/fJgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnwvTIbq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNYRjo3Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wdMW1399871
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 05:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8X/m6BpotSV0s2wlIu70ir+Zo0Bu84qxjgZXHCPBHk=; b=PnwvTIbqhaocR5C3
	gMnO3Z+xkNWMNDC9UUaapGPH6ugZiKrj1hcJQ90vC2gTdNFfBVbjJ6Bs7aPn4yKa
	Mfy9dy8FYwpFf9tzaNBBAEt/8DLU/CkCG/cX4Mbx1fzBSZswIMWxXaTGN3M7Y8yL
	zZuDUYt7YM/KGFYBZKTLxeWwxHamC/BymfpDI9UbXgh1hx3wHvLUiprEuCwrLk71
	Pvr2A4f+Zez3BvyGvs+WcjEAMpqIMQeZi5DJb4FWkM9kkblszGNcN5pQXRefJqMG
	rEVGuAkCIEOP+f0jwecG5ej78hTyCDUsU3cD3lsHTXtWcxNcFy8kxgTgmnqB4wQ5
	AfTqVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2ruw7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:35:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso54287365ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 22:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983326; x=1781588126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8X/m6BpotSV0s2wlIu70ir+Zo0Bu84qxjgZXHCPBHk=;
        b=BNYRjo3YojkezcgwToT8YPcHzQLbiCIoSFIoWxFIzGjV0fHykR9dAszMSpdVeD0dYv
         65TnPXER5vD6zWUNX6UkHvHz4aQoj7AADlRd70Lvi6/TP012YLvGp8z/6eqeVc+HD3vO
         FJOYbk4zzSgtV77igaE9j5ytkZ6BE1WMMnYW3ydIMi6U6g+feQSRbmRJYIT99GpJ4L8/
         vJd+IDudUfIXpqJkfNefiU/DYCABHnPaGtwGH0OuOp8iNkloeLAf2eTptwMuAoWwuEDW
         JD/QtoLeievNrJgoyKZ+Tz3QuQWFpFFIC0sp3mFOQRins3Zc5IFDp5aoufn6SO1oX7ji
         WUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983326; x=1781588126;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8X/m6BpotSV0s2wlIu70ir+Zo0Bu84qxjgZXHCPBHk=;
        b=makI1mA6UA7Wk4kJ26LYl6Xyqqxkz5yhA6gtoyVkFBO60vzqzlrcSKz0HWmrUF8CYj
         qcYirZq0KwgSeUiuunGmnbagmdWnDBBU6+UlRro+Yepp4T4v1D/7WaWvJB6teUcHLFY9
         17y+s3o1b/QNxHJQmZ+5po4U/SCVRdOHVOxwHV7U77OL1L7PdYMEa8o9rQagGEbjgSyP
         TYoY8VUuYgc32DPXDNhlP/xj1thvYG5v5Q5OMN+NjH/Z72b9FLpF2RRapaiY4NKEfMdH
         sLrtZ5gp6osDXuw2/p+AoBOoztsW6yrxB+IT65oza5qBCdE361ZZ3OIvds+aUce6NEcC
         wh9g==
X-Gm-Message-State: AOJu0Yy+spJ9/izvQdkxEDdEkbjjMci1pdSl9Hld4UQ8zePFK3Bved9z
	tXratv3Nnppl9lZD9rFzYnGqbLUkQvX8S0TLAQGVZJGBU/IwRsLB5M1Xi2PYqyfQIQtg+vocGBY
	H00cRB9B4A8VaQc4owHu0R6r6iVMSE7zUOk5jN/rKgdYpahOtm8mstsOs0QnFZeU4eykr
X-Gm-Gg: Acq92OEi17C+gw3dgnwRu+APG29TEzPkgI0ZHNhbKLjYTToHyicZbaryOaYwRyLlvqS
	uGOSAMAkScUau3GpBL16/HIv5PxLscY49IpbKaBjkQkkXs0BBYWOtJ3RjZS4LxKk+aGzAdJWF6M
	Rwi+MaKpCd9lxmq/6G7tIDewSVwgISzZ1+mMPv2hJwirVHvs9ldHBeDnY0Sq1CKXP8cRfn1zKnr
	gGst4fFKUKHoC1DTIkEEX3fwi20MC6jBbVFiYm4avQPxEId1YgTS3JzTnYl8MfSfNIuPRfKj9//
	j70z+PYFd6iZW3cZd3ZlExQQjoYKbWwoQVFqKEJx8aDfBfrze+HW6rb+0G4fGqtbc4/WnA7wzw3
	pi3N17bMJFZngZbwIgPS0BB/IVTJXSlmgOWsD35jOxe9Hx0sq41soxokZ4FV2K0cbLAVj8ayYD1
	GZ
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr219153765ad.25.1780983326037;
        Mon, 08 Jun 2026 22:35:26 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr219153385ad.25.1780983325599;
        Mon, 08 Jun 2026 22:35:25 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f94a7fsm202031215ad.28.2026.06.08.22.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:35:25 -0700 (PDT)
Message-ID: <dfe6eb1c-4205-407a-9193-a27cb2e3b72d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:05:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
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
 <26374aa0-1db0-4d90-9cec-b546df598155@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <26374aa0-1db0-4d90-9cec-b546df598155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dJuuKzBn68qfjyClggnAMp1LzPokdCbM
X-Proofpoint-ORIG-GUID: dJuuKzBn68qfjyClggnAMp1LzPokdCbM
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a27a61f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o1Qc89-7ai6OhWUoDCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OSBTYWx0ZWRfX4zO3/dTWLhR6
 b38cGxOjSvYipq760ICJQMoWO8n7BamQN3nYdwh1UqYqBUnTyWpPswVfwM0PWwvRMRLjNroYf2i
 bGqvj7CHArqaZlcwyKmghJGQbMbR9mtr8puj0E4Wm0Tgqhm2f/2TKalyVwXhGaEDp08fEyU7GXV
 k8QCrgYkKC7Ed8fLyQkwZRNzK4qp5PdDvswn5mVDX3xdPamBwmFvQjkZKoHG+NgyZn7istRjK+D
 ovNLh0SLWCVjrvJ98IC4KDJJmha6cMsZ+CA/KrxTJfEZmEGtCS9mfn/Id+BlLvkmbtwuOWOvG1O
 XtyHyk/+4lMYzSDrKax3V+PNlHv1p4h6OtfyPaAEjoP/vkpj9y0EXexLN6jmZ5umY33EJ2y8FfB
 aE8r8j+tcUeL5ToY6lACI4RrQCZZch8iweT490xtieHCRlTCJ+uPdkdTvFIdZPozx/D+QdJbBN3
 acedclSH7E7+fQs/YqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090049
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
	TAGGED_FROM(0.00)[bounces-112004-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: DEC9665C782


On 6/9/2026 10:55 AM, Kathiravan Thirumoorthy wrote:
>
> On 6/8/2026 3:52 PM, Konrad Dybcio wrote:
>> On 6/2/26 6:34 PM, Kathiravan Thirumoorthy wrote:
>>> Follow the new binding style by defining PHYs and PERST# (now RESET#)
>>> under the Root Port node. Avoid mixing styles and move these properties
>>> to the RP node.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>>   -            pcie@0 {
>>> +            pcie1_port0: pcie@0 {
>>>                   device_type = "pci";
>>>                   reg = <0x0 0x0 0x0 0x0 0x0>;
>>>                     #address-cells = <3>;
>>>                   #size-cells = <2>;
>>>                   ranges;
>>> +                phys = <&pcie1_phy>;
>> nit: other socs (like hamoa) do it like this:
>>
>> pcie3_port0: pcie@0 {
>>     device_type = "pci";
>>     compatible = "pciclass,0604";
>>     reg = <0x0 0x0 0x0 0x0 0x0>;
>>     bus-range = <0x01 0xff>;
>>
>>     phys = <&pcie3_phy>;
>>
>>     #address-cells = <3>;
>>     #size-cells = <2>;
>>     ranges;
>> };
>
> Ack. Let me add the 'bus-range' property and move the 'phys' next to it.

Just checked the history, it is dropped due to default values. Given 
that, let me move the 'phys' before #address-cells property.

>
>> Konrad

