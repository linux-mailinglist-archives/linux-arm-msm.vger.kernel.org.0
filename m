Return-Path: <linux-arm-msm+bounces-113400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CUqFCS89MWpgewUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FFD68F243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GZ9J2lz0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZfBSj1I3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113400-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113400-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D709A3042704
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5131943C05C;
	Tue, 16 Jun 2026 12:04:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCC43C055
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:04:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611473; cv=none; b=Oe8TBZgesgR7ut2Q6TwoP9112e6OXUSYTBabcvp4zWob3matnkVTUxu4ZSim0HLTQ1lKAt0xlrWrdozktHwe0xjt1x3tseZ2db3/LMeyDTY0qLmuSHooB9ftZkwZ5rroB/Q9DBKKsdYuRmnEDtDk4HWp7OVMZw3b66f+WF+VXHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611473; c=relaxed/simple;
	bh=DDkm5XCp9QcGdO7E6yJwdMFO/sI704vzAoq+VFSQUSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7dIhWxpx/7oCDtT67UsvBC+r2lvDKxhIzz6xEhbvErxTp5FO1aRv6ot19WWHFBgBIJ2rUUKIjFfQNWNwjg6DHp4g6t+Fjh/P7nxmjoHL0EcHfk8XgHRQxQwHHV1zE5D1SmksWX2HlrUBaVwt0GMa2+zIS6rmmxLttDSWtEbhL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZ9J2lz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfBSj1I3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACSn23474685
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LO7ewEKrdNJ1MfAiKPupz6CUcmlGWMVqGMR+gHzOGpE=; b=GZ9J2lz0AwR4+li0
	t+Pw4YL0gpu09jzCVWmeLPOw60m1z0A18KZ31+6oSJxOEFA2/5H+8kdImzYjbODk
	osaD8pVS6+h7Y/H+gANAKuviF1TsUcRUdWR0uCJ6sS9sHan2V9svjcCsMC468JBT
	cHkXklLs2i1tu3SYCIakIWqLl04DGjAUhj3EVy1/3GOIr+XO+L6dvAqEfVukAB5+
	L80125UiNI0H+8dOaiyPn/ErhVIXjIKz/bH7JBsr3VJ4rmgqWxOGXjQW/gyhCXA6
	1l0ssQErRjlGVQOUsqFlQTGAKGP5VO2MZhmKWOwcabzgO6nVRINjoP6UItScJJxH
	nu3rKA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52swcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:04:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c59b44054cso173965137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611469; x=1782216269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO7ewEKrdNJ1MfAiKPupz6CUcmlGWMVqGMR+gHzOGpE=;
        b=ZfBSj1I33nxAb/qhWHFG/wLrDFA7m83kjKKO+6/t5CIuZnBbqW3MTUPzxz0az4TveL
         OFaOgpvZcADjtX1UBH91BMgw4hHCB6XYtM433Wm2kCTwOQd+i/UiVX8V9489Xdih5aaM
         dbS9aBZ03v4MCqMbUzAgrqlYAV4HmEDbqYPc9N+ikdMWq3qxzulWtRDYRCkHM4lOFEi0
         cb/oZ/PhvHF76lueyuAm54y8TQxwg+qd3S1ivv1GmWQF9b+bOFYylQvKOr0qTohPELjy
         Gh253DBetumGcGYG6oJkHic8INwhNaCQQwiP2S/Db8wtTi2xyx+5dBiojUqar1ZLFcM+
         ZEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611469; x=1782216269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO7ewEKrdNJ1MfAiKPupz6CUcmlGWMVqGMR+gHzOGpE=;
        b=nD93S1xkxlvBVrls0vtzQshMUcQU5nwCsadzhXxN+dz3XjvQ6xCpfWQQeEnQJ7rZUo
         8x01fcBWRjrdOkJxKC8KeujweP8uGw3N+Tswx7NZKcyiER9hSLjOsTlcXZXxVWNmRjUt
         dMTRhpV4mpEbd0Pp9TnSIzqUUHQU/hTwJ1mGiN47ym3gedDhvdShNJXD1rm/EYRfjQrO
         AMZ1isF6jqXmg8Rd51+9AUphjgotGK+Lz2LoF77NnLEw3gVfzyABdDiEgyizhmv2XH1r
         0pF4LxrGqnBMSSLSdzwTNFLjjwZNO30xJ+ojTK8fvxLpi+eli0+ALcFYn8B27ifsdYfN
         CnLA==
