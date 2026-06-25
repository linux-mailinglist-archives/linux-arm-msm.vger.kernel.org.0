Return-Path: <linux-arm-msm+bounces-114432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cs9+KSWIPGqPpAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:45:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5096C2365
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:45:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=maaJc0gp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hs3XCP+B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DD33037D50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 01:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32854374745;
	Thu, 25 Jun 2026 01:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A4536F903
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:41:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351673; cv=none; b=DnqZENx9YxnpfVAgWb7nyr4em1HjdBLS5MBJAyoZJrxfZ/WTNrn+YCl3OdNBrvPlTRCGEVSLDgN8qVFMjC6nYY/eTl7N6ya1p7mUHa0hFd+gW0mR4qcGSQw9tn/AuIWwgSr0fEpXbnA/Sm7qxNe2viYLyH9efOrSLyPaMHAwl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351673; c=relaxed/simple;
	bh=lEH/0FVTYKey35oWiIRJMOOR4UYB4BRjSlE4Qwc0ta8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGJk4q39t13GUeoV9dFs6pagvM8wL4ldpjzUMCKCS9wXIbd81gRW3vCncGg8QvsC+3EyxBO4zOz30/JVRtdb8k64ifoE3CZauxrmELVbsFJqaCt0Uo7EEHuVMmojvqZo+TFZtLU48esm3L7UKTyazp2qBCTr2Gnbvp5Adfr3aVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maaJc0gp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs3XCP+B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqxQP195653
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2IoxnuDNAwtIVygEfamkJMcz5ltQTuXoulZAxcflDI=; b=maaJc0gpDeT/uRtu
	1ZbDSakquHwFQPTLlZTrriiTb0oELBSIJb15sNhTZIAI0UhN+NG5s3LnGIa4UNWp
	eEJVb+atgNPeY4GOpdQEMrJCvNhGL29DoRUxudF+MEscCdfPYZknc0DTySttkR3r
	1IqUqQz1rY4fsgNh1JtEuxDQOTBWjt2CFmJvLdVMzQuAyT9187/RyIWb2Aeg8oJu
	ziBEhiofkgdhzvd7ZLAfS1agCQo2GcwOU7Bz2Y/czSYB/74WB1SmwvousdJw8xOk
	fStwj1Tn2dr8aHDZetfq9Eqcm8gyTvDt1luXERGlA6FinG/8RVD4idRzLimZKIXg
	AvwY6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq3wk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:41:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0b35fa876so16296095ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782351670; x=1782956470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2IoxnuDNAwtIVygEfamkJMcz5ltQTuXoulZAxcflDI=;
        b=hs3XCP+BTqwFx11Pnkq7XaZLLF+XDegoPOLJY7BpNsleOrZbDgxWrEVZT+AUiFpMWM
         LA6pDDGva2ofkMeSE9SUSogpyAbdxYfiRnpLIuXWlpabz5wkHWxWrPlQ8ODGBeyq98zh
         x/a6OvbJ/ojTQY9gP+MxDnOSuUKfwQuOE2LUkiMuN9FZdU/Af8+hoih/p16rR7PYhrma
         DdvImyhga9i069L/NUnkO5BLWuh1hdIAZN99cTSMiCztTgCP/tNLD43wXwDrE+T1UIZV
         XiyFW2DRgQ8jX8E9mZmlCsf2P06W5kDtaoCzZ3N07ohzTDquPp0+HuMxiZwoy3cxvtVx
         jWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782351670; x=1782956470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2IoxnuDNAwtIVygEfamkJMcz5ltQTuXoulZAxcflDI=;
        b=auxsqFIBbosTD5vU5YckQLYjSHJTMXhU/2MkGYXl9dENb1xRbrREPXKnM3pm6ATFA4
         hzd9Sqd5NY6EGRDa6G1a2q1w9fqeaXMtHc8IR9jVFTuH7iZEIRMy12rdG/nTGMdGGhmX
         7zNWJKBtDosLaIR+KzsIQfrkCpCiJvmcRQfNJtNHOVTiKYWz01G3TratYSb8DvHJYjz5
         NoHxHgoVSFR/+Ot0O4USkps9NorSygj5nKTyIMaSPVCnNYF2uOU32EQdvvKOivCb6dHZ
         psBH4wAILeraTnKexr2lInmdln9/FpjNqgC1bCCA9MUKV4yZdaLPri/rt7t/Z88jKMRh
         zfag==
