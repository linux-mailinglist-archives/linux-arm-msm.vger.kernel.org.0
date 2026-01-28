Return-Path: <linux-arm-msm+bounces-90947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJZ6L7vmeWnb0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:36:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7C9F912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB854303C815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9462D2DCF74;
	Wed, 28 Jan 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJCk6cVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV8zwRrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B702D5410
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596496; cv=none; b=nBRik4sLSPBPOQIMXvKX5Us/LDSpLbQcllqqo0ca8RWWsdNjSp5xfI7YmOQXBGwd5uaOIkejMPVrqUj/eQKSL9DYfe879IlNjgKYoG2lq/LgGR3siPjBXxuVw9Fv1GR7CWL9yqd/GkjptnVqdaB+jjrNs326voEhRQFrU5C9KY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596496; c=relaxed/simple;
	bh=HsKI8X7852eK07yEmtE9uzf7klLj/4S5XyAqbNDEDvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISQhoeFI8QEKOzpM17ws5ZrHM8Q+K4G/NUtqpvE6ted1OAdv8MCX2WxLnVk9T2mELRpg3Ff8PgGHmw5M60U+oRiDGV6vOWTNaS7GdaBp2ZQS7MTQ8kseEl9JN4BpCFV7VDn5CLioBAO6WB2lTnztAekstVqjqjm/kyW8UEQyKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJCk6cVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV8zwRrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928NC811695
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcWbNCQycmM8x5jw0xO7IuxbVMoHZTQUjaqgqnklwsc=; b=IJCk6cVEH+MY3uBj
	QVUOP4al9n9MOO0GO8Ld9hx9e67iuRHD/4vja7TTfrrrFItxiOWxPENfQu34DRN5
	9y/HzF/ANulKipskXOexTSvZD4l/ALvZjveKRD/vtfU6iyap/HYXOhEnMgWR46z3
	rY4zOz1x+Er3P0iirP4STHYZjA6xV5kOt1sfek2tfphdoC6YKmBHmPzWJpGdny9A
	LZQPx6weqHiSTwHjcogLKvgFQYZ/NTmhEf4SDvnHIgT4sxlOHVKHmhCl3273HCf+
	g6N8g9amNpRTfFTdZFlXru9boJecalQCxlARPZ+ScEiM+UkLvV8uE03p00FaX/D4
	sA2mXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbj35n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:34:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso14561985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596493; x=1770201293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcWbNCQycmM8x5jw0xO7IuxbVMoHZTQUjaqgqnklwsc=;
        b=kV8zwRrRnYwlhRER0zGK/zHNoG2bF5/PskZfSJ1FLyhrIj5Oax8yE2lcPnf6En+reE
         4EduA9jYVoHHh9JLkXS9REKU2UU+SA6uldIootts9bfMLNAEgeBZ8HFx1wTHRTYazGyP
         hO+njo44WvLhsM71TZM66iMyddz3m0MRgKKtWCf21HJAI2dpBLqX8moEPWjd82z+7lOM
         8pgSo0XjdEMaEwUSmt1fHT7DtdWLgM3pSZ+hY3BpyxFqj2p2DYA668mQfkaeZrCrRjhs
         h17LBwcwkxmCALMpM7KY3FO2fTP1POlA8PH8IfF+TTSOJr4xnBIc2n8ABQQQHErsRv8s
         AsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596493; x=1770201293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcWbNCQycmM8x5jw0xO7IuxbVMoHZTQUjaqgqnklwsc=;
        b=ZgTUACToKis4XjotJAakYPn5OCNzZgWPwkg7OGAzv1zcdrRw221LgvA6T2PB3Uy4h2
         8OJRE7pLO3Ua2bKvdRgqZEA1Cr6rhkyWIv7F9FTQWUVD/higf40LRbuo5isZrnDErka9
         eaEhv5iFVmLZ7+PrvVuC9xiOvi83+6UfcC9zjNIYSBZht6vwRhv5urWQ5iKHARiitGVH
         j7tupjU1xRE87aW+hI/dlpONVh1rgbnwej65ynYfIGadK2/k0S+iqLYLlpxskVtZJ7zE
         Xoq1MkrAHItZa8bsd7P4JZBnIcChyDHdJ80gDOwZQHRkSj0IxrFOrkIuCi0f0TgmfwNb
         gBiQ==
