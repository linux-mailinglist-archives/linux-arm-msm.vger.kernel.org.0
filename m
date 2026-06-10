Return-Path: <linux-arm-msm+bounces-112531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zc03JoSfKWpOawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:31:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBDF66BF65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PmNX02+Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GZy39txV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112531-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112531-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 144B43036E64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0A8348C77;
	Wed, 10 Jun 2026 17:31:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7418340411
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:31:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112703; cv=none; b=kypSzkfHIgy2s80a2gMN8T9lX63oTG9Vem2n8zMwzIy9UVlWESphPtKqGNE1bLlLrmc6sdbUGSSEa+JfUrW1HBIJRR86x+t6C/T2XEntMqQBD46bO3gq/ewJeNXJ77mQUXwha+ITEasSKUSz/5qg5EWbDun1aVexOZUx27QveM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112703; c=relaxed/simple;
	bh=zoAVZM9lw9OZBoKsWFzZss54eAd7kTsWGiBNL3Nahj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNddhO+nSdGnieABTOPJl+/iDc2R+5vyLMB21jPa8UGH1jWXX0nk8ZQChx7/CJPdVy3up9sfkSkAp0YH72Z1wLjbWM21Oq7F+94aNxL/XEFpyCLYYu8jqMX3J/eTMFCuvHVLNKvAI+RjA1bCR+z2SgI8X9eezMOkxILFRikZnwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmNX02+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZy39txV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwaK41598452
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuaZqI72kcvOWTcAMRw9YZ+vyHkrkFtJRQmO3nBSIeo=; b=PmNX02+QZ3r7rAax
	caZqRDHPJ75DNM5P7Xfqj64k0255t1UZI+rT5xQiwqtqLA+Ov0FRQQlD1GxDNKz5
	cVstyCu1BPXXaT7GA7FsCl4qz+JNpMfqd8mals8xWBwsBc6Hkn8tfBmqreLFsiDq
	pr190h78ksV7bCrnw0rvdBiHu9ZLV0wZR+xiADTSeTV2Rii2+VAimb6sF6VHmfcY
	dYy8ppOkNNLCMgeoIxuSMcHgaNHtk0+g/fK4C73bcuqFcM3dRDGxKpET1THMcQ40
	nMkPKX6yCt+Tect8Jj5NPTthphA0Eg0GIJ3gghfall2iqU4P9HUyLzCYob3iRmlN
	SKInxQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvkgvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:31:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8425a9979e1so4823623b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781112701; x=1781717501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuaZqI72kcvOWTcAMRw9YZ+vyHkrkFtJRQmO3nBSIeo=;
        b=GZy39txV5stzo/cZuxK285ZoyKfx5wnY7mu96K6wlziRZakgEfAmizo1qdnVbPtMSu
         keP79NAZ3BDA7uH41TVki9W3y50zWsP93iLAFpjkpsQ4mgLm8K2ocM6B217E1xe7yHuI
         vB731KfobtJ3mPPBNXV8zvjzeQWHUL40c8DsmibjiTWVZ2E4kpvYfJFuRpRnSMA6cJ/A
         IgY2iYipuktnfS7jSKQzcSRNDuWBr9l5xnRJtwaBCbpXnFByoFCJcnt78lwUp/aoZbGt
         c6h6nCdsAbKAJyFKUtR3+Y5m+fVLTRvD79jrqJ2HHyg1vkbBNgO2AudsfYxnwhZwcpiL
         iKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112701; x=1781717501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuaZqI72kcvOWTcAMRw9YZ+vyHkrkFtJRQmO3nBSIeo=;
        b=rErl8DSFYWi9PDeCMWbHTiBHMsJGMBKs8M4h87oYg2jqISCnP9oQBsdqXTZWJryBNR
         OaFDaFPk1WvWmsQ3sKqUdnYkRMK7wC7EIRph+22Rc7reqy4xMVAf7gC24HxqQ4OszN9m
         hKAWQjpefi6Uu9Z/wcgKDdrJ1mfawSuWjJ/1klomn+rm5p/4heEyknzJEFBrQ2dhj+/x
         GgPw1ffwf1EZK5ldn/7s3zkH1MLu1BVPsmtb6Ryg7Ht34iSQi9eUFyAMxnHRuuuolgkD
         /HhPXPEWbkdnvz1JSU/lmMc8AypSqQBGlfHsFdjf0HGjakAd0F5wIFXi9ip3HqiW2VIc
         +zvA==
