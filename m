Return-Path: <linux-arm-msm+bounces-116626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PlCxJ6s7S2ruNwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:22:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD870C8F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:22:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NyuSX+PT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MG+2H0Ff;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116626-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116626-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83DEA3011C4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633E13B2D0F;
	Mon,  6 Jul 2026 05:22:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174F3812F2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 05:22:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315357; cv=none; b=kBCFp7wumoRO5/Ld3eCwxaU8fRwO0UB9uDbU6LsKdBd0X0GZSFJbw5PSt9/HjK6qCzVxp17IBkHrgeBgPlgPqRRajQ7aBBiZ8HOwWWBVfnfjrDU3x8FV8eTGIJcmdpBlU0SBBLDNmaAJsgszoEJBjqww3jbm8YF/FQigdB9v8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315357; c=relaxed/simple;
	bh=fgHrxfJ4suBUW0kN+8kLcEywmhNEd+44JP4hCrz3Cs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKV3Z62kTxzVsDrm+A13vMYD2TXC8eqK4L/s4mKgbW2lMKWxbE93rVx3M2XsHugo/HJ9arRBW4uB4yNYpfJfehze+HXquXjJrwp+NS+BU4yDGYpjvXnzZbrCLN7Ku0nJ5q1/fKkYafzWXwIJDNyJT7o2MqanuDw+ApRxf2AeM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyuSX+PT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG+2H0Ff; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cbo3617506
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 05:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4/rkxRtX0uFMh6gYc/GZ4w+bhzIdW/NE6ERvdxmeV8=; b=NyuSX+PT5xfcw3hE
	vY1joPs1yagJOjhbrj2c1kivpQ/Q4Zs4kDfZYZRLxim8JElKPUSBZEDZFvaTTYTR
	6sjrHJXg1jI1KweZPaoJRA554xcXicrOXPDhpk4nDSvZbN350b2rG4Cvhay4x5SW
	2smmY2eFF0ho6W4l/n6iUXApA/4J0XmeYHT4nYXUK33mordC7Av1O6plbRnxuaa7
	4q9U+u1BvrRJrYPlG2IMzza18hKO8XZ3iMrkDaycMsyzSPq6p/K2lvAfH3VrSMk0
	o8LKmxyZpgZsfnjB74tEwX5CIxfgwF0zu7GAO31c4d0ZZqn4uvSSoftM1V9ZM4Ts
	FedYvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64mkd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:22:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2062828a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 22:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315354; x=1783920154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4/rkxRtX0uFMh6gYc/GZ4w+bhzIdW/NE6ERvdxmeV8=;
        b=MG+2H0FfUC3ULHBmq9AsRjOq79WaLvS+0MM/svHl1r1j6MTJvWnQrJFE1tF1IVcbsO
         Q/1/8Vdfw3KRv61lRnbs9sjusHgFGBV3FGN0jVDoqdtCkjEypqSwxmSbOeD6Pn41yAv3
         xczNxWPhSYMcMFZZfWbcbedI06Ppw0BblGkUGlqAxu7uMP6gbeqhA45nuCmLvko04wJw
         yhZBcOfcExZLomxG+DZGAjhgWNHF2D38EQDsHWegSLnpJQzFPitibBNFFtqseRv5aifl
         6EKF85zumFLb4z6WBG8Dm/X5LPqhFTWB+d+85labsQ0sOFQjT53peOwqILqij6AMw6BS
         TuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315354; x=1783920154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4/rkxRtX0uFMh6gYc/GZ4w+bhzIdW/NE6ERvdxmeV8=;
        b=D0SPS6sFayhAr8JRjAwmFWlJC1CpweLwiciahcJRJM5HjG/tNwnwsForIxidr7m5Ey
         OtN21yZQ7NUdXXKUsnysI5QJLH6tAKC8qnKM7j+YWtDL7otxiEqrVbITIULkTnqKG/j6
         7szagzNvVM9cxifDSZJbZj7/JLr0IwZYzs5PlhdJ9Fd9Bv5CSmDloV0Ow0aE0rp4norN
         BAzYk0DY7Xi7wT3BORKQZGjOUzz4ceuhH2hOALDUzYWDFZxLX5dbFOymI5Ls5fE27yB6
         PaRO+7/4SF+azz81xcVPTqARLKpFz5fdVJenkpoP9MPclvtgKGdqM3H1/iatw7uLxxMt
         G/3A==
