Return-Path: <linux-arm-msm+bounces-112483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A+4qN3drKWpRWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:49:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6E669F02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:49:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SAYsM9+C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FnjQMzd3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55F2730C4A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D40406829;
	Wed, 10 Jun 2026 13:40:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710C03E44F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:40:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098823; cv=none; b=vCMLPZGBPwGibi+nVyjL5QNdyk2NnqG7bmqmN/BznzSavcWQHrgyanS1jgSfWqzWOc7tmB9vJSsORqSL6Zz5NXjZ3oyZx0IF1HiFXTYmBtCkmgWAIoxmo7Ai6nlKB4/dXMNM7ns2Ysn7mGWqJUEVXeAXFWUQSzFavHBwp7E4RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098823; c=relaxed/simple;
	bh=mVXvA3wixa6hyZFvV4amyK9ItwAKUiD/qlGCQPnK1To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWy62L3rb2f1nH76mWz725xEY4jbGN51rA58fT/1JylH++up6ligec25IghUe/+pT0+0ZGym04tOrWsKkEmhvzRRBZeqpf7kuAu1z1YlqPG9TY641qmocEqRp0O9Lzxr51UDCdzc2P0BSZhr7ZiCnZh9Jtsq7QQNRbZfGeWnyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAYsM9+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnjQMzd3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlpd1134988
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=; b=SAYsM9+C7UMEjemZ
	WNe/d19a0wFv802RiOdQc4e/jh9FrAor1JlhtZ+eYi6qPTIXkupbvXqYWi04JImP
	aPejNR6Hsb5PFE0WVYetuKJh3eqgeCzPzOITgzbZuqDa3/lmOsT8+AGOA7RSU95Q
	Yo7sx6KQoUDY9a5yFrgIZ4w2Rb3tELanRyPVI8tWXNA0e8Km2nQErLmfzNqlu8F0
	W7mldqwPbcPsfTpVK580JKBddmpmmhF2UAZ7z1YoHh8ngfNzpayoD2dPIQjxK4VM
	buSwG376ECMWbGSjHM4fXFllt01ws3pDsdaiZfLlcK8m/QT9gidSqzDQxEHsuCHS
	CZsHAA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1t1pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:40:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c7bdde6912so381617137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098821; x=1781703621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=;
        b=FnjQMzd3T8VtEYWd36YtPszeniZ2p6uY1z8VgTD7MF0tkv/td6RqCt5CyaxAk0wLNK
         kwhRNIZKZ1PgJhyRvwLR4Wne1pAWB3q7Xb2HQYMjozNBWrnKv/QL2deELD7if/2olmkC
         /rTozsos2WPP2z90pRnvC2mcHG61/uKsQkTy7cIdvW/3ULMN+sL9jzl/+150+OtVYThY
         15Fyn1cHJAr2QayzTWTUMCpfqs9FuxkccDyhtdS2FYlLiC2Zc0oKUVqvuILZ/e1T1LbW
         3xT4zpulKutnqLD0zW6bnDgrty3IGPuFIUPlQP/INOwSogtnYyZSRvnUf2ZQxt40RmDt
         5zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098821; x=1781703621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=;
        b=EMT/ucO0wYvS1aNmE6G6VF3WgOMQllbjSERJ6Y5HpZWV9WaPcuIiY3+P781DyW9i+8
         lVCUpx4+30wyWUhCqOngUfe5grgWhcsrhtPvxo5/2mxQ3Yn+mE4cXYsD1ZBszw0Gfn9g
         0HnRGmitvweDVU9YoNdrHfXBA/THr+S0+6APv/52DtTMXccWoDN6Uow5zxIBTr3UFtRs
         hcKIpslLqt826oVOCXQ9q3gpHSMvX3ow/gTrwPqNQGvvi44vNc7r6BldfCfNAtBWdyqT
         dmSh1iu6Gd+l59VEympZauKaAC0veQ8g9z8DvX5XfRhCWJ42/g80FbOojMmZ9TD7R099
         S6AQ==
