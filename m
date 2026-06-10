Return-Path: <linux-arm-msm+bounces-112490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmxzK6lrKWpZWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:50:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFC669F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:50:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KxIJgXJV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eihe7Hbs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112490-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112490-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5986D331D540
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ED640F8DF;
	Wed, 10 Jun 2026 13:45:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3440F8E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:45:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099104; cv=none; b=rKkj7mSrwJ3RCMCnPmoTlIAp07Rj+aM64TYWGbNuJ3DFz5b9295SWAyAeIro+w98iRejUCRkDPPRNz7Z5t3EWDo7a3oxKClBtFhDgl4xI5JxnHxTlGxmhul7AJb/LtXsK9AORTqGqDk9c7qyfdDbCWLZxecuZq+TlLTKu/4ouQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099104; c=relaxed/simple;
	bh=QjH2RgbFk1WRZkPXh4SEzTpK3+glKIM07co+muR24rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ua0BbzHCjLXcLsF/KCClnynjCZBzFT2SNDfaM//FkGr3zDTOYUScJ7+n6EewlaNuS580SGjd+2H/U/ehgyWRE8Z8VVk+P2r5QEN0NxOqZr+8AF+vV8mjZgeDiQzXAWDh9ZeiMzE8Gd7IWmX8FZXPA3mymSPvoIpTTk2T5zZdmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxIJgXJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eihe7Hbs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgjc1138091
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLisBjxHprw7EZD8IZXsLXnVHgD19va+82RQlSZYq8w=; b=KxIJgXJVDrbonLFq
	HHnxgT4wmr8d+Z3e1s011V9IDwarJdQDjUk8QdnafuV1alxYca87WEmbmh/mnPBY
	3ODwa+XnW7IMlOoFiFRyb1ltAm0dwfTJBE9c981kO73CgXg6UMQ82xNuwafmIl7O
	LKnQSZYTCS2ngpwgmfbJFNJcJ3VdLsecV27B/mAxteVIJp6ZO468yYo4E37vpohH
	UWQUvoc/CulDSzPDeL4Z1MqFq6vMZLsN42C4ZhS76kfE8OeQFvae5m3X2wPmNhzm
	27a+TLN/7SS3D8zobkKxUM07009IC4HiXJne9z3jl9TaQeh6h2ZYZqpXVOZZh044
	mhLIOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jp0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:45:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ccc2d4d2so97306185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099102; x=1781703902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLisBjxHprw7EZD8IZXsLXnVHgD19va+82RQlSZYq8w=;
        b=Eihe7HbsMsOGDWPp/n+A0OU0R3WEY6ucKeoPP2JsScXg9fpFNraItWTaKVPJqFX29F
         41PNMgB/MzK2VN5VnJnFpsTBKDpQRdLn6ovxq3QhGQ2g2hcUKB/hOHhasuCjErFKMFwq
         zlTpTcVM8JaHVKzFcVdziffzsTefNSqZTVEVC0yhN2x61q+hQ68j+QnYOJKkFzhO/YYa
         PNYVnOOJclYjlcAxT94JYYHQi1UTlh1BmHDh9D5qHZBohI/ev1D3/Ny1imbN30Z8VX7M
         teCP/cA9oHMXr8K43eqPfibHYrC0zmi3uvTSr5i9wkFR44dYo3+28rQ4ESnRSuvxszHU
         4DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099102; x=1781703902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLisBjxHprw7EZD8IZXsLXnVHgD19va+82RQlSZYq8w=;
        b=j0HaKz4OrHzE4lu2IumBGkY4cMxodbxImi0HrUZfNR29MlPs1tfHxAdQkq6H6gT04i
         YDPucgltWAccw1U/Jcy6/6GHn23R0M/FgXMHgrxaEB0+nvOchioGN0exmD96Odnr+fcl
         LzezRPmq4qSC+E0nLWyKllsdoFWg8D+OZcD11v78wB4jgDKiNJSj7eyhW4I2n5TKABNx
         gUOV7k2/1BlOe1UeQ3aqryrUb/3q/qPyjjA/Lp0ZP7PRkGKgaATtdcYA4QWzeiIVthOc
         fVAFYnmFTejs81xkZj8l5KTplhjLPj4e43DHhSWoy2Db/Lkar0UyV8MXnL9IWITVawc1
         +WHg==
