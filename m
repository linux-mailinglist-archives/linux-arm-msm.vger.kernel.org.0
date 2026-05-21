Return-Path: <linux-arm-msm+bounces-109021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOABCTDkDmrACwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:53:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A505A3A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96BC630091F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32FB3A6F16;
	Thu, 21 May 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDxGAXEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6C4s72/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C43A6B81
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360125; cv=none; b=so5ezebLMvY+wyziz8XtUkm3jVrcepuZj7B/QkAE6UQIHJUXKxcTyF4JaHHtkLKGeOxkdEPYA3R0ywGYHnPARagCGq56Jk5QSIg7sOHJetMEHlKR4kQm+xqXcLBcI/wPvPsZaQftlkytDb7tFc8Nm+UT3kxufFw2yzwF8AZem1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360125; c=relaxed/simple;
	bh=OoG4A/nCjg1WGRfiXsW3OEJxdp06xTQX/WTx768OiUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyOPWuY988IWHQahpW/43pJb/ER5yXFnzJFBHF4cQVeW2RtcWEwSZsFPE272M7JVQG8N+bWB1YlnNBAkgsKqahLxyR3bbBN+NBu7SDFgBuYRLtODnPVU17mP9TY/zeYCJnS1j7Or2bCCSqgcciOwP0MhBoYB0mqmvLTrjRSoUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDxGAXEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6C4s72/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMSi1731225
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=; b=cDxGAXEGlCfUNI3P
	aRwNlqP+tB4kbW9UakvqPJNYMgSji/RS+EQEN1JApVu/K4ArR9yx6psHKUxY6QDE
	tihgbXOIvQgqDR+fqoMKMnqRGShIwLNxguMLXgK8b1dWBffpyY4z1EENWdVRJW0K
	sU1Z2NZVOOen1r7ZTM8e6gXHi2yrHQxFUbszz449NYFAwSPa2SMDCDmuFUbSvC/e
	PatLI1zpYDHHLs7cmVN32oecqbZ2Z8f5akQf+WHOdybc3Y6mpkKuxtcGxeIeE2Kb
	Lv2XiN9oLGC02ALr4PUE5jcKriA96rTEFw9sYjkTVRd03elxOIsnCRArN6AwmREy
	RMMllw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4yfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90f04f07227so149319185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779360120; x=1779964920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=D6C4s72/8Ke8m9SXvpPMe3heC9naNsiWB2ef82WdIvMb/YmTJM+rTPB7QkZ4dU0cj+
         yUOAQbyu8WdjU0q/cng6/L2z9I9oMfBEHZT5SFs6CXtV3g+5JA5sqQXH41b31oX9dm6c
         RxEcTFRhbljRk6qU3hFoFgo9TFE7d7NrK30atmBPUeYbwcqklslPyw+ZcWBK5hwcs582
         UNsv29UMz5y+vslOljUOGeZR8E9VQ+0PgrqIBD/WRODE1Rm8BBjntjNbhAl58ctt39+h
         Zn9p9hUV8zbo9jvrn+oBxHT7JYIqlFuxB+L+z4W1Kd49wFiaS7wgWpn2EolYfb6W41G2
         w5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360120; x=1779964920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=THSMtgU0hWiPgWC/jnUHQIQNG2innAyxd5qE2AvDiPync92XaH7f/I6bSg58A+xnyd
         j/YUT3fVY4A4zoXCiTAxnIP5pto+lmA0v0PvNliEn60MWh657tFB/IwJeKxLUuqfVTdz
         3+hPIixSxajVxyujfYewdlnZ0ceXgKE9bPtZAs1E+B1PetFB+8MSHhi5S32QPJ37m75m
         Sf3AGkO/0bGzYea8NfeBz6behwCOsrnvDsF9xS77UAtFqm+vry5+0DnUzsFd0r3tQF+G
         xwY7fpZ1TR18pP6EVo+xDrjYIGRkDqR3yiNuuQP5F/1jtYESEezFyP5pT1VAhUCTHo6n
         2x0A==
X-Gm-Message-State: AOJu0Yzt0mCru7RZLsqygfRT/0tz0VvKFiqS2JuZl17UZaXwgZDk30xa
	n3nNtjD6rYL3gZAL5sGF44SWi36jYq7BkDxn3lgVQS1cB12bAqn6fNGrbHSnE2R+IwmvmmXgEM+
	kNgrbHmYDtzX3hoFKWKFf+OIlxrSrUBo9OtXPvMeiW2MhRVQhnCqfcZa3K10BFvAn66IL
X-Gm-Gg: Acq92OFR76UAv2yyKBEAaFaRHuvzJ22nudM/6/auk/DlkBSUTBFEV7n2+/VrVs1ZGEg
	OIGVIgUB1C5l3aXnRCv3YuSJ1pRddzteCJkB6QhXPXs2tXsVgNl/wq9jn87X/JSlI2kTMuY2xkF
	kflbsXh9QFSrxSacNP/qMOqLpYzlpdQjnUpJSaJfedXYrAP1TCKIiep2/jMQ+tp0giVsC6Q0B+S
	ZDbYnyXFv3Jj2piIYrhOVcKF9ss5sYQte6UDU6ROQY+Z7WEqQEYBUjQWrdEwMWHVw8kWIU2J5BY
	jcL+8zUCJqBy1Um5K/0Yu7iL/QXncpr4UfjmM8whanUL1+f/sd1DUn1ozrw7k4QvR5cs/ptnk4E
	oxj1Ia6zUqjOMS/hQtADuqJTrz+mnLnf/3kWeN5OFLx+PxYyb1vo2quedXIru//0Om+Pe3NfQZF
	sbiHDvl0hn3PFxfg==
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195784985a.4.1779360120571;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195781785a.4.1779360120084;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670e02sm8737368a12.22.2026.05.21.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:41:58 -0700 (PDT)
Message-ID: <406514ab-bb74-4e5c-9348-64ededafa6f4@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ee179 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3BB4LYrPl4bHvSfQcI4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8eHdjPtfzwmqV_Hr9iW8POadRiC90Be0
X-Proofpoint-ORIG-GUID: 8eHdjPtfzwmqV_Hr9iW8POadRiC90Be0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwNSBTYWx0ZWRfXw69uY7TVMhYX
 J1konYl4iOxa8vp1o4miNPLL8O4N52OKfrrnbqrKk863bu2GcoHdIGsjtTfRZ2qYUa43rQWqj3Y
 uo5l8E0hX/dIM5qFGkkYK71k1nfsyxI4UYyUWz3MNv9lZJ8NQQbVUZkTmB1WNUvfjYk5TjvXajK
 vCMRMYGs9IltCDhQbfD7lmor/z4Ztin/D3AeXuMv5Y9jOEDbgTPb22tXm9iPnoLV/s7I1vg5mRI
 WhCuqURMg5UXu2KGhFUlp8hC8J4d36ejOef4LMgn0xFWcw24RBQlpniL/mI8lqXsyAN+SS7sDOG
 ld3tACyaCgMiuSaRguY5CZAdypqDx3d+4M8HF1aNE62JeMZMNpMqTOZoDNMqs3pHBzoEJ0ftvJY
 9kcpBvpwP1EK2deTQbn534HG0wN6WpdOKVVzFUtWXtUO+2XlanIFPY/N24LlwdaOkPJhVqrexPE
 jtJSXW62QepdHJ/u2Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109021-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15A505A3A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

