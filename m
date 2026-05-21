Return-Path: <linux-arm-msm+bounces-108927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K8iO6msDmr6AwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:56:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921859FC3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 337D73009039
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8542BE034;
	Thu, 21 May 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1vg3W/e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iizJBzm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B2348883
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346312; cv=none; b=ItNCfrCs462z/Z+slYTfPxCSNcnimzZOnykMN936NwYXwzpZFuQV3WTZxvQ7qSOJeJOYBVtiOgsuhIYz+8picbPGWGbrp0kaOM3OfHXtoOhPeQ1dfWBOS38LILB0YqYHMlDPOyn1aKSkcVN99H3PWVoMtSoNXwfAsaQ+7nRR5ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346312; c=relaxed/simple;
	bh=OzXvlTwqyg/LORhSSsvxHKnz+VzK+OsN50SGeyyrFmo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M73EJxb2yoKvUgLMoiL04ujN/YrKDFK6Im+A2zU/aA8BZhpdTC9MghU1VEeZ5remQ135MKRnyxDeIXv5FA+3nyGQTixY/Fh3aHZj5Fd4PNwrSUB0UtCTKb+q7wxxfDEA7fWi1LQ5Hw6Ob006s8PoUlil/R9wSet7Jg5vE+BwpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1vg3W/e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iizJBzm7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L61H4s2157503
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipaFgG3ogON0geuVOtzTG/KiPSvXW3QMvF4djvkApMQ=; b=B1vg3W/euwWpmXT0
	mzK/ivX/06i+rfYeWpY4Q3W0jG7eYYXGdcOb/6CtlDz2zAtjyAC76ywiKXwQ2qGP
	G/FwwUPBgqXK4PMmDABwSM/Sa3l85HjCfxz7GMhau5d9oubwkrLSh+meSJV4yk+V
	btNs5mLaK9MwW/pJiKawRCMYxytvUy2+gDVCXG7Q8j+Jv0FrHqpBjNrUgZLlYp02
	ex7sRnqXkCmwpHaMe13QVtppYiW2fASuriagul9HYgHOCXH351shb3fu0Vr4fC8x
	ggnd0nZp3NRv8z88HNpz4Sn3CRz73zpPTek9G9BfX1t7/0USEF4b8/SnK/k4BjNa
	cYEfgw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma41tw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:51:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-836d0184333so7611953b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779346310; x=1779951110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipaFgG3ogON0geuVOtzTG/KiPSvXW3QMvF4djvkApMQ=;
        b=iizJBzm7b9BwaKNTRzDes63EmIbETTVNpbBdhD0Bl7y1dL0LAMRRrlKgCNTH7ZXiwq
         txE3rrlLQrA0Y92OQZ9BMOZfFsSyIdt5unF5vnX4mr1QsZvzLK+hHaiZdUgl7iF//k9o
         tcczvbVbd4X5bwk0oPQyMeJ6HXK27VE7pkcdlUuz2JEXk27y+S+bnZxAMU08UoDfDvQR
         JZtB5YnQgR4v9QnLytnfRj0ElZZO7poRsOFemqfkKkMbZfD9BiwwQMSUSFDt3YD6z0mH
         NtxHajgOn59bK/dIZ/iAvaLA6+DJAKjygxSCaK1diuyg4C1tY2rMoznyiGB1J5c7okb9
         aeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346310; x=1779951110;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipaFgG3ogON0geuVOtzTG/KiPSvXW3QMvF4djvkApMQ=;
        b=d5/6LJH7T2AVJR/YEMSXlrdfaprxfSmjmIVo6oO9a1SRkTE9mVX+Z1q6eM4cMX01eD
         t990stz47GJZboaSXHehCH0Liy9+v13VKXjAGKgNV5I5NCsyOWeubpqrzNWEJ9XnhMI4
         eA7RsfNEkxV9ozkWbUbCGALNVgjDR+nkPhWbq54dugaoMOC7c9vwV291mcVyhMh+nThA
         H7QqSVvIijWaH0sduuw/9LBcXyLASU2mfzwRLFBjC1OnmrdjL9cf64EitO0tmbGh9trP
         OBUk+bvZOKtKYQ4FY45hWFbbYuXh8jq5ouJj5J03yJVbQYtBsEvkOQUDjiz8zH6P+FMk
         MSKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hwfqtR1VBvH9EEID+F1Hc4u8LDzDbXrHb8HQHC+mzWVhHTk9EcvzlfK/LPZ2ZRz50N5Ran2/qYssI0JWK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsnKFrAMj8kj7DxzI8a9J+fzKslSrKJzKYueKYoToAPvbgaKV
	ODzlhUGFYpqQEm9jZqZML93/YovTSZavlp7ROMX8kfXcSrwFsQxOJk3Mwhibiy46SNz+iWm7srR
	WJ/Eesq7c93NWuowk5ZSiaVBpOMEV2H1SmaX9QamrfC1J9eIr6916ETCsbGOwcJ+ufEBA
