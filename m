Return-Path: <linux-arm-msm+bounces-117276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NJ1GHiHXTGqoqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8571A7B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:38:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E7+je8WR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KtoIgwwz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117276-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117276-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85025301FFAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E743ED3A4;
	Tue,  7 Jul 2026 10:35:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB063D75CE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420538; cv=none; b=UElG/6hyw83nHiuG7ZvMga/hvUjXYmAEEkY7C4eZDH4IDvd8n39T5431zFniGBThb9KOxDzw/QuAYaXLkNpA+WXyjzge1wLrtdHW5787y9GREL5i5Lefm9PIy37viC1WVLBvIQkM4dwzPzJzLV47lAO0Iem+WN7sDfwLoPXm1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420538; c=relaxed/simple;
	bh=e+jx1Olfb73OVRo/4OTCtq8bSlJfSrGtv8Y7yUC7jgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zkf50uCMYjD1/PeofReLUzF3AcEgiM5acvftcjQWRXujZ+MP/rlwG2H6AHq0MFbBLXDt/W3pRLDDuoEFhMykAoshcLk8LO/mBbVxfHBkh/UKSaxUCGvooav1BFM8JrzR1D+bVhwR9WnPMrmxy8mnuQYmUPhIFRkcamURT2wWU14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7+je8WR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtoIgwwz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dlh73182159
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZZXOlcWQScQLLTqcRXN9MyJOLc7Vq6eYSI7gxmCWkk=; b=E7+je8WRR7JqTH/b
	o6QnzVPjEmM+cgpfCOXGu49SxxN7222NGTrjLIaFxUXVAJZoNaWf4qpb8+AGGTiP
	hD81CsO+PGMilx2cdu7vG3fK6/G45mdmjEyMqeCYuzMaVk4T08j1cMyEWTHV3OMs
	ecaLqDiqvioircj+ElLrGum36CzWvInjT92pCcS5KdlKm03zq4cOhHsnb9xTX2k/
	p0yLkJLPRO1h4aQ8TwpVgiHlFu+wGhNfbqR+F+SpEwHVN5AVFRrw4c3G1zd3Ml4l
	IuR9352/OvmjG3yY9s5Qd4iMCwmF/NOipmYGV8fotkrzGmn1ll2/KhtQnGhCVdBr
	ODNrHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t91bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:35:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19a2da0eso3671491cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783420535; x=1784025335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZZXOlcWQScQLLTqcRXN9MyJOLc7Vq6eYSI7gxmCWkk=;
        b=KtoIgwwzhy9ptd5MoHjZprvHq/fM0W8WLEEnbp+zmqbB/o+nPGHBqc+E+0V8xmcK4i
         gKfyyE0zBJkWJZHCMSlgLyUAEraAesOc38MuxofIOxnNzFr0h7esGaguzPzm1d/ieFYJ
         nQSuoPyeD8/4g5g1Ka4YBXXknremyqvPnyFiNA+fO8IWfyhfQsq0ybC8c0UO1BFSskv5
         mL5Fikhe8O3Nv+hEDEEXRwPn5P2wGahnBgQFuqxCFGyCGjo2GO621vSgjF9QNw4eL5Xo
         OsbOGuGDVnNJlsQdnZVyjbuFKFN3eVrbjxPRntifxuNgggJ6BKRJaIFrFki01qXDcdbc
         13MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420535; x=1784025335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZZXOlcWQScQLLTqcRXN9MyJOLc7Vq6eYSI7gxmCWkk=;
        b=P1V11vDPZseBjcRIyE9zWnoHZviPCptPRjbXMbjEEJKMtQQBsREMbacirqjgJ3n0+X
         xigOu+Znq4d9Iu9GFp/bRRv3m0op2gwmGD4Aanq2JoVBd0EIl6OQO2J9x8aNdTRO+Yt8
         /UCnZp7TXmrneNNS5WS2VUVv3p6UP0+/iQuT2ahLA/9rCcJHDd4ekkczeylQN5/SvskN
         58By21lCbiTh2bDsLSmP97z1GfhizchmwXebDyfH6YI5ZPqZLBwxrLMfptqfXW3mx4S8
         77/ig4UMTVWjvkq8QgPyIQVSB5JQnzCVLLA3OtOXQSsR7FINOpIBhryWsCuid+/0vDXB
         YZ8Q==
