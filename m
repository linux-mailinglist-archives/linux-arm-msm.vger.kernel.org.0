Return-Path: <linux-arm-msm+bounces-100383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEFzLfC1xmmgNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:53:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E67347DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8611306116F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A913126B4;
	Fri, 27 Mar 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbUg4P1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGdkMxht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D90335E954
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630233; cv=none; b=BrM5363HQGVllVx6ZepVxhWbcDzf98P8bOQZ9alFPLl4y/gSffbslXKcF3p7/3ct94PufFzD/3e48T006p+E2vvRP3Bhn1lFaS2/gvfeU0/oyrqaBcudWr35AmxTPhucuBYtVvYFQiGkEfeyPOMPmyDkJd5JyUf0o6N2rfAXN7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630233; c=relaxed/simple;
	bh=LT187Qv6lgnSDsb6O+TVEXWKrwhAaFe54M8TErQkv14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDhQFS4Ax7JQCpuOGIo30PcPWSLvluuCKjdneLDx/PzeoHbGp+2nfy7w/RjzjEF/G10rRj2vrot7VS0OCf8JQ3daI25LSefASAX7pNYCXNSJtrnjdYcSxHzrKbxB/STLGZ3InNG2S24HQh4rZmpzNBSLilviu6Vd91eXqGTdUdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbUg4P1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGdkMxht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RF2JFx3631401
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhZqUgLrglsJ9egt0HZnkgp125uN+lGRSaHje0okr1Q=; b=EbUg4P1oYi7DXLRB
	2j3XKWprS29EgjELSgLJM5Mh8umzYzmSocMiZbcpF33ehKNJWiX7LtyifXaK12Oi
	dS5aG9i3ojdCLEmb2EXHr6EZHh/+40fkI4I9tvkHAfFU2afPyQToUO5VpgtWvskS
	daETKtAzkJHH4l5XvzlRD48ScQnmd8ZeIZiNul3kbFagpnsb3Vuqru/EnKy1f4MU
	+7P8SFVn6YNzr+ktRWRQc2zmmuKTc9Sy8iRl+k+a9vyxX0VH3tpQnFLtJaHjvg5R
	nIUH7UG3Myes1PUerQNQiszQkBT3z8pR2cduCtpq5GKzR2h8eE7/2nEq4X73Mm6A
	8cuE3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b0cwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:50:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so3968888eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774630229; x=1775235029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhZqUgLrglsJ9egt0HZnkgp125uN+lGRSaHje0okr1Q=;
        b=NGdkMxht68FY9cgq6WM2unvqwUOC+alcKEP3huvbzRy3gH9FwOR32vtJ+VUXL2xhB6
         T5tWqbDPy/4q0Gg77hwvfM6ZoQSupluLGruWfTSjENKmnLS1hhEdkD7mN8k25fbhTNCz
         ZxbktCI6o0sG9kHoPj9SiPH6+uo1tntfX7DEQtEHKymvKC9eH4xFNwtB8t8tzI3gVDRH
         TFDYZisRuYRJ9Qf/z/TvdBX1x7XixCUA0CArGEvPNIprUHZyjRRsbBm5NKQHM00M+59f
         vVH8KdoCiH12wN4uT2jtQiGV4OjQimtOIHi1di797nX5upnMaXrd2dXbSZt5sFrToZY8
         m19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630229; x=1775235029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhZqUgLrglsJ9egt0HZnkgp125uN+lGRSaHje0okr1Q=;
        b=WQ1O5svi68/2sv5UNyh+NPCcxQUJU2TL5VOgrRU6e4xkSYXFlMWJIqx25iMAm6GEDL
         N4ez6IA+skrCdieVwk1sQF1EHISX3NuXAtd7gXYbloZvXG0WLEC7vTnKDp10Mh83Im/q
         hJlLmcq4kLqKPey5ZtQuA8ZyDqCS/zkFJDDY1TRQSmnw8iZqNdorwLO7LB9I5UrrapiV
         pK/PNrdlToy+H8hxnX3GhaH4XKhEN+FD8Q2If0EYAzMm3ui6P6g7tjdDCK12dGrDjvo8
         b+EaCjZLrFq1q/yKmgVFpPSVNVan+EciFeJpw6IttyKZaULf7n1b64pzBOPrkYYHZTST
         Nw9g==
