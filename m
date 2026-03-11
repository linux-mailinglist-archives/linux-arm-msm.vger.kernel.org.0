Return-Path: <linux-arm-msm+bounces-96824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LFMCFDesGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:15:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285E25B545
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C5CD3017FBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F05333A715;
	Wed, 11 Mar 2026 03:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSzdieCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jf6sYevu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0747633B6DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198903; cv=none; b=NUbPfsQk5ct30S6QU2wW+rDYBQy2kSR2EnDTf9LC3VNMXmNr7b9mU4h9wd73Xoxcme4h8P3Yc2DMQZck01aGcH/Rb2enAmP5GvLBfYUryiZAF5CeLCuaLIG5/0TvEIHvqm2BmqOOU4Wjf8dchBmEAyjtfxkNDeSjXVTAIpkHX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198903; c=relaxed/simple;
	bh=AOJ7ZMoEHiMTx9oywHeMSnJhPFIsN6iuUkM/lZ3G8Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDLs/y3Sy8aLqnYPDbtLhSvba7doMqw4mBtxiAp061gG7MMXCNmapMH+mIhmeEVCAv/KlYIRQw5DMBIDJMr5bfCAyuQIZoPbgqwjci+os/w1VmwvwQXx2qKBMI7/F1s4WGnIYp3LQ7gEYomKgzQFGL43UtB2bDjE5g6ahuNvT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSzdieCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jf6sYevu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ANoNC4145520
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eni1OTjRHNCM2aH84dIaSsE9cyClxmHWov/FTodZfM=; b=TSzdieCzpNPrwQfA
	gMfAPW6CYBkteaLK5eOVmcccifjMmh7fg+iJ0Ms93h0RPUtQeNIn/5ER9NJS5Q0p
	Q8BJaygA5QBWamy+ZR+jORoTZF+WY7CDq8DKPtBB7o0YgZxvUcYU8keTADKmKSyI
	iyY2DAB/ynRwIsCMS5y0/tLIkFWfsOXIwsJPsVnfpbNkp8A/vUvekkPqSGMhTWRA
	yg7TWAYhBdKdN7pnqc7pEQXglxadELPdL/uXhZX12TTSyBTd1omt3lXDhqSAYFy/
	3QRdM0wwsX66Wd7a6vR/GHiVoBgv30xRsqiuovcsQqkHJ4Bw70OYnh2zKqj+sxmW
	U6T64A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctwav8gam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:15:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4a6bb316so103127585ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773198901; x=1773803701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eni1OTjRHNCM2aH84dIaSsE9cyClxmHWov/FTodZfM=;
        b=Jf6sYevubDywIsbuRXvoxL/G3FSOF7ezGSAogyzlvKNeRo1AjMwWkMlcQedRdgvaJT
         ApGEyrTNmlXdgNxH8w+KX+6jworsIJ1W3hIIPwb0EZrtUQZ5mBHAosVd2QoNExQqfxir
         x3ssEdlvTa/rmnWMQvSG9eU8iwkqLMiilH1g9vG/78A2C1AnFqDuU4jV6gbcaNct+tsB
         ohQgWVb4Dui4Opp/GhM2Wyy2s4lpYeJZLdm8ME8UVUjIbkzLIYxaDFc+AtOJKc4G+1hc
         s0to0486CY19SEj32lHE/Ti3YXO9DrzEFaThAlz1FSA8J9PQc2hn6nyda4yWy96U8wv+
         mRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198901; x=1773803701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eni1OTjRHNCM2aH84dIaSsE9cyClxmHWov/FTodZfM=;
        b=kLwaIeypeW43MmLuFPqdWsVdzd/SjtjNycEJk+CZeb23c3YWwoKyNLfsNP5XN9e2D0
         KPLnGtjHU9s5SVg2XelsNytktoRW7klkcWTs1vCzAZKFyaH27j7JhNsAu/AhBwEPn4NB
         WT1qbZWQxW1UKo8kHlKEAWLFOr147Xn4xY++PRzdFl5HvP3wfRdLp6AmNh6HKUT8TLwa
         UeBCTlFugdDt4rnC03LhsaN8xiFDVLLX7nvpX76I0OqY36S0JWilt7WJjFS9bVCZL48q
         cHGWnV77qAxMVniIblZDPN4RZn7iGVa5FxrsUY0nVh0aQXg+3LoCE+4FMn2QEgb9IbeF
         kGlw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7OXlcFqNZ6UowWlLxn7qOB6yecaUT73kGrGK2/hW3vv7ZxVdz9za7tcox7dWmEBhJfP3PR4CWrahE4I8@vger.kernel.org
X-Gm-Message-State: AOJu0YwemFad3Dcn+2uxz9bA5tAvxKK4vux2kXa7TJVoGFt5Kneqv9+n
	+a/N60/hO07hafsXPeqCTDowuwems+POw3wBOlbNsKNorwavxXoGuPK3etvJRNSta1xS/GzYeIV
	MopNeEy2lqQvgdQlU+/O/wiIgATHiXDcyuuozaa/ULmpdDNx82GLxNTutDybnmUtkSf3U