X-Gm-Message-State: AOJu0YzALfVfNCV9XNzHkwkA7QnYFsMBHYzGEs3iMuARMaz4jX1d0saz
	C8rztahh+FR572VaAoFh7Gd8OIn//nZIEDUzK8AzXApYSAxNcLcKfkbCEdYdc2u3r/w7av2vQqM
	rR2Y2ksS9S6sU7CKPdSNWeCvO5Se2bQHJOuOSYqJiGAWaixz0t+Cwqx5DdM18hZIrNYVm
X-Gm-Gg: AfdE7cl3RLsFgWGMSmscgSIrN057/SXyF0X+Z7BSzIwzxopOlKrUWjzUel2yuwE/2ev
	qdk9/hlHQwzwSgIs/dVSAED+IZdfo5Www5UZhedMUK43hugsSVvYb8jtDG9FiXojCsW16dTaknB
	zKMFckcTspGdlaX051nRwIf8CUsicnQJ1zjDJbfeOLRV4utqhMH153pfHushvrMIo+aTekffSES
	NM67mMxU0kiMNL910l2R1KxQafWHag4l5oMucusK01fVcM46g9Tvu5+D9EnSH+jf6iQRnYmAVPr
	yED1oRNk+84TTX0SbxrBUHetFEppqwvxskEA+p7hMF0EWPB6SNDUXVa3mYsRNBErtKnx4BsQ06m
	0FXas4/n9D11jHUUQemlsguaLsuNno73T4e4=
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr126558851cf.10.1783420535125;
        Tue, 07 Jul 2026 03:35:35 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr126558601cf.10.1783420534637;
        Tue, 07 Jul 2026 03:35:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada04d04sm102848566b.47.2026.07.07.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:35:33 -0700 (PDT)
Message-ID: <4afa8797-1cb1-4cf1-bdbd-9cb5725377b8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
 <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
 <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
 <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com>
 <1e151b08-5d3b-4b75-8d71-635617868285@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e151b08-5d3b-4b75-8d71-635617868285@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X5dWp5fDHNBs7E57OYNMlTY1hUZeSDw7
X-Proofpoint-ORIG-GUID: X5dWp5fDHNBs7E57OYNMlTY1hUZeSDw7
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd677 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=l5FYNS5t4BCBesUsx-IA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMiBTYWx0ZWRfX8ym3XOqwqUdF
 ZUJwEKrlLx4PskuG8ahG8CPj9DTXs+G1nz+TKKAGm4dnjyorNNjS9xSqdWovfoypdeTnRrnVnby
 DaAsI9F7hhCHok5R6Ehr6ab+dUKhc16Znf2qmdZLnF3VZUB6iqdS2udteGgxRSy0t6FXtbMlZYT
 D2B5ryaA5yL0v+NHFuPY/szmRZde9prQxi6EoEvANMmCYe2id1XK1+Cap9E81CVuwzS1dCVKAqE
 E2zfdINnldcU+0n6fy18DH2UMox1QT0kI6vl4Aan7FHouONmELDbm1ZPBHTKyTo4dL/wrVXOm98
 +J9w7KmyaIHMHYsll8xrk5ZLunN2+/DFw8SM1VstyP4h2vqouicjMhz8aVge/SmSvN4k9xNUCFg
 3aztrLTW3KWkFCybVSFQfo6ruwcO7Iw20zBRFj5BqY9i9QC4TljJWqCk7YcW8b6dqGEdM+96z9I
 Hvt+qAzmUCrRov8yhBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMiBTYWx0ZWRfX+P3yTOBvTtQg
 LpQ1dhVTNgv+1ip0xdsBQ2+JW5BcYvlEPtN2K9k7hhCtArMMYPKgmRIiyHTNcD6L32N0w1lC8SI
 xnJI7mQeIZmETieWv7Ff4HVFNklizog=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070102
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
	TAGGED_FROM(0.00)[bounces-117276-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4C8571A7B9

On 6/30/26 3:57 AM, Esteban Urrutia wrote:
> On 6/29/26 10:18 AM, Konrad Dybcio wrote:
>> Please alter the size of the register range that I mentioned this under,
>> as the range is wider than what you specified - the driver takes a big
>> offset from this base and accesses far outside the bounds of that range
> Just to make sure:
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index dd151a2c48ec..100daf8120ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2643,7 +2643,7 @@ ipa: ipa@3f40000 {
>                         compatible = "qcom,sm8450-ipa";
>  
>                         reg = <0 0x3f40000 0 0x10000>,
> -                             <0 0x3f50000 0 0x5000>,
> +                             <0 0x3f50000 0 0xb0000>,
>                               <0 0x3e04000 0 0xfc000>;
>                         reg-names = "ipa-reg",
>                                     "ipa-shared",
> 
> Is this what you're referring to?

Yes

Konrad

