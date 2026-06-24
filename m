Return-Path: <linux-arm-msm+bounces-114330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7/KGVfFO2q0cggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:53:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EFF6BDDBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:53:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EMfMaa86;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bkMARwit;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114330-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114330-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A21983017C03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9822EEE75;
	Wed, 24 Jun 2026 11:53:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402862DB7B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:53:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302029; cv=none; b=k1wH2C+YWxmblCIBF+J1ycHxi+Yt909axk3BJyIjbBeIvxlTUxul26/kGdl0Qylu5DZZiUvM7gMCxG/2QPXfPWpG3HV/PwQczk7r5nWSM+AhCYojNvoxvMwjyFYWiCbTpFndntVb9b2b7AC6qzw3Uv3COyOIHYBCHeUv2/iJWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302029; c=relaxed/simple;
	bh=yYzLktbxNfz0/lgwBT2vqn65s1yAgTMWdgHtWZsO1Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuTqrEzPiQfGobzs0SBNp/AKp1JmBg/KLzDaxCfqEOs9ruLbUWQx2fOcQHljADTSmz4r7ZhfoZ0PownhnAMrrWCc4F5/udtosG96yDzPAuHSbq/ZAm2T2Jly/sssKuC0/OmaAuCPbZy9IQTQlOceMa31RnGbxNRUW2ygnosnFAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMfMaa86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkMARwit; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANZwB2869042
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8d4ktxPW3oKg7/kzTAfWVLrcH14s0wP2cl364M7YAg=; b=EMfMaa86eUGm0sm7
	xGmh4kQDuhRlnwVj+4Pz9mKOLwUA6ByN03Dcf4Xlavdzbg/isW603U8WwNjkNNtM
	oehwxkc6LxrSxTWEPlSBhq3e5pZOrN7fedTAGV7dQnxMP38j97vuFIugfzUuST6A
	btbUyQrTFobE9c89JX2Lb/r+c6mcSRb7G1x4GXW+SltcBGzohgZDuKgAbYKETt6z
	fh72WQ8h5LRERZLPOk+gZUG2qPmOatEtxAI/eSBnBfLv1Moo5tLYQyUNBc8mJUwF
	i6s+b4OMGnB815tl9SAExRuSRlPJkvFjXajYS3q4i8Xv83iXIuDpUb1vSftOgcdf
	T0nSAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq10qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:53:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5198e72249dso1009661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302026; x=1782906826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8d4ktxPW3oKg7/kzTAfWVLrcH14s0wP2cl364M7YAg=;
        b=bkMARwit8BUGimB2fXRO1M5HMOxENW+yKpjQoXfiF6e5SDNj88dwigaTC15uMpfYmZ
         bAC/uuZDxTon4BHTioftpT7VbOB7IrqIkv3RuLItI3mhs20/GkCh5bES22cod6J0bfWZ
         1Ha3Psrd4ufwcIiCdsDPHzEnnOS9RW56s1x9bh3iSMeW8PljJn3lr/ozFukQxn9OZtVw
         1bxvgr7knTUvZO8EGqFu6RCNoXbv04lQcH6ckoSBfqbZXqerU6xDCX55FR96rzQ0nRsV
         g4baOAf95RKx3y3uuCj/2IoaFIAcOGDpOrjkgTsw+LcgpGT8MrbwmYg4mY+XKDpuGvfz
         ObYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302026; x=1782906826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8d4ktxPW3oKg7/kzTAfWVLrcH14s0wP2cl364M7YAg=;
        b=khn71/y8MsKFZlztAmsmWTehju0KP8UdwdgRGxDiNHZ7Kkaa16r3CIqJDxqxcU/iKd
         BN6V8bkocKkpjJ3JtjosHNib0+5uRWCz9lQrifi7cuzWR54/iNETGxKgMLCePptoi/Jm
         kKhcbci2WuOnmEQc+WZFDJL64HqnTaRc9zhurWgJIzwYUHYe7kuT5TEbUMdUKdWWvN1o
         AjOeyDiWTjNLzoJQptO+Ax57NmjkcvLO2Q0Mw68QnmWtbbRTEvCTQprFG75ZaMu2eqkF
         24ztylNBBtolTA4V9X2/GuGqmD8De4Wns45TXytgW0j2JNXQvKeoxtqSit42FOzLIUPx
         NBEw==
X-Gm-Message-State: AOJu0YyEtarspmz10ARdEwDoSRdUp8+BbnPiEnmu2pzIGaCgED4T1SUE
	+b5l0x5sMrwRI8Ihzi+BPQtj1W/oxaF1bUy2iBCLkb0m/0xPhTz8N9p2I/9O3HzQP65lDA7uwde
	wY5fPRT9Esm0gw6harO+5qWJEzXlqwx3FEGwydXRlwMo37C0S6OETr8+d8fHS39Jg9SpO
