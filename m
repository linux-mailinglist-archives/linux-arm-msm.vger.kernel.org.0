Return-Path: <linux-arm-msm+bounces-112746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Yl2O0GeKmr6tgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:38:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819E6716B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m6NuDkJN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WcafSNF2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112746-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112746-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A89D6302AD2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010A53E8326;
	Thu, 11 Jun 2026 11:37:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B63E7BC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177846; cv=none; b=JGmcWiNh9GPK5lYXFHVw7AIw2KSOK97R96gV31rXJ1XpQV1dMweILMmVtPAOs++ZH92apUSD9cUOT+v5tPPpCUT6/0o1K2sATW1gRD2wGCu7pC/MyeTU5x9wscJoCW5v2CBMlB9pzS8D55EON2OJeUmsSE9Xeix0y6SRC7ZC+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177846; c=relaxed/simple;
	bh=wxd0z1K/jMxfFNLgwOXIm4LHEBf7fMJ8Se4Mlgv2iBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExjyoQ/FMmFa1ERGh7uQCtqCdzGDjdjnuNQ8W67sdZxpu6xfz+P9ju4CdcD1w0KtlbwLwvCxKm3SgAppi/05rSJpLbQvN74wyh4xRLffKFs+aTWRGcMdVtBq1X45YN/LbBHkR5s9/fS/MTfu/XAcl/QV2RlR69vf6JyNwqbf3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6NuDkJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcafSNF2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xrvc214608
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=; b=m6NuDkJNG8QX8zcE
	gkdUhvsb9XlAjnjBQKBY9WZuctg3aYXqmiVABtIsgINfKBpZmcLKJ15MdECAlImY
	I56XicnQGmnU2CbV5mqPibC9gUXy2P3S0tHMO888/uOkE09riSwJ17q4hRwboUE3
	YgkrnT5A6ZWbUVAaOKWulxC3tQW8eqEqABqJCjfEgNu+Tb2lZBgf9mPX2AxVnGlS
	wXV7tREDML7XVXkPh6xeFj3r0xg6QssR/hvclZgcZU23prurIT8pe1L8FNLLvZYE
	BojTTHMxXB9BTktRAYJMVZY0x4mqRD/gKDODp9nEIER+IGmTaG2mUCceAUnbTXbI
	lKrSsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk8ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ded346eso15813351cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177844; x=1781782644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=WcafSNF2Js622wI9yroqN99NEZPsvafcP5TIYOgRn+GFxqagStR5EJ5hbGT2HkQDnN
         cYKSq6l/ltWMXLh/l8jZaxKnBdBUumj+0NzwQpCsn7udUzlXLRKJsWB5PjnCIFRobxij
         JeX2URJcUqbar1ARcDkYzbXqNhBhwS7bBAkU/4bJfxUxsd/32BDuXeWRV247MWB3HwT/
         NJ4bmB/fx79pelffNMKIecEHWHHbdGN1ylwq7sCxV2EaCUzbH0OsplhC3g6Y6YRgP+Ji
         PeO58HgA2mYPDeuYQ9o7arE9S11Rlg+56DhM5voejMutD31zxk5Q+W7RBBgVnBNgsHVA
         1PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177844; x=1781782644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=S4kuSgkcLXBu2mPZbi1fqFcpQjWx1mDYZbp0Z+I/P1J80hm1G+3eoySAMIOyN3+VKr
         LvdW7HYP5aDF5S4ZSvgZqffWt8FIrVxXIQSCw5XZexLKOta43ZIUyq9bxepC+q9DQHDi
         PLAbUACmqOQHhz7WC6/GsQO4PQ59VlDyrNgNYAaVt/c1NLAgI9wACoH7omuDaOZUFcSk
         qqxZydvxWpm52EWg25iKB37aWmBjqJyeCeoldv15QbzeyP+0AC4ENoHssyRoxuCrR8Lu
         ChC4bKTJ/G6yjtMm2CM/F1FMfY0KbNIphQqzemEx5gyYJqMXyv5AuQqT1vzGDqURiCAb
         DemQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VRzUm1Yf7BoseJPMogzErjzGCEThMWK2VTz8cMWxlS/iBPfRep1z0rXyabyQzA23N8q+g4bO8BNlLccDf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2b6Ps6Z5X5FD1y1bN4u5DmglypHQ34gQo3vPUczS8LB/FokL3
	alADQrHmeMZY6OVY8L+DHVew8astWesextCN9QtBE0R0RF4etLqR0+cY5sm/NBjvuyVAbH8g+46
	/ru2LzPzRoNIHBZorxu2pIQ/w3tkEHWUDUMPjyMXNNMaXcRjG4VdV8CiMFddfM78s0h5p
