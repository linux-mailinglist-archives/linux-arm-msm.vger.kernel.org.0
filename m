Return-Path: <linux-arm-msm+bounces-87168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B1CEDA56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 05:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 781DF30046DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 04:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBB62C08D5;
	Fri,  2 Jan 2026 04:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eME5FXjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hs1xu0W0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0E1E0DE8
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767327837; cv=none; b=UHruGZYrsFHLVLfBJri70+qg6d/ApqDOuZofnqHgb130IGKfr9AxwC1rRYJDKTahnHaQwGIvaewKnSsJofafXsXYUw7iuy9Q+hbFvGBb4+eE24r2GVP1YjHY/R3CpXiFi6a5eVuAknXSx8R/VzSlO+5jJwZ1jaCZfp1j9icNMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767327837; c=relaxed/simple;
	bh=ggAYSskf+7Hb2q0ayaGfuC6x127BT1FHJI+Hnd/lwvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkyJDr5+0BdrnHT6IGxD2x2jP852HL3mmf2AlPG7gqkpAYOm2h8Vgd7Q92h/i5aDFZtJJS7cYM4C97JgXg+gzhuYw+27erHuXNhQSpbZuw0NMTMl5mtiPnqmY5q3xYLr9Fjndha3hw8d7pAbWjkw9qeJ8lqMCkMv2wxnnUIh0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eME5FXjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hs1xu0W0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6021gIgc4070436
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 04:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JdQqBWRzKQMrfV3g9F0VDsmSz9eUhaYH5ps/MsW8VI=; b=eME5FXjv5ZIajhuL
	Xve62hxIDgtlYiUQOtSyvW5C4PiItrB9jys+A2CT+BqF8pBTPZyzTp0ndeFEJZgn
	R9DyC2q6TBgNugc/OXyBofGdWmTDClCaLTYPbKQJSbdNMjggmJFPwScAIE9+yJS7
	UzOIvYd+Gx/eiRIqhJPVOL19TxvGP2qZLwFiSBUKy8u9WcpH+vT7tkCwbwo0jakE
	p1koNmQ/ezasFJ1ayISuif03NEcR7DQejfXKha7f5prcE+WK+SRNDxwI3kjtQEyl
	5uN73vnMCMwiQqGVDvUiJv6HMfShCmdEOmKj+xW6z8Z+sbsc0jF3MImMIKpPJuSH
	PywhdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8532fse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:23:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so398974825ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 20:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767327835; x=1767932635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JdQqBWRzKQMrfV3g9F0VDsmSz9eUhaYH5ps/MsW8VI=;
        b=Hs1xu0W0bsAxIbA23GG7uha+FT3x1xz/sr6QsEww5hZOEeMNrp6Bi5Le+SLJZw2z9t
         BB1mBN77CmKKbKUvJlODJy991UacjlKrJ8wilcuTwTr6MmnRtPasTZCGeXsJ82ofSD5s
         8T011DPrd9FhwEzpIlXQbORdMLecSbFURU81EISEfuR5FJ7oT/ZTEmrW5rwOwS+DMF2/
         lgWZbJqifqiKu+EvAGy7b8CDgOpJR24EbU80fXU3et+HBv7XEicq21de8ypPQGjDXosh
         BoqZkhnZxKcM88+HXES2ylkQT+nv3E3ivLoRytX28SgCepzOT939g/5czGMfZ+YsysZF
         RH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767327835; x=1767932635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JdQqBWRzKQMrfV3g9F0VDsmSz9eUhaYH5ps/MsW8VI=;
        b=K7BT6ItUZk91zSyvM5+6zIy9WbWp+d1LTMa8mGCjXkoYDyy9bMS1IIXzO4i93z2juz
         JJp5BQ9N6A+2h3bB8b8amGn3oWyADLY2pyBbuIpecDHo/uCQapJ1V++sfpG9CuIFkwr6
         JbaqLi183VXoFtQlWYVr1bS2jwn9VaB35y2nVc7HdvgxexkJdQrsHaCbU2X+WCN6Qr6c
         xFgXqW4y8URgqIiqZFWBWtT644nTlVAayETjOj9hTt9UIa0086rgMdYc8Qrqt8opY9JU
         ckctlTH1OHZ8rFS6mXFGajr8yJt5dgTXp4T0zmKTs9hAWVvHpBluBOGWj3N4pcg47S6S
         G3AA==
X-Gm-Message-State: AOJu0YxKc4qShpxBNTZ8ZZACMyazAolaBE+AzjoS0Qirh3EdxbPRztdx
	SV5iMDfplTcTc3DozP7ghUc6SNRkMs4kiywkTLq+COaOfTFCsvIKO12m1lBt/TqO3P0FM0hQuBO
	uPWojMkltxXbeIa3+nc7tuWEk/RK9ONSB6RPPoRnFrjSXjMqhh00oqDH0T3l2aGuI9eSz
