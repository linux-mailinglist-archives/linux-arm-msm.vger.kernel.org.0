Return-Path: <linux-arm-msm+bounces-111730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5UE2Ba93JmqyWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:05:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 170D9653CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JPToVGIY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jNtCIr0j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111730-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111730-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3497A3009E1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49A2396D2C;
	Mon,  8 Jun 2026 08:02:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715933909A6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905727; cv=none; b=RL5W4fBNhms93ArgU50+lxYsvWILHukdX8gd35v5CqYe6qKTzf1RCUIDrYI0/b9MIZVW/A3N2Wr5hdTAs3a5w0RD3JmZZ4nJQBaN+fAuv0g9BKIP0Ktk6uma5bfwrX/5721ewxNJdFQNwHm/XqHF6IlZc+8n/fzLc5y8nvm0c2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905727; c=relaxed/simple;
	bh=eaI6IvA8CC0peKwRQqHGFnazyaoZ+QsnVLRibILeED0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axY3j7Iz4jZoH3tKOiRe+yVeXTaJ7zi1OxHU51Mpy/w8c90hO48K6k+/1E07j7SnqSWAdmhkmiMSjQnWfPKJNEwklP1UcDKhX6WU1sPPiAcq6fMhHEIslYyCHIR5J4d6Cbg5O/ZwrqtINNDV9jIhUoiEsgGdGmAbLf6jX1paogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPToVGIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNtCIr0j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlWA2347164
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	luB0/y1C2J3GY6bJol69fJAcDK7lywSoLu6n/9624kw=; b=JPToVGIY55f7bAKJ
	pPPOgFRoLVpjN0iYleusIERnvhX0NCREPTVSc8a9qLqqSEMpj72jGrDH2rZ+y7tW
	/irDT8ogPBQJMUglBAteAZ7obcz9IRNsrMK44M1D8fnYqjWxPIrbzrTGDYj75vul
	Tm/cr383A0dfdK9DW+rYynUKAt1o5r9lnYKHCGjZJtxGpY9sCSSZj+zsbteZIhX8
	xhHijH/fhGzk4oqADQZF314/xq4yokcEdr803EVIKo1PtuM4rG3q0VXKzY9RdSFx
	Q5qMoki1mJRHb8rqLZu2dHa+NBU77oUD76YVPMjAQttqHbn2yVcOHSzW0Ydr8ujq
	y7kxUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrexwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:02:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915737aaf0bso114371885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780905724; x=1781510524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luB0/y1C2J3GY6bJol69fJAcDK7lywSoLu6n/9624kw=;
        b=jNtCIr0jjexDAnMsqyP27gaMTdyweyljaPo/H6gPxp934RViSDqv/w6Qk7zxPLufr1
         IcZ2OfUyNigvF8aPuX5+h/fWFoprVZ52yCk32eCoULAVAYYJp+kFS+Y3JPyLtO6gcKuM
         rNG7+Au92k/VOSMjvA5xXC42+YJtCE8QFPQ5gb1laeuswPgZM/X5dKm7a7KB33Pcg+bW
         P17D+hwjvHfGt+17TzYSTeJpqNl55vKgI6+bDg5qZ/zyGsHhWeyUZAZ2NKSLfvNokq7o
         sLY+s/qG88ado7XOqYrQYGnw555rh1WfVkN/xuyuQrSRvO4X+nfGUSxX3ii15a3EtnL4
         cBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905724; x=1781510524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luB0/y1C2J3GY6bJol69fJAcDK7lywSoLu6n/9624kw=;
        b=ACztKL3LJ6jeSLN5IUCDDIfJdB3k/gzZd4IOSdfn/FZmln6n+KP1yFwwtprqRsexmb
         kaBWQ786HU0kSB+Aj8SHXOwwNu0sTV5374sorLN7CoxM2sGSzpd+XNJuGQYULVeIJBK6
         rxiVsiaQreT0I8/LYf5Hc+ZmidcqLLX2+NPOn+eYzE3WJDjDnn4NmfZZvrd3hTgKVwss
         Wb6ai/mYzaroiQwooj2lNQExnYI/F3r/IgT+DssbOXFhvYPf6bYQE003zZxW50ULKPPB
         Sqv3ikvgTzdoSsnJ9lKvqrkO7zzmxoQViRMdpgdoxzsRlGh5OBRAGx6Yzf0iWFq+OBb3
         qjWg==