X-Gm-Message-State: AOJu0YxMZmkaohFHISTEqMMG1MT+bfySd1vaxGBLp9uHS3swSUYhjlVC
	u2i9Rfk4SVO7/+kl/QlUrRPAc1c7NfNu7BE66xTNgE3yC2scI8O/MVtb7O/CTKEIgzr/f8bX5iM
	abCqCwDs77Zghg03XPBzto/U8NX999UzV+qEzoueeeeNvs7ew0DFWU36BLx68BK2HcaCO
X-Gm-Gg: AfdE7cmKRU1PPxZ2542vF++Ilyf1GfQQYhlUSpMV2QdrsNbRoldbOB13DWdjH5e8ubz
	rd/ZvhG+uhlwNCCHHRyX2tASBjMIAPKuSh/ItTpNo/yde7AeiilKLQjCxi3uieJkiQJxqmZN40w
	LNTnWsVYzZBz/X1j495oGuZboHRoIEXHgdbvNCC3zekDkAoheaATftL7QIVfNF3J7iGvQnOXJqh
	IYZZkejqJbjQviovpzE1oE8ccBilgUtaPm1useeJooXV/4gcVESXvshMPqRB8C2zW+eTrh8v6io
	3VpSuqDcrWul1u4ZtxaIpnb1ckyBHQYylFnZacx+VGU6YM5f3sIZ6o6fAuu+IlYF4gT7aQW3Kag
	ukml7jdMLeuMAjSIwdkDU8Tp5cJoJqATjnCEu
X-Received: by 2002:a17:902:ef03:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c7fc88e6d8mr5510235ad.9.1782351669913;
        Wed, 24 Jun 2026 18:41:09 -0700 (PDT)
X-Received: by 2002:a17:902:ef03:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c7fc88e6d8mr5509835ad.9.1782351669439;
        Wed, 24 Jun 2026 18:41:09 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae7a7csm8373935ad.22.2026.06.24.18.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:41:08 -0700 (PDT)
Message-ID: <36043887-6bbd-4b2d-941c-bf222786b80d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:41:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] input: misc: Add an initial driver for haptics inside
 Qcom PMIH010x PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260617-spry-greedy-chital-1276e0@quoll>
 <be2b54a5-ce9d-49a2-80e1-60da874350d9@oss.qualcomm.com>
 <4ba2eeed-71f8-4799-b261-e4e2c268043e@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4ba2eeed-71f8-4799-b261-e4e2c268043e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxMiBTYWx0ZWRfX44t6C1DelIgo
 0H43UMouF6TOW7quJrn2a2o+q7NVK/ysDw6eWrq3H5NLLQ8t65tG0gzy3ccHpOPW5izZb/57v0m
 PwPbxNprUpnKMiAL5mJK4Q24yuKgfCQ=
X-Proofpoint-GUID: mJ73wH351gP9XW0nkbJVjoFPHQ0eruWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxMiBTYWx0ZWRfX21NAP0ptARqJ
 ldCAs3XBkgDVOb+FTW/dMwxE+KfE/EIoEADcDSnuA05vQgcZoFfdAFBxc2n9846Z8LRAdKS+enl
 Ig2K+X+ks29/4qi+yrNmUt3iEPEfUg1nUelpFAfDjWknViYn7x9CAfhNRNkNLtfjb/HSv4Y9P4z
 zG88uuQezeviIzQQQJOMzFvsRYifZ/3A22Dej0G+omOaplExgIK23GOKlh4xqFldAEZU6fM1UWU
 8JB5VNCoazzb/i1gg2UcXIfQkW0l7DRL3yiV4RNyKI6fcqpkz2+IRE6C+hL9B4Ru172dysXKgVi
 KVILr3zOLEmuVCZz5mEYe+xrlbClmf1ty7x1EHv6+M8WEgHmXDBY4QqYcxKY/CYzzYfbXFOoHgS
 k+MCk/C3+IbMZJyeo1eqiz7P/8KIYg==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c8736 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=miLeENm1gDbChLBegJYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: mJ73wH351gP9XW0nkbJVjoFPHQ0eruWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606250012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114432-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B5096C2365


On 6/24/2026 6:05 PM, Krzysztof Kozlowski wrote:
> No. Act as maintainer. Clone Linus tree, apply the patch and see if
> everything works. My claim is that nothing works and maintainer tree is
> broken.
>
> Best regards,
> Krzysztof

Thanks for the explanation. I just did that and I didn't see conflict 
when applying the binding and driver changes, but I did see a conflict 
when applying the DTS change. I will drop the DTS change 1st and resend 
them after the driver and binding changes get accepted.



