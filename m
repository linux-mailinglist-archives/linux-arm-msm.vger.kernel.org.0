Return-Path: <linux-arm-msm+bounces-116701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XzRAItN5S2pFSAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:48:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13C70EC22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:48:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zq9Pmryv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fPS5Cu0n;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116701-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116701-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89988338CE11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A3734D911;
	Mon,  6 Jul 2026 08:55:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092841D4CE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:54:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328104; cv=none; b=DjHjWnVyLvt7/AsE2mMQiB8wqnAkxqcdRaq2dNhHs1FumoHeHr9ikVkfixWM97kqOa49lEUA7MioVg0MhcIbp4et2f0mkHuzScDVBB2sisGc5eUhVtKNGh3jKauodPXH+GHz9EbELFPigvv6PbAPkM8CQ8BXURngH2SCE9HSiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328104; c=relaxed/simple;
	bh=iT7dINpJVOh2dnT9OZX5YmQdX24EQqrwcxdPeEZYf/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKREE0Hu86pOXZhjZXjyHxlkICFFzw1RZbqtlf/7n/yqusDUeZ1ZuNcagplrGHKnWt594uR3Rd28SlfyND7nG31Z+23mtgyRjgquXljucivq23tytE23sp9HCJlwo47h6zmYOK9ykp7vnhICOTH9Rlknu9WnWg9ZlH+05PRJ+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zq9Pmryv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPS5Cu0n; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TrX3470445
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ScZ9SElj0/0r3FTII32o7CTDaNscOGNeQ8hwS8N67g=; b=Zq9Pmryv1R2hTpuA
	7NP7TZzTXj+6ld1F+9YOLnEG8lojczZWd4/K1osX1iQRfHJUV7NNcIC3v6ptEOWk
	MkygyYGotLgjb0LK0wS0aM6V6WAjn9gCim53kSVn0e2mdAwHFdJMiwFkJrHu3mMP
	xXy+rPqynGI+J6dB3K1JdrpP+RkO2oJcL3kMfTlYGAmSyUytH4tsZw5VMCF5POrH
	I02VOE9I15CoXjQ7VwdA/I+MdFSGnPCA8Ag1mA+0Tdp5E3hqhH0SmSUo7XbvNt8k
	rMgtsSepDttnTstuSH03wonWasCoTKHgFm7LaWn5RtSenztxpb5mZ706G1S79SPm
	CuUWBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen8uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:54:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so4267116b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328096; x=1783932896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ScZ9SElj0/0r3FTII32o7CTDaNscOGNeQ8hwS8N67g=;
        b=fPS5Cu0nAYz8NTGLg8XUHg+pYVH+9kPnEH+tEjq3eob5wKJEtJLKzxVFRBWAPxROU8
         ysiE3Sg3iyJ9X9xw4OBtMkk/NKFQt6mP7qRJp1JBc+r8Y0ENSXVifqzBpojzsGklblBB
         1dt6+Ua3oLodLX0g0zJf4pn75lW6rzUJ13H2q/0o/41bdI/8YpYD3898ND2v8oJm0Ka8
         z99P01RzCert5lbNQjRPwabSo+y3vj4XUnb1A1HwftN7YlTxYSfA6ZII0zAzhatAU+iJ
         d8NqvCcO2ELBLi7t25RP89vRXzt2eDpbakHvgRuc6japdpqFwEjavnbQHg8BLQrKWRab
         7Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328096; x=1783932896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ScZ9SElj0/0r3FTII32o7CTDaNscOGNeQ8hwS8N67g=;
        b=s90BLgxcTcqWkzEhCXYeIUugkb3HD/B/jsaTeSY1U8j465Gns7hwfBpELxEG+f2sDJ
         SAuH7G+51uadKVHGUF85YecKcRsVOgAmgRPwttlgqEB+Lwf95etn4yc2fIypsN5Eawsf
         Pza4sUErmhDFsfBZJzNfpTVJR1yK/0LzONBgVhrQHMHPrSzYWL2RfZk/kePo5b7SivvI
         aE9Ouvql9j7ehIDh+g0ZyEWEHHzNF0IiiEU+wPULCE4WcIrIbSh8h44zwAyLB6E22fcC
         LP6vwSjjUilLDqfuyb4SAuBp8aimpnnVg+E3nfYfLI3bbQFQnUpiFUS4exogR+31uV4w
         xn8g==
X-Gm-Message-State: AOJu0YztDNktIBlsiZPMJ6+YEj/KuAsm+g1l36Fd0bGhUV5fsokt9U9o
	Fjc+yuMxGGFpk1/QX09Wn7McdPLv4o4PEl52GmeSY3797xL0ZHGMWEq5fWtWWm14M4VoqdKw92Q
	rZC0Butp9HgnGSeGkvnsazrKGYtZtyK0WVCuUEm8Lbv7B/aZhkBOQ0I42NASAkatwk81o
