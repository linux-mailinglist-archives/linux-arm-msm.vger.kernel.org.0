Return-Path: <linux-arm-msm+bounces-116691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p7fgAotpS2r5QwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:38:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4F70E312
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qajac89C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SqUY0JAT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116691-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116691-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DC0E325C0FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FD43BB687;
	Mon,  6 Jul 2026 08:33:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7823F1AB8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:33:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326815; cv=none; b=HysxX/Gr2qesMlnomNtFgqxFyNy7BlnPvaw7Ni+TsrwoQbywtqcNJCeTL2/nMfsyRl+ApkCZ9QdKVMlKVJo2UPiqivyGQsxaiPrLD9tajWyr7Q8b3H0DRyMD5udAyEBieNOhzRcWP6j3ekCnlPyQ2WhCtx8+4jMerDUwRXbTz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326815; c=relaxed/simple;
	bh=DqM9Vlg2aPZNJnQZQ/VsD7QqBMtacZIbkNCaz+Jkhl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRJGAI+JZSBnJQiVWACYorGX9dRc7dY8T7lOw+aoyCHwAMht+/EPeXNFW1wbcJhM2dKqxhKuHfeZJSNIam2B8nrLW0Th+lDdrVQFplrXzWWTxGB9F6/NWSteeDejjqT3XkOX6yn/8N6EShqYdBWQgLiPv23fIFzN8b3xDnVA2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qajac89C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqUY0JAT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641To93470445
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=; b=Qajac89CIUayPVvV
	pPzl4yBtgQGpOPBxZYDseQAn/QwNnVLfX3tsct9zjrKkDLurz9d9MNZFMP2fYcZi
	nadTXVu2qYityg1O0IrK8YYGeVv8oDucmTn1MlsX4telnjO1qxYsFkZrJO7rwne5
	cFxIug9ksbnj7Dv47112BinAQrm5mpm0jm2V1PCI+yWGQiCQYTXGsPO8d3ZuJf1h
	TdqD9yvlU+xm0H7lpUdXzAhReFF7yZya2ByTzznYK71MxoXwgMch647CATqABW+6
	W8lWjH2stE52wGDZEw/tXDl3vdVYRbO30cvH5uJZMSpcLzJWEW6QOpVMjnUv6KjB
	xTIxMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen66j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:33:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9088831cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326803; x=1783931603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=SqUY0JATQOz9b9YjRXgIlyilDHcyoPe9aCpJSfpMPekywPek5L83t4oeAy5XRwX3h6
         3ZkPlx6YFTGIC3Jrk2G0RMr1GW6zKVbBYY8iO8RD5013nTQ465frsLtp+eyyc04dJrQ4
         XKgcM/WaV+P9jO5U+6/6icFFC1YbimTTBiJE9fC3PqZIgp6slXwD16RgYK8bFNhEYkQr
         juw3Iw87yGsK54GqlhSdAUdG4HCRN8Vf9asDx+RSgugAxWsYWV++OA2dXQz4bEgCJDsF
         ePxrSbESdKkoOYrypxjbxPDfLtGYFGPPdBdLgoJFO0UEuQj/9GOZMN3eIEXfF5VZ6hWv
         TBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326803; x=1783931603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=e2lOwsC3jH0CVk+xs00V+HF7AM3wPVyiu+9i3pL052zGHDZ0/pH5yA7Z9xk8G8gb/y
         O4QdmSQt34W3PbVcuRZpyYkixslq221faGi9rtBfOpKBhVigLZ354fV0nwfKVBpuU7FH
         tlQSlHi/QG49FtfF403pVFHXR1DvTdMimnb0Nf3GXPnKvt9mzI4FrdI/xfaCJfFuL0Ke
         JZd1y221fUCyKkXNn5EOtU/ouGyPu90zSzRhZ5ZkYcjNJL7EHAx7LSZOxXws1pgG8OLx
         3mCkiZMFTlM2eVdIOOTOWIeKt2Zg+OMvJya6Be3kATAeiD9xeo9ZDapSJBC7LCOP85Iw
         gHew==
