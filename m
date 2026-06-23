Return-Path: <linux-arm-msm+bounces-114161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XPKuNv5fOmrZ7QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:29:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992E6B647D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:29:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bl7a4t6y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RgxPCnkc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 679553013EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735E93B8409;
	Tue, 23 Jun 2026 10:29:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5C3B777B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210547; cv=none; b=sgKRrjHlD9OC6k2bwu4aTGgrb8a8c5mUsabJNjHbOpPikHH4DEumx+hYgIWh8Gq1a9lYJSA0yTIcHHopyqrnjWNEEO6/KGkkEhLhwgS1jqdIAOXfPb8E+0i70AULOspEYlezCFnSFDBDSMArm84hWnbSXf5g/St6jrNmto9mU6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210547; c=relaxed/simple;
	bh=5BeooA/HmNqloULEYf/wilQjkc5AtSPEwMHJP3yQY9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUHqj/HYicAD811COVrR9fxlRrgSMLnF8BnFnDrbA1LfEhlBx8AdPOXoDmNsTugrwTcy2wLopOmebeI8l4Q24LJfvD5OC+tl7mtxREwFp6ohd0sPViys1RNNkh1MSyyCZUFgniRjqJw2rC+VrDalgOTkWvG8ig6TlQcY9py5ayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bl7a4t6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgxPCnkc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7jAIq1778203
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmwpieETH95MW7hPYU1i6Ak6k7x0cpMpKx/vncfVnf0=; b=Bl7a4t6y2hTBiqbv
	u1Ff6R9K58hcJ+32rq1CnXS3ucTPIsgHDI9YYWFffcOhMZeQL6sIlT1l1SRsM59w
	1MbxBdQufWnrBc+bV3KRpuRp7wYHi3cHAiAcwhx+bXUF3XXhMqd5CULN9oHTFjHs
	0zMdzzaHYs3CKqbpd+3PEJD8KCAx/sqyMV7/lWW2Hw452Wtton3PmN3TTNn+W+qW
	xuzVl3PKCh70fw26eo5F2LvLFdO3MHFO6Jpl26xXNLAz+0/qsikB37LqqkADcWXr
	PA7YMcqIYztnMpjd/FpMfN4yMRIIThvJQiytIUbYAGKakNOeNvW+JpgfI1LbMsAx
	J7Ln7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grpef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:29:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dda2dc6790so19263866d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782210545; x=1782815345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmwpieETH95MW7hPYU1i6Ak6k7x0cpMpKx/vncfVnf0=;
        b=RgxPCnkcUosldZUX5zkPOLXLmcYBu0O8A/Pb6kA1xSteB8qz9d89BxMwMFYYtYdrGN
         JaJfUGah6VGM4wHVq8LZIPRWhPuhzawuVK5GwzYo3pprLG3cqi8OFONdKZ6SPXEUk0Jp
         COTqbjwSymsUdhGx91aMu1AtmZShLvavVk3TPriVzHQPnusc438vU1wPAKhghC0zW91N
         Ey0H5UnWcKde1MRHRKWjR/f0i/S3sisHd8AqXE4TnTxMUq72iqXs7yF5Sxg/6MOuFpYm
         GpwmubUQbnykTNvm8U2nch8ZopHVeLbWue4KaYGr/s/srEAu1Nk0bjF7AkyRnFx8emZv
         jYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210545; x=1782815345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmwpieETH95MW7hPYU1i6Ak6k7x0cpMpKx/vncfVnf0=;
        b=YKPo6NFKRBZAh1VToglNXlamFVf/Q5RQXVCgvXKEUzfxDxfK59ginM0Y+VgZF2JYl7
         fE8luwSh2A8DMRV4knKxZ1rTeFL9IQ33RnpAn2csvejGssQCE0uAL1cmeccIbweHrjW8
         5yGBZiOrl4PZuzXRy8zOkleoCE4a0FWRhnYrIG37DJjjrGkh0aeNNGPdigZZC3Agq4ne
         65+caV42B0Xbssp1komrYoVlDnwFgzoSTPisgCgp15m0Wtt2UGROLRG9fOjSpTkbrKWc
         h9WLATTYjmiJrEKBiWUz+orfZnpqOTqCmSIv9T2XHaCSyg5HsPpj7QkanAyUWalgvXSe
         Cgnw==
