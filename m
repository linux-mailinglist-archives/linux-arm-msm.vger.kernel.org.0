Return-Path: <linux-arm-msm+bounces-112530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eF2IEZegKWqbawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:36:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D866BFD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZRE+QaKA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=km1o8YRW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112530-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112530-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A73E3322392E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F663346A14;
	Wed, 10 Jun 2026 17:24:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0E343D86
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:24:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112285; cv=none; b=S/1KDpDLvQHYjNH04xttlc0vJ2qucpKxdQCKHHgten+jYGRTJuP+Mrd2nrh2N5O1ykbk39dJe23o+9FYktAvsMO+7rReFedNuZgAzjAt4PzA67SxuR0/sgbkjv9zOLea4I2WVPRPjTlNzwvImcjA0z/yL3OH+ZOp+OUqPdBd8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112285; c=relaxed/simple;
	bh=7sxSIWuiDdngtEpOJtIYRzsR+xkl8ex2VgVFRGD/gkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGltLhRg1hRpxa2LPUamDhXozpexuEQf/6j1RWPXzdYP71wRzc1j2I7dktwXctYnsD4yrNZYFh+vzKaioY4Pg9192Z9jHCawBa6E7216o8r3+ZIpXK9U1BL9Ws2sUp88sMx9TzP4ZU5B6rDkHRvxIj4VbKWzunptHkOROK+ENzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRE+QaKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=km1o8YRW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwfTN2132480
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAEzp4s+Abu40cq3+C0nFejCUfG1tPM3EKMGymopLDk=; b=ZRE+QaKAZW4XA8ji
	vuDEDQDALPCXlbVSv68rakoAvORkUndKhqYeB0vk7HQvXWEhp2sqZmPAboVLsYJO
	twKWSYsl0Nx+EakTBs4e3yXyZcnExfn1v2zm5LB9Y4hgLVdrYwzfcSGhCgVITYcg
	hjxPKfDstUDxOuRM7YK9nWIlZRpmsIDEdBSpDCJgiQqyvoZTKom6CyRhrt0vMPWI
	vOt4rOrRSQWA04/kVOKg0uUdADrpLt7ok8qNojh2I17k3Bnagvw6ie+ivmSyB0TF
	MJDmQaBBg5NeSRjUqpnPHo5QeEWw1TANMZYzAiY5m0w7r1A+0xDTSIuJSs9uM+y4
	l3l8rg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg2xdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:24:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b934a336eso5166431a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781112281; x=1781717081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAEzp4s+Abu40cq3+C0nFejCUfG1tPM3EKMGymopLDk=;
        b=km1o8YRWJNuv9SO9ooEkYCW40FD6wCgH8hbP/DJDmBmc0WFIDlcuSbnS192vvltQ/p
         YFNr8k2gldsJTvy+j/3hcoS2b9Uy53D4xxxz21s0PNHSXUizEDne4n7NS8lfiRd8JZ21
         qV1WYs8k2ufR/6p5xpq88h29jo1ekyzedUgXBBknkcw/gXRm1qcH/UllzVQjKrUfu5qN
         TLf0ilWNZ7Ndr/C/Prb7vHebxhqf7SePmzkyMIkA2g1GZR5GMrphgwi/9ZHF0LFPG8+c
         L0rBiDZTNDiHe2ASXN3ADNscmE80xgxDGKIQvJZ1E1UrBnEBo6jkwMNK7D6uVYAtnpbW
         ZqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112281; x=1781717081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAEzp4s+Abu40cq3+C0nFejCUfG1tPM3EKMGymopLDk=;
        b=cPV/fW/SP5o33UC8tnW2KcAgOSb0nDUxGgbMrE+NvIVdA6kNsVukaOXaTGu1TRgg9t
         Cu0dV/AwpgnhYdvKtmWIZl7wCeQ8UI0gIO3BgKzg/ROSDT5Gjvr9XIKOj4maHCqbaKKF
         J2BcAJ6+UXyBkfwQgeCvaKoOCdpBmhIIqqhhL72EDbOiGYjv2Xxr2qrctIg53vi7z1FZ
         NIQ4tF85LpMa5rY508tdiybiNyHL7GgNISveZu9lvhlMA+U6EkwNJ5zl7QdV1Tw3a1dS
         USAWjj9a/JSmXSPQXwp5oV2N5gVxrc96x6vVHvoe0+/rafYqDwA+377x2wCnhpjmpz4m
         8OEg==
