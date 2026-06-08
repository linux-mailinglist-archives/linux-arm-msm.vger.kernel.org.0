Return-Path: <linux-arm-msm+bounces-111832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlHPExydJmo+ZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:44:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B79655472
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:44:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AlDuD69l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MFC1tTg3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B035130CA4FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AB238C2C6;
	Mon,  8 Jun 2026 10:36:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1303AEF23
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:36:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914993; cv=none; b=GSGBMBu1x5qftpRRvSFs6pKMA1pfxqKS/khgH/u6WSuxHwmdQ2JHE1n8JxlIVLGBHa2Eg8Fs30kcX/VssooUkpgRFKjFKbto0EWZiCFAvyAnmnNSXYLsv7ICApSny5ldZ01Sx6bhYTZzVELhLhc9JuEI/xndYIP7BKaMBA6Hl0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914993; c=relaxed/simple;
	bh=xueKkhHn5SxTa0rE8+SCQcYUGJGPna24rZlLrLKUJ/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKzEo8jYYV+2Cq/Rjvu+VLG3LLN7h5JOrbZFgR/GOjB5+fa/3xA84JVUNefY8AlIqcXoZEMnZ5kWTdQRWN1BcGYWGB8A7N/iRl7yNDsT3O1JMJ3ZpU6dHd7p6MCrZERgbzYprBOV5x04h0DcSivYWNlNiDUuAlF1TO/b6jZtQoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlDuD69l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFC1tTg3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ou8m2832965
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImZ0Aq+n4EK2FB5Lr3zyUFNgl2SmAfecI9pM4VllFJk=; b=AlDuD69lf2KHVjI5
	fjhdMBSy85Vk5gTp6mX/KvR8CQR3Y6Jm53vmQN06K2H0+wqDFERpVrLkOyp9cFlj
	Sh23TPISnh/Dz/0JEjD4Yvq0zNCIMyUf39r0Zut75kCs7B8zLbmlTtJB8wKDJVZ6
	E3m+58mc39+olAmgl2BG7JEL8X11bX6MuHr8RzhFwdgZFvwigbqk9iKgoT14aW7z
	v0kj4Ai1wTWE/PCAJdgZhZ1sMmcaaJu0tqNz5BkTu+IO0KNDm4rg3TXljlcNwV8J
	w37hP/l4RXppynfYqM0en1rPp14zI1BcghkhHpBAXRBdoduKkAQb6wgF2bydidX9
	g8xkdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrffju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:36:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bfcd629eso54861575ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914990; x=1781519790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImZ0Aq+n4EK2FB5Lr3zyUFNgl2SmAfecI9pM4VllFJk=;
        b=MFC1tTg3C4GdGGJrMgrQBGc5fl47pf8Ax+Ih0WX7CAcF8f/5a14Qr3q8YvChtzaNTB
         spWg1Y3zA/foThbID8hgXN3ljjcYANbWxqnHFCL2WZyUrZkGiOAvqqZGIeNfmMEswTmR
         5RM5nQfYj+I9YGk/JKKJSnZKPE1iptQMbLeLIHstNB5orS4eMA3hMWh4rcdB4IhQwVJq
         MxoruomG/1f0GIGVz06TbdBEFsGsEihbsglVQjj2Q745NfsWaB5gCMFreNHkz5bPee6N
         Q0CJGfMsbLhTi/v3KmgoFBjWYq8t7pQl687AGTU7CSt+fTONkDQ3D0oR1VW4Vb/FYmkB
         fF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914990; x=1781519790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImZ0Aq+n4EK2FB5Lr3zyUFNgl2SmAfecI9pM4VllFJk=;
        b=CTiHppWEfBRRGspu2wroS16FSpyxq/UoxgbXzEE/oo6Tc9P8MFY5ZJriglsSvgksDa
         YV1NDa/7c/Oo5Ncen2aqSkQ0dvTgAgcpme3MdSJ+Ck5QBgoJFMUqKsCcfZY3Kzjcje0o
         t4XPfNcFD2ZrX190cgHTmDXUPAULEpYBygIGljiG89T+2LhNQAPAQjRJqEhtzVavJcji
         YK3RQLxnynXaSL6EX+EKUnvbfmsTyBRn4bSbqr7OCTUUT54YhF/yT8g12W4q6zqytxIb
         +fhBz2pg71Hm4yxoZrM+tlzCAdEttt5YC1YF3zE5VQIuCpVU/QBU8CgztkK4kZ7MR2Pm
         Bf2Q==
