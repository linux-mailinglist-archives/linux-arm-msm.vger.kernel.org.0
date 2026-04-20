Return-Path: <linux-arm-msm+bounces-103691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MKpB6Ti5WnfowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:24:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F04428192
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B758430254A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03748388392;
	Mon, 20 Apr 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTQPwg5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNg+nT53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C42388360
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673406; cv=none; b=ocAcMkB4B2c4YiGTvspul16zsgMKqHYstlnUyqS/kwr1P4tIxFX+c/9ZNTSN+dKt0gFINlqxPK050iqRE+EpclG+ssTLASDmTMIToS2dOHBEAgtiEfAAAaCbGbdp1tKsnXW8+zcuJE2zCRse0P4NUUtixJaEDOf/M3URUGthjCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673406; c=relaxed/simple;
	bh=0CwvkLCghvI1PVZevLuiJYR05WEEBn131AMmrY9kUzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYre7vAhjrP9SBEhm4drsKHIUHJnXF3BmB1NlRhQOhHcZYKiwb5XAjLr6EeOXxl8WX4f0JGqqaFBHb1tsHPasplQuXotTl+JJQ49xp65gYOX+l9g8iwv4sKNCb4pzaOu1Btx3Kc5Lfy2DjwkIU/pEgLwjVsCj56Q/HZj7AJsxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTQPwg5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNg+nT53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Z7j13455978
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPr/mgvvMG4JgNqktiinFpILBYdemUMXeGLmKapPpaQ=; b=CTQPwg5tNMc/yrxw
	UiLoey7+/VuzbBI0tcxr8V6D7iUCBxM5DhaqwxLGHIQpWLuwlH46ouETLen6r3Sp
	UJxabM9CX0o9JzE3aEQEI7Hlqwt3PyYMIIquD5W4J+5veYfyjP/xBAOzS7UrD2kd
	Rx6LP/2fd9xMvNRdnctJsG4zDKpjTZwQlFfyDytDKQ4msF9oaM+nb792ZDGy7ZQt
	igG19iRcRNVvgei52CVp6huT/Px+CuChRP5nyhXIIYC3H8jTvf14G9rPJSTaNpfy
	+myC1hmwKJVqMPBVvXo3dBYygPqCXNutmhJb2M5F38E2UeNus2rC0FDfkQWoMCwo
	QTRqPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjr69w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:23:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d840206c3so5421161cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673404; x=1777278204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPr/mgvvMG4JgNqktiinFpILBYdemUMXeGLmKapPpaQ=;
        b=XNg+nT53rlqIfFFaxQ8glIfokMZXD4cu4E29/egdO58KjoeI92s/H7pBYRg1pNSKkt
         nbKGHGCwrC6YUjUK6cZK4zKXjPbDvClMdthA/9nBiuM/gYmw75Rb+TU9jAGmrtp8M2jy
         Tgkr4OG6hu+/FmMFVtRhwLDzARnxJ+g5fZGmk88Cen4NtL/IN6qmLm1yxmLKNdk+zHEo
         +WhXOtE6Jp9tFWvsamkNPHlu9WMlu9HLp/mrE0q5VZe0HbTG2xU6H3460TCiMT4N1uwH
         KiOg/iGODEiYbzQlDHJaOe5bW/6hUUDC0qtuEaM0KuthxulaxCnUYTdploIdeepoXCT8
         iwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673404; x=1777278204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPr/mgvvMG4JgNqktiinFpILBYdemUMXeGLmKapPpaQ=;
        b=c6LLT+fhOViyX0pZm++rGT0YRWNG1zluPHF3opnrkXCTl+i869icr2A/63/7/rK1Rt
         /SLIM6+X1geAPNHv5a2RPSVFhithZiGrKO2+U5JIVUPz16b6WQAX+KKU6BUHCf4gfaEY
         00BM2j4xbReuiB1+wYPIfGFh6o+wMpRd/+ZrePMcPkO8gD1On3KKPVxgGBLWrZ4DpwZG
         9R5z4IzJ3/Z3Vcb3J4/QAUM/CPgFbb7Lx9GVHSpKELAUcifmotlpDDCd8yFjPhuXniwU
         Q7Apk276fGxcDWG3NNtDMGdw900C3WF/lbzHIWfh7wduHw3opEsRMqQSoj252y8sQaSP
         RPjg==
