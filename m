Return-Path: <linux-arm-msm+bounces-113411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BYDHI8tHMWoEgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:55:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E111F68FA90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:55:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hIPxV52G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RXk7J7oR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA79A30FF88A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D891367284;
	Tue, 16 Jun 2026 12:50:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785B3655F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:50:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614229; cv=none; b=rHQ7ObTY4+KabUakORV5inaaCIEkssIqjJwbsT8qCd2OX2frtC+yTMBLPCPD0YgtBbpfbGuKEYcNNIrFP9ybeB4hSun+zCr4d/axZ56n1ot6cMITduKUKi87/KS3RH1Rf/KmkWdh34OujYA0ToCxFMP2zGp0y9xMFvlwq2nzVJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614229; c=relaxed/simple;
	bh=XjqAcrVlKlv2jZrnb0KVc34zNT1cI5DK6UA8ZWDtYRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZxLb6HaqAhZN230znSwykjWugwlXqAxci7CZs49Hy/sQm0V2oRM+ww/FI5p3KiRfeoueJZI+VwqowT6vbHeeCCZY+jqa6CesWUrSNqSx6cpTjFgmiKRkBeeW5FAWr47r0LUXYWcV8FiqgkP3DVZDvnR5u4LvNZ190UHDmFJN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIPxV52G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXk7J7oR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1TC3256272
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uJD0ggfc48GnEtiXzgk2UThtEN5moTKbVfpjUgHoq0=; b=hIPxV52GYUpVpU1A
	XxasK5i9dJFQJTyYcd6Finpkm0iAuZaceiQj5VRDAIS+mgOQGHOlFoy9clysdBWQ
	iSpgHksO3JqMBTkmhEknsirkoQa5+tyglip0mqkWYSJnH1teg9JtFyDq488es0df
	ADOeNvmVve+CmKwqA6nqArls/ZgCHRLDbA9J/tMJCuOhbKnIO2zT4QFj/u7AKj7Q
	oI0nrX8hGpS1hwjqy9FZB//GBnVEwSG1FQjsOI4Mu8mi08LBaC3C4+k3Z27eOEOQ
	iqAfRaynY7Xv2y+QYetylp2w5Sm85V3e/dKEZL+cGrj9vXBVQPWDkWKHYGapxbD6
	3Sz6CQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9smk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:50:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915732517cdso16619485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781614226; x=1782219026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uJD0ggfc48GnEtiXzgk2UThtEN5moTKbVfpjUgHoq0=;
        b=RXk7J7oRneRsJgNXhvU/CdyMfFJwwZed99oYHm4zWVpg2uSorBFY+y6QgkJvnCaEaU
         8+nxVnFZUUUKMpGEMe3tTWIb7KssuaI01gaa5IxxbfiMfYLlvyUidWPkAlL+GTm10T4A
         iBeRzSnWcf1Pq1W2cPojRanTdEL/SdcUKGww11pFVyQFNv7vgByjS38VwZDhwelxQJu7
         JS5o3tc67z1MXe3JRcoo7qsGZ3CQAFh+l42SWERr/0diju8hAZZfIq9PS0s19AXvp8xX
         67rQA4KfJO+FIWf0o03B3K2RGHCs9KkGswaNKADqTWAC4mm4WZ10/IpggTHb6yW7kE52
         loDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614226; x=1782219026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uJD0ggfc48GnEtiXzgk2UThtEN5moTKbVfpjUgHoq0=;
        b=gjh0taz3YtYnJQ0Ggx1Maa7wQLymi14TNy6ChOzURnp8bSdnwpOTDOnkHYA8sz2p+n
         AId/HI7HcAye16yvGmbj7vMQ8x0AMUyB4TEg0/6NfqM01+PDkUYh+xJDSThhz+TMAHZ5
         PetTQWOgxSJb8FUIZedATn+60x2ocYwkPLC5FXyO2//jgAvBanyeKCh7WtzT6B97UQZB
         YyNCvSz+OaA9SdXWsKRiUp4ziImCSmRs9uOexFWYATWvwks9jrFbsfOCcgIPtwubu+qf
         5N63Lacnf75ccfA+fzXLmcH+nnqEnDtd/7Jtt18qQz/XQ/3bIuEYW51yZt6C43JYD0jT
         65Ig==
X-Gm-Message-State: AOJu0YwGS8wwIJvUqxAO5pqOfl5C4EavSaN6BQJw+2qh2xmaUCEG+DWG
	kTBBXTUxLmEibvTns3QeLbIbwLYQox2Xg6uGIG/B1l/3KxlVMmILqIW20J/QF3x1gBvl2mwwSxP
	IwjsT6BNfSaQOJnqWVh7dxrU7wshHWQhOYkL3wXnZzF09+4Hun4aw/QeidX5yPwJ4Gqgf