X-Gm-Message-State: AOJu0YycglEnsphxXOM8cjA33wycDzHGJVSxLCnlxXxdNjfFIm6wc04A
	IRmq3eOQSK6IW55n2siRLXWDlCvbD1wk0Q/j3bKNtv/IqljewGmERxMQz6xcgAmHixvh4DR3veK
	WGSjHbpr3g0+wHTBWDzMYT2nEle3O46tI2vBIgTKaLWovrsu7FCL7SKhtrGx5722spbuC7boWvG
	jK
X-Gm-Gg: Acq92OFghswAdUujxig+hSq589wW5n5ZaoT5/H8GqNetb6mW+RIgr4xkz6Nexx03+Qx
	p5MbOneQvafAijMOC8sUr2KcDRcgVob4yJ/IufLNV5j6RB/qfxXUUltTa97LSLuisHPIvGL+JaZ
	Qpi+4fHGxnAWooCIcdogUfKwWB7vdWfAY5kaqbF6aqCd7kjGl2RW833ttlZl9OS58oXOgHjqlv/
	CLy194ZdrJZEqe7DHOT5zNjZ7H8qJ4AdGmJTjzLAwzpLQ06pZkNKRCZmd1FO6OxPqoIlFaqqDVg
	PjlbPw/6LNey0OKDLdxscmqN5r/axD3JVHyk5ABkA3XCtUUURA79dnKRrbNjh2K4m+iuLeTBiZT
	kGkJOQsXAHIiWv3i5sG6H2Ht/LB93+LUSUASREOAXIMMulQ==
X-Received: by 2002:a05:6102:c8c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-71e88c6e864mr3803210137.3.1781611469379;
        Tue, 16 Jun 2026 05:04:29 -0700 (PDT)
X-Received: by 2002:a05:6102:c8c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-71e88c6e864mr3803159137.3.1781611468752;
        Tue, 16 Jun 2026 05:04:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb51007a9sm626094566b.21.2026.06.16.05.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:04:28 -0700 (PDT)
Message-ID: <e7461734-9ad6-4d63-9ee4-106a635e6b58@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:04:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
 <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMyBTYWx0ZWRfX3zUO2duu5ayn
 oOHKlRgIrtRxG1s3YLuNxnfedCs7I7XtIXVOe9u8jplnLOQ1i87dBt9z83/BL1oe6YO0FtdAtbh
 OGgW3um9v0AEwCSb+GsAWrII88duDjY=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a313bce cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ERXISu5ESIjULu5SvvoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMyBTYWx0ZWRfXxgT8BhT/Cns5
 PBDM27zKpb2YeHw7+2wWlhK1dwZdJEd5l47rRjHZJEZY+Go0vkYH0xCDNufjwujy0yMsHeCylgl
 eDDs6wgBYRahnfvIs8Cmy7CLcsvpeljCND1+e7J+b44a4/OAFAlHXvd4goRJB1z5DjdnrRVrcJv
 epEGuXGvr7ZjCu6lAPB/iB8E4wC8jJrimHARI1sD4ksA246RdYTY8oZFAuYwxdSoVg9jrjwcdbs
 zYUq5K9FVBAAn720jVSC8uEqRUTgZjfhU4tLROzqKjkPWHbe23UUkinxhs+TlXHRN4zQ0nhPuYT
 y8eT2ESXOUCKtA6LX2dTthlAubcDQ4ue45GPq0FptnIHXLX8gPxGTGsye4kkhyBnYkkFRQrg2+8
 DKkA2iER8JtRRVLPokzdRusDyXg5YdU/oWLZXmHXBzB67KoqMEAJw8omSoWddnLJ/7Fbr28qE0N
 Bun324z6zoAPQl/gOSQ==
X-Proofpoint-ORIG-GUID: ZpYQ_NwBGVbQEgEZcSq8jlJpxnjteaxD
X-Proofpoint-GUID: ZpYQ_NwBGVbQEgEZcSq8jlJpxnjteaxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113400-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6FFD68F243

On 6/8/26 12:03 PM, Gopikrishna Garmidi wrote:
> 
> 
> On 5/19/2026 7:55 PM, Gopikrishna Garmidi wrote:
>> The Glymur and Mahua CRDs use the same board-level hardware for the
>> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
>> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
>> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
>> regulators and pin control states. This has been verified against
>> both CRD schematics.
>>
>> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse with the Mahua CRD.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rebased on top of next-20260518
>> - Updated subject to include glymur-crd scope prefix
>> - Rewrote commit message to describe the actual shared physical hardware
>>    rather than the code-sharing intent; the commonality was verified
>>    against Glymur CRD and Mahua CRD schematics
>> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>>   2 files changed, 396 insertions(+), 399 deletions(-)
> 
> 
> Hi Krzysztof, Konrad,
> 
> This has been waiting for a while now and already has a Reviewed-by from Dmitry. Could you take a look when you get a chance?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