X-Gm-Message-State: AOJu0YxN0WZ8ZcJJeqkiQz0eT6uh9PkXWfTEITOdx83ppFgwZyliNw5T
	w7VVT6sBsrxAmACNG3hBJYE9lqXgouemLqXPGzDjPATFRShSXnRYxnx6HOuvG+Vphv1SOebmwvl
	7crtS3YQkGQAGs7swaTlgvzoRtO7FU8sWciTt0irOT+pIhVBpYZPbiEve3mCtMwbDfY4u
X-Gm-Gg: AZuq6aLR6vwPTEmXsaqWqx6JaNw5J2c7B0iu7Xqw88xPXcy6j6flhZyzYqdoZV0MF4l
	FRGYP5y9tfWOlF8haBpXZb33iDfawJjUc424HJdVdzi6pXZpnXEsRZmEwNYFiJp33P2nUgs92Wr
	ODsKh4WJkbg94HMzT/rROyB85Ur1/nOgvrSJogaz0uCWs6xOxZJU4ttSo7BlhW3DiiFfV2mBt1z
	Axg4gC5q37IbiNAH5KOtM3zj1jpdp4I0r5rSYs+r0OyJ4x0a70WMm3h24ewviRbRdxy/oR95QiH
	PkAlOBNOF6goXCPbIw5rcRYB6je3UoqPGEcqMgAGrp6Wu/3Y0FcOfiptbAIBvXcslD/XfRkmkQY
	xJy9nQfvO44Lk2bVpyf7pGOUrd87aLUGur+tgXYuFBnOQKxECnVReksVfnAfDWpcgJP8=
X-Received: by 2002:a05:620a:bc3:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c714b85971mr124199685a.5.1769596493257;
        Wed, 28 Jan 2026 02:34:53 -0800 (PST)
X-Received: by 2002:a05:620a:bc3:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c714b85971mr124197685a.5.1769596492863;
        Wed, 28 Jan 2026 02:34:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86942sm112832566b.11.2026.01.28.02.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:34:52 -0800 (PST)
Message-ID: <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:34:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6XxJJUjB4sBqFjDjVSkejXf8o4FhyUTy
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979e64d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rpZdSPpRYYrpvmdKZM4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6XxJJUjB4sBqFjDjVSkejXf8o4FhyUTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NiBTYWx0ZWRfX5DUrQ+KnvD/h
 Qq8xHrorEul1VwrMjUC3Ow9tmfg8TOLAGKQvOXcHToFrQ4Dc4U7UtOO63rxXn5ojnzZdopxLLzL
 zxWDncBaZ5716Pxv3Ox8BY+IdedGUDQjhScKRdGz7WEpFu3/iVMYJVeQ5TolhmoqEJkhgd2+IAq
 QGKhLgldj1MHQq7Y6iSR8Eb59QQcKCP6rqfrtpRqDU+gNVZDqxxJdwkEm+7CTxnaUOzSebsIZzm
 N+Hb933pIpw62hq/Cya74VhQ8GNTylvcajCE0o0j9xnwduvp6ooy0pMGDCNxwsV4mkIWJ160vYs
 AkXxLsy0cItshcSb4Z/qB4kBMTmEEeY/1APA7GwvQ74/8qrHPesMVuPMV0/yitomETFzLjXgkgy
 4FfFWrcFYovRmCHl7H9Nyu9U7qBjxJmOivjqBlyHT8ay5b54ljkEqORywA9cW/oNKIwcHNuYche
 9f1zYvPmB/GM7VuvOFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90947-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14F7C9F912
X-Rspamd-Action: no action

On 1/27/26 4:03 PM, Abel Vesa wrote:
> Add the TCSR clock controller that provides the refclks on Eliza
> platform for PCIe, USB and UFS subsystems.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> +
> +#include "clk-branch.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +
> +enum {
> +	DT_BI_TCXO_PAD,
> +};
> +
> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> +	.halt_reg = 0x0,

These regs certainly aren't at +0x0 to what we normally expect to
be the start of the TCSR node

[...]

> +static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
> +	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
> +	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
> +	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
> +	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,

I don't think this list is complete

Konrad

