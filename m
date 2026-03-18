Return-Path: <linux-arm-msm+bounces-98418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNkVE0+DumkxXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:49:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A205F2BA34A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A0AC307092C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DB1375AD3;
	Wed, 18 Mar 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiABON2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0Kd+Onz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE9035B63B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830906; cv=none; b=m1+8aYXXHoMflMysqOksv5nN3ggqqTSHFlMhXoAPLBGJ8F+O0jL9RIv/y3HtOnDedSP7TmP476GkCToS1AtORCn4SiTWwzAwlpEfS5uGPUOOrXwsS5mT493AzRLouOtWfm2KeUz+2qmHB5viq+ba0+4gM6VdilHPBQNGAXBLZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830906; c=relaxed/simple;
	bh=cF1DROYnjX8skY1YrSMzROf4KbayS8Sh+36OpO6N74M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBdzWE8hQ3+FcK7XsaOlUsfSXeJfKYCyqIj/Mfdc38RJSlyoOpFb65/veHR+pZAsSGSCB8m1dfv36p4+D/n2gr6FdRK63S24/8cQxR6qAl1C4Us8zqjs/0P6L/CDYc/yFwpJU0IIaxF6SkSmGbRCKKQtiAI14+AHO8FkXNPVkgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiABON2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0Kd+Onz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAhxV2008387
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XK80EzlkLMXAuOZQ++FquWS/RLEA4ilvvwe4PY609zc=; b=IiABON2P0C6eYenj
	otioN3BgR0vJ+e9M6XS7iC0QRAkqCoVOu8vfR5h5hM3ztY5qpfZ0l0Fu10d2QcKJ
	YdfSpdI0ttcFPZqj5EqEWe1SlgsyoyktHTiSGqkZ+HLk3IFN0Pb3r/qLeMXDGurI
	nDNHl1fZz/n5POruk3OMPe40n6zjHhEMcTsAc4moYkTwxv5fOUMWHWKWJQ5VwOvj
	moNHEXce3QcyQU14EbahIbX1maQ3MEtlNtkSeDQw7hnFsWKxJA0LBjgZjL1U/iqu
	RBarclO1kPzU+N46L8OPobZSAExdVZNLuMXa16vrAjphxFFxJR5rd9rb28Db58im
	5j+M4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj500fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:48:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093245c2d4so28625811cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830902; x=1774435702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XK80EzlkLMXAuOZQ++FquWS/RLEA4ilvvwe4PY609zc=;
        b=S0Kd+Onz50GPy0vHWK+VHFsAjFBPnctwm/xrP2OLctR9MYiPAMlgU0ZMzmzsXNmGnA
         mr6aIKrZLUuT8i/YMhw9zdsoag8LAIJOHxKebiBfoM4TtVUle31DBV9JItDySfP6Fgq6
         CoiQfIrR84U5qFU5jWXqDiOd2lbCcHHvzBm7JSY4IpmrDYtuH1bPGKA59yqi1068n8I4
         BuLTi/LuayA9R0Ho+71J9gnZfW9vCB1+ZKVCef36ECZ7nWkmrp4VGRqeeeNYiuRjC49l
         gpcd8CaoFHZ23GSfhIgpJffeSKu7p7148rQDu/KMdPU1mCwcdZztYH2E2zUAc7IJLw6y
         sUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830902; x=1774435702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK80EzlkLMXAuOZQ++FquWS/RLEA4ilvvwe4PY609zc=;
        b=N6646pfnHrrj5OeTfpVxralBitwcuFub43Apqm9lopx7MF6J+1n5q77qkmsjFtU662
         yeWgfv0C/2vWqumcQ0lUBDFU+XeADDHz20u0KyevvxlRObIvn2ykGhCqiFVB3lh7mEhd
         I9KEynhQFLtsh1TrUw8e1jsKhzzEGZFKYNHCb+6S5s3IQnKCZAghonyimLXvCvxLOyMf
         fEFtwihOkJADBTqhxbWlYNBqUKgf/jj1WI+mnrRNUEk52H4vcZIVB4+JEPy4j0guwOvL
         R3935Q+oiAxudy7D4gHnDacsL4RpWomEN2u1zRas07145R9w0VTVNnw7CtWOZjj2OR54
         Lf+g==