X-Gm-Gg: Acq92OFAg+Xuw8suxr6bQMThQNdBUTYrqQMfINhKw7CYcwUCjgd2l0s/5ED1bU8asu3
	QZ20/M+pdbaUHSi9+o1XVQmEt6sMrUg/DWBJGyx3nazv/g+pgZ419fXRvvUz6gGIZWLCiqKw2uz
	Zm4UXY+Q4NMixzkQIKJ5TjxLPMpshPa4riLvVMnUIBNWryyOmSQS6RMQeyyvpJERomNRDE3Jx0g
	oxKaAy45SKh22a8KN3UwXqw4SgQHNjN+qbN9Bsyns6ikDHNjD9JaJb7ScHmdgEbtqc1T7boUEzx
	HKoH7w09yIcAcKi4mqrEn0elG38nBOroHUtWqOGKiThzIDaJNt6Zhq6l53FwIvlw9xvfZOK/inU
	fuDKtRvKL8mv30yzx2ETW8ZZv52qT2jK5FvNHs12TfqBZwe5TO1MzECrx
X-Received: by 2002:ac8:5ad1:0:b0:517:76dd:4c2a with SMTP id d75a77b69052e-517ee3d1a49mr23226021cf.7.1781177844001;
        Thu, 11 Jun 2026 04:37:24 -0700 (PDT)
X-Received: by 2002:ac8:5ad1:0:b0:517:76dd:4c2a with SMTP id d75a77b69052e-517ee3d1a49mr23225651cf.7.1781177843611;
        Thu, 11 Jun 2026 04:37:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:22 -0700 (PDT)
Message-ID: <1c2e7d1b-4c1b-4b34-9ed0-0b46a9adcc36@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/18] arm64: dts: qcom: sa8775p: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a9df4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EbZ0H_4aSGrsEeNKfi0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HsrZFuV6tFwkSnV22db0RMU3oXGb-4-m
X-Proofpoint-GUID: HsrZFuV6tFwkSnV22db0RMU3oXGb-4-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXxytx0RkqGAk4
 Ktggac8u2vldtfDu5iN9PYr5b9W4TZmCkuvvNC3jWnHRwLj4ovM3zs6xTyejRc4PKv64ow8PBB8
 Y+c52ws7xQSE11UcfwGFtLr8KAJzXbI0/j/YiZKdfvYtKDiPpJvPdMLkDUd/PB/PjXVCPE9ltZk
 qZ3OKaH/rkoG/tCuGL7fkcq4HOVITcPSDPQUz7NsbzY+2wXb8jeRlb0t4bNOnnBSW7P9GIoM/7B
 5HtNN+l/kzTy8z4iOqngu7hSMGLAjl95+p6bdpKk5sEoB4iVv9mVQ43tpSgQyEwRL/IjD7JaN/K
 tM8mTiKzND7iz98jHkL7pZmpK9wYEdEh6EBvNEu0HG/mOqYYWPs7dmRNWa2UOgB38klftUPPYQj
 N4e3N/FqDQr0TymjeFIsJZh7slUuS35LNzTKeAfFOMwrBIp8k8XFrQbP0jTSxARXMdxwZeyHIOw
 F7NcQFXOKDo3G3VBTtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXzBY9vvOaalcg
 qSjPI+hmu5EEngA1LpO5xjLR4i3LSy23CNl10BwiCNl2k9oZp+xgwHeHqsxkw7EjjuaYHL45Vbi
 fxEaIAt2zbkWHSKsQupS7B3DZTl9xTg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112746-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9819E6716B0

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

