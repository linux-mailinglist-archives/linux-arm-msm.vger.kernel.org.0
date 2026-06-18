Return-Path: <linux-arm-msm+bounces-113775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pQ6vIhnuM2ouJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:09:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB66A0595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:09:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AsXDiPjm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dfXWJ7bM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113775-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113775-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEE37302C84B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB7D3F7894;
	Thu, 18 Jun 2026 13:03:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB33F58FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:03:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787823; cv=none; b=Ap7oAgvfYiHxzrwXggECusStiF0vGlHvSvcPcaTOikb9iw6UdrDGG8rkVhkfAjJSBqq8AvvZaoyLTTlD2ivRU4RUO5XJpmkHVjurb+MVK83l8wG4MadztP8VaLGfEv1I/SCRJx76SeRNpNsVoxgXIzIU1uj1I3XvvTN5dhncIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787823; c=relaxed/simple;
	bh=PSCZlzz5fjxTGq9uKR6wX0C/ymeqII0/PUc/wexBbHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsBEvAb2gr0HvIZtCdOpqtRip/fYFCIOXnxHb7gmWvLq0BE3YMwqaU6YaR8WChQYF5MtnnZxVJ7fFVOxghseECmGVdbYIUSKQ/Kc4UJ6yuIgg/NrHAO2PPogbdSsBJaxzez5lvO/lRrGSD3kNR6plMRduBBremxNxPxuWXD6VEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsXDiPjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfXWJ7bM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICvQpC1806218
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7JX5X2XTD4Cde3MxSmPYTnPXo33idXZtjiWq+3lvLA=; b=AsXDiPjm/cJN4pZl
	RdSpC7JwGwSCoWCLzG/B6XJfdw0jsEwluMJtdPBCO7BR1CeHBLRRcJoOawvbkGtA
	PTlQQBA4OQ+s+Oe8uA8cu8Is57MrIYpst1KglQE8+j115BcqhHO9cxU9TtBCyTSg
	nN1qmb3ySMkYFpWPi5wd4yi/GdM7vRtbM4caAbqz4WsFuuDDiG4nafF+xTUdIwU5
	mrsrplcD53iSG49rxOW839guDzA1/hwZbNqtSJF115qQKjaNlVJeiuKP2MFd3dki
	SaxgB0FujY/xEYTQEuEQFkY2aUIT++WiiMREwRO/CwYAT+UKehbchoZ1F9Hefl1u
	jn8ASg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kkgcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:03:40 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e70409ed06so97445a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787820; x=1782392620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7JX5X2XTD4Cde3MxSmPYTnPXo33idXZtjiWq+3lvLA=;
        b=dfXWJ7bMgUbJcldIz3vq07I74EpPN2vmTdmK7m/GTtcLvhsPQJ+TLE0C/FTxG78pC6
         9sTmQAh9pUctk2vxWuomYl5g0RuhZQ1nGdg57rkN12TUxrdCGWv/FU+v2V50nGHup7Sl
         bTcylULNu+O/EvjwvCwtvwHjJcWxG0RtD7UQXaEYkFI9gnZ4ppr2Oe9JMLvO13fodhP+
         t3ffNfcJsOwen9ChyB/EEt9TdwwT5kMZofv9Walc5iInxUPblLrsWYBXe3z1kBePSeaE
         3LH5sGAqxem5znxQJ/xpFotdZ7Wid1SzR0ordH8dnzR8Y4WW++SqoHOkKD7M1oQcBtPj
         Rx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787820; x=1782392620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7JX5X2XTD4Cde3MxSmPYTnPXo33idXZtjiWq+3lvLA=;
        b=BApmOF+E0TRNsM1+UafF0vwYTB500v6qygBzMY7NUIG5+oCDh58WiuQEtIUTzc9YnF
         XV29zVJIuXx3Kjkg9RlADi5RqKS7Z5M9fJotvMmHDk9nCchpuTZd1B60oiMjJOsnCTcv
         3TsFice0sNXZ+N2t6E3jsv+ovo3OLo2+Ij13mzWHP/ha17PImcHC/6NGl6BcKahec0J1
         sEgRH3EfNwqaMGQwiqqwJiSRn3wNqfrpoLyJhxCr52YhXjnWjUnIySjI8mqOlRmxrjo3
         g/EGv8Q5IhM32SBseGx+lYGGGxoQMuB5TgEeBjb69kzZds0JXIACJp/gt90qLATsduyd
         g3uQ==
