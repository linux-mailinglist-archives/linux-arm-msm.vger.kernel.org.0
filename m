Return-Path: <linux-arm-msm+bounces-114460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vK3rFpLbPGq8tQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:41:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A36C3707
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gL1VEv14;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gpBxvTLJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114460-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114460-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 757103002510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE8C3815FB;
	Thu, 25 Jun 2026 07:41:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8FD37FF6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:40:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373260; cv=none; b=A1YVYPeq06PlVsCM4MI8C3VMLX8KT5vMxb4SPdanFa85ULjcBHMznXgY3qbokrguzYL++Ra05KTP2pKNBY5hAhM8jAMjsupROpI0pXjzS6LWmqs9hu48stE3VjT/k6ejmmOGUyIPpRYkACH+ZqNkP4mOt/udmfXO9ukP3GSf0qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373260; c=relaxed/simple;
	bh=CXXM5USArPjQgFQcc+Ci03uGJdngKpK3nhLWeXnCkfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iszRhLclTDVNhDJaYLgpzL0isbG96QxSBy5iYrFsVpEhv5KZuyISQLZ6/omavgEfVVT7FIRUz93d/NpbCSBaMFGZ3zPRCLrZNV27JHumKPB4LXLCvr0xdIEg0guE23IVZFVXFDkNehOO3cTLAJiNFbpSAojXdkzJdlgqerG9HY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gL1VEv14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpBxvTLJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P6gmv11527044
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4N3Gga+dK+IdPbI/DXsNqi9huRn9GF1tNNYDx1OsWY=; b=gL1VEv14I52SGICN
	PEIaFnfDGXje94zYIL+3fgzGSekcPBv1y059At8J07o+I1N12qdAIbVs6VwiU89u
	Lp5y1JFYdpM9hWY7eajP/gh1EjndQAI4KlE0Vqw06Q0/pjBl7FXM9cqmbzwjpH/A
	+OdUiT7eLwmt4yQzuwQUKw5Yob1EUmneaJHbNbrBWKYahyzd8X5n0VuUpDA/9d5M
	tms288tueD39Zhm2yEaHtTTqLkcS+qGDaywy4Sp1ZtmuzGTPNw9cvl1MH7XtP9e5
	cx2JNAjUMIEjyVbWV/tFxR0I4QMrIlFDbYMSIwJl2xeqIRpI2phl0yrciG1lXkSC
	Ajn06w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8r765-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:40:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9229581de9eso44236685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373258; x=1782978058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4N3Gga+dK+IdPbI/DXsNqi9huRn9GF1tNNYDx1OsWY=;
        b=gpBxvTLJnn6L/Mz3wpMCl60tSzPIsNlSF2d+pZZM4IDwceZtot1x6i3sPM0GzaBhhI
         PkInCdQSnY3GK8bfYojIKQrxwIg6Mp84jBnVUVc5HXb0MBjLkmTOjq10Yw5s96QiwBoa
         4C2+8XkHOrxi2StsGpjALWKj9Ba79rSqWCq2rEmjcwipeLk73jw/vwuZPzKg99SlIy5B
         mQJhPzxkGwiy5vICM3ki1pxdPH5WyHIuueJQe04ZPAlFg2d7oGsVVQrTeHUWdzeXDvH1
         4A00+GIN6queSBSKSaBbqFU8b9OK7NNm3M3/TRyYPJm0eMtikUJYNOk4ZSeylt5iEODd
         2e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373258; x=1782978058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4N3Gga+dK+IdPbI/DXsNqi9huRn9GF1tNNYDx1OsWY=;
        b=lZ5Dz+oshq6W6jk2QeTczqWF0h5g+6HkQZz/OC6PGuFbMjp36X4vtUdeob/LmWsSIv
         0w6XX/tZEVBNZJ3y/MCFaB3YxV/hOpUvNjAY6RCWXNAnTWQhQCL1CEtEjmG+lx5ICTBF
         bMG2q10pnhxgElJEgBttaYlbJUxcZTFxf47EF+RuUToHPFz4majJMz1cnd6LEMxlpJ3/
         kF+qh9xuR+KAbITrWaqJ0ccCRC1ShRPpTvTHGmzWifq6jJI1C1U3UfJMttm/NCQ9nN/Z
         wUh7lku348D7yehaIDHVPjYLuxxTicQb68/Zl9/5uvlIfreQYAymZg9HqPfq/NnPw+bB
         cRTw==
