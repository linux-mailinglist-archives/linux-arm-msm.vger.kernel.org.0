Return-Path: <linux-arm-msm+bounces-114324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oa0FAeG4O2p1bwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30F6BD87D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:00:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ojvBR0YY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NNFAYYnr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114324-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114324-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE849303C61C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8D328E0F;
	Wed, 24 Jun 2026 11:00:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7F1FDE31
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:00:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298833; cv=none; b=ThShGDNw42JgMCd502bEzx5YNmLZrZ2Y7KBRvmlNSsC0JdIDjEYc6HWl+TCkr1/aZYAviOAYwQ6aJPjKVE4R/1LD+GUkWf3reUAJ3SpssKJBOiVFVod+JBnyAJB6jh27MJG6s3aWXTAq3GTc+i1TetREwUWyD+C0eTugrxfS/Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298833; c=relaxed/simple;
	bh=uPbUn6actKKkvsdui2PhPU5T7wXetEBaeMWfS73GncM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qn3cy3YPW1bGVw6Ep0syC1jFbFO+PMHoqWJfWt73h5bmD1NlxnLEBqGgkQbls2c58F7VXxENuICZoQq4JuBFkEieBoAe2pc8kD+HUHoJEshvrorTKpk1af8UaFJ/uLC9GgnGXZG4zWTujPWBcAo95vc1AzJybiB18UBMpsjkUGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojvBR0YY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNFAYYnr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANkir1148454
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uc5Cj3yh7udwhNMcfVCvV98vfUFOng4oy8Pby1IpcrI=; b=ojvBR0YYRIqoisgZ
	LolSuv3sxSulWt0/PlHffbvHZNPMOvzl6uaQvSENxe2gKHIknb0uRsPzqvTktD3F
	Md/8KexnuF8wcacC4NJxsELoZOvL93xExCYB8kzKxlfVFskj97feDBemUxUMkKG8
	bpANkRKvRtMx6JQygc4X0wy2DAMDxV2BBpluW2BZSSdykIa+zcl/c6QAdyvB3vFh
	xiYAgg83WnQsKtvS6dtRRrRd1efrkgjiKCRoZXQPKNqu1xzSdb91KbfJs1aXGx6L
	6GS/cOfoB27X5rK2N6bEC3rZZdLm1eI4AfbLr9H51NxaCDx+3Z+7zSCC4nxE0LW+
	R6pjCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r31qr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:00:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a15cef334so1252641cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782298830; x=1782903630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uc5Cj3yh7udwhNMcfVCvV98vfUFOng4oy8Pby1IpcrI=;
        b=NNFAYYnrQm62P3H4RlEpAHJXlBGE704xS9IzxvdXAjkMMyUTETNV86tnMCHJD3PpyP
         l1LsJMfMPVqzBhAoaaeUdameK14D7fIuL+KFXSoCHkOzdmPx9y6tLLsUVhah96dMPsjt
         cWrXOX0IS2EdvslDnCqgCW3P/OLoKzUkebXGg3pWMc+nUmEFJQtizqr/v4dAsIgyM5dB
         0he5uVfdWVX9lyNuoNq9Rz5spOr2MygCYa2W+5w+IfLfhQSaWt9uxszfREQa5SDhRT4u
         uEi2u6i2JcBHjb+eOAyvIdd2MZTRR56ysfvbu8euej7Turz/8egMm+eQymrb5514odT8
         5rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782298830; x=1782903630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc5Cj3yh7udwhNMcfVCvV98vfUFOng4oy8Pby1IpcrI=;
        b=sZxFXvYsuhOrLNZAQsTpXvavFuKR3Y8nFqCGHdINyx7Kjmc//lZaxx/T6vyaN1OGrU
         1kjru21+HbjTEx7WbAGYawuAteU2CWfEAGI6zeaDQ8wzgtvhFff5gbVAq5Z42r6A34D8
         suF5HeZIxDqDgYeY//yE5U1lRzNI+/44LLhEYXn191sFEhGXGkPARySuXOunHTS829dR
         M4XSkt5y7zV/uaUnhZ8HAc8V717T4aDGvV4d8LYnzkGbfTvCbvl5xEDNeoPg4g0Lrdh7
         vKb8FKb3y/8SegpWOwe5Rm9HRn41OH1BgilgEsrFcQfhYUCYyAXAk9ly57nM5/ntd5tZ
         KA2w==
X-Forwarded-Encrypted: i=1; AFNElJ+r1t8aXOlAUmCPStyZaOPMlJmetDMXpEsYKimaxpXeCzWeqmS3/3/HPunK/XqnicFb7ctW132NoCts4uQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YyzbDgudJU7E1oEjseb8COz+hTTPRID0WWXpbBE9JmYNAvxeFMX
	XdwanGL1XQgglOAJEOwOT3HDLyq4TnvRKdfC/ucO2HuN9/BPLU06wfC9zwOKp5gKXTzQaZhUGoE
	xAM1iTRDHM0gGu/VTtIKowbCoW4rycgUhWYXz1MhuH5KS7hpwHlKN84XswQRPFHruMBc5c6s7xl
	lJ