X-Forwarded-Encrypted: i=1; AFNElJ/yIZbYDFkEx0dI45a+rBgfGRk0mpc5dAB5/TqGL5mdXlyRtZVYDglD5vXPvvthenUBj2KI9ZF43wIoxRpD@vger.kernel.org
X-Gm-Message-State: AOJu0YymN5OjMT3DSTZitEBoqohlH/XnnMzqK3CQEqTlrDQQL2ecwjWk
	kxXK0d7M/s0EvTwdUtPgoBRQ07bpBOmASvVcvftr7It/TfN9BfPlS3Bgxz4PXl7doLQUJbcHsH5
	was54p3MfaitfW7oo72yk5eLe7PVsu8SRHtpy+gQBa/Q/utk/I/UIlvRJ0FfL9LaXaj+Q
X-Gm-Gg: AeBDievkjLZBmnkbju2kPvDD1DOeBZRAKcEQSYy3wO3qJ8vGdtcE91gUoLjM6OVV+n5
	F4ZKm6uqjUnT7mMzqDvLzHCl5qI6/9aSXAc8U9L4AwXrwFrHgXsW2V5/iUHT5eq0hA3T0VhRPeT
	UVHQl1Km3a7ab6ZXCVRnQm7t6gMsB1tfugDvhmVtuioCznj4mFljgKZ0/Qzu5mRjJy3/V5wircN
	DzBq21tXZmcfLOVfK2bS0juJldKWze6EiYCqYaoOYAqykKhudy6IdF39fN1eEAemGnj2PKxDcwV
	PmgilmW+E3NMMP6HpX4K56dNWEP2anWu8RkLWRdqBJ4ZRnZtB4CLzIfvUkUpQ0R4H1URjAOi6FM
	zp2cgFUQWbjGh8fQ4YUp8+QPhiOKRBEwxR7eplx47MIVWBfk999i2zUhWgJ5PSGB1cd+QVfoI0g
	vKK1cEgBhZjbYPaQ==
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr7229551cf.4.1776673404091;
        Mon, 20 Apr 2026 01:23:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr7229351cf.4.1776673403693;
        Mon, 20 Apr 2026 01:23:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba538429115sm259109266b.15.2026.04.20.01.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:23:22 -0700 (PDT)
Message-ID: <0c2425dd-0ba4-49ac-853b-b157eec1fdfd@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:23:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2g_6DcFF3WqMGptgSYRUO67C8weGi2tk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MCBTYWx0ZWRfX/UqcAGsaDajp
 9dHcU5gAbxw7L2MWe+bRNx2HIOatCvZ6CiG8mXJmIxSk4E9kOyN4grpgopbrQtnYZ+Cfn5mdGuS
 uZbV945XcywIzRWp6Tw7hdruwyj7Kr5ue4UnXkOQKXuIbA9FIHXp4P93U8Y3BYfHvQAQs38+izL
 oky0q0YwjHSeCLPHaJVs34VSdMHDXFj5hio/xkeKrR59DifHkPpBSG05VoT3u+Vm4r5ObA30HnQ
 CvaE4R1YipyVAAgNP6HL/vuXRK5TtCd11DBMWBiqeUv3rcwA1l5lP7S3hYk7Zi8AdbL+KL+SFXa
 RAvYu+sEVw9aWOv2N1tI29pttyZZmQjI9pP9qijzbmhEADMD4GiVZ/l//uVLjRvroWWCZbPQtNA
 Ziy8yPCTiUxMF5GSDUYN5cwAC9SMu2hfIFQ9J6mfcr/RvE7pJ4Z2blN3YcOSLGEd7fHOAh5wL9y
 gB72huYEfsLtW17207A==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e5e27c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ivwl1-a15JezJ7RitgUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2g_6DcFF3WqMGptgSYRUO67C8weGi2tk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85F04428192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 5:49 AM, Shawn Guo wrote:
> This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.
> 
> The Nord CPUCP mailbox is functionally identical to the existing x1e80100
> implementation, except it exposes 16 IPC channels instead of 3.  Patch 1
> adds the Nord compatible string to the DT binding.  Patch 2 refactors
> the channel count from a hardcoded compile-time constant into
> a per-hardware configuration struct populated via the device tree
> match data.

What are these channels used for?

Konrad

