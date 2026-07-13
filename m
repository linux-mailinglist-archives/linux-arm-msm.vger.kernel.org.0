Return-Path: <linux-arm-msm+bounces-118749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3P9yEWnLVGryaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:26:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CA74A55A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:26:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VfKkSOWS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J8htx/JL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118749-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118749-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82094301468D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804953CE4A7;
	Mon, 13 Jul 2026 11:26:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CAD3947B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941983; cv=none; b=Ko6PYf0H/SPdyN3frJy21mKmt2uIirrgquLEAo00rdxkqPDFmaosJYRQSoTszMtefkr5MHLZme0yMu0u6FjTKDMmGzRA4m52bGvnqaff+ELUsoh++NfMN3VNqHByMH+auXvlq8GgDRJiU7t52PIyr9yfyoTPpFlVBxwmZ2IQh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941983; c=relaxed/simple;
	bh=xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9Dbff8lQQOdto2CHCQRoOxpJq5hOTQ+XCyGNLuMnWwYRgIFCX3NHlUs5ahOIBLR+djYOKkIeocJPR6VM0IeM1SPBPngYl66B8kbOnXCXadUUqhuyU3oksWHkNouJD8YTGO4oglexEHTY+e7IsFkLMc4jXPBay2QhKcsuvzILlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfKkSOWS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8htx/JL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77MgP810491
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=; b=VfKkSOWSLtabfyGx
	pBXVACq3Bk/eBuD3eEOqwYcEegaLnYMdpa8oUbCe2nS1cl0ORDFg3iRQh4EEp8XA
	SiEuczpi+kM9VnceNEUfiYqVDsRLX5twmVias+MbOq6n56b6FkfSOo5I4yo3JSx6
	rpFfIJJ0yQ06oM9SMcMTpB+QgxWuNGS/fa9NgCCRlaLI94qQpxv9OlRyBdDYnWAM
	PW2EdZtTGuwO0QjsML2wjPrmcGG1zIwnSPt1c4qor3E/3TaIfnYC9rNwJ5aV1oE0
	3jDrwCBh3shKry3sKSWBAdUfh6FPUhk7bfKplb4DEvs00lMfuzMPDy4wQPyhdj98
	83A/BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrx5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:26:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9784251cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941980; x=1784546780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=;
        b=J8htx/JLTO1cP51S7uAbhVsSbFoMsJcVjg2Ku0eUt98vljhlyf0qs6evl2WrgtTiAt
         lw3TD5ZQ+aux1ydVRmJSE2kiWvlC+f/iYr+Y8dhLFJcEgIgPHrqgfpG/nHQ8x4TKOZWb
         fzWB0KebnaMVZ9fNl6j532q9CQBorACovrFwpk9zYCGxREVpHb3yjPiJ7KUVo4ATLO90
         Zp9QKCRGijWKPLI9Vtyg+kjpOowWGWWRxNINqD4TWaCzP+A7MDFZ0dsA1bHpMHK78Cjg
         whbmMi0S8h78tcomEkyiMGReJ3Mv+BDxOxoXsEL792ysXX9uoKSdFF3kZGSi2SAPjy1f
         rH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941980; x=1784546780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=;
        b=L+EtAeQhKTvS8hh03wgjXE4jvIZKVOcZkkk6D0O3B4n2zuv05OzpMbo7GVyBz9r33a
         Cz8QcCrQs7aYmc09Ifnh2BJndN+RwN5qcXI9rfzH64MzX36hDZjH5eigg6lAh2pM+8uV
         e+y8pLv0twSJ/riIjAU43IGwDkKJFEvFV18AhBp/2j9knWrD9Fz2wCAqww5K/DZoQdHQ
         1uXf0PZTzMOq5+ft4Sk9X+YssIVbC0Ey8DcneujzfOVypYPhgKNWBr5E2sBiOzzO20V0
         WNGUggEIibuaBgAMe/TB+UVsgfHJGoX5LlnKazbBzw4TFxDJNV6JJMCnXZjp2bnXYfYB
         7F/Q==