X-Gm-Gg: Acq92OEpEPMSDT9W9uVtaLFjhgGSp6pZBG+p+T8buTozS9tzdZYbxRPTf076AoJ/lQS
	WiXWr9Jj4C24t8EEl/R2Q5FN3uYNjL4Wzdqglyk7tjK5u2CUEKo1di/vDhi0KfY2bncjgzlJ01Q
	GOdOJYfApC0m2EixBQmGymYxiu5B4ZNUZtT2VM1aSCfrmlcVNag511giv1LRg6eo+UW74ov6Vge
	a20YxP0viWhIoBKRI3faA/ORrQJYLiYkoFz1LBxNGlX6ZFePiUwvpMauoqRXYhrYynOoAYrvIfp
	nX1uG3fN032RqbPAwCp+UmaRIpGcwXtwIVIAlfpCwSYnwriHifwDmaFB8Q0s/OOi2FjsxsxTwl5
	6cJWQIWhLenUDWzZkvBZDiTskoxzsKRk9fFo92nOmLMvHSi0a7WjxptGmfsbbDA==
X-Received: by 2002:a05:6a00:845:b0:835:6d99:3f94 with SMTP id d2e1a72fcca58-8414adf542bmr1746462b3a.25.1779346309537;
        Wed, 20 May 2026 23:51:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:845:b0:835:6d99:3f94 with SMTP id d2e1a72fcca58-8414adf542bmr1746442b3a.25.1779346309052;
        Wed, 20 May 2026 23:51:49 -0700 (PDT)
Received: from [10.92.163.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e59ea9sm232016b3a.61.2026.05.20.23.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:51:48 -0700 (PDT)
Message-ID: <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:21:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com>
Content-Language: en-US
In-Reply-To: <20260514194735.GA1939213@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0eab86 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1cRb9DtoxWFOFH21OVAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MbGZQpWEeDHbRg4LsW_EprYrJc08BXLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2NSBTYWx0ZWRfX0ugBqxk3YP3p
 HlkBm5ERVkauTyyZpNoVL7fQS7ggbGO1yBLAyQBLz0RsiAr0Cknz3BMd0uuQqY3wk+JAVxBLehT
 ZFUH4sXDG8EoJ3ldCy/0Bfp+rC8noRkBxA7QWTt7SNRw4ubLLROYDQRkBPE0QqsaZbBZNWvM1Ja
 GyYCuBUHnDeS7H50OnNyHLuv/xB91tsL6vcAFHw9tKHVyVdXOuGCDd+CpAvEcuaxN2bx5zEM53j
 UyEsxbSo05abeNSG8dQa1BvIidKUdNPovU5KkYcZq9D2OhgMChxmDiI6mjqMyNOigPXLsvpouVA
 SQdUCMUAxP3M8KH6jRzZO5ofzt8XttC19CnURWoQjn0/9qK79qZ3KGCBoqtXqSEt7vXbDZ5e+oz
 4M7niHWPn7IQPy/qPtmY1rk7+PcZFtrsD6hVNO2vG1Q4vwwU5PhI2m+hskQgCnjgQa4cbWBBhd1
 P7RzT8fcksa2lNSjG8w==
X-Proofpoint-ORIG-GUID: MbGZQpWEeDHbRg4LsW_EprYrJc08BXLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-108927-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6921859FC3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15-05-2026 01:17, Eric Biggers wrote:
> On Fri, May 15, 2026 at 12:53:35AM +0530, Kuldeep Singh wrote:
>> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
>> Shikra bam dma supports 7 iommus so update dt-bindings accordingly.
>>
>> The patchset depends on below. There's recursive dependency so referred
>> to base DT patch here.
>> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
>>
>> Validations:
>> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
>> - make ARCH=arm64 qcom/shikra-cqs-evk.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> - cryptobam and crypto driver probe
>> - kcapi test
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> What specific kernel features would this be useful for, and what
> specific performance improvements are you seeing with those features?

I hope you mean 7 iommu entries.

Please note, shikra is an old platform and differs with latest platforms
like kaanapali in terms of iommus#.
Kaanapali is optimised(in terms of iommus#) as same pipe index/sid i.e
4/5 can be used for general purpose or for any other usecase like
DRM/HDCP etc.
Whereas for shikra, there's dedicated iommu entry for each usecase and
same pipe index/sid cannot be used for other usecases.

The performance will be be effectively similar.

-- 
Regards
Kuldeep

