Return-Path: <linux-arm-msm+bounces-103350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDq5F+2f4GlukQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:38:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB940BAAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6343F315924C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB3D3921C0;
	Thu, 16 Apr 2026 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZN7eN/0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhhbT1HS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A938A70E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328218; cv=none; b=QumgsCLVfAmvToOL43/6TNH4OnRGMMqHhN+Vyi8cw2VULmdb1FSE632JT/fQhOo7sKboceIUWcvXbVDSzwD3hKUC9iAo3wWR+gqV8G9fNEtq352I/KQAGpPjNtSqbZCEeZ1QTaDdlmHBcCtocLo9iu9emg+ZZRa5bByHHVfY1xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328218; c=relaxed/simple;
	bh=Jlqk2OBF0M11bCApSjgrDAFc6rP/EToC2kPMBBcfHd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+FfWwWPxCldd10fBz95Mh0hQKjhx/v1L4jjem1IDx6xgHPCWc2TIc/82SOEJyuvNbYP5vETGayyJUa+pToSV9X8AsMapsB0F2xUmdRNeav66h0mjxuXWCeL5OGRz6WgrbCsfU65Xdv1xop4u6OQtIAoRbIAC6RkTwMtSk+AEZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZN7eN/0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhhbT1HS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G4TDeq1553088
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NOY+XDWE2V4k2vSltcsyiU3hAomE8uf48R1x87M59E=; b=ZN7eN/0D99EX7snM
	Be1KeV3EY0QqPUGe9gn/E2D1eeBv0IxpEz0+uviPc3g2YLTlWrY1XZWyZKAwjaEw
	P70TjLFGjYkY/SgBCXnw1BJhGUmLyIiCq54BliIKf1L7zmGR4z7/rOvcU1uzcAFd
	OYXzO0YvU728C1T9C7SweJn+At90PAWfb5yg+uRVlklkAvocCvSO3JWAMS/QCQE9
	URlvCf8KnGKCS6GPySi/SISexkfxErsT9F3fYARymvRnLVJjIVxVhD2TxvWS9mlH
	FnW2jHMYclab/vUHaEj8s2KcE2ribFdICfCpm1lY+9ITdmUlm4qNYv9QfGos8IEO
	pI2tUQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn8rrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:30:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a18178713cso17256866d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328216; x=1776933016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NOY+XDWE2V4k2vSltcsyiU3hAomE8uf48R1x87M59E=;
        b=JhhbT1HSDmr1odNh5ReoLHBuBxKUzR+qARvlQID/luJL61vEKg8DfeQrM3Jhmr5MQF
         MrIx8OVHkLwzUt9JsIwmCnIG8NT/SWaECbsrEaorRtcJ7tKA8mwzjnJadVDIi+Z1bJkE
         3JxigF52FYKNoAknYFION3FGrTUZD7hZy5WcTZcq3C93b2cRAc+T3EBsyuyvgHXm7oZ3
         0bcNRq5uDgzMptBkEwr64xzqtfdcIezj95lq1OVrbxQD031kSQ1ktg7uDju3J9giWzxd
         BvBeexbbzju46DMs7hTI4wtzGO/mQg0gOOt+lc7siPn6n4g3BJp9a/ntIokyVpe+MqOp
         iIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328216; x=1776933016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NOY+XDWE2V4k2vSltcsyiU3hAomE8uf48R1x87M59E=;
        b=TULCxZC7caULgpIdI0UXq6apFNVwuUhKOTOP1ohdMs7W0E5S9VfIDFS1ashL+6WGNc
         qULSMBHIaV6uHnCnKZSxoaS6zEyU2JS23mIU1QjVDmmGp8bmcT/4XCXRuXPy9C5QRFyw
         wAfFhwv3Nj0tVGleIB25DAUbeP/OJaszaGwJG4p9ZhuTU0lVtqjKlKllEc7jsMaLGxDI
         zdV2uRAXiyNV6gS+3YTLTdmUJERxncjH5w9x0LmeS/zJ+tV02R07Gk9CC8cI7xJQw3Zq
         ME2r4CxnsOk/aLtrbMgAGOMXr9a+S7Y1RjoXLhZMK78DpXoEZUe8RTlijF9PTsTvikPO
         qKjg==
