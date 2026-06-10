Return-Path: <linux-arm-msm+bounces-112484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +pusEt9qKWoUWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:47:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 979B1669E93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:47:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UdquW7El;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DKnccbxN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112484-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112484-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9CA23274032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06833406829;
	Wed, 10 Jun 2026 13:41:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C701F3E3C41
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098861; cv=none; b=aTVBkrNVrapmKHRsjxwaLvnhcVWfon2hGpTEJIPbLRuYL7IXJDO8vaCkp8frae2uz1A6NL+v+pY91+3JGXQ2iw+4NZjrwN1tbtP3xnWDguoU6Yhu3LPxLvWMBXgsq8+vV+P+n0vTv1PTJV6CJPLkwsD+2mxRnRv0L0W9IishkPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098861; c=relaxed/simple;
	bh=ejqGpVngTlW4e6yqJhPVr8yHewagRkvbmYi89dpAvRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCl5tmRVQ+jjls1ONBfYUHNChSDJXkvVz0AzDIao2G37cj6shqX0mJBTUcCnbV9xWXib5es7X2D1FVrFTW2j40tosbAQQH9/mSDxgT7k2MYVKzWCrfyCf3fQcQn7AWIxiANiLwjk/H6cZd1hdwMRLOAiDGbLVluUm1M5ixp/+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdquW7El; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKnccbxN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCIEQ1512083
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=; b=UdquW7ElaHXlp1nE
	jaJe10Viaz2Z2oOme6bu2k0S+6ouGHUfm1uK50PAFo3gtt18P1QPezgZgcWRSHiu
	Z3gLbz3L8JCVqWBD2+cxqaMUWjo3JIVa7UvzI2t8cu6OF7Ls762ooDMNcQzs7ZsV
	SdihhVsYgc74AjZsru4BhhXWwvIOyJY7BPI1jnSYJynRVa7L/xf2hczScn5Z6TzY
	0Br6e2DrOBoMzvpSz+prv3uX4w4cI3DTxnS8MMYc3G+ECLpZ7i2T2Jt4mAP0ifif
	KWRt1vnJ0LKF0vdeI2O141bP+OnWF6AxQJk3KATKOeLREXuHc626DjhDxuME0VNN
	PcKIsg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukeu7tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:40:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c5a5133221so256780137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098859; x=1781703659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=;
        b=DKnccbxNIStGN/aGFP1rhEmj98bIaaJNovkVof0S5PCipx23uimo6U4KIru4iNV/CX
         U6EIuBcgqYNwuFsgvBHrqWC7nvB0P9ENu0rKaxKkWUWQSuaeSQmT0VlkE+B4r9cYfoIm
         DtuHa/IDTDfNb9FTuajqHdpZppcG7Rin7NqIySoZJWK80jqHRfCltUKy777OAcIDZZR6
         ND/HTcXSg5PoP6nEPGOzMoTDs9FgxnJq9hMIY80FUwGrIej1sxhIP+fIBaNlAFkUVqNk
         1D5tNqJ3Ho65IGAr8m32CybXRPmSf54iO3SbLEeQQjKXWO894aOWqIH++DvVDjQLhw5Y
         XxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098859; x=1781703659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=;
        b=d4Xt2+78g2U0xog0ag4WMXeXihOsaIvi/iF0q1EsoyX/mhrOnkQdaKthWFhAERvXOe
         sqyuXMeP5FQ43vCzp1onHC0IOQEgglyFqmAXqHH7umMRbRjDW+YjQKjDC7pAPlVc21mU
         a4TlMkBN6hGfwqstnvwA4ZSOELKG0Ck0GI99efafi5J62ydSs0V3y+AUDqHSixmcW/Px
         kb7Zb2qvC33kBJJFklIoqC41liGBtbFX/dZnwoNrC62ruQUgWOMrxUcKmKARQh/QWDzl
         q4tpME0v+OKvVS/p3dQyCJ+fj9XvRfosyCYPOKWh+Z0YL60ZgxwlaVEuLHKS00kNvAzW
         0ERA==
X-Forwarded-Encrypted: i=1; AFNElJ85sbuNbA7yh98JbjfRcQVU+I1m5XCF3G3sY0jl8X1pwMXQFWQoSsZQ5D5WmubFOHdLdZsoa98Soq3jzytE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9PjyGmqMQDfhBPdsmpOCPrDq3syOYs2T18m/aULCptAj2THtI
	TRkuCpGGBtLpPnn+lTT1t6dgXnGMrHwlvXuHLYFJCzIrD6y2U0R+6la4O0iUDCWGy1qY8bA20xA
	o5h9BryrwYbnzoeHJGGyekFgj0bGtlcWAaWc216mqcptOadVJA33v98w1Z/8DzQWseEUORPFkx+
	9o
X-Gm-Gg: Acq92OFUmqGiwiyCezx/y7e9gNyRhBYfi2K89/XQt0ybvg91r+dGtYhUlv9nCNFkPql
	q5i208I8zrf2yV8tWX9/t746ZOau/OqB1tagtvH2qq9MuFcUrxgduAk4OsHRWBt1NS1a3gUuEvj
	B1ST7lTrIhSMNLMoKlxeUCwENC5vl9hXliIr6k9+q0BSKFCzRa7gD9ODzDtn0TZUR+jrZS5085A
	xlQ53wVNhLR1Kkq1kODcbfFbMt2bqkj+KAa8TlUTbiAWkA77CQn1scmiFrXr4uOOH5c4sCAV0WV
	aKEVWjpyAn/KyjBcLHQdvdQPOvfhVziZ1/7J+va0femcZvoWCUmfFx4irojs2h2d0lAAzL1X14C
	gZMj5PvNvtOHDANBezN7OhrQyrEO10YefTwdP9NDt4LI+wzh4QQjfN+Ds
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr1528748137.5.1781098859168;
        Wed, 10 Jun 2026 06:40:59 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr1528730137.5.1781098858612;
        Wed, 10 Jun 2026 06:40:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm63677961fa.18.2026.06.10.06.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:40:57 -0700 (PDT)
Message-ID: <70afc705-9d95-4c44-905b-a471064bcde3@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:40:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
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
 <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXyCFRPU52tEF4
 C3tPGXEmGaoOpdyXWkw2RrfiMfZo33ZBruvdFu0zfSOz9wPKe+StkhqQS0z5+8wnpMewmyBJ4ET
 nrwdQv/jLAXsj7kSyd6bDFH2YhomX9/13aazJ8UVFr4DPhdBVDY3s0fYv7KfTgXPHu5Kez6Q55a
 4rgQq3b6j/XuIb0f+BVD77dWT9ISYBRpogwE3VYM4V8jljl8sY5+q198kBECaN/W33B0m3GsEam
 scjS9+lsfNU5LxN+eV10fMD5UQpEzg4ri+SXT+qT/U7tOikJ7ZkaTWiku61r6UGUGca/Lc9ute8
 9d0LN0t291Ypci8mV2RaC9A84wGi9nm11XPIwC9GfAZAg38dwcrk30sUQo0buOIpvYcFPils25m
 jvD6NIts/xuno3gcLY2qX/Xun7He6IqhGKpTzx/WHpTQDvA4Lzkhw7aA3mIk3WAd+01xhPL1NQR
 UO9HxljZ3B7KTCqB8kg==
X-Proofpoint-ORIG-GUID: zTlTRpN4RW2gaCjoR_2DCjFejohrmBE3
X-Proofpoint-GUID: zTlTRpN4RW2gaCjoR_2DCjFejohrmBE3
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a29696b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112484-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 979B1669E93

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