X-Gm-Message-State: AOJu0YxCYb0kBE1kclqZK1NpUIQrKxco3MFbp9HtEGPtLtX4lwDQkk4D
	Rb/Fo0yyHku6eVYeguz5w701SMfBzIkweDiBYBKbIfBE9QF37LRhf7M0427ei8TnbbvdF7Yt10Y
	pC0UlquH+x4BVNTqBr3vGKsxPygxGQcdSG13mOGfgbnQatdz6Gcw5Gnn816ygv9klTSyZ
X-Gm-Gg: ATEYQzzDm8IUBFjfC5FXvruPMRau9+Q3TvIJ0Ar6yuZImVVO0tJPdHhav++qFUrsu2V
	R7w6/83nHZrSGmPHhkxpyRVk6sCb252zXAFpSUtjA1fpbYlNxY8xXKb1BZJfQpYFIASwF1eATvX
	yyZMCROjSopLnvKwEh8/+YP4jMaqrXmr+zENmLRuE5ZN0kR6/EWm8zcTOuRLdKu6zflXfPFtvAS
	d0bZ12MkBaKzdi/3JUllh1K0ChI8QpStTxpwJ72zmo3t5kK4pRQP86lPhqmsW5y4GJ61FlWsy6y
	+wnpByUqsOkDMfpiKQIOykU1OEvgtiaKLl2sCucAjclvW2IqGENpW6XYG1+xHpwIqTJ6Ya7OGRo
	XWNTRhONhQL7WtsiK+1w+QymIRAono9XAjhlPaGBpOdImYDsEmdvhzgDz3Mf9Su3xrGfkNQloUB
	I/jhw=
X-Received: by 2002:ac8:7d4c:0:b0:509:24e8:ec48 with SMTP id d75a77b69052e-50b148afafcmr22900071cf.6.1773830901902;
        Wed, 18 Mar 2026 03:48:21 -0700 (PDT)
X-Received: by 2002:ac8:7d4c:0:b0:509:24e8:ec48 with SMTP id d75a77b69052e-50b148afafcmr22899851cf.6.1773830901370;
        Wed, 18 Mar 2026 03:48:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cb46sm178339866b.21.2026.03.18.03.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:48:20 -0700 (PDT)
Message-ID: <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:48:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NiBTYWx0ZWRfX2l98tUoy0jIe
 HRznJZg3/6ub2RIo2VGIDzcaOpjPD96czYZbwtF39+tIfD/KqEThKqeZD+PMqKqabeaaAbNUDrT
 cEeLfT/Rg/3SM+AiGJmja86IvxD9CroNqwN1I6VUB6CHprWNlRdwulNN1gbXLB+m7cQcikr6Hh4
 pRkTLHEtif/FH7O++ymJ63DAQtk20A4LZa81j7d+hKCmvIN0HL8FK3g4CIpth3lwzwtVyjEwLRb
 qedNXNTIIlIHwjvW8EQPpr5dNKxHT5sqch+sw0egI5Uf4hYOymVS89HpHfPpLoAwKTqGjhgfd0W
 pFaxZB9zzFPFT+y4DX5pq45ha7Mtg6f1Wd2IsC9p4OISiDtC6I7Zm+0atiyyxBQXGLqq1vqa6vp
 HeT774DVMXrTsDvxOJpoNEle5OMJ1dH7gubRfx2dQnFaCU3QfWwOyjMw1BVHvnc6aOUZWrT93/a
 I1YRrvFRdzCVKzQ6NCA==
X-Proofpoint-ORIG-GUID: RyWVzMc3RXPnVayTm-PcJC3Ix4XSLa_l
X-Proofpoint-GUID: RyWVzMc3RXPnVayTm-PcJC3Ix4XSLa_l
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba82f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vXNxit1Icg9rXcKRa9sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98418-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A205F2BA34A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> Add a driver for the display clock controller on Qualcomm Eliza SoC,
> which is copied from SM8750 driver plus changes:
> 
> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> 2. Eight new HDMI clocks,
> 3. Different PLLs (lucid and pongo).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]


> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Linaro Ltd.
> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.

-> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

[...]

> +static struct gdsc *disp_cc_eliza_gdscs[] = {
> +	[MDSS_GDSC] = &mdss_gdsc,
> +	[MDSS_INT2_GDSC] = &mdss_int2_gdsc,
> +};
> +
> +static const struct regmap_config disp_cc_eliza_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */

0x11014 is the last register

[...]

> +	/* Enable clock gating for MDP clocks */
> +	regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));

regmap_set_bits()


with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