X-Gm-Message-State: AOJu0YyMV4ee9p7NLpbztRyutbE4rI/PB0cVzbJtuSlx9i9O7d7lWX8t
	iOLN4Lo0JMHtUC4Mv92nCcaK5YUlwkafVxe4AJ3XNupRptVvyg1rdmbZ7ecBKj5KGNhaG8kEo+m
	sU/2buew1BtLp1suxH/qRW597/8rJ64grFufDjC7lrH17IZKjYr2m9sRxH+MeSIXFG4VX
X-Gm-Gg: AfdE7cm6nf0ILY+k4zAaoBQi5DzKkpC2l6Qj5pSTrHH+cZ2ythOu2Yyr74KeOCUxzGK
	3QwUshRUQ/zyXWYGDseIKp4lX75PSW0dfX8H0KMAipAXjJ9l2NuFxBV+Dvkd36D69oTjNIrmHeQ
	RK2AZZljtECh00sSQvTBHgEIkIUDr8Ov9Imy2Xk4/OFU2+1lyh7M8ViaoSZoJKkTpKrQ+iF5vzz
	z10wn6SBX3TsUe1m5O9p7GCmBe3cfHjn1uv5Ins3T6rj2qDExYewnzTWZP0KlkOW7CLmpMrPrGw
	tdWPMDDlJZbvefhKrp3E9K+nT4hlsgwe1uKjvtrWaJFft7kx3bxCoZPhX09nQpChcgxggXcWLsh
	OiyS3FOPhVcGmbjJHOTVokxulSJ9OfA9IS3o=
X-Received: by 2002:ac8:5fd0:0:b0:51c:d16:b498 with SMTP id d75a77b69052e-51cbf30e92fmr64404301cf.10.1783941980569;
        Mon, 13 Jul 2026 04:26:20 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:51c:d16:b498 with SMTP id d75a77b69052e-51cbf30e92fmr64404151cf.10.1783941980178;
        Mon, 13 Jul 2026 04:26:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c165a9b7c73sm8359266b.9.2026.07.13.04.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:26:19 -0700 (PDT)
Message-ID: <2bec0856-4d51-447e-97bc-13917c11a985@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:26:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54cb5d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qFC8wAhaXB78bAukjjYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vZA9SZ1Uvpuos-I8mIlqPY4Eleias9FC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExOSBTYWx0ZWRfX6iOUui8B/fBA
 /7LstfW+E/+G4/RiVZ/Clg0EjO9oH6C2cCLQYCUy8BtMfK0huArRHVlJSHjZ9e9HohsuWKudnsz
 uL9KzLdJOLtt1zfaAO6BiiAdFR1MUO0=
X-Proofpoint-GUID: vZA9SZ1Uvpuos-I8mIlqPY4Eleias9FC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExOSBTYWx0ZWRfX1UcUKph5qLM9
 Ty+j9oqD9oOSG6JN0hf5arKlETIVwZHGQrfIZmMibjQABK51/1xZFMs5OM4WLEaM1rDrUS0Caap
 ZOPi1ta2r+9PuqVNVU/W6iUq/ptk8WeQJy6ZfCoUqy0358TDDEYUv06iRXBN3tVIBBGDgHImXBt
 PksCazRmNFeiRvHDiM6QbuGwgPEDE9k8vJJg2jrfmUTFngBK1XkC1ZfE8GlClpxEx1l5wikOStt
 7vNMaZdesAGs/URiU5j+tQrGXRgZeLDKAkLYzpJGd/RW3tz8WbLLd8F0jzoVC150K5hGV5ul8wk
 YxbRi6/Qfm8U06hXT7LCJJuG22PmixngHVxc09vSALJ2YIlAWPPb9MKlji5X18SdBecfhSAq0TS
 JmuwGfOjB9jrUPu7Y86rOwq67pd3sTeDQxvraIv7gqTPrsLZzdRjk7Vt8ERdW/AAbLA3lk82giO
 dHIlOY73okHTrkptb2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B35CA74A55A

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> Remove #power-domain-cells property and add power-domains property for
> MPM device.

"why"?

Konrad