X-Gm-Gg: AfdE7clcVwhun0Tvtnt1JR5nQcnQIa+BPTzTnYUwxW+37mfyWKqLVz0M9HXURfuxAYI
	ONL194ZNZNQ0YqeYAZh4gHLA4uQxAeAc5kRdq5VAkhi7XzQZd98I9vx5vHSEqTjCalF1xc5uz7e
	29UCqZ1rz/IA4i6gkAUMAq586yusi3Nwj93YP5Cx0mOhePVzDkxsHYtRTdNUnatZ+n8zx4+09QF
	8pi56hNZTEgGhU92VR3PW/HdJlvH2NZK8HJOvBxlRhSJ9vJXZvtpS1tJoH+pIfjV/c9oIGJOytP
	5Qfh1l8/qF1bdA7bcsmRtIf0X/eAiC9fsZ89cb/MHyla2LsTLfeOwHB9SbfSlI2ozOr8rZLF5SP
	43tguikTePKA1hKwjuSYZKUVue7ZV7O19isk=
X-Received: by 2002:a05:622a:609:b0:50b:2875:5782 with SMTP id d75a77b69052e-51a4f4e6e6amr84139611cf.6.1782302026131;
        Wed, 24 Jun 2026 04:53:46 -0700 (PDT)
X-Received: by 2002:a05:622a:609:b0:50b:2875:5782 with SMTP id d75a77b69052e-51a4f4e6e6amr84139331cf.6.1782302025717;
        Wed, 24 Jun 2026 04:53:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd7719sm1003218a12.30.2026.06.24.04.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:53:44 -0700 (PDT)
Message-ID: <12bc9f3d-bfea-4ff8-8eb6-d2203bb46b89@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDA
 850
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
 <6ddd0652-d18e-4e23-a230-5f5c8a9756f8@kernel.org>
 <16d91c51-9f1b-48ff-90db-7dd7ef056bc2@ixit.cz>
 <80049d2e-ddc9-44e9-b231-876adcd79823@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <80049d2e-ddc9-44e9-b231-876adcd79823@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T7mkH8g2_-K6Ok3AZi7-Vx_LaBFZWCvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX0YcE71Fi1pFA
 FxrO2YyTF7Hybf6FVez2+RjOFm0rHWpQh9Le13cqqRIEkyHzSHXq7ENUKjrlbpSDLjEbN7CWV5v
 Q+Q478H9ilS62r2lX8XtmHa50btVjhfuUhJLkdDgUSloozj3bttiTIR7A88+leEaCsn05NvTZMO
 ZolDa/51scDRQ6JmXfvPBKjF9skA4KT8LTMs01PMcjggnP4FEbAB3x7yYcJpCztPkJbIuADBVdI
 nim0qbWdingIlCjj+0a03YPFifCebllcIFW335mrlgjtgIEkSYcQMb9yj7r1VeV3kUaqdMvbCvS
 WLvBWau/BnhoB6Gy/nNzVz5qqm51TIO104lCyYBw95HUqjjVCeg/kkBLudGshaz4GwwYRqZb0DO
 ght1kHeD7Puc0k66cIIS6pU5YNeaO7G66w105o2WF+YDlwEaypA23TYOx2GO9wnKs7rnVLLad/5
 Wvxp8dT8dnueDCIQoZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX+y/e8BJ/ZvK0
 T6FvABRN+Law4DYXi91zShLRSmzSiOb5a4jDTf7uOgDBTYtWZ5rxvkT4zATSHpXTEgXqNhkeUZL
 nXe/kxgJF3dZXHwegtLzIsPIeb43/r4=
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bc54a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=JxAcqFIsxX1jjD7gn_EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: T7mkH8g2_-K6Ok3AZi7-Vx_LaBFZWCvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240098
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
	TAGGED_FROM(0.00)[bounces-114330-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07EFF6BDDBD

On 6/24/26 1:50 PM, Krzysztof Kozlowski wrote:
> On 24/06/2026 13:37, David Heidelberg wrote:
>> best I do is close-to-mainline tree,
>>
>> https://github.com/commaai/vamOS/tree/master/kernel/dts
> 
> 
> That's not upstream, so we do not need this patch upstream... Just keep
> it out of tree.

As I mentioned, the proposed ID has upstream users e.g.
sdm850-lenovo-yoga-c630.dts

Konrad