X-Forwarded-Encrypted: i=1; AFNElJ/cCUGR4UmEFRhPUa4dguTBvMZ6TQJ3RVs0kQ/2q3iWbtiV2Rsw1RUn/TXhQIEWFrikxcvvXGT2pSqVMsU0@vger.kernel.org
X-Gm-Message-State: AOJu0YyEdSSDk+aEa/HrlcwWPJHZatM+lYPYUVHTCWPaHYnZhgVyqsXw
	9OyfJI3fWRT5RnEU4XAR1YapN0j7lsXDYfQvOjESJhksx3MKW22A09/GPlnwcC6jnuyVXKJ1Vt5
	n11B/WB5cFHWRjA4Nza/Uq3xXpnKx47ED13p2HVoebjZKvlw4c+oJbx8O0zakiFXPcTEE
X-Gm-Gg: Acq92OGz5+t4SZ8jk/zGBwdHqrPxu6EHiGlFWOJuvHD/u4uOoPyzKSkI/IKQZenfkTv
	czIURUbz7WYa0FQ6ekUYKTGayijyFF/S7lYzVKrjP1eseAYSGq8rj/rsyLCBoSBqWEWrDFauoob
	7SaWEBiEQX0eUvrH4IwEGpNyys/n2Y2vAWFzvN1LO6ubr8XA1OJt3zIkLV/tn18kLCARYPdLOQ7
	TGjMFReP/B3rLZPnrYYisvAvv3ZF7pCOZK7UoWYOMJ/ToU57egtNUMLoN6lTPGJo9Rp4wlKgbFm
	/5oz8AO/oH4NimdAQv26es8VKtbAyvI06znz8DDTKtKgVFP3LL+BUPuWyOAlEtBBL/dinKXGUr7
	cBKM3XNuPnpLPdYBtq536pFHgZYbj+ysCjZPLv1bsewdx6ej6QqJxJPtmDFPE
X-Received: by 2002:a05:6a00:391d:b0:842:2f09:fde9 with SMTP id d2e1a72fcca58-8430a62fa44mr9456283b3a.8.1781112701200;
        Wed, 10 Jun 2026 10:31:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:391d:b0:842:2f09:fde9 with SMTP id d2e1a72fcca58-8430a62fa44mr9456240b3a.8.1781112700712;
        Wed, 10 Jun 2026 10:31:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm32993890b3a.11.2026.06.10.10.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:31:40 -0700 (PDT)
Message-ID: <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:01:34 +0530
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
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SDxWLknRvGy0h8GopK1XgSrlehPSph-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2NSBTYWx0ZWRfX6ShK/saoDyYc
 aLucm1nFIQ+2qeQ0ptALUvYbWf8EY6v95fbCk4AYphN4n/QbWHbwmHuYOJFrBpin+AOPcdtJJrk
 aA47I9b6sKP+5Y4SxZfpj3Tpjk3HGiBdCVJRDPALC4pGY0UPqEk2U5adQW2uKm8awzKhYjgKiu3
 EEFN8PsEdxEp9mB9VUrUflXCqIpBPZ09M4r2+MlT6TEt2pIFV66uQhd/aAqOtYyeU7R5O6drU5H
 WuSh0ZgPcsnGb+7xHk6sJimFbExcwC3ltGFRGTIqdx1IEaFY4Rl/GEX4DZ260gO4/gTSlXkwu3L
 nXCfTToDdjgWATxUSKnRQsLV67AuFasLiGA/SDXOzv5cI0IgifKlFvs3dewyo2QmF78PoaEg93A
 OltP6HHyKtU6/8UGFcqENCmytMrvg6sfzXhu8nZ9ocg3cYoVdvX9gw61TNdBzTkfLhOAUkLywRo
 mYYBTZalcBrLi5LUcCQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a299f7d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=j8Cu_9a8AAAA:8 a=naHRbAbjXZXVQ0aMeuoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-ORIG-GUID: SDxWLknRvGy0h8GopK1XgSrlehPSph-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112531-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 0DBDF66BF65



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
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
>  drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
> index 0bd4c12483cd..ce78ebc8ffec 100644
> --- a/drivers/clk/qcom/gcc-mdm9607.c
> +++ b/drivers/clk/qcom/gcc-mdm9607.c
> @@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
>  
>  static int gcc_mdm9607_probe(struct platform_device *pdev)
>  {
> -	struct regmap *regmap;
> -
> -	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
> -	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));

This was to ensure that the (APCS_GPLL_ENA_VOTE) vote indeed has a vote
from CPU. AFAIR, the boot up was not using this particular PLL vote
register and no piggy backing for the GPLL vote.

> -
> -	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
> +	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
>  }
>  
>  static struct platform_driver gcc_mdm9607_driver = {
> 

-- 
Thanks,
Taniya Das