X-Gm-Gg: Acq92OGG5Ukr3fWPNYHweJKuauKegxjIDWE1/oGwrU0i5iVlCg5+bPhS/pY/gSsXg/T
	z/+qlXaavwi4puEnnhm6jJjvUwdI5icAZ+kZsPySvwB72oDjtUwbeeUKBIi10AP7eeUvoOhcgvL
	+51Dh3m5985oA2L3LxXiY7vkKpsyLHjWOk7+MJ7OXLk/05jAY3ECeadnjvavStDHGfHzqSoeg2q
	Pu32HHNkJVwuA8wEx0EZRD6gT0dVeS5cvJljpWuybsd291TntwAtfss8nd3MKCmjO/H9vxlJloW
	SFVglwVrxT3KpGAn74rQXwWRr0P9sT7vPI3ioQM/AkzltZFqTJVtLWaKtq45CT/id7FQC5aHGd1
	OCfgE1yoXlcXm+U0ATipR3m5/dNX2q9zSi0CxTPDLAz5eow==
X-Received: by 2002:a05:620a:8006:b0:916:10f6:765e with SMTP id af79cd13be357-9161bcf523emr1677821185a.6.1781614226426;
        Tue, 16 Jun 2026 05:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:916:10f6:765e with SMTP id af79cd13be357-9161bcf523emr1677817385a.6.1781614225873;
        Tue, 16 Jun 2026 05:50:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162222sm3544928e87.17.2026.06.16.05.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:50:24 -0700 (PDT)
Message-ID: <b75a19f4-eecb-43e5-9b2a-325264f79029@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:50:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8998-sony-yoshino: Drop extra
 bias-disable
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Luca Weiss <luca@lucaweiss.eu>,
        Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
 <20260610-topic-june26_dts_fixes-v1-1-2e0c953a6c08@oss.qualcomm.com>
 <2229ec5a-f89f-47e0-a489-9d127528e4e3@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2229ec5a-f89f-47e0-a489-9d127528e4e3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMCBTYWx0ZWRfX2b3hKIpvpAXc
 312tu48FmRmFiVEdRjw7pLV2WDPzxv2R5nzpcDEW2e4FP2jssPYvMBnAlMOr08MvayablLlBeJk
 WQP4cTbpz5vPuxkc+R0YujVvoWhx7YA=
X-Proofpoint-GUID: yxsABZgpUtx8NmCoiiXTpANyn151q934
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a314693 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o_LvGBUCVDmNgIntDowA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yxsABZgpUtx8NmCoiiXTpANyn151q934
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMCBTYWx0ZWRfX6k/Hkd9q7aCO
 AtEz43dm1boJVCztgzAzNCRSQ4lGQO/CRzRjwREZaIXT0XhORD7uLjRxL49TnUElRCD/u1AXwAm
 SsS6VGDhYxpt52Buks3iy7QVYmz5zKR6TCztDwSi4PiJj2CaUhJ/ZjbjXTaq2DZBwmxVMkUulvo
 UkgWNhGOeQmmgE5UgJEGOz20LJoaDFpLujz1hzIZMzlnHfGVrM7tY7mZ4HkD5+8wACsbnVVLY6S
 hoEI6zCZ4W2SInARJJqQBN0pdj3bjbdUDnkyHhMsfxROrlCusSqCPOYbfH7jfBsoGvi9Qej4SES
 FxL2AQVrEgyoyFwC5N1vgXLx0ZdV03hIglPOxOe/KnbpksYIMHaDJfeGncrtimZaj19g4jjChpq
 VWA2p33X3k2j8fg/Zbi9fNFk6x6YHCgz3hYgnwR8qhWgrHtrVh2kr20YsgcU1VeoffPmNE1Jq8N
 h+2J9ZsxvQPyZ3ZvMog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113411-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:luca@lucaweiss.eu,m:ultracoolguy@disroot.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E111F68FA90

On 6/10/26 2:00 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 13:43, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The msm8998-common i2c5 pin sleep state is defined with a pull-up. The
>> Sony Yoshino DTSI attempts to override that to bias-disable without
>> removing the existing bias-pull-up. Remove the override and use the
>> common definition to resolve a dt checker warning.
> 
> Maybe the bias-pull-up should be simply removed? At least you should
> document here why you chosen that way to fix the warning.

Seems that way. Unfortunately it was yours truly who set it up that way
back in 2021.. but I don't see a reason for the pull-up to be there when
the I2C controller is disabled. Maa-a-aybe for some obscure wake up
notifications but that's beyond me.

msm-4.4 sets bias-disabled for all sleep states for all i2c controllers
and e.g. msm8998-xiaomi-sagit overrides that back.

I think the right thing to do would be to set bias-disabled by default
and that's what I'm gonna do for v2

Konrad

