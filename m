Return-Path: <linux-arm-msm+bounces-102524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDU8LyLp12msUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:00:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC63CE62D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF9743009F0C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC9B3E1215;
	Thu,  9 Apr 2026 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n87eBuju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aafETJFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998EF306D3F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757597; cv=none; b=pMaAHwgMrkgyoBJGoqQrd8poptWH3hZTPFz3T2iBWYpo7qszduzza3d8XBM4EsiTZ2Ds+WnzwU1IqCWSrBH/DiWCkaZOEelarZ25Qt9/zK4BQUgzUfClL/hse34VFhljoT+fEAwIsxWOPYeVpa5n0ZYcUjNyTR19lYu7WEAD72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757597; c=relaxed/simple;
	bh=UwTKJqIuXUGJa437O6+rI9hIW9lYlI4aKyAu0vnxf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoRhpyNhy4Zq39wCCZXdhI/29nWrMLv6E8DiSH+Ep5Ntd1Zg6rENU55nPga6Os3Y1/X36zxFx8jWg3kz+NkyO0CntSVl9Ob+CmsUCXt0tqfvGTpN46BheDdW8c7LRKLJ1wRpqSVRKIM/GqcSvxNEzb7RCwb4tNTpR/kwQoKVgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n87eBuju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aafETJFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CeumS2866413
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=; b=n87eBujujRU2JwR2
	1pIelmYVDonQlfkw1Ws6dc4xep0H4alt1HdgclQIbVe1kNshz3Mbxy9r1rCtpd7n
	270B2TpPizMz5WZrGshTol3uEPouMsr2EVMWKIQcV39W3gwd7htEqQ86mNz2RAZX
	spm/5h8Tm01ZlxJWVyum5ZYr11TyXoECE8JHyUiUtzYxwSKJO/2+2ViGPf/77ltE
	4h7fP5h+84Ceq//LImlzmiTWpBMNjbobR9fiMmtcC2KgFjxl541KcU7Rc8or+fPI
	WsdMe4HKdhh1GhRqTDqCi9Q1Um13VjOezbTpf2d1qG+6NYO2U+9VigmuGLcsxVUU
	vKMhhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayh8rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 17:59:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1568610eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775757595; x=1776362395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=;
        b=aafETJFR0zcxuymhyNvgLc9LHglpSRw7COw7j28oVURMu7bkyjXKKOAj07UKnQXSqD
         t7LgI6o67PhZaj7Wf5GgPwphq0UMZEGkByM9ajkjq9vnWryCwti33i+xW4/haBzwIGcq
         TNpvPgisw+xQXZ5gX/ibzH++/J12i4aQ+9DjuxD/0DchevwElLlC0+BgC2LIPaMQcmwi
         fW0nAfOD+kzVuY2ILFiBzjrFh4swSBwoIHDZuSX3SZrskTEe7qE1FllJZM+v1ptMSO16
         PCRbJUanR6EhXsj2Pkr12hFfZIhOzPoAEuHJcPQ/QoiskabZzZOpQrKpFskyNvW12gwz
         I9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775757595; x=1776362395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=;
        b=ZZ+8ETX9Jh3urska3Rg9PiQBCWDUxogHPgN45FZNUioa/16/svfpFaPg504dBRcOOX
         VEOXBYHbjf8EMHbBjNbxq7qpRBdBoGLQD3nVRmqSBCSabgUFPYXhjWUDHPx3Ti/8XluW
         NVg59Yi70CB07s55oDNpNZpdcjPSlfRB03scvgkMjyeT7+BZ7XGA7IpI+/DqhzLmTaQC
         bza1pjiAmxYMBN2B8xKQRwLoQCTcfp6MiEtKD0ADbNB5OwbOyF6N3DgVACVZH80Rd//4
         X9cPF9eBKneRRHXtFAbprFQhuhmJfkywiu7WZpIQ7uwCexkVe1hLwH6l+EmxwOqL9t9w
         0PQA==
