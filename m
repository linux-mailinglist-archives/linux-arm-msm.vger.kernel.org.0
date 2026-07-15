Return-Path: <linux-arm-msm+bounces-119203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TSqsDd5bV2prKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:07:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D275CC49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:07:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gOQitf0p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CagMcTMP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119203-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119203-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B6CF3021722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AF543B4B9;
	Wed, 15 Jul 2026 10:07:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC05430F803
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:07:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110022; cv=none; b=M7jRuNW0WU07ZxvpIgyTPKJxyrMSnWbJN4lrsCe23bqjBdVTllDnZ4iD22fOBVxIV45CCqIf/PnYbH5ODF+YM0Qwd0gazpFyN/bPNnzCVrYAMD+94kD7naM8V07SOPg8vxIQ81G8vuiiMAm0h9Fvgdt+2fp1zAmPxy5uqz3JT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110022; c=relaxed/simple;
	bh=HAknQiUL7XmRLQU4Bw0HEheq0vCOHeI8MTqdQuWXrJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bE62jpica432FD/qZaFHlyyfBg3hNcRuDffhoSyDsPEuVuzoAM5KIrQN9CtiWNY1RpU1BFpfE+vTCSd7s7wZLEdBR/kBWUspAEFt0+AamqIRNjdkaNnz7hhs6lxxCe0e4pqvKIYf2g1N9XkxOP0R4dkW9a19Tr94L/WxAbTa6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOQitf0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CagMcTMP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9ZNnR3319695
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQuytmltyngSmdwciRLeAa8lJF709BV73bAM1g2asUs=; b=gOQitf0psHkK472z
	B58sZHZ3a2Nv9ynQxMuMekcpdfsA3KJH2kpv7IGqX0THVoyE54smidNvUzZadzOS
	AavaQ8y8g60KVbAvZiKOONpzyVMJvnbjknY8/JMwX41q3JLOtOOuMFHqVeK4vHzw
	YT1fSfciLfydzVICHzu5DNVzLbijH6uZT7mgea5jHW7VIpuZr5YzSXmbO0FwCID2
	rkrmkWkPlCnZitEfKoDTtCczy3lBmyM1eu/xj7+ibC/RzUL0V3ZQUgASLn9pRjK3
	Hs4yNkFWDQ2VBqEsL7hJ2o0bc+hujiUVCFzfTfAjehxCCrA16cwZo9hSjMVEo/YU
	2HZd6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q603gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:07:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so97151285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110020; x=1784714820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQuytmltyngSmdwciRLeAa8lJF709BV73bAM1g2asUs=;
        b=CagMcTMPWgpOsSPKkfnG7NjBmht7eVaP5xGxOluTTG/E/657KIvceGEwOmum40GvYw
         K1NA+O6rRp1MEPTugo/+WxMtdFPFLXmd8zApRdW0aN8XZrCMJzjUAzo2vwv4LMzeRjnc
         3pwYSmEgQglqCDo3FPSdI5Nz0/GjTDzLi5nHbMak2e4ctG13A0hzxgxsPljU1UVQwGkm
         5eAPetzSX0OLAVwA+5pj5iWDjMWTaS50q2D9h5wSKwKH2ztYl07bnBSJmX8Zo1QzFeAl
         noNdjVR1MSRIwwZI9vnOlvnsYaJidg7wjYDVwHWSP7Yj0COcqlR0jyX2Lu0BlZ6flvTG
         9OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110020; x=1784714820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQuytmltyngSmdwciRLeAa8lJF709BV73bAM1g2asUs=;
        b=dHGQcntTGmeUE608hhBZDMH/6vCpsEzSEkSU3P4I9r0Yw9+OE7DxO/RISrXxNNe09l
         icbe4fwxoNw42l/8N3MRTyIH87H85AQ70SH//hSdlfX9q7tb+eqd+WD1mnpuc8ZbCc9p
         tsJhAftsY6Ko5dntck5Nq6kGnEntZWR3fLcAcQGR/FvqiTFCpZqjxVvxPJMcFJUZxDTL
         vGplrRCYAZir+dx0heJ4paT0jF4LacpU2gHTohbLJI91FZ95sSvgvH1rnE5jfSCwKiAg
         HzOGugSBDgt8ASNMqPhG5LeFimhFYflSW7jb7oUW3osd1ZKtkNn/edsOKJ3H5VurPi/U
         X4xA==