X-Gm-Gg: AfdE7clEo9L9TXrcnDlQgRx/FAsLduVwThFeKqWowP+TKy2lmJT+KG6Te4K1N2ik8mn
	lJdPAMgDIcuub8YNYEtRUYTRyh6uDHpJs0htyHn7+xBFYUcL5VvAPg1LydJHyomY7glowzCVTeT
	PVowQLXNu0L23LXGMdDSh5Tkl46doFDamRdxnhiOyDUwRhTvaNRmZ88OSw63939bgRpbG2XRpqh
	J8ieP8IAosWf3qiORrlzyOUSpVjUxoxvqoUgMrPzIfN5vwdZ2Ukmatrs+nieLs5WO3Mgbd7HYJ+
	H2EdTnNkP3m5yV32k7Ltrsgr3+rZTgiivp+8cT0jqlssdd1gYcsg1WvZH3wfMrcNYjzPC9tzZMB
	4CSVstveQ8prWbJSt/pBhfaJqAVj6Dx7Bg70=
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr916085685a.6.1782298829918;
        Wed, 24 Jun 2026 04:00:29 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr916074085a.6.1782298828928;
        Wed, 24 Jun 2026 04:00:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f73sm1620615e87.63.2026.06.24.04.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:00:27 -0700 (PDT)
Message-ID: <891015c8-68df-4654-b1e7-94d73e74267c@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f18194c2-01eb-43c0-8e40-5575deac9e84@oss.qualcomm.com>
 <tencent_A1865527015C7AD1B52C56A46AD106234508@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A1865527015C7AD1B52C56A46AD106234508@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5MSBTYWx0ZWRfX+dcC+FldHG9h
 uyl9pA8foUF8w3dLc2Z/G4UGjTGDy4q+7H7J8lQg0eILG55BKsGzfbbrGprXnAHVhiORz4kNt1y
 qhAa0JA0XaKp1Tqp4rjoHS2FcRwHiITuf8maQNZZOlHs7+jZT2xcaoKrRepUMjdeNV3W/VYkhW/
 zU6BESroXRVBKXwlVbuFXHHQ1+tI05Y1te5iwYrrcmQIjHDKDGRcuvMIf1UBPx/Z5ug0pvlo2dH
 ytwn7uYxMYco9SAWo8EaIPC0PGH0SaHqaj3uWpH0ZvJ1YK0R+hSy+X3bRV9BEnwPQGyLZJXjVyx
 sXhaOgoYyIKSmhliWovNHTa6wEUKik1RpLuqIX97WpHDD9xTGy+4Zc01LIfG2W55SccomD5uCXB
 ATXtApTLLAUMeZQlYPEvi8ptlO02DySZx5t0UFnrNPQsUrhacQ/vY7uSjkSVXcPCbbF17FI6i0q
 M+iCgtsgXVajT7Kxtig==
X-Proofpoint-ORIG-GUID: 4r0qTog3W_3m9m0fmk8_zPSHkJ9raalH
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3bb8cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=dZbOZ2KzAAAA:8 a=i_-uY6NMUGNg07SqJiEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 4r0qTog3W_3m9m0fmk8_zPSHkJ9raalH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5MSBTYWx0ZWRfXxyG5CrfPYgNX
 hHS+ecckKhVGy+pOXxEbZ1uzU7GLErPn+DO5x3lF6WedDgpxWfC+p6SkV7KisFkQcN3jyLKbMPu
 0gevx51vTkxSyD/BdkvhnkmmOYjsqIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114324-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B30F6BD87D

On 6/22/26 8:07 PM, Xin Xu wrote:
> On Mon, 2026-06-22 at 13:40 +0200, Konrad Dybcio wrote:
>> On 6/19/26 6:07 PM, Xin Xu wrote:
>>> Add the pm8008 PMIC node on i2c15 with seven LDOs,
>>> using GPIO84 as interrupt and GPIO76 as reset.
>>>
>>> Signed-off-by: Xin Xu <xxsemail@qq.com>
>>> ---

[...]

>>> +	pm8008_default: pm8008-default-state {
>>> +		int-pins {
>>> +			pins = "gpio84";
>>> +			function = "gpio";
>>> +			bias-disable;
>>> +			drive-strength = <2>;
>>> +			input-enable;
>>> +		};
>>> +
>>> +		reset-pins {
>>> +			pins = "gpio76";
>>> +			function = "gpio";
>>> +			bias-pull-up;
>>> +			drive-strength = <2>;
>>> +			output-high;
>>
>> Drop output-high, the driver will take care of setting the output
>> state
>>
>> Konrad
> 
> Thank you for your review!
> 
> I will fix the coding style issues (blank line before status,
> interrupts-extended, property order, and dropping output-high)
> in the next version.
> 
> I have verified all LDO voltages against the downstream device tree:
> https://github.com/MiCode/kernel_devicetree/tree/elish-r-oss/
> The definitions can be found around lines 209–244 in
> qcom/elish-sm8250-camera-board.dtsi

Thanks. It's best if you grab the DTB from a running device (which
has all the overlays applied etc.), which you can grab from
/sys/firmware/fdt

You can then pass that to DTC directly

Konrad