X-Gm-Gg: AfdE7ckWW5G/EDEF9SaI820hv2V336laxwHgzkrF+i1BcWBgPbgnkMIZJtZ4E1k1sx8
	DB+l5bIZN9H52/iNGFBKecEZvpfq5s9hMgimdnjubbqtmLhQiIq/5gff4Rod3w5S5U3O08F7HBM
	qC3PqNLa92wYUA0OjwFr6AdGvXXMbtqyuT6TK8eJV7RedwtolGPL5a91bF/+xyk6tOb3fBaOyEC
	zYe0tU3T8D+iqEXykeog51uQEpl/qFM3jPkNG9AEZZe34u+jJH1/ec28HpfZDHBbIEUJwIqNryT
	oYGTnr/S+lc8Pc8PczfRWPpeOj2Dt65s061ZVabEEGcTC/ixWn+RxgauiZuducd5IDUPhyocJBN
	jzPtmt4ZruIlmujftma/fzN30YIM0+QxSpPhvLXUu
X-Received: by 2002:a05:6a20:2d2c:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3c03e1f89d3mr9858812637.9.1783328094159;
        Mon, 06 Jul 2026 01:54:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d2c:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3c03e1f89d3mr9858785637.9.1783328093722;
        Mon, 06 Jul 2026 01:54:53 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm5490383a12.27.2026.07.06.01.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:54:53 -0700 (PDT)
Message-ID: <a57cdb37-eee8-492d-aa1b-6aa1b84e28e3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:24:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-4-56fcd1659ea4@oss.qualcomm.com>
 <67fa53b2-b412-40a5-8bf4-b47d370525d9@kernel.org>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <67fa53b2-b412-40a5-8bf4-b47d370525d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX6blbRh6uwGMl
 ObOuLpngMzbq8+J9a+LiAS1tBQSUlfDOiUCEKKLNN2582qqIBK4dL8IwBvVjHDnYmyuGl5xk0VT
 48yEvKOpi8uPB87c8Iqm6/NY9eoX5qc=
X-Proofpoint-GUID: aDtxV1qRGMQCwrveqztHM006Q8ml9gEg
X-Proofpoint-ORIG-GUID: aDtxV1qRGMQCwrveqztHM006Q8ml9gEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXwmZTmFmiroym
 whUWShrbBa3mCO3ufqzZTsmCsmbQzULGTc/gW/wVane+cRpEs46pL32cX61LX8QyfDNDZPt9aX9
 SLBXZ7uOc2gAgKoxhYYBi3tl1HFQ0GYZV1YCw5c+8Oj/jfg+CIzvNs3KjrYhZaVUsuG8F6xGyjg
 vqeer7EitK8qbJoBsgCWiVoM0+L21K3lmKpirhIJvkx1NYUq7rv2gnbpBZB4BtrhTBihbwluOps
 7R57UmCE9VrzoLglgVqByN7DUaEZRJdRFlYiqmgDSpm6tOQB+MtxStENME1P/4IED4UOi7dMal+
 dvsDJnK1ZiHI/4wDGnsDFwRA3RPliV/jbFifZGOrQe3y8WxAbdd9utAi+KJfOAMKCxcT7gbA2rW
 B3+bi0PZEmXTGKd3D9mfp+NutxxsUt9AzGg1HIUKg/T6MtxPa2jf4DlUUuc9ILPvdA9/RocPo2L
 0TrQiTKR1elmqRR2rlg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6d60 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=a4Ib5NwJqoKdfpgd-YcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116701-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E13C70EC22

Hi Krzysztof,

On 7/6/2026 12:04 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 08:04, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Qualcomm Shikra MDSS display subsystem on the Qualcomm Shikra
>> CQS EVK board and add the DLC0697 MIPI DSI display panel node.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 126 ++++++++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index 26ff8007a819..8c4a8bc01595 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,39 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	lcd_bias: regulator-lcd-bias {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "lcd_bias";
>> +		vin-supply = <&vph_pwr>;
>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&lcd_bias_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
> Same comments.
Ack
> Also, please organize your patchset correctly, so some other work is not
> in the middle of DTS. Splitting your DTS changes suggests dependency.

Ack, I will add the [PATCH v2 3/4] arm64: defconfig: Enable ILI7807S DSI 
panel driver

after both the dts patches.

Are you referring for the same or something else?

Thanks,

Arpit

> Best regards,
> Krzysztof