X-Forwarded-Encrypted: i=1; AFNElJ9OuZmIxraab99aCjN3NjZ/pvBzG2jQOVm2/0RiWfTOgrrWvWTGOlcsDdu3gKz7Hd9A9YdOJATGNgQ4U1IM@vger.kernel.org
X-Gm-Message-State: AOJu0YywB5FsNJrGMjQjXc/qmDu6sD9NnVi+SNJjL6a4yCEqYIs1bdcM
	chL6m2cNCFF3D0r7IQF64EejH4LPI/hr7Jk7z7KWan3q/qeUS59Q6TuoCOoSe09gmx/qXbtMOpB
	odH0PSdSqvdcJSjyNFzVsLS7TE+H01KfC/mEVUoG/j45GFaHeWMgs/gWyHRHV1WX71VJr
X-Gm-Gg: Acq92OHWHdqONyQbVcm81y5vCK31sxQRJBD4Nv4g4OVDL6/blFlDljkwKbVxgcxPe4/
	7Ed7AB0SqOySBaw99+pPtusP/MwgkDoSIBUTnedXkkOisr2DPlw7oG7oK7MCtbCf6Xdm+RB1o8Q
	vSSNkchVfJYjYkwhdaLp3vYWVndNPtJB5c/NKIemiYHRuqwLfHZQ/o8lnfl0ljUkTiLwRAUN9xT
	aod7L9S3fDp6K91KlRJUOA5ugvwskq/rAKT9SUxhM7s0IYAoqBjnxCCemIWgwxDMTlZqi+5DRmD
	H/TRFgA86/KsTJmNWLgvfqzC1Vrvy372j2kaXtO1hpPGP9/4y5wesy+B0v6RzqxXF2GiFY/7gvS
	TyjeetEg6+ESirOH2FRbVap/CI73wMsRBrkP88dyHdtT9OJtrQ5A2AieL
X-Received: by 2002:a05:622a:350:b0:517:71b8:ee37 with SMTP id d75a77b69052e-5179593f3f1mr209122471cf.0.1781099101569;
        Wed, 10 Jun 2026 06:45:01 -0700 (PDT)
X-Received: by 2002:a05:622a:350:b0:517:71b8:ee37 with SMTP id d75a77b69052e-5179593f3f1mr209122031cf.0.1781099101043;
        Wed, 10 Jun 2026 06:45:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e02b43sm1165887766b.40.2026.06.10.06.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:45:00 -0700 (PDT)
Message-ID: <227480ed-cf70-4f70-afc1-9c5a6f73fa57@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296a5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=j8Cu_9a8AAAA:8 a=EUspDBNiAAAA:8 a=hT0Lo-xYggzRLxYTxJMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX+yE2t2+4GH1a
 pAqRTZVpVG3yaUzqf6BslbUQi4PTW43w/CICwwbFNVwoxVSrCckU9yZIbP8cgz0e+/CxQy4egVF
 rMTWwMfvEKBaksOPLKlH986vNWQvTHsZg2RzsLie0MELXZBuosHBolCuirJSalGQi1PUrDRsRqT
 1mq1b+VjtXq8aVIy9iIIC5RS/9DW+ZAFKTUIKHykWCMbpH8806FUQdOqn35MEJ2ceSzkBaOC9yu
 YWCs2Dj3GwPVcIbL5oCZwsEdgr2TvEyLSmxiDbBKBRbUbsykb91d3PF/XQFBcIR30Y26/2TWVRn
 4lU8FMRUNGq0t3LqxcJaFxVU2U7fQqsq/VMhL37U9i40s4QQyXLUW5NNiJZ4BGTcgmoVdH9jmvc
 KtgnNVPG8FqJ/mlKWDSjihXd2qIwK8EFIddUVrsv6Juwk7dRNEScu3u0wuP0iX4dkusM6oZdxZU
 5pORhMvyW6HHpEJWqUw==
X-Proofpoint-ORIG-GUID: nPwBEa1BVMh7_0Du9bups1PZdSqlCslV
X-Proofpoint-GUID: nPwBEa1BVMh7_0Du9bups1PZdSqlCslV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112490-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gerhold.net:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07CFC669F1E

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
> since it's used by the CPU and also various other components such as UART.
> We also vote for this bit in the actual GPLL0 definition, which will be set
> as soon as any driver in the kernel requires using the GPLL0 clock.
> 
> All in all, this makes separately voting for GPLL0 during probe redundant,
> especially because the "acpuclock" in the comment is a downstream construct
> that does not exist in upstream.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