X-Forwarded-Encrypted: i=1; AFNElJ9+dT6gMUKjIA5wuigyUebSOaFVy3ihOKQN2ci8bXtOEABI7bWLqYauOfKs6NRmF8B3E0k4uY8sVZtQSBNK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8ldr6jybb8yuR17pI7duVUUEdz/W7maMFVKhBmkrJ2h64QbO
	BY6nGPbJGfAZORzIvRzP+AOVOd2UH5pzvbFwz8DRgxJ6WIeFzAPH7k8vRejBdGR7LO4FTDReS70
	q6/MPgqyj5YCuuPOazEwzRE5E+9TLUJyy3IROx3uXqygTW9GPHxrU/eCXIGBaO8bw8lNq
X-Gm-Gg: AfdE7cnqcVQL4yRaRekOJ66pNS6ovjhoMNfij2BuV3VGJ8Xx2vU3i0ofmIvpPEH/pP7
	U/7g896VzVW3OorZgMRWA5Riy5Wfr4nPHQKxukmQ0OaWpCLPIKxT0gNEAAA+VAEP2iWw1sQ/kmw
	ANfE4H9EM6Z2wCPhWM5fi0+lMLbAur37fTHVzRWFtFt22sxF1Aw9ya9jygilp6ug0TP1wBBtPxh
	KSFolqu1SdAjIPOC5I8ktotc58IuixUnPO5mcA0Qa/gHcBY8ddlgw2LtwVgorD0oU6e4xXfPsYR
	K5wSSHntCZ6W9MM82hmzaI5Lyh3oW6NlzTIyEXwyzEIA0sh0p6WuhaVNWAO1N1DUYKBz3r4bdMO
	SF/Qs7XNGtIroAOGuLWTxTRt8jGlp5/KyNjw=
X-Received: by 2002:a05:620a:8807:b0:920:798b:e290 with SMTP id af79cd13be357-9293ddae942mr101791685a.7.1782373257719;
        Thu, 25 Jun 2026 00:40:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:920:798b:e290 with SMTP id af79cd13be357-9293ddae942mr101789585a.7.1782373257172;
        Thu, 25 Jun 2026 00:40:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba8b61sm116339766b.4.2026.06.25.00.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:40:56 -0700 (PDT)
Message-ID: <c1984f80-f8a8-4ee2-a087-c49ad3ad1e39@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: release pending invoke refs on rpmsg
 removal
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260624192700.5388-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624192700.5388-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX/xxvxr9dCKmR
 KrV4zxPkaQlbD7pf469FIE1rjs51p2guOhms/L6GejCaEldAByNvDr0a/Kt+N+qyCe7C9MWJWYZ
 NcKZCVmvjfVxgO5mN5Vj7YEhcmjyndE=
X-Proofpoint-GUID: PVCVwxqBl8TznPWJ5DW_oBNAENLz7PkD
X-Proofpoint-ORIG-GUID: PVCVwxqBl8TznPWJ5DW_oBNAENLz7PkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX/lKRAEruIrF6
 hgyOVrmAAupyMTTnRP3LK3wq/+ZaZP5mZmUog82dNEyBk4aCt6++h0J4LWT3PvXzjMi4HJ0p7L8
 IQsOKGWhNAlp3+rZRWKqyP5tuqYEupeqpi1745uaA+0R9VL07m2+nHsfpb51Xz3hr2/ndnhnd36
 j1i2tREZyt5ZqQNu/VKUmYhi8QpwVrlz/n2AX6gL0/bY9F6q/ydwyqkkcIpyJ/To3atMGg0Exs4
 UDGCAydjh26rRWThfZa2egZskYhMw1asgdkKr+a8jYiZil6jpv1vCJOQuDtS8usnVs0E/1sTbcc
 9Ry3VadL+E5n0MKtifKKnONZ1LOhKE1cWDC2LHkjLCbeSEmS4ZTX4SOB7PvtyLcLZSdpdwYEPCA
 e68R2Ct/q6Qxgu/LaMhfYqbEtbrLRyrndu17jvDRxJf+J6FRYQzH0I7GLxU9gFMybFqit4vnqO/
 VSCJerxlCEIqcLVw4gw==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3cdb8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=nLcEm9eC-BXa-18sqisA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114460-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,qti.qualcomm.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 531A36C3707

On 6/24/26 9:27 PM, Yousef Alhouseen wrote:
> fastrpc_rpmsg_remove() wakes pending invoke waiters when the rpmsg device
> is removed, but it does not release the send references taken before each
> request was submitted. Those references normally disappear only when a DSP
> reply arrives, which cannot be relied on after endpoint removal.
> 
> Walk the channel IDR during removal, mark in-flight contexts completed,
> and schedule the send-reference put while waking waiters with -EPIPE. This
> prevents disconnected channels from pinning invoke contexts indefinitely.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---

You sent ~10 patches to fastrpc as separate threads, do they have
any sort of co-dependence? Can they be applied in random order?

Generally if your changes are even vaguely related, it's best to
send them in a single series, if only to reduce the possibility of
a merge conflict

Konrad