X-Gm-Gg: AY/fxX79Wq4IzNE6Xt9PfleaWa95ialzCXACOQMMjbSoXruGeHGkeUjmzSAZlDpgfKa
	Kif3XdGf8aQhszcxwXvWdULzSI9tRGumJoof9N6a50IYbOXYawMLyouKiJx9kVDL+PT/mL9WEhk
	Bz+T++JQ+RpgG8id1UOuW72B0DOUWw+SQ1BxhsZ4jZJSfSLroZ7cfQSJ91R7dxB9Tq904Itb3cb
	lWasA318LYG2eda2ThCyisqxTVXZ8t8+UpfFIWMlOuJ9fthJqzMcbVVHqqBzv3RIx4x7F0JkT4v
	c7k305ZkUOmgRuOdX2QKmH+rYTBPVrzkFksPhDta017J+fEMpQvYvTdVj4Npo/13Hq4IerrwO4S
	1LTs0xW7zH7j8ZwlOfVtreV4BmytBlXYtvwvi4C0=
X-Received: by 2002:a17:902:e552:b0:2a0:d4e3:7188 with SMTP id d9443c01a7336-2a2f2223bc0mr451953875ad.13.1767327834616;
        Thu, 01 Jan 2026 20:23:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHIb3L85/jpqM+hkvUNcIJvoLwTUhkvKs4XeKWJSbNq5U4FnRoG1VNec60c5doF8zuXEcTDQ==
X-Received: by 2002:a17:902:e552:b0:2a0:d4e3:7188 with SMTP id d9443c01a7336-2a2f2223bc0mr451953715ad.13.1767327834143;
        Thu, 01 Jan 2026 20:23:54 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d86esm361129605ad.74.2026.01.01.20.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 20:23:53 -0800 (PST)
Message-ID: <eb9a337b-1805-46c8-abf1-7eddbee40c79@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 09:53:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: qcom,pdc: Document
 x1p42100 PDC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
 <20251231-purwa_pdc-v1-1-2b4979dd88ad@oss.qualcomm.com>
 <209c49fb-04a6-43dc-a3f1-8451e3946d06@kernel.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <209c49fb-04a6-43dc-a3f1-8451e3946d06@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Q1Zl3YP4ar-_fjKFDL4se3AUOF_YiyJ
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957485b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-qTOTZwHVwQcG5cz7zoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5Q1Zl3YP4ar-_fjKFDL4se3AUOF_YiyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDAzOCBTYWx0ZWRfX47pWFUzelZ6O
 MkowThAo6Y3SykEZpf5kY+bB2UxfLknPmJBm5uyv4g1VL0cx1w0Wv05aM2GBewiTenYk6chn5gg
 stuYAk65+vADeX/y26TZ32450R0cbRZhD3gD2ITFNESxObmT92TcjjWsAoxs9Ixz3WJGn3cQUmO
 YdVyVr0hBWgLc2FSq029xadXJPKcjYo2N5jcmAKM/dDDQ6CdIPlpv/6MiBotVFhPVm5+9cmp19J
 h8epmz6XMkDZTg7yWBGFi9wjY8osU9MQtUC0IPU1IwKgZ/lvg3NqX+Hw55qg+jk2jz/zkN/rjCR
 FPrfzC0IWxfY4wQhbsJ8O6i6Et98n9SQawUezTBNOxYfxncqyKN15M21im95SDJmqa4IA7g5NO7
 6Y+9V8IISHmcCzj3IdLON1b/zTS9iHmGQFNkWzt8reYpB6KIPwnsm2Whm9htYzWz5NJvlHX8GLE
 hIHbAzhYpVvOuTaGPRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020038



On 12/31/2025 4:19 PM, Krzysztof Kozlowski wrote:
> On 31/12/2025 11:18, Maulik Shah wrote:
>> Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
> 
> We don't use Hamoa name in upstream.

Okay, I will not use hamoa/purwa, will use X1E80100/X1P42100 everywhere in v2.

> 
>> bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
>> hardware register bug on X1E80100") is already fixed in Purwa silicon.
>>
>> Hamoa compatible forces the software workaround. Add PDC compatible
>> for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.
>>
>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> 
> Your are describing wrong bug being fixed... or actually not a bug.
> Every SoC should have dedicated compatible (see writing bindings) and
> missing compatible is not a bug.

The X1P42100 SoC today shares most of the devices with X1E80100 SoC as is,
with X1E80100 as bigger brother.

Adding new compatible for X1P42100 PDC to avoid applying the S/W workaround
for the H/W bug of X1E80100 should be as per writing bindings which says,
   - DO add new compatibles in case there are new features or bugs.

Adding The Fixes: tag for binding will also help when patch-2 of the series
gets backported, the binding change also gets automatically picked up.

Thanks,
Maulik