X-Forwarded-Encrypted: i=1; AHgh+RpEYCbKvpsEoFQ0NgGWNlZv6wOj/RGPuQHeAjgl5S0YMDwH4ohddqTT+iiCefXm0+0hVm21Wc8s1zvsROg9@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZ8ZUaW0Z4iLoPJ4JpmZ7M9v6m/UjwPYHxU6e+Oh18/FTNvbQ
	e31yk+kCW3OhQcjnQWB/AjVNU/RZGRYDiz0AY2vNmCqoI+QLNq76cIyuFzD8Xkg6qGCHYQ4OzyO
	qzSqOnYRG7FZhH6/+xz0U04V+nDJ6aglQ+geU8SyE1+sqDqsoGisskh5ltWyxmnQkyEAr
X-Gm-Gg: AfdE7ckCZMin9/JPYyzjGUV+LWpECABOCk+T9JdqaOUG06roWNXJghErGWtP4rze0xC
	y8Nfh0wdODxopGVDlJmpHhV7JGvclJulRmi048i3gNM0wYYFkMwrN5Q2nd7BURnotqSDgsU4weX
	YlG0Bb1iTyweLcvihHpii/1VV2uRyDPBp+h14ksGRtqvL1RDnUL+uojLWd3LthrVKHFHopPkE8f
	RRWICrMKw5qKKJnyd6tRcOb6jiH+TY9c04ujglRE3qYPT23ckGbaeXXlomXPKmK3mRq1R/k/4pa
	v6EGLILYPho6JtwrLRWxZRaMPnd4nRAv67ms0vyAUTOHf8aqO7cezsy6Ek2i3Wyu//QBaSTQ2OP
	fOkXmXFtaPu+FQi/HAO1gLiCnJY8lJs9dUgo=
X-Received: by 2002:a05:620a:460c:b0:92e:5023:78b with SMTP id af79cd13be357-92ef2c1a94amr1335844685a.5.1784110020086;
        Wed, 15 Jul 2026 03:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:460c:b0:92e:5023:78b with SMTP id af79cd13be357-92ef2c1a94amr1335841085a.5.1784110019543;
        Wed, 15 Jul 2026 03:06:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm1081919566b.45.2026.07.15.03.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:06:58 -0700 (PDT)
Message-ID: <b2c4659f-efcb-47cf-bf91-f87ad1faae5b@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:06:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate()
 return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfX/jeF/D8acXLw
 0aVeuLKP9puLHzp8WcotCCMHew0dly49o4GOZ4wM1uCexd0xR59fDnDxDk/tv+ik4RYtF4QwYR2
 bRLzsqVqQakEqHbIyaOCC7poMJWoC38=
X-Proofpoint-ORIG-GUID: sBcOjhAC8QeU3nyRlPp_mjGNKTkW4DvK
X-Proofpoint-GUID: sBcOjhAC8QeU3nyRlPp_mjGNKTkW4DvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfXyLG8ddPXGhHi
 w77uzPtNaH0ndTscr+Pe2zFXXlGNzW2mb3o5Z5HR1NZxAhl69yhLFt4Vui4I878qc0iYBRlcchU
 WD0Mw4AAgxk/H5OY+TVoS+4KUbtyXsY2Opz4qe6q3n0pPSttut6no75T6ZVHg8KizykU9DWa9E5
 vdEL44CkEr+S/XVlwY2ehUrw0ArZyTh+C61glz2JWVYRuJA96JkYMd6HiPjBM9KxsOEKEvsG9Jt
 mmIho4NKsrPtLQPlNR+0Wh95AuKJPd+Tuon/7GZrwJEjhHty1iOWNXL8iM/PJrXrqFjzCXyzKTh
 +SCg7F9DtpnUxo4+o08Y1JJ8s/dtHrKnTWonS2ORVRFjwZYNWa9wjY111nexDeFMXxUWsxWh+q2
 NztZRlxcU4FYP0mLXwjdiXfkqG1U2ruNHIaI2ioti6EZ4dpjRnSU4sy9E1vpnk+bXRd/6HD/MzR
 HJaBkTRzuVeYISkr5Rw==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a575bc4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YT72Ugdk_NjNlKIGY0EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119203-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 7A9D275CC49

On 7/15/26 10:29 AM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the VA macro probe function was ignoring it. Check the return value and
> bail out of probe on failure.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