X-Forwarded-Encrypted: i=1; AHgh+RrLdwNG1XH0weAkkkSgfEBODGtxej9a/4rc+XLEJYncKamD9TirhI6yS5iskWod3+j73e7dM1ouzUitK/co@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSnY+EtAl4k+JFgZ9CATAh6NZ42K0eU6MaIjSu4le8GTV3kjH
	J3iFIqsZVAmDUICHMoqBao/2au8dRDIrZ/dMS8PnpGMmMwc5sQ5RDn8B60yGx3EKjlw5sf7Vo8B
	70b7N9gNivyxXBzUcwI9ahZS7h0YUMrnsxJu9gk6dI0voXXgkJoStbPl3u/lkSss32hDR
X-Gm-Gg: AfdE7ckaqDIo0pBqApaXm6hC/kvooTXzl/6Jw1+8B33LyoYlgO/Yoth/8X1Vn17I+JC
	fof9eHD1GKN9HSR1D3QZitijV/Xkt6SCkTY686Cxq35qy0hw+TazJo2F+nz6b3v1Xy5c8Y7C3L8
	IHtwrAKp+3IFjhgAeFzldzKqBDgkWJ1odx+PdqtgMnOFppi0B/027Q4BMA+/tOK7fYAHU75aOiB
	9jvMnllPus9BruoIRFsaXgOYTweo4jQFvcvH7Al36lrRSrwx07X80W1dKkMZ0cwIX6dJhYjWYWP
	5pGOrJlXcilQa6pbla9gJmKPWhoC3eenj4F2POelJ49ENGJFMVApmfpwQ6c9fd4oF1eBXwNHH2P
	BUrA2FmvS27PEXwi6lsmlTGQK2ffoalBhtJY=
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589491cf.2.1783326802807;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589201cf.2.1783326802229;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm692511866b.35.2026.07.06.01.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:33:21 -0700 (PDT)
Message-ID: <15493c41-51ec-47f1-be1f-d211a970e487@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX3+hEBsDUEDYf
 CeNidJm8EPQYLnLs8X6C9fhEJZgMy3Mw7h7R7BiCrk5ncaYDns/F8Jo7qYROmvnKtGPMwT2/w6X
 o3GG2PEfSLVTGw77VTANm5f4XiiBLkI=
X-Proofpoint-GUID: mlADlaF0QqFoP8T1gaumA2ZugFfTTXw8
X-Proofpoint-ORIG-GUID: mlADlaF0QqFoP8T1gaumA2ZugFfTTXw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX8O3HvyZXt+y3
 XgpJpow/ICZaLI2QfQAO4n8LdNIdOIzQMEU0dTudmEGz0sy2Hp/0eDfW4eYSFLRrRJXj3qGLTIs
 txcFn995kMVlF/J19WK1lQeCHX90y8BZPFSHiG0lePol8rhrBB8oY6Pvu2Yi750yjf9MOU+K5q/
 fIIiTpwCpqMBNdMa9r8mf77clVXpRVXkb7oNc6COtMH1qAFJDBkffymPDY0AksChASaE3TsGpaJ
 UOVB7jjIDAKA4MfD3j7//KE99orRpiqdKtOgvjoG7+RUI0/wblfDVyGy4vCfjsa8r2DQMdaWfZh
 Xd7rwmPw/oCfyz8TCrPpTkCZEn5bu0q6mDyxxdHhfWoD67d/bpUwsBg0Kn3MS1CvBnvUtk+HvPd
 Jz+zeBVotfWqlqEMIRQPXWMqvHYMkiiCdhuvXAh9ZhpcDTxYlV9OPlZjq/l+O7Ho/oCDKauLNia
 J3zBB1jy7EIkmC9sxBQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6853 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SQmynSovjKWGrNaXl4IA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CB4F70E312

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad

