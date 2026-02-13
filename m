Return-Path: <linux-arm-msm+bounces-92760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKpgIHr1jmnTGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:57:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8027134C02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672A43003ED7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B5434F25C;
	Fri, 13 Feb 2026 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDePIFtG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChjU1+zi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1770134D3B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976589; cv=none; b=oKivdhEt2PTTHySCyo599Fv6W2sJA6KpP9IGLIUjjFzBN+jBfu1jpmx9YDEWsN8ZuKuDZqD2xbxQUzXM2VgDOqUuWOQFJzDXdikSskerTmdwHHtkKKZFXSgN9RXM+dzRP3PY+dhqRyNb3Rq7jRiPAFCnxtqX/sLLl905aqEX7QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976589; c=relaxed/simple;
	bh=+b3kQtx2g/hAWfAFV3T47XZnjNUfGKbKHSW4Ffsenro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBcJlvShCjBfmT6jNqt/EFqOLxyWDBNAgb8uk9g/xn1llJ96MNnU9n2CAYi7sS35yMINtktWsSBtaR4Z8vTJNczza5LcVIoVlO68v9g4eczoHXy9HN9OWtQNIoIP4fMItoEZrSFTDyf04ctmr1v+3YhAtCtjNtq+O2G4znUnQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDePIFtG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChjU1+zi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D93slN2733827
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upfeY9o1qBEZsl0nTLNfKOwxwHSnbFCU7OR4o+ubsHc=; b=jDePIFtGSuWlRsAB
	66bF/iJJmoi8yxsxoQ6l9vVefix17rchUNGf9E0tXUCt7YEUdzyZqNBPvthyH7Mp
	o2yhdJSqdlyPSAcg1RAx3WOHm86UiJkaFUh7hzRIx5Z7E+ltQkElcdVpan15MrCu
	vYGKlO6rsAYkznXapt/TMv0Wq1UV19/U+E3451Lh15Y965RxPehXdVmondazJtjr
	rLIJOfQB/MsetyhiTxC2nwpIhGfNSpYKAkK5hBanQ/7IqlWp7P/QzGZOCkv6pRkj
	PdDJ0JgXCCDNHu7v9iHVY8t26VQtCzz6ILy4nvCmCSEed1C3yUKaV+goVQNGzaXQ
	gi4CDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wsuud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:56:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb399597fbso26166685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 01:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770976586; x=1771581386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upfeY9o1qBEZsl0nTLNfKOwxwHSnbFCU7OR4o+ubsHc=;
        b=ChjU1+ziTzYWP0yEpfctRDbm4RxaJRGmfOP2Iqo/WSWaFB+4UVvE7YDX0yPU1VRm36
         pEZxaMBM0h9y4709I4ZcGbFU//vxYNrX2UpGHl9k2+NyhPk5/VnbLjZvjYTubo1BaVVp
         XxKNF0oNYCpxgtqd3uepf51S/jEBqkw56yzLMzISAaa96A8LnXE6IlrYLbiJV7Y82rpx
         GZxKPE129mfSpFFgbDoiSl1a0hNBjitcNlVKyNrsiCJf6H1NOcOidg8SSv5T/7RHqYZW
         rCkfHtxIXzdDW0WJ7FHbWWkc9L9ueKsC9Z8TXM4oiBp1STLo9fAPzNKgylenYyD2cO2s
         ccRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770976586; x=1771581386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upfeY9o1qBEZsl0nTLNfKOwxwHSnbFCU7OR4o+ubsHc=;
        b=Ad2z/j5OWVCWVPGvgLTOjSaDzNCHcGKifY/gAqDvbcF/5QivrowCEDmdLlqOxLitBr
         Lsx3wQcYqrmWXam1Pl9N2pYytwKVDoFmnoXOWghTnsNgIIlJEbXTtlAHQlOTouBoa+qS
         TzixhB+s6zu4snQOO2YwSN4aNN0lf3chVh6KFE5dUm0xNBFPIr3OYPDdUL4bgUJdMtAX
         HxPOrW2tFHNSNUgPveBbIlGgCLqnytX6StFG4VEdYCtOlj6Q218NMKmtF7xBw3EYjdRv
         ko/lq6ntskykwttJCnMXce2qzlb1FAhKyHNdRuST1/YPJmgwzWulu02V1fx8eCxXE/fe
         m0Fw==
X-Gm-Message-State: AOJu0YxfBuRlw0FsZGsIZNsC+KzL8FpRpBfjEWZ6jHvvpBbbPqf2koFA
	JMWB0LwMBIqM25vF8GCiE8laDnwHdfEk40ZDKXaIMy7JnK4OPfZK+Xl8jKZZmMhAr16icu2kG4t
	e5I3E3lssHUjD43s3QloCWm/JXDgoDNhuBog6rKdwThlwES5kWaZtPPqR6S56PgLpBmxv
X-Gm-Gg: AZuq6aKXs2B8dKgK9OO/NMMryCwUKetKJTuhrOQiuUUe/Gi9Rb0oQ1SJY2mzhhaqjcc
	3WUZqGNnsfNGEW5UOD0ArIRXnSctFm7rLL7MCW7AILJ3oa0YEFM5aPFJyx3sXWCU4oAQJj4hZzL
	4BR/nT79D3w5j30kqTIS4huZPQnj8k7R+vNZe2XJ3s0dxl9ZJSSMOmASPpSAbnBDykbz6XniWOQ
	Ujzy/xl04rNh7EPnnJ7Z3tJBRayR5j7e6vfakfDGNm89D/VrzEDDqy+WYfs4S8C8rZFdBpBv1bb
	crEGP3jrSusa9a/VS05ylFzRIA4xMP7KAEmmz91w5wOO8tNQyWZJPcx0CY/JQ8RUF+Cns+yxxsi
	hTHHPpY58jcT9RKaJUxGvyXS3rVGetL4bp0RHxPo1dsiJmoflrkB/jAEBTUaA7pI8RTwXrg29IE
	ht3lc=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb408c9044mr160957185a.7.1770976586374;
        Fri, 13 Feb 2026 01:56:26 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb408c9044mr160956385a.7.1770976585848;
        Fri, 13 Feb 2026 01:56:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fa42f8749sm87098766b.49.2026.02.13.01.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:56:25 -0800 (PST)
Message-ID: <bad5343e-c843-42cd-8523-fd6bb221f724@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 10:56:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8550: Add UART15
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20260212-sm8550-uart15-v3-1-b90405f94bec@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-sm8550-uart15-v3-1-b90405f94bec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lOiRhYIJUwWOb36hYmerpJb9r8RPGvlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3NiBTYWx0ZWRfX5C93nllTJKJa
 MMEIRmp8DItINQgXpo0aeF1OnoFpm32uAXsfj3t9Ou1gFCFtuXm0labWYswWpZbadME2jfvFSAd
 cGWuid0/IgLajUulrK6g8SBl/e7IN5DmjrNChjkYlynFwiHX+iJ4kfQzgmId4xx1L1hZ9/tjrft
 SIXH0FSnskNPGx6Cd5FP60pYeXa616EyIqTgmgB1iiJlDTD9WWOl86/Ey3vZ+BZX5jBucu+w+A0
 o/gkUJchpmiV+HGpKUNmfw8A0L5BK3kmbX8uGG3xqiCKvKH4QqHnkT5Yu4IsG546pc5oOYtXJD2
 O0ZEFLSoOcXf353JTZQJI8u+euC7iQng81IQbk5ZFZyboI0wSSbyYaPHPriZlDWmez7NCoXR9im
 SAGp71SDFxvyrFVm4qeSl0Lc1uvDbGadsJuMNrxNamMqexub2jrJGxqkpAlQowV+lmuXXxkk00D
 N3Paa714cjhRBu1GWSA==
X-Proofpoint-GUID: lOiRhYIJUwWOb36hYmerpJb9r8RPGvlw
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ef54b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=U1Gh7MNEC_fZTP3XIEMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92760-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8027134C02
X-Rspamd-Action: no action

On 2/12/26 5:41 PM, Aaron Kling via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> Add uart15 node for UART bus present on sm8550 SoC.
> 
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> This patch was originally submitted as part of a series to support the
> AYN Odin 2 [0]. That series stalled, so submitting separately.
> 
> [0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

