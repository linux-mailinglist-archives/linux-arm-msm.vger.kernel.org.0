Return-Path: <linux-arm-msm+bounces-102262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO3WOkT+1Wn4/gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:05:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E773B7DE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 561B53014116
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9C3358372;
	Wed,  8 Apr 2026 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/9RvnE5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaYL16sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0983D2D0C63
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631831; cv=none; b=DaER3foqdf/cDpzC4w3mdGyZeee+gHxNyxPkngat7NJNkjoAs0Tl26zHh5ls6UTZHusTBpvpoisdMhv0aZUjHYSEEh9SnZ9zEMyZd0um6dlKBxssKV27V3DAf5iMe4WzAsoSKRu5V47wqP4uJhKWPYIdJOS4/gSJ1QSn+l07/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631831; c=relaxed/simple;
	bh=X+1A+xZyFYlpT66RioT/eZgt+1+TF1klGlTw6+GwMEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRxD2CxCXR3G1NUDQfAnxzWMVqDSFel8dWcvuoxgwYqTK1J0dsNr2sPwvNsMRv4qFr4eeeV99utlJgsMoHyWykVnvGueNHXyae+Q2exE1VXnxOELVisJxM/bdf1pmNnjAe1i/M+N6rKEChuXEpT7tdzXTOG54toYvbXG/aRXdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/9RvnE5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaYL16sy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385DE2X263869
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3aPs8J0HMMiCsbxBm6aZJP/XCCXyEfunVTiLlJlVb70=; b=P/9RvnE5YHqboKg3
	2byhUh/nZDhy+f4uTEnWgx9QTO3t1gKGFCopMAJ07XGimtFW17Pbr28x2ytQ0sum
	L/rEvcPH0EIJQw3JjvG5x4IRYxqpqngdzo1f6F5Oegz/6AXPBa4jOxXBs2oaaeTD
	HCSWNAF/Z/hroBRw7+j2sQ3RjRT2R3xSfexbLndoMKMyfHiCcbX3JCsbFk9bepq9
	FeV8fcBYrCk8DegBRIY9PfVf9d3ONgUptZRj8WhqO31SerEOprCwuF2VQwULxdI5
	HapMQEM1S3ulnho1nvDW3mXy+NbVoA3dg8ZweWPW4K/towr3p0h7qNxDJuxYvPSf
	w+3bRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t21ytm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:03:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso5638609a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775631828; x=1776236628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3aPs8J0HMMiCsbxBm6aZJP/XCCXyEfunVTiLlJlVb70=;
        b=YaYL16syk1vyev0js2HtEhQGTfTphMf4vuZerr9r5LXriH/Ee25/nE16BsHuuHR44p
         3qAhz5u12ugSvCaNhfu9qVwDiVwcbQUB6fwudfoWoc5836P+5vn47EFY340iALdaeNfl
         vi97sIAT4ciOp50Jwk4ya6Y2EAlQYgysKgLokpn62lWV0ckWM1rHtrXVT5CK1Ac+dloj
         EGQ2jXKitwkkhF9BZQWj13hfXAOJju9ZIO5vXDEVbKlIclrRzgbxDCdPk/uiyfpn2EFL
         lpRAKgLl+fMPCi/CCJoI5fmsa5aYh1FqDkASXPALmkg/yTtxpU2l7PZp1s0YGk1C7aFi
         /xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775631828; x=1776236628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aPs8J0HMMiCsbxBm6aZJP/XCCXyEfunVTiLlJlVb70=;
        b=Sg/+X3ooWXfOMrltfXeaF+TgT/oSeM7JhFtEFuFDIPV/Tz4GNjdnZPYb965AFnA0eE
         ORTSA+LTtrRoCFNRY9b83V3TIegnQX5SoR8T8tcTLyctjqjAqGsBkKUj6YPzq6FGhSyl
         8fiDMIlEjfychBrsK0P0GwStiGheFT5AS2rV8AM9JMXPf9XE6LoVab4DoZte1uXcLFP6
         QLAzHwn9DxpST4z2YbRb4VZ6364grn6AaG5IIco4KjqF52fh6t5qAt0jxt3nu36UiHfe
         lAWAp+VlhGI/1cAmKDbwShjtBl8Vm7P6WY+D2Uuthy1kyMubHXFRy/GztYURz4S5TQfA
         5JDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWl1hQW6JAtnDSoCeOqphSJAsQoeH/Mb7ZCKtJPORWKC9ouX7cwzKznZC2lfeVXXcLU+0O7+UMv/i9zprk@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVDY8qosSZ3pQckcD3h2XWJ9HCfkGZTSucRtttU/LWMUUcBVD
	qXpLllaJuLhe2CUiewIFbPsLuCyvnOS+ig3GHlHLM9bAHL0p5fCsAiO2psU9tyM2iK/lTBFFPuA
	8LiHfqmmtJWoEjV+5AU8XbuAAV5ZnBjoMqOMxZ0gnVXyuOHEa8c55W7yoFDxDuU4wiGQz