X-Forwarded-Encrypted: i=1; AFNElJ90pwdXjCd1FftAuSCRMXeb14Zceo29Pe269dBI/nsVK/te9YpFbBdSLrKIuvEzEqlsHvcHwJTg/YhGLrLX@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMqBNNAIVBm9cHtPKgU0o0i+d45d9Gx4I0j9VczYpkTDznWbc
	Q8OVrlLvZgGTaX31ISAUKpFBEweO5urxLm2oQUSKEsgZgaKeOtwyhqukJTkfkNh3bF9kkvEg2v1
	WdA80Xgw6hkJarXPAyqIN6QLvJiklVgpWYA4RVcr5nFxV+dpsXkwmMfJOUCM23AGuY8eZ4WpMwx
	Al
X-Gm-Gg: Acq92OElXYgUZVx5ZuwBnoB8mU034T+Rx6j9ncqj9aSt90P1UX3Gpp21oHB9FZk35zn
	MbJtTBOqdOcE1YHpXbh3EZI3vRM2CzHDImff8kiqo40Z9FFRKFgs1SnpOyqB8xsOWzK6S6W7lxK
	M4HIMlf7KIVhU9g0PP+QjFEcvPUozoWfcugfkrBA/6tDduqcdZWo85+4UlVA+oL6kzU1ngWRT43
	89rQukBwCpUYHKesLTHKKOfSHZWo/InCT4NdmjTmlje+pqDZPsfA8vIDoF+k/985mDQ6ViUWNRF
	FrHUY6E5jtfKdRiugePY3kZG54stafGCAfKtEfVggHhoEweHpBrdQppJm81yql/EjtpzqudrN4C
	+/vvCy2WdLlGughboJeNWta4MI0Kzd0P+s2sJbeZnQMYEae6co4Rf60Mj
X-Received: by 2002:a05:6102:6890:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-6feffb06cd2mr3913375137.3.1781098820626;
        Wed, 10 Jun 2026 06:40:20 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-6feffb06cd2mr3913354137.3.1781098820062;
        Wed, 10 Jun 2026 06:40:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm64054131fa.12.2026.06.10.06.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:40:19 -0700 (PDT)
Message-ID: <29d23bba-4952-4c03-9aad-5f7325e1cd77@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
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
 <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX4yc4vWuJYcLo
 KIAoaD4Im0b+0234DqgAJQX7GHZKrSICNeXdrbY9rD5eDbWeG0P3wCGhVDw3sZg+sRkOxiMfEQl
 3/9/XZSOnuJ3Qf9TNb+oIYADeLQzlKgjHQ4JkCk8JIcZ6jGOvv+5Mjd0/7pyLjYdfHXoW+QzNDs
 SBDfL6bykMl0gESeg5YgU4u6/NFTJrSlIWQlPqL0h6IsWzIqO8Noq/hI7++gCQRreriDl+Ed0RB
 UXiHjXdzUhXS4aqD16MIM8BVyjPGM+/tX0bT6wD4c0pjMUCDMWsk6ygsEZD5+bCSXijWt0kP/v3
 3uHRZzodg+sHDOXU3D6Tcm1F/72S4DlB3DTCbtJPIOhgP5aKP2VbfYEFz+q5LsKlHr0IHShsmpq
 QlOoe7behqlEOaEd/7LB/FKZxpjI7vv9JUc0BT4M5OToxcs9KibohYcbuvd6cvIfFmUX0y0weJ/
 nVvnMquVbVXvvdn55jw==
X-Proofpoint-GUID: kc1WWIJpXwLNG885xFAh9YGXyQeZJGJO
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a296945 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kc1WWIJpXwLNG885xFAh9YGXyQeZJGJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112483-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81C6E669F02

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

My sources concur that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

