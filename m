Return-Path: <linux-arm-msm+bounces-114191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UsarFEZxOmqG9AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:43:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A526B6D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:43:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZhD3AiLq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gKzC7ufs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13DF13066C71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E596022E3F0;
	Tue, 23 Jun 2026 11:42:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B05379C23
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:42:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214930; cv=none; b=o0naMQNbnVgqL1DTcNn/RC+nTSbQSyApa0+TYp2TdBiJ6wv2rBJXOvN4YjLVGkLXbkcE+nYmOv9+uEwBrcNa98oqyff5Yi+wB2mAfSElluz8t9ZDMUKgkacBMXmdDvyxS7AOKCTlFXlmHcF/lOED06Bx/EnEFS7QwRgf1iIeKC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214930; c=relaxed/simple;
	bh=QAG15DDUb74k6M2l7iVsr//S3EiTDofYdPkIxWz6ULY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=puZ1fuv83WsE+724yECWDH1ixBeSX6lSc4Qh3/vysPPaX9lCkTj5b9fiw05mZ0SqMV+BY8A/BFDT2/6o7vPRN+lg+UWdrxge89qvTsX8OiyVDiGWTDqTiJE+jkVOLJGxFPfZkfFROmm4gq/Uf/pxs3vyWK8NoTlulueu4/YS3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhD3AiLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKzC7ufs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZaYY134214
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlOY27h74B9C0OQgS9UR6AmQvHUAxUl69cLfO8t03XQ=; b=ZhD3AiLqbzO6YbxF
	l6JStl/bhIhj0RVzchSJ+KLQRxM6igUwFLuGIvi/gMqdTxL5CdaL3fTP8LzXmE6j
	5acgPlPIAx+khbCoSgHfT1NCPUTDR2vDIqQHyq9ediqpAokIBH2/qC7CXpt8LCMa
	VSQqo+ujvF9yMP7t8YaPfHWstJIlzOIMDjJwUBc9LYBUsQGZjhR6D6EfVfd/UjZD
	7uvog3sHuHwQ1mq6GzqpaFHK3c+eSRNa4c1DnTB46KSRJM2qFvmb0hX5Fmh4Igz6
	m6pSBS/2FZUvBm/0dQnfaCy27i7jRLOBYtgosXmdX0wmOTg4fTk1eJcdq0vTJED1
	GpcotQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320be0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:42:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-921ed86ddeaso623117885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214926; x=1782819726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlOY27h74B9C0OQgS9UR6AmQvHUAxUl69cLfO8t03XQ=;
        b=gKzC7ufsnk57Lgovzg97MISElvyUqzRP46E/TYRECrKianC0gRjFObyBsO2Mz1D9KF
         JA0bYC4CxcSaspPW6AS1pu/4FzNakG7V3XLVglDXiPPSnYtAUkRWranB+RFH0NG4OzFN
         nS9WWvMRksm6Qp1IRamZnlb9FSlgXyF8XpXnRwiwMyP/4vATu9p3vkqn8wkNANVvBKrA
         fgJIHOMdAdNQbbd+gWz/64FEof3goZ4go2NwU6JsWb2LGajpispfwtcBC7OlbwmI9C/1
         o9Zh1nkOSNtcb7l9YcF/gVjFU/XnBBJFeQMaB70PrNU1om6/4/F34vAShjaCtEplr/sz
         DIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214926; x=1782819726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlOY27h74B9C0OQgS9UR6AmQvHUAxUl69cLfO8t03XQ=;
        b=tRLBBffsFM3eCbUr10zPFGgpfktlVvHFQQUz/wT8vq/F8TTF57zYVa7GjV0mD8x+ON
         bfsxLYBUHUiY38cjjPCrr75+AXEl0yRekpD4kVZPC2Mi94+TZ66FzWQlEK+0vNLSklRx
         6SJ0w6UuklzVFZ3j2Fr3sDzKAtA+o0QS/A5FXeU2cAak3ZGXpcH9ZkK+gaO6X+GKjYuS
         yVTGMIezdnt25D4kfG4lHEuBJD9YOevl3Eqw1oYWff4PEypDikt3BIHSDiboNnxod64L
         Ggxv45SrsQNOvugxUdl8nC7COm6MMKaP4p3AnNA5PfVoqmQ7RuuelzSDhjOyIguXLSU3
         q1/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IVXAKSfaVh80WqZrEgJrAqbTVR1FCEWSlQH8PlK9Fv7ol1c19dQuwH5F7dP35Qq0SUiUQsJiIkL5dDkzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YznDbKGQYgHEiTvuQDhTLPa9+BQsBXdHYmUZ3am9lU0UseIESxQ
	eYnH8rHF437UcDjDJHvUkKk0IVjVNCiZM3IlDKeevg4s37kIDSPLpawg8yo2BixuEoSj5yUkl37
	tO+EA0PEz0JbHJhaHeoAe79oP448BJPLFgGF4qKMWu5upp6dNBUDqNiIBYYslifHCrCjY