X-Forwarded-Encrypted: i=1; AJvYcCVfHUNe6POTIl/38yKrGM9bbhXD8NeGkk5JGoyTmHcCWDmT2FI8+9cAd6RPf6FQz5Kh7KawS7ih0GFU9qgv@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQLtsQvFpDj4430SaWY2ciFmeTvNbsTXVzyH5hUJL6QLLIslK
	hUlIE+KkCJaJSWgZ2Brl/qGLRXKFB5vwzWDy1hAsRCsIu3vx8WvDmPFlqNHDaFSYkWKhc0zkD/z
	7c3dGJO4YSIGDHxlBgwX/Z5pk6ykGoL6Rb0ZRXRRQFcjfXBwzFJpro5Y5nzGutYwzK1oD
X-Gm-Gg: AeBDietAT6ykiuT6yuH9DnGeChqV2xuKMf1332bksT/bKrIM7qEu0Ki+4ehv9bFGS3Q
	Fha6Ne6kJqPOLIKGPjKnv3JzFRSU68YB/bulFucI3QgkCXyCufhg09vS6xQJrMgo8fmenKIsZBL
	bQCmblLPM+2+S4t17Dhc8r28erV5D0mVWMLTbitQz5ynblG6gN7gCjmE1L1ZfQuTJitCQ5hqcw+
	w6cwdqQbC/1whiadSBbFOsByt8a/eV9lcKprJhqpEsFMpiM6CfhI8MELTXP5d2kZ3cq6//aFQuE
	EnateueJaNDFrgPY1IsLMx8EDngdpGW2OEe/ynV+jRN16PrmAgI3Siyip5WEus0LL5QHAjIYSDJ
	NlidiMX9UfQ4Bn6LhaifKILQzniQHPCAi7QRDVqL9Yyb0fTZ3L0Elf9A=
X-Received: by 2002:a05:7300:3246:b0:2cc:3684:d1 with SMTP id 5a478bee46e88-2d589cb5e3bmr26042eec.28.1775757595240;
        Thu, 09 Apr 2026 10:59:55 -0700 (PDT)
X-Received: by 2002:a05:7300:3246:b0:2cc:3684:d1 with SMTP id 5a478bee46e88-2d589cb5e3bmr26018eec.28.1775757594609;
        Thu, 09 Apr 2026 10:59:54 -0700 (PDT)
Received: from [192.168.86.243] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm779899eec.15.2026.04.09.10.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:59:54 -0700 (PDT)
Message-ID: <78cc27ee-ff1c-4c98-93a6-d108bc6f3b2c@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:59:52 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi SoC
To: Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
 <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7e91b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NgZ62R0EuECE8gCXEp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NSBTYWx0ZWRfX19ppALothJJ3
 Z3yPOGdSM4inb2r3AIDHA6NgPK6LLsr+pCAuEnl6kSAMiggg1ZjqwEhdw7F21ikxe7Nkh9kBL8q
 iHs+mzsFBe+pTU591oFvvbLkuqgAlXd2ii+e/ugkChssE200Q/3ieOxbU24574nHDO6ktAiTG/r
 cdMcztF32KZOE5APiaBpzHmUQlPWIeutfDoquI9cYskE90G/LGub5swJ7vY6T0NXJgoEe+qfo0o
 6aEPvrbnMth0r/yTF+g4/aSerYZCkVRxJHxnWVyMPlsCw1Kz33xak0fdppEN2cxlSu2KKXFcng5
 I89wu9x/q9UsajQZ9wbowXQoaILRa4cCC6VwgI1q2miTPHGGuAIQ/7BaDN6QdGQM0dSL42OiuSd
 C/98xgSDC8svFMCufOdgBXpf1BCfasxW8yVtayuaUcw7rUXr0m2vnClLGG9StNNpKZ1DlrC1PnI
 YBAsWfn024dESV+TSMA==
X-Proofpoint-GUID: yKPrvXCctcl4SYlF4rSNfS0wqaFAXDTU
X-Proofpoint-ORIG-GUID: yKPrvXCctcl4SYlF4rSNfS0wqaFAXDTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102524-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5AC63CE62D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/2026 1:53 AM, Linus Walleij wrote:
> On Wed, Apr 8, 2026 at 4:16 PM Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> 
>> Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
>> Qualcomm Hawi SoC.
> 
> All was reviewed quickly so patches applied for kernel v7.1,
> because why not.

Thank you Linus. 

---Trilok Soni

