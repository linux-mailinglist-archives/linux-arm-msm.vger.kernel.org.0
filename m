Return-Path: <linux-arm-msm+bounces-115883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id toEmAv4yRmqELgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6516F56B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:44:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BHubG9ux;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NUaXxreg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115883-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115883-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCF2F3024196
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC25447CC97;
	Thu,  2 Jul 2026 09:35:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201735CB81
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:35:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984950; cv=none; b=Xf8MHSdXWR3NnPAZH2tlzTl8Yh2wXF9ScgEkVPApIiERtUdW3RE7+vDzPlns0+9KX53nfiNJdUnpFJP0hX4eMGlso2k2962gUH190XYNQkKO5LFEc5ybI6OjNJlXg7g4qCToKiQYcOUxukZBbvOqrlEUFnxl3/wyb4cHfb68rHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984950; c=relaxed/simple;
	bh=/v4JVXn/IGpTDr/E+vAvp0q3qjBU/OGcsAmTaUF6dCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLekhoyeIBQ8w7LWGLEH4UGoDrnggR6vQh6sM78BNCHcDmnkOSqXkg8EcLhhMElE0478+4n0rXJjkMf3/UWy+AuB4I9vzb72KBTq7pVDqNr/Ky9t9mqfM5RmA3aonKB+bLeG19tF8YmCUqLEvVMu7TXn7bQADQTHEWfy/X125j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHubG9ux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUaXxreg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KMEV4115608
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	idJQTFK2fsEmc4tj5NC6v5WdJKyxotJtoQ/VbxlsE5g=; b=BHubG9ux026L/t7N
	eMTXYU8reyfXtGDgtnRlmK3LsWLjP3Lw/LkKK+bsjKIt/H/gFrDio24JAACKDrDK
	VxIL2R86c6/msMrKP5iaBoowj9GTqFGsT7CFqG9gFudHV8R/xV5+leSflgNOObo4
	Y9jGrHoHu8OABJm3SUjNGg4J5Yw0wUj3fjgAFCQ7QD8P+f3JMLB3fwY2N15kmVkf
	xoEndgZmRq1dJiEsVTk8Qk5A6rEnd4ucMbsXKqG1+5R1Nhj0q3Vgb1y36RiqUECY
	l19l8z0cYUbSHaJwia+8x5RN1TZc8XEl66Wk5c2Q0tpIYgpa0fzlNMd3TmIPgvL3
	M2q3tQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9401tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:35:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f2747d334dso5588286d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984946; x=1783589746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idJQTFK2fsEmc4tj5NC6v5WdJKyxotJtoQ/VbxlsE5g=;
        b=NUaXxregqPts1cMo55B5tgi+5Z5snvZR7MjUETGBllqORXE85klEg8eTDzzGlMT8F5
         FNHdOrNPzPj/5X8oRnu3SPo/VRIjVrAUzNUfKnSkrsCBi4gab4ZXBZneU8uUlMIgCJYm
         IsanYrfeuw0Sod+MDGwSOxffSQuIBzh4MYHH3ogiUSbj9p93RkAdpFMo2qUh76LpVtFT
         5SHciu30RpkEYpBW48C5cbB4pBdiEvTJlmnnRKJJKqLyMZbI1xCWNl0JweRM7hDdi5Qx
         6LOaun88ObJdiMRVCEmAmDI5hGJy7J/guuEUlbUHBgPjMx3GK0G1Pxr+Owq8eLxZB7Qj
         sWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984946; x=1783589746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idJQTFK2fsEmc4tj5NC6v5WdJKyxotJtoQ/VbxlsE5g=;
        b=areN5UtE1j4mayjDmnsKWraRPOpTJEWVtEAHkkIAVsL3dus/fCcGVNglVy+6YK/ov/
         pRmCCOQxuStexBW/KYPyZ5uTQK5bMIM/IqBnaFxjBzxBYFggbTV7SN/RVmkyvQhN9hjE
         fQd1m1R6JJNFykMaYxSXpAQ2kmZN/q1Wtwm+HsGmiXL+D1E+nuLxyNDAKbEXOmnQxyva
         A1W4vgh523BE52yLzkdZCxDHkDrEXA86NRIbe87vFGMC2uuAwX+7Gqd9hb9W1kMThIfk
         GdERKzskioT/KBogCBQ9p3ogk5xLC+JxHcmOKfMTIToezsOT0DCMwnMsAsR1zzR6Rw9c
         qIOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJgzp9+QnbVVoviDjnH4Smg3F/HoSsQo2u4TQTT5+YKuSb+X8Vxcn2EXjHShaFqlyFLiWkJIuAslCFuKq9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7s5yRGDIuDqKq8Tr4/dJCYFsxAItWD7z5j4cdQ40AakiF6E1m
	UYDTruyIy8VuRPd57M200YI9iiAyCZC5XbUQMrWecBrsN5KwmFoyJpygOp1Suf2GIWgeddVgvwS
	Y4Lzp6JzOhbpwxBEInZINqicqJB6eTiDZ5xJ7SzvVJ7yZqD8e9miW7ahiSmHT9lqVD7aU