X-Gm-Gg: AeBDies5Fw0gjNeBoATPsdPSdEQ4MaKP38CQpM9pMy/FmC7wiyagvH6a9SyV+5DaeZL
	M03pJNetfq0QGmzcehfgiowChhSnKP82U7NfCK8S3IJXRO0Eq3tLI/icGBS9QSnBWx09j7mCGo7
	IhFt6xuQGstXiul9Vk8L8Z2kreP8XQGTCLQdfK/HDOIXhq562kbab2EG2EnsaLWLYm0QSrZJjP6
	71P4g6jfxL+UGxJu88iYFtDbZOToyPv87EoMceqVTyCuimfylYjg0/bXML4vCrpK5QPbTtAJRfI
	sHhENzEjoeQfGvOakP9DBYKfBoQ48UM0ohn5n3JsTS20VfyI3PsZPGSfPw3d6zKGuHwG0IPNdIO
	ASjl2NVQbtkPs6Ou/wKWyBbxzlBgQQL4Hf9jNJnFQBP64de31aA==
X-Received: by 2002:a05:6a20:72a8:b0:39b:89e0:2e37 with SMTP id adf61e73a8af0-39f2ed7f89bmr22911607637.14.1775631828528;
        Wed, 08 Apr 2026 00:03:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a8:b0:39b:89e0:2e37 with SMTP id adf61e73a8af0-39f2ed7f89bmr22911559637.14.1775631828023;
        Wed, 08 Apr 2026 00:03:48 -0700 (PDT)
Received: from [10.204.79.79] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6563c43sm17162654a12.20.2026.04.08.00.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:03:47 -0700 (PDT)
Message-ID: <4c08d702-af44-43a5-949f-938d6b99933c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:33:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add missing bug fixes
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, quic_chennak@quicinc.com
References: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d5fdd5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u17xUTBXOzVR9CVgqsgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2MSBTYWx0ZWRfX5augsx7poQ9s
 /J3Srw6k3a2/FsCOqJFHYypYt7zFPn9yerW9iA9JPoO5GWQH99lmW/jpTOUJ9WE+0TGr95oKphC
 j386/QEr6OrH8XEMWU/vQIJ8qBewRzWHri8lMoRAC/4+iD8mdjCju3ePDEfawDEVfCaTEPYScvl
 JoU5IfoPqKuoxxH+CPbcU6JxWNiBG4LBJS1j7yRE/1tn6hWxTgl6EilxeiARB5xOBJ+EFMqm7Fl
 +p6U1idnp8NVHr84t/qhhwUt7ZHdN/CmoqEBifXXRuxoFLuQjYRdHq/gxbrQeZPle/qTSiWXgLX
 3AMzE6AwRiRLB3V0mr2qVPQyFQ22/406SkVIJ5UxTdOpHBOGdTscRerzvFrog3uAyxgct4MuFey
 wgN8Y+57QfqHA70Og0ugoU3e5hsu3BOT1uRiE719j/b6jLZn/ymeTyEEmtK1bfI5r/dyNBRc7fp
 ZbN+gWyAvdemQtxSOUA==
X-Proofpoint-ORIG-GUID: aNU4v8Wmx3PD5LM194mY0KOg3CDXF_g8
X-Proofpoint-GUID: aNU4v8Wmx3PD5LM194mY0KOg3CDXF_g8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102262-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47E773B7DE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07-04-2026 15:35, Jianping Li wrote:
> Add missing bug fixes in memory areas. This patch series carries
add misc:fastrpc: in subject
> following fixes:
> - Add multiple fixes for remote heap which is used by Audio PD.
> - Add safety checks to fastrpc_buf_free
Also add the details on the logic to completely assign the memory-region
to audio PD during remoteproc boot-up.
> Patch [v2]: https://lore.kernel.org/all/20260115082851.570-1-jianping.li@oss.qualcomm.com/
> 
> Change in v3:
>   - Adjusted the order of the series, placing NULL check changes that are not bug fixes at the end
>   - Modified the commit message to describe the bug background in detail
>   - Switch buf->list_lock back to fl->lock
>   - Add locking to the operation of audio_init_mem
> 
> Ekansh Gupta (3):
>   misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
>   misc: fastrpc: Remove buffer from list prior to unmap operation
>   misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
> 
> Jianping Li (1):
>   misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
> 
>  drivers/misc/fastrpc.c | 130 +++++++++++++++++++++--------------------
>  1 file changed, 68 insertions(+), 62 deletions(-)
> 