X-Forwarded-Encrypted: i=1; AFNElJ/V4SRVXDGP8S489mhOK7Dhz237vmY7CUzri3JyrqIHdPN8fSbWjGXHkgAvwJ/IqJPhffJ0R+s9LjmqiHfs@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkPTlKvIJtpXcn7o+KGMWDhNdYl+nkoh1JfiLzQ7v89LIJUST
	empfVB5jaUVnE4bTJCyx430bYkQzd0CUWdK32i6yj5U6slLSqUiZu/NI0T1wYgrBaBtvORo560R
	RjfbQ7Aq+h9s/iUNZLf7PmT7FXrighk/XGfw2k3kkdSIRacw71KWUM6grTeo/2HeFCWwQ
X-Gm-Gg: Acq92OFnqUN0L8jJtD1sJd4UEG3ooP11bw+79YGvn4Pzb2GSIF6UMPOFSH2mv46tFEP
	3Wzb9hO7bS4reBpfK6Mo19Cj76UFGyOvToSaqwaxTub1eE4jVkkdJopZJbdTaRUEOsk4HpeDoAV
	HpVqYQe/+Kahsf3hCibzJBYYUbItNT+RZKbo5Mx2ZHIEoVASCEg17Bm6UwHkI1/4kxJayNQuv8s
	bDzV81gv5twrM7ZOGet9cpdDal5cdbVk0Q6j/FgU6QVrSbiUYigp5FfdsZ+kuYyAm/s/otdsMTO
	BQBQa2n1KeJUcX39xHhP7sthfKmfXrWNP3LwGU/mxg8abWohYuZT33ReoZTisGYssR9gQv89HtY
	vHixForUDI6TnlMUTtXeq7s9wPvehkECUzSBJHXciGqnK1BE2kuoz5lQT
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1397044785a.2.1780905723742;
        Mon, 08 Jun 2026 01:02:03 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1397041785a.2.1780905723227;
        Mon, 08 Jun 2026 01:02:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65868049sm6655703a12.24.2026.06.08.01.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:02:01 -0700 (PDT)
Message-ID: <aaf40cb5-e40e-4239-bf66-4f21252bc8cf@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:01:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: Annotate flex arrays with __counted_by()
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: kees@kernel.org, gustavoars@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607111933.6398-1-med08elkadiri@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607111933.6398-1-med08elkadiri@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MyBTYWx0ZWRfX/bJOeMFoYynm
 29HqAc94lhDOCx94PWb6zuP1bSDHJR6BIxweCimA1fW45DwAfWgjGpDZXf/bOSVS8uJj09NpJew
 DULvu3LdKjgivpCQcK3esgfA5xIFwRk3AjPaW6nXHkrnVszpaaHx0YNZVfmZfRVMWZl/nWObjpu
 EqW4qh9d8sKxG6/kT7peHN1rM0C5gd89kkiyQY0FUHbdwOWKepXs01ocC90/MUHtISbkMJGVO2w
 6t9pd1+UwJoorx/18yEWCUx/JXBWxA4swBWA7uGlcZE0Gwx+xextsOWD6qZnS/bMo6iF1fk6jUc
 mLX632NiS4UBPkfXOr97qgRbv0J/b1CDygCFHGiZzvgv5KM0bdqvlt341SA+K1xpDoPRPxbO0JB
 lziv6ybToq1zu9tMOYpj1WgQqpdWNFhethcyO24GyITdwSnJV3JrbpgExTwJjuNl7F0RVvd8T5P
 iyTMAS84OREMGCwvi/Q==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2676fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=J3NlhzYKM2y1xIgm7VMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Dqu_24K0FqeiDwTocCUB2kTj2FfgAsv0
X-Proofpoint-GUID: Dqu_24K0FqeiDwTocCUB2kTj2FfgAsv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111730-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,quicinc.com,linaro.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 170D9653CC6

On 6/7/26 1:19 PM, Mohammed EL Kadiri wrote:
> Add __counted_by() annotations to flexible array members:
> 
> - hfi_capabilities::data, counted by num_capabilities
> - hfi_profile_level_supported::profile_level, counted by profile_count
> - hfi_resource_ocmem_requirement_info::requirements, counted by num_entries
> 
> This improves run-time bounds checking via CONFIG_UBSAN_BOUNDS and
> compile-time object size resolution via __builtin_dynamic_object_size().
> 
> Assisted-by: Claude:claude-opus-4
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