X-Forwarded-Encrypted: i=1; AFNElJ8s6ayhRj4Q9k2yo9YbUt63/dsLmViRQigemuzEgjfM1ZOV0j8ogp+aYMh8U6VuCtJd8whOBPyim4mnnD2R@vger.kernel.org
X-Gm-Message-State: AOJu0YxodLJW9JgrERzdEZ/9dTBpvM67kroXzDmp7xVBebdC8WDTJsl/
	7lKhHxqPIlxBkz+dj4S/2TgHHxdTmYDiqEDK3+X9wt7byK3/WLKbYLB7Psb9ozPObe5nVszOALd
	z4wmZuAxpiZNP4PN6b/Af9RKQHoWP1y98ET009lIciu2eV3VD3NJFkrtHF4NG6wIIFr0C
X-Gm-Gg: Acq92OEr8Bk+x7l/D4yTJHXGRY0mv5qngNRgMFQPwQbvVskXS44f2kRj+xKcnCgz/cL
	+QQYqgohDBaxrs+jbNFN25VZvsHgdOVYHBBXuUYNuRDc06tcM7a5imtzw/TeSkZ6QJW6Zr31k4G
	bzWxJsfwzgh/0JSxCNes2+yTdyXxKeIol/tZYrlPlPdrV79VOP2UCrudvDYZNm4VUUPPJeegPTy
	/frYh5ScWcEv79hhLy/72GNjQY1hQ181qxOWgX5QYqEveXKBDbH01+mY44L2/9/xcdGxQWDPAg7
	hZZace6vGcxCScPeBJZcAfIERwiJyW5as1U83tc+8EKLwy7Ym4YqC5UWN99OF7MDZLedAykh+3E
	6IpbV/dqrSgM+RBsv5sp2Ys2ELBD6Rt/1Le2tl804+c6thsjOasfRMX2nvnFV
X-Received: by 2002:a17:90a:d44f:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-370eed08e71mr25719002a91.11.1781112280689;
        Wed, 10 Jun 2026 10:24:40 -0700 (PDT)
X-Received: by 2002:a17:90a:d44f:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-370eed08e71mr25718979a91.11.1781112280212;
        Wed, 10 Jun 2026 10:24:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3772c4567ecsm308907a91.7.2026.06.10.10.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:24:39 -0700 (PDT)
Message-ID: <4fb85204-a19b-4a8b-9f37-b841673d57b4@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:54:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6Y-w6QwOLxpQxR9UTFaWlQibmwGKp5bZ
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a299ddb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kpey41sLADR_CTz9gPIA:9 a=QEXdDO2ut3YA:10 a=w9sP1k96Qs4A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2NCBTYWx0ZWRfX3X5aGb5liOgr
 hNp3bIqR6AKk7S/wMbdV3+5mhRn3V/noom+YBLCuoNxx8ElSjEzu6rOIheuEHdmxUHGppNGLYzZ
 AQbUvSoSQB0X4ZJgt0llssD9NsbbrZiw010g2L9q7DjC9b3Aj9YqCBkZP+xeZX1gUA4hC35howc
 CdJ6ZJA/DUOP60ljDe8oeP1fMnKIQ45yGwesQRI9HrxU/Aiv9Vg/im5QG9zrQnLdXeu1giPXvzT
 uP610S4akO793BYwGHJG/cqnbbykCM+vnm+ggCaROT/f5jJn4B0jTRJbJTCkWy+eo/Mivv1tZLm
 dHIWb92evispglkn1c/UIRfjPuZ1UTeJUBnXykm6X+2Keda1RDwoU5RVLlA4FazKnRQlvKB+Kpu
 a3BPxaOe3b8oa5q4xuaBPsyo29+6WlTHTVOW6l3xL+66e/SkoxS+CyOhAz3ZL5oBEdlFfaYTTXi
 uGJSPObcpUAfvC1578Q==
X-Proofpoint-ORIG-GUID: 6Y-w6QwOLxpQxR9UTFaWlQibmwGKp5bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100164
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
	TAGGED_FROM(0.00)[bounces-112530-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C67D866BFD4



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> --- a/drivers/clk/qcom/gcc-mdm9607.c
> +++ b/drivers/clk/qcom/gcc-mdm9607.c
> @@ -1463,7 +1463,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
>  };
>  
>  static struct clk_branch gcc_apss_axi_clk = {
> -	.halt_reg = 0x4601c,
> +	.halt_reg = 0x46020,
>  	.halt_check = BRANCH_HALT_VOTED,
>  	.clkr = {
>  		.enable_reg = 0x45004,

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