X-Forwarded-Encrypted: i=1; AJvYcCW4LxAZPILlCvN9NHi/sm/eSUKSvcfXPzBWL7spmoUn/nbFbJIfxcFTMWikuQjpFmVojkaRBDlWX9eY4P77@vger.kernel.org
X-Gm-Message-State: AOJu0YwCktcRN4gvYyAllL92KpuEbE/O9yIH7oDiOa64UUlQP+XUDGYC
	4g2VoPFFzyejmDQDVCqWovSEBC4vNwHDO1qXC7PHWN14MCm5Wu745UQFjSa3vGJevuseiMCnUUJ
	nbBuF0ZlPXbVOH4KwsHHVDpbDu76YtRiNP17RxkiKqvbhyReGUcAiB+KrXsALaLvFYlWV
X-Gm-Gg: ATEYQzw4RgPmXZB5KnagkVGzriR9BP18+olK1A5arv2HDQMTTdw6WVUfKDXtGxUIqsG
	W8DdKarTz/t3eZc1CucMhxTDX5TFqDUVHgdexaWK9y+MiKlfDjsJNK8iF/rEQCJJNrMaOgXjLZA
	Le00ZZBo6Oz3VwLAB83nNhOSkrDgJtJX1v6Qd0b8lirgCrQXjM0tpBkK+lcLlCnRP81lVVVrgRS
	VvF+SMgyP+fy9yJDz8veqNyzWqZwks9G1NdpLu7/LCr1cimc8a2QYewCmdt4gBnIb/CEon344OF
	Z0Hf93MnVPl5J+JY0rhBTXOeHDWJEHN7hGqJOzqAnGsyzHxezZmoJQyRiyR8oZaL0nMBNLqXgwU
	eWxpJMj35XfLaTvlY3FpmvhXylbvDRhPHxQJeOZdVLrbVGvbzfYJkB2r1ssScCXy1MzOdDtCSFT
	M=
X-Received: by 2002:a05:7300:4348:b0:2c1:6cfd:73f3 with SMTP id 5a478bee46e88-2c185e4e940mr1661642eec.27.1774630229292;
        Fri, 27 Mar 2026 09:50:29 -0700 (PDT)
X-Received: by 2002:a05:7300:4348:b0:2c1:6cfd:73f3 with SMTP id 5a478bee46e88-2c185e4e940mr1661616eec.27.1774630228717;
        Fri, 27 Mar 2026 09:50:28 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edc0436sm5516661eec.22.2026.03.27.09.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:50:28 -0700 (PDT)
Message-ID: <68679ac8-d914-46bb-8eb8-133f381934b4@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:50:27 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Handle DBC deactivation if the owner went
 away
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KvroEB1mtJr6hX1sdFDHARhNNfEID1_k
X-Proofpoint-ORIG-GUID: KvroEB1mtJr6hX1sdFDHARhNNfEID1_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExNyBTYWx0ZWRfX4JQ+ovYW7Y6K
 +nT3s+2SZKpUuTK5EAYILMmgyiLjD2JuOVtAIfqMAuJkh78cM+pOggm5YnkTyYiOFEQTlvanonK
 xpEoPKbIQV1jL82R2z4u0d/LNRdzQMgw6rcG3mwopQc7Xvk2yMxnzWLmjKLlLIxWcPhFjmkYJR9
 4ZDuZ4vlio8PvmHxtIZgSehtTHhUFymEcJvYQsimj20oVukxFQk04ouI6vDx0rmLA5cuFCi7Nt0
 qi0HvvYcPsBEjPwry9nLYGbwQsSqeqh3AHUtYvk7Ne/kHIJ2alukJnJik6hxdcfsV3CZWDzqOqb
 nMFSHdp4vwT4Q2Dw2OrITL0vnzLbhNs3FcrlTkPU89b08lyCxXCrcJnsw+SjhMbJrLEou21l0Xm
 wwoe8JQNL8iFFSYaN1FMztd604A8rWNw5BANNRNsD1UEuVw/Ez8gj+kY5WZkk0M/W5z5qpxOKk+
 y0fxvv29msJDDmI68Wg==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6b556 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TB8fjEhHHLHokerti4YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100383-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79E67347DF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/5/2026 5:34 AM, Youssef Samir wrote:
> When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
> transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
> this by calling decode_deactivate() to release the resources allocated for
> that DBC. Since that handling is done in the qaic_manage_ioctl() context,
> if the user goes away before receiving and handling the deactivation, the
> host will be out-of-sync with the DBCs available for use, and the DBC
> resources will not be freed unless the device is removed. If another user
> loads and requests to activate a network, then the device assigns the same
> DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
> leading the user process to hang.
> 
> As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
> that are received after the user has gone away.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-fixes.

-Jeff