X-Gm-Message-State: AOJu0YwoHpb8nvUe382Xt+QByRefcQ7u/5m/Bk9ZozYjvVN3XrQ+4O4j
	7ZyxkZIRR6a/N/DEDO3xoxuz/O4JB+nT0VgGUop/VUT9YbTdaeWFwikn9wibn+HylE4rwVTZFot
	G1beJB9NzHhSuO9Vj0dbNmXcDX9/vlxWlmpZIKBW3jPShoSufS2ymDqqWNCup55E44DfT
X-Gm-Gg: Acq92OFJK9+mObLD6L5OYTRMI1Q4JbdbLot5hxt9tf1lkEprcFiMBEccbnJApv+rM+3
	UX6NIKFq89sYqOV3MPTFutb+P2TYA6Ff+Vq2eaNtq81k9UfJ86/3Qddf/Abi1mmDaZoTqldQEnh
	VutQIRgNindMzJaIQ0z15Sm5SwmVjPZtJxtRjcuKTf2D0fgZqg/UhxEjGF76CwPvBYdY1Zq1sSY
	a3f8b86WO2EpSFbna3x5kXXpwKG0C6PMVfiBhZXv+ZmxZbT3AnX3BgXtRcI6b8v99kRiaUIq+/c
	ZH17jQVuCpyeT4eCHx75Zg2azW+tbm26ApilMHENH4nPo0q2JExx9Phr/lgEfALhKNOwXuU4bnD
	XumJnYQZYmLkz180tigl8fbrisHU8jY+6KCViE/QB1FgLHZgy1xlTvngerlfJDYw=
X-Received: by 2002:a17:903:2389:b0:2bf:305a:312a with SMTP id d9443c01a7336-2c1e820985amr174110625ad.22.1780914989948;
        Mon, 08 Jun 2026 03:36:29 -0700 (PDT)
X-Received: by 2002:a17:903:2389:b0:2bf:305a:312a with SMTP id d9443c01a7336-2c1e820985amr174110265ad.22.1780914989510;
        Mon, 08 Jun 2026 03:36:29 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm167065495ad.12.2026.06.08.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:36:28 -0700 (PDT)
Message-ID: <84d8eac2-e031-4781-8f3a-d301b5ac5a0d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 16:06:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for rng on shikra
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfX320ol92uSrZ6
 x3cck38PGDLIsfyvryexFD7LSFxt1dj+1q3qX1DoN8AZEmCbmv0/54sVhzE53lc3YDy4HZpTIY0
 DsyXe4PLKVhtWi3c8zZUsDqUAssTOBr0npIAVcwdddimgIU9L6DI9RqqXxXfGxFlZaupDOtRY8k
 GDbVIlLDy58g1TxpqHOp57r21IquZsMsovPPjmpl/UUHmO8Mbu7CKAZPv8kkeqyUcEecQMiWVYv
 aHrOdsKdq1764C31GC+c9H86zCxM5OYj5YzLShEjzMT6rOdWObM7yL+KXm8P8Bo53hBuDelOX6r
 Unua/ZBoQR29nOnrK03mvVZ+mDy0S1eWh00u50QpZOYTtswvsPz14FVTl/74iXVdZdTxBIFW1j8
 8gozwRRVVaurKuddQYNPziWzCE3dOrrJIRqvAj3dbfuy2abWsr7XcFb11Vip37fhiLNqcejRSHy
 dzb448c+K1x6lMRGn1Q==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a269b2e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ygU-B8C60GXm5nKEi1AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: s1mIjNEX-GnYc7hP7jIXhZ0GCy4xBplm
X-Proofpoint-ORIG-GUID: s1mIjNEX-GnYc7hP7jIXhZ0GCy4xBplm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7B79655472

On 14-05-2026 18:46, Kuldeep Singh wrote:
> The patchseries contain dt-binding and DT changes for enabling rng on
> shikra.
> 
> This series depends on the following prerequisite patchset:
> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
> 
> Tested-on: shikra-iqs-evk
> 
> Testing:
> - Boot the board and verify qcom_rng driver probe success.
> - Validated rngtest utils
> - validated against dt_binding and dtbs_check.
> 
> Steps followed:
> - cat /sys/class/misc/hw_random/rng_available
> - echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
> - cat /sys/class/misc/hw_random/rng_current
> - cat /dev/random | rngtest -c 1000
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Kind reminder, rng/ice/qcrypto patchsets are sent together sometime back
in single series and please follow here[1] for discussions.

Please consider this series as inactive from merger point of view.

[1]
https://lore.kernel.org/all/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

-- 
Regards
Kuldeep