X-Gm-Gg: AfdE7cmWHQcdHyNLKsg+UFsXCyavngPHVrGdl/IB8RBTuww32caB8ESOWWLZ0dfA3eU
	rOH3/Wszlln8/ciWeqcaQY1UR8iVJX/VPssPlSY02x4kUWAhss6YgicF6W1o5YS64ysAW1fkDBe
	FlAkK7q/2LgCfQOeZdcoB1h7yf7LbXcizfh+gYM5JkZpPP1TJmRWHnxv7vWeuYBGpEVa01vowkM
	GSP/d13n3gxJXp9Dbervfi/VdWkdYwN8ThRqQAAWNnawQt5WbaJy4AsrDpkgWLZ9jpuzi2Frr2f
	QPFNJT5Rj1UF4gnLHkBz2s9sW2VAWH7vPWDBlTrJBITXGyo2Sxkp0Nw+1aCR7Z94CiGjJSUz0a2
	8QLSEWLCfMOOulC+GSFfQJmEHe0KwdfGko1U=
X-Received: by 2002:a05:6214:3911:b0:8f2:28b9:bdc1 with SMTP id 6a1803df08f44-8f3c9da9d4amr45695366d6.11.1782984946257;
        Thu, 02 Jul 2026 02:35:46 -0700 (PDT)
X-Received: by 2002:a05:6214:3911:b0:8f2:28b9:bdc1 with SMTP id 6a1803df08f44-8f3c9da9d4amr45694936d6.11.1782984945548;
        Thu, 02 Jul 2026 02:35:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad11981csm696520a12.22.2026.07.02.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:35:44 -0700 (PDT)
Message-ID: <55ee63da-21fd-4e41-a36b-26ba2fc90979@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
 <20260702-xo-sd-codec-v7-b4-v8-2-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-2-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfXyQxxhyzTOqMk
 /edENOjpqXJEF6k3OsQ4ViNVsRr3FhfahWrUPwDGZtnHrcOJJ5f5HdDryk+Hbg2yt8Jq7/EVxZX
 ZpS3peusuTzk+8t1Emlkd06DlNs6EyL75t5Znfd4u8VUL8hD8mq/G0vSbxBNDw5lLWGnk4wBZqZ
 W4b09t3XMSjRmqyjJHOo/sB/3IQOXWcwqPfEswY24pMcd6VHSnuiZkFjvEOKCS++N5juQ+WgXJS
 dreUukglMZlY9/PdJfRVyWG9a0LLCGVtrMML+jqsQrKDW3QQFAPhT5z/JG9IDMZLDxAt3oQ4QSy
 2CcykkevM5jFU3lLJ32jfMte02y9Zz2NpTRes7C+gqKT1P6dovNT6whiHma9Ctg1ZYCljDeiPiO
 xveUDXrvcmCxpsdKAlv+39Ky9fg9sas1m4EpmPLZyigv6xtHaEdOkrJp7e+uQGmlDsYS5Ho8BNM
 TIn2WkYJcncZEs/NUIg==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4630f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wa2ivycgFbbobwuY4j0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: D2EnnUYDHjcMSKmbjpxlXWGZKnDCSoG3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX6vlTyJkyBJxo
 Uin43sZOaGjHJoHy4Teh6XmJYrjUVVt0TzNyvtup6KKMS7Fzby6rZTq1MFNGwI/SP/Kc7V+g9zE
 VyxnywKjyQLcyRxoRXgU5rf+zcpxisk=
X-Proofpoint-GUID: D2EnnUYDHjcMSKmbjpxlXWGZKnDCSoG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
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
X-Rspamd-Queue-Id: 9C6516F56B9

On 7/1/26 8:44 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS VA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
> and runtime PM callbacks, and keep runtime PM references around fsgen clock
> gating so PM-clock-managed clocks remain active while fsgen is enabled.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
> introduces PM clock APIs.
> 
> Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
> paths and restore regcache state correctly on resume failure.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