X-Gm-Message-State: AOJu0YwDd9sRXtI4etiDWIlXrv/0pc2ptEyCG50boBuO5YqdpxwXQtlt
	FgCBTAsdrq6H1qzD4LCd7yhArpJAs8mxUYbo+S1yQYAzYBhklMlKyhje+ZZH6xfR7Ruez8ndco2
	b1MMNqyDe5ickbm3Jbnf51iLoGPc2ADQVY+dzGn0dGRu1abpIwisxGDaan4phb0VQiNYD
X-Gm-Gg: AfdE7ckWgW6b6g4+qlJ58/CVKrRanmMDWz/oGWo2T89qt7UnCbPG1lf6tYWj92Jo7Rg
	6TZmUC6yPHke27ZfokhZk/PmyXlpENVFq8pd4jKPMAuey8tahkjb35OwpLpE2efWSmOzmzRrpFZ
	owFzz3Lj17yrS4K9yZf4BsL+VOXQvkz963PSLbeocD9qQHEiZYTCHShW/iJTz+2Sgrmv6Xb+h1M
	gErFsPz0F3HckvqhfJbw7eGQPEKEyRsk9aTinXtQYNXR93FM/rGv+V06PBfcB5rupCPRqln/rGE
	5clyyJgy+wdMeBxY7r0j0AiDM01h77BP9y7bmYmfPuX0l1mqMotxVDXGviHCOPJYceCsvWKPw0l
	Q3FjQSkWP1B7MZ0DiXt/Srw1hRPr5QHWvYUrp6l8MuWM=
X-Received: by 2002:a17:90b:180e:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-382933033fcmr8550250a91.22.1783315353944;
        Sun, 05 Jul 2026 22:22:33 -0700 (PDT)
X-Received: by 2002:a17:90b:180e:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-382933033fcmr8550213a91.22.1783315353496;
        Sun, 05 Jul 2026 22:22:33 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127d147a8sm4232021a91.17.2026.07.05.22.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:22:33 -0700 (PDT)
Message-ID: <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:52:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MCBTYWx0ZWRfX2IvBJXBC6eWu
 MKw3OoCGh00GFD3ZV5yVBsSrNtbip6i7/MQxo00AWSfE3B0yhAfN3c0LDj896mZgEPbDxq44hdw
 +JU13/ypZ+XE5BKEiN7E05qD+V5UJCMkpD77ITzw5DXWyhLhOlHQDLTB38IiNVPMlWkDvbzNaGH
 hAjUL+hHw73hb0z0d6d5CJI8T9JTAH3tKbg7ixrFVAobgbb9ivVpDkutbnndnrdkmZmqRYyhzCh
 7MH44ma833soospBBZzdgpsh3Rn2EEfpQyK5f89/oYzEb1BJPBfdbGksD6FegvlykxaZ4US/5K0
 JeB0iQBzSuf2QUuPPxBHCP/zk5HN9WNwk5xPv20zEm+iuYa5tCkgvF9XQznoE2q/X3MMYQpma28
 qEitwFG7tXNCLHbIuZOyPs5FG9Ytd+8IMUymytn5ZnPSbuxneRoc5swLTWsWxfiRaXSWUTMDRte
 OpZZ5dYllZwxIdsCHLQ==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b3b9a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XhGPO_9aslPW_XT5sbUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uksYkMCr6g_nwPqx6Awf7baad-tiGWtU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MCBTYWx0ZWRfX6qRV6LJe41/U
 9qoh4NXkPfeXwoqq4Lkw3kTR+X8/sqs3tu0JRAYRGvI2YjYoH5PPK9/zkEB6H8qo7nZSXIQqT19
 s7K9EQsy5Gv8TKzlAFPGRJ4H0xkYVHM=
X-Proofpoint-GUID: uksYkMCr6g_nwPqx6Awf7baad-tiGWtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116626-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CDD870C8F8



On 7/3/2026 8:39 PM, Konrad Dybcio wrote:
> On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>
>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>
>> Override the base iommu-map with the expanded set covering all the
>> switch's downstream ports (0x1400-0x1408 SID range).
>>
>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>> from the PCIe controller.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>> +&pcie1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie1_default_state>;
> flipped order
>
> [...]
>
>> +&pcie1port0 {
> This port should also get the compatible
for pcie1 it is not required, only for m.2 connector we need the compatible.

- Krishna Chaitanya.
> Konrad