X-Gm-Message-State: AOJu0YyztkTy/E7V3i2VYroZFl/OiIcIJPh9Q2C9frxaYXmeIYu7gy4K
	aZ958cwNWeEv72jklvEgDeAyr8Lx6IZ7XwvzE52SwzhqFdUiZQe1uz+YSVR7k9QYF3Dem2LaHh7
	tm/Ne4DTssEGxitjs+80zCSgsVancwpbkzveJiYfoc3BwI5jA22CmiY2fMBC2Dbh9N9xz
X-Gm-Gg: AeBDietokEP3CF19X2mVY35JB9ODKI5KaU8wsBH+VwejlXn3k4vyEbaGK+1sWWrrxJO
	QjioqU0eUbNDblYlewZBzvyndqVPC4y5H/Z4n741bNt5CPiVCIvd9g1DTfeoZe80j+7weUExw9a
	Y5jjEdOjhU9VSKU/lF8gYwlR3PSQmZGRhCqqfg4/Uc8pkS8VPB+BwweaO1yT4S5d2dTamg/xIDO
	ZJC/TIX/hj8z+HAnM5fBU4m1NCJoj2+dXxDduKVGbdmRzmDO40Pjo8Rlimf8X9lQz5K7kw6spWR
	sdMCDATfUg036svsOu/1/HLlJpscrigcZ7VeWZYYiJjnarab0LUJQFA3uZQWwRk0y1Y1KK7t9pC
	U4EAgJ7kHGH7joDtmUYTWbufLud5TE6GsIqmMrwxfnhAER40YnQQkZJ1/UtonkW+2pruoIzbuPW
	5MILfLbYwiy+Kdkg==
X-Received: by 2002:a05:6214:cc8:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8af6b75ecd0mr15811576d6.8.1776328215648;
        Thu, 16 Apr 2026 01:30:15 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8af6b75ecd0mr15810876d6.8.1776328215088;
        Thu, 16 Apr 2026 01:30:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341b9b6sm141901766b.2.2026.04.16.01.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:30:13 -0700 (PDT)
Message-ID: <357baf04-44ed-4d79-896e-16b7063fbbee@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add defaults for desired arm64 drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i_0mIk8GfxYBshMWKaB9rk2Lnx-MHxuS
X-Proofpoint-GUID: i_0mIk8GfxYBshMWKaB9rk2Lnx-MHxuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3OCBTYWx0ZWRfX/WcUHlAo54nK
 JuBt0okTLJuP2Vtt7pGMSqohJUBeeqYk8LHJi82RNjGgWXCyQTAStFJnmWHGz87X9wL8w5CRhl+
 zcmwGXA1Cg0eclnlLeqgVul1ox4HAVtQcW6hgPAllbcPwT48I9STIdwb/S/W5e3dm7BjKArDXv1
 LoRAgK74+VipGzlNDVgjWVcGB5K3qUUSM01BgGCfgP6i9Yx0X3/Ipq9f3I/8ZtV+Tor3qRVyniw
 5GS2G1sZTzJYxo1oijWwabCfSYeOImDpyC0dK/2C0YGhQIJ2XrlRdWt+jmyzPYgq+scxvVaIrS1
 z3dpZj20h94nKk6fYg3wgrXiYOY8c5MFQFL8rRWLY8lzARaoi+vCOW49f4/AHulKJm0WLQstBt6
 OyOsKpzmjxTjUKP+XDNUo92qNXU/xgc7dxOy2+p+O/ulz4SsTgdFNYNtu+2EoBJyhDU9tb8ovJm
 4pEd4/7VGQOnVzMphxQ==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e09e18 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G14gXSJJWdPwksqYDHwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103350-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: F1AB940BAAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Enable drivers for upstreamed or being upstreamed SoCs, which are not
> yed enabled in defconfig: Glymur, Nord, SC7180, SC8180X, SC8280XP,
> SC7280, QDU1000, SM4450, SM7150, SM8150, SM8450, SM6125, SM6375.  Note
> that main GCC clock controller drivers are usually already enabled for
> these.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

>  	tristate "Nord Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select QCOM_GDSC
> +	default ARCH_QCOM
>  	help
>  	  Support for the global clock controller on Nord devices.
>  	  Say Y if you want to use peripheral devices such as UART,

So Nord GCC is "desired", but Kaanapali GCC is "important"? ;)

In any case, as far as I'm concerned patches 2 and 3 could be one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