X-Forwarded-Encrypted: i=1; AFNElJ/GX5DDC1SPtloehyTm8buBF8U/LpEa+tvQdUMS/uOwSOsIkxjNYb1DZN7yO4oGZnQHkHMyO1w1RLMXxvYb@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBDL55zKNMT8I42ERNgdbTogLf2fu+I8DaUk/adMQ7QduGv9F
	WBZiH3x16+fFOkGTWGNeLAHUleukryr4t3ac0jueUVW1P/jbxdEcUuhAfpct4i6lvRP0B57y1vE
	peCXjurQDps3N/94a23hIHPgIk7InslO7ZicHJAgPTsp3vLoR5pt+zqMo9d3TrpFcJjXG
X-Gm-Gg: AfdE7cnK76gfRH5LRN3ni6g0cJUMedvo+nJ3A9rZepnPAHq9WAF5WBd+KU+5SzgZ3vz
	sx53pt6nwTsmmuI10C9/dCJ64SoljE1WFpLsl3hcbsHjJv6YnG0AK4Z1ZZA7I2v8HaVUYO41ilP
	JLavhc6ZI6GeqVWZKTdsWd+fH1EOr9y6S5Kp/SlZAC9kwKzvCVAts3BRKum6PgvEJ1gMMZCYVTl
	gYwiReuDhannEDtK+KLszJlJvLZRlNPL8gRzt4FlLd5Xs9o2pCDjlKwSa1kiY/Y3X8YPDUu+a5y
	rHZx5j+VU0W1PQZGOMUzB6Yg4GG1KzPLnlBh+3kkstdF3Mwc9GvmVq8XRkPHiBnZ9TNcZrc5aSH
	PvxLqm2ApxMx3p6ObRE8CS5i3ZYRYCqMQ1iE=
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr398145185a.8.1782210544614;
        Tue, 23 Jun 2026 03:29:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr398143585a.8.1782210544215;
        Tue, 23 Jun 2026 03:29:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be5ef8asm4280364a12.25.2026.06.23.03.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:29:03 -0700 (PDT)
Message-ID: <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PJpL3fRPL2tUCLn67vFTNxBqfO3OytFw
X-Proofpoint-GUID: PJpL3fRPL2tUCLn67vFTNxBqfO3OytFw
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a5ff1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=1QvXDvejAMkk24zzBIMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NSBTYWx0ZWRfXxKfe/IR1Ouos
 m+leZZvMmZCGSCL6Fp1rp7x/lbfYOAWTH576VpftXlm5Wd75tAZ1m5kYaPmg7jQRSBy4s15Ol68
 FrmcbPpARFCakrMyT6bxRvjJGYgI1g0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NSBTYWx0ZWRfXz2v6OQRNIL1+
 bXzgr8VNdAYDREV13ZzHgNfD8MKycffrJ8XnDbpJJwb6yF3W+fEOPfQWRWkrIM5/t3MpmiZpj2K
 LrCiSLSHtTyaMVuJHtikKaPOSrcwibhvYQwvBuXRflTcdLujTTucFcYr3FR/8Vb8GpdPWAmseHt
 IsN6Ayj84j+lMTO36bydhLjIBwn1Nc4zmjIUXOeETK8bRJtbZGuE49ceArGe3FgBf8dpFw6WlH9
 XxH1bJ4p/y2bwAhSLTVje91xzux1EVxc/KCu9y4HQKkvAN3zAi6gvTlYeTFMNU+0yHLb2RJ/84Z
 gdfB4ql8LXlCcBqJ32ZLcDaXCsPQYgcjPp2AVZKOiw2yuMhlpaZjy+h5LGLGLTmMFO2jNAmTMC1
 NCxMBEi2Szd+sfAtlwjPyfjwH5ZVwGAyepV+DRQqpQKO698OQTEDlXQ9EGIrdZKzmlO3+aX37fl
 PW5FSVOaeD02X+GFrDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4992E6B647D

On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
> Hi,
> 
> This series converts LPASS WSA and VA macro codec drivers to the PM clock
> framework for runtime PM clock handling, and keeps WSA MCLK-output clock
> registration resource-managed.
> 
> Changes since v5:
> - Rebased to current linux-next/master and regenerated as a standalone
>   series that applies cleanly.

Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
all messages as a separate thread.

Konrad