X-Gm-Message-State: AOJu0YxHNEA6eVWORHwldPhcGV7JM7aI5ozKxiMbZyTBnl2mRuMqeJUy
	d67PwRSQ46xHnkiIVQkbtxrU8fPzzAM2vWIOzTsHkI7W0zzqMGeZqPjZ9OsrSCq/br5QmAnUIPs
	IrLE7QmuxePGb8Z32gFmvpwlzx5AJ9Bnrsw60ZpR/LZbuk8cVEr0cRagtl9BT8O9JM/26
X-Gm-Gg: AfdE7cl4+Pn36eqYtvwxbf0pr2TNqI6iZb+rPpTWWQMqiR4Z7kTwod3IoSixQhT3kr2
	nvoQe/aBJGWJPgvN8iI6gw4ux/7V/q93TNjKuiH4FljxbESsMlqccEAM5C3IqMbjQ4Etjqup3Ie
	RDNe2qba+Dl81Cw9VIkf0YAc6RDqzwyoRofiieGIeMPZ2+DHb89BAoAqQOuUzdwc2dsyT3MBfvL
	SbdOhZ34yn671czg+NeCnIjlRTIIhZQn6OduYgvXDII3T2ntu3tH+2QOXAc9IOL+yAbTVMGOil4
	1P3CPp1MyKjfcVPMb0aiLZ0VEs9bPd56+TqDE1J7ZgLpszdGtGV5H3EakiUMT5a3N2nDMEwU+wv
	AXMsoK5tFry6QOP/g8ZmVpeAganrRvi5tctU=
X-Received: by 2002:a05:6830:43a7:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-7e90c7497d2mr4384692a34.3.1781787820199;
        Thu, 18 Jun 2026 06:03:40 -0700 (PDT)
X-Received: by 2002:a05:6830:43a7:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-7e90c7497d2mr4384650a34.3.1781787819765;
        Thu, 18 Jun 2026 06:03:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-695836d7e78sm1997961a12.18.2026.06.18.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:03:38 -0700 (PDT)
Message-ID: <c008fa1f-55e9-41bb-8ef0-8a9d85f2614d@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX3CxbCcOnjZnd
 4Xym0vtA5bXZKujtLn7EvPXVhKDSBwZPs+0VsE9QMpE5kLsJ7DFouzPxSlZbzeOkos+mezFqSLi
 lYT7Q/AQtFxs+pttbxo9qqmHLJcmS2NGxjlZWRYGmhwF53Licp3wtQ8BiPm4OzpZHj/5+3zmyKM
 sCjqrpbXRhmwIXWb6MgkRnRnQysL5SS5TLQVpTs0F/c9vk9aix6AIqg90Z5hZlfG7UqSlfo7cAp
 hM6BVxL0uD9fiB8+eUoo0XD9G4HifbfqJoUmkYfZQ87ZGPOKP/jGgeKKTgyJhB2cfWLwBj2kAqI
 KnepQMDIJEXiUAtfzyc/Tmdu9HK0JV2Xx5oiAg74AndYHO9F5m46YxHiXyVIwoIt2RbXFDOa7XC
 4/y6DmRAUAjltznb1V00wco0dM1yt1LVmeryUiQeu9Tk74+In3cOkFPMwI+JLx/QhtpIThpYdZL
 G4h14CD8wEtUu7jJBsg==
X-Proofpoint-GUID: GA_Eg_lUqJUwXDu_O19-8ak5Sd12hlsS
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33ecac cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: GA_Eg_lUqJUwXDu_O19-8ak5Sd12hlsS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX02wGD0nJ6agp
 jt8IOEmgCKJrp4kmjfsQAD8f9zQAjOGnqxI19xpIR9Klt5xu7deKn47VtetR7Qr7RTTKRBZ4TlC
 G2iNLNQRNRabWTEN1dfoEdFYDUE5k0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7DB66A0595

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