X-Gm-Gg: AfdE7cnJF3bKgRH7ld0DhMtd88p+OXSgxHW4Lzy9s/644AlpfSHscdlQ5qsbv+vZHmp
	6mVyPD1QjoMI8yXAj3CIpeeIpr+XBm7nDdeN+30Vkf8DTezLUmDdAeRGdwRn8tkSvcDzl4dEhYA
	dOu/YIoco6QmiCDxiugW2F70h6b2k6O+WatvkIhUij1lnEr8BwzKMe1G595lW689vQd9acCclGL
	/kSgpsgUFpAi/f0VfokYrfHmMSnyt+rKmR0abgfNDYAmDmZwHqQRgSEeg5Z27iMo4zvqSE8weee
	sSsqGoz3rTqSw3Q5LzyQkrr24TpVytiy/iJQmxHgIiD0Awbq2U33iB5gKXjj9se2/bILmdQmpJV
	aTPsMMHtcR6wdovQl8tcPuJ4R98iyguGA2iXtVXZG
X-Received: by 2002:a05:620a:468a:b0:91c:ac0a:690b with SMTP id af79cd13be357-9208fa25179mr2976645385a.17.1782214925728;
        Tue, 23 Jun 2026 04:42:05 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:91c:ac0a:690b with SMTP id af79cd13be357-9208fa25179mr2976639885a.17.1782214925195;
        Tue, 23 Jun 2026 04:42:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788282sm51702639f8f.17.2026.06.23.04.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:42:04 -0700 (PDT)
Message-ID: <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:42:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
 <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a710e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mu5b_UQrn1g3QmYy6j0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX3GfFIAQESmPd
 w70NFFxw3wejKhWdbZWZGef/rrbvbOZ1MnsGnDKtqVJZ8AYnL9AkxAIxep6YuV1ORR+ylYy114j
 GzlBpJVCEPcJK+E2WzeO2dhg9RNhtwFef6XVCkYLpwitrPCQjzU5ompkpYmzav82scl3QN9j4f4
 zV/q2JTbWx/6PwYitgyIkj6iq8RVc3KkVqCk55KMfcZpDvqbEa1ZfcYgGJDEP9LLZCRPYSX/Yly
 jMbnt36MCWLY+8Y0m4KOsnE06pwBxDM3xsRPKqmDu+Z2I2NbP51YJ3uor4uuCXaP//cGNRReRlz
 ApnoBURwV277h+oLviQIR63DnsxnODZNl+tyFq8LRVx3/ABWwLxcaavv0Bl58qR0MRhjOOkJ1GF
 lD5lCmshNwmb1Hb7UCV1tzpVmOIvHg==
X-Proofpoint-GUID: seA-nfqbrHNNpW4Y-6jgMzN-ucwsH95Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX+qwX/MIwjyON
 ft8mtxwxvQEnVxGnq/ovzqxlKwZzl03JxReMN53+REKOvPU0HQm1nqKU9w6cAZ3CRpjnYjVPMGS
 2+9ng9qfo6p/m2Jy6f0f0he5E4ddusE=
X-Proofpoint-ORIG-GUID: seA-nfqbrHNNpW4Y-6jgMzN-ucwsH95Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4A526B6D01

On 23/06/2026 13:38, Konrad Dybcio wrote:
> On 6/23/26 1:31 PM, Krzysztof Kozlowski wrote:
>> On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
>>> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
>>> Display Clock Controller is enabled and references parent clocks from
>>> DSI PHYs.  Devices which in base DTSI do not have all required resources
>>> available (e.g. because they are simply disabled), should not be enabled
>>> in the first place.
>>>
>>> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
>>> and warning on Eliza EVK:
>>>
>>>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>>>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>>>   ...
>>>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>>>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>>>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>>>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>>>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>>>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>>>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>>>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>>>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>>>     platform_probe (drivers/base/platform.c:1432)
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>>>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>>>  2 files changed, 5 insertions(+)
>>
>>
>> I should call it RFC, because this feels like a band-aid and should be
>> fixed in clock drivers maybe. Eventually DISPCC should be enabled on
>> Eliza EVK for HDMI, but DSI PHY will stay disabled.
> 
> I'd say all of that hardware should be kept enabled, if only to
> make sure that it's parked safely
> 

You mean enable DSI PHY, even though there is nothing attached?

My warning probably can be fixed same way as:
https://lore.kernel.org/all/20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me/


Best regards,
Krzysztof