X-Gm-Gg: ATEYQzxlLRRrxCKtMUys/1ahFVDl8X8OKzKVh1bFXXEnRuZ6iuOEUwxhmHXl/Pv0dur
	IK84H/iaRlVfyrcFNzmSDjNYIPb4CJuKMSRoRPfBTRpy89/NaNBDkrAXVS9AdF9qroJjAK+1aRk
	9eUUvucvEyhJL+ZwfimzKX00jb1lxkGO+47rtm9K5BwWWcRETi2Hdv/P9O+20WsvxFsysql40h+
	P76E2AX8Z07g2XhCVGItlR3CBBTH4vwJ2YsFDWstIjoinolsxIXZQeaiHCpFWbv42t43OB42EuU
	OfLEgGHjlb+FN+l8n49YywMBbd/03jlIO/iSXzqU399qfKuD8IV6bduXZiUZ/3JVurdesR+afAX
	YV+7WGBpoqEnrdsixzLuMen55NbH1qpZyrU5cNO9KwnM1WTmK
X-Received: by 2002:a17:902:ec89:b0:2ae:55bd:1473 with SMTP id d9443c01a7336-2aeae876b3dmr9648915ad.31.1773198900573;
        Tue, 10 Mar 2026 20:15:00 -0700 (PDT)
X-Received: by 2002:a17:902:ec89:b0:2ae:55bd:1473 with SMTP id d9443c01a7336-2aeae876b3dmr9648625ad.31.1773198900120;
        Tue, 10 Mar 2026 20:15:00 -0700 (PDT)
Received: from [10.231.216.91] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34d918sm6578995ad.45.2026.03.10.20.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 20:14:59 -0700 (PDT)
Message-ID: <581ddbf3-e79d-4a25-956f-7045c09a22bb@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 11:14:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 disable wcn6750 and wpss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <zutya6ebksaqkpjen4qb62kit4lgannbfbvvfie3bpzbf5cgfi@v5xbzjuf3tyy>
Content-Language: en-GB
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <zutya6ebksaqkpjen4qb62kit4lgannbfbvvfie3bpzbf5cgfi@v5xbzjuf3tyy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNSBTYWx0ZWRfX/DzgF2pPuGow
 odDBQczwgkkDJIp/E8VfNtcl1QQ5CME9C71l8nCWGb3CALqHJZmNTgH29FUVEBk/oeG24dmdGv1
 2M7yI3tzpTowpUX2A92CD/Wh9xdcB3X4c11b5GJs9hmTf98UmGbqN+XiXRVANvSerbAbsGOdjuA
 V1qs8jCsSVmdsosO1+iicvqaprBsihTA0zcJTA4eLbkcgMd/E9yNPyyW5J7rCnLdFX9OEDRa8Nf
 ub8h1Ai48AgGORUUidsJrzZvPQZkUNom0svtWwv/0TAU8oHML0C630qhfcw7Zq1C0FE15GSHIY6
 86sz7y4ku99PtPO+DYnHySdXjJXguQwumssJPwMb7mknO3T3rycxDkzcerlA6QXv3iX79NUJ0mC
 jeapZ3/oox6GVrGII/3tZaADQyZLJdapIgedC4L7tL5W7ybZDP4JtKIg7xgu6QkXYWKglq6NqmW
 BrFYBokJgCKMe0o18Jw==
X-Proofpoint-GUID: jgGPZR2L-AgvH8mmRGGpxzgKTZqt4Zwg
X-Authority-Analysis: v=2.4 cv=K/Yv3iWI c=1 sm=1 tr=0 ts=69b0de35 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dk4rUomavQjDMdTiWeAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jgGPZR2L-AgvH8mmRGGpxzgKTZqt4Zwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110025
X-Rspamd-Queue-Id: 9285E25B545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96824-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/11/2026 10:40, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 10:32:19AM +0800, Hangtian Zhu wrote:
>> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
>>
>> Disable wcn6750 and wpss on industrial mezzanine. On rb3gen2 industrial
> 
> RB3 Gen2, WCN6750, WPSS, etc.
Done, udpated.
> 
>> mezzanine platform, pcie0 lines are moved from wcn6750 to qps615 pcie
>> bridge. Hence disable wpss and wcn6750 nodes for industrial mezzanine
>> platform.
> 
> Are they rerouted on the mezzanine or should the user toggle a DIP
> switch somewhere?
It's routed signals inside of SOM, no DIP switch changes needed.
> 
>>
>> Depends-on: [PATCH v4 1/2] arm64: dts: qcom:
>> qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
>> Depends-on: [PATCH v4 2/2] arm64: dts: qcom:
>> qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
>> for PCIe1
> 
> ENOSUCH tag, please learn to use b4 or git-send-email to define
> dependencies.
Updated with lore link.
> 
>>
>> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
>> ---
>>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
> 


