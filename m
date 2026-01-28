Return-Path: <linux-arm-msm+bounces-90907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAWGLSi5eWl8ygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:22:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E519DB80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08B3F3006237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319B02D7817;
	Wed, 28 Jan 2026 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpoajJSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+oVC5XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2CA329391
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769584903; cv=none; b=fVb/oTHMy8L3Jd44630TpSla0GaczmPBnfhBkFaK8kyr7m8jGCe63T6MZpOxZLXGqFUFAnPhRjVTlah8zwMTtjQmtmEJQwVwCb2wqNnkWobySXzPtHSuMVwLFGNZEBSrPdblIZ2HdAYkU57AFDP5Yl1XbUBQHkqsp8/R0EhJwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769584903; c=relaxed/simple;
	bh=2QkJ0O/j3QhCkpBeOwUdXsahGbhnoWQBSYxm9U5xmCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1OnOUOz29C2uZ5MzJv7YP/WU0Ns3Izdo4ume//IB8MUYnjBgVA5meuLczbQ9xXEfFtYOPxFd++3KOO5Si67JEQnQaBARcnfieZmAR6Rpcntn7NZZNZbQmSyhwnXeoziGKWp016zuE5iDiC9hCPtqZXzhpIf3gSYQTlkoHys+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpoajJSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+oVC5XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S54HeX3354089
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gP9XExijN/w7adWro8gAP8Dbsmo9LkOzd/iaz/cVEW4=; b=lpoajJSm6YISZj9A
	+3j1YDE/hn4IkHAcooYrebGKfRAHbc+Oh+i9CpDa5u9jcSNkDsWCfVyFqav7ZMVw
	qRV1u90jFjvKtlEcrJIXuh3yPGPVAofTjFUH3hHU8c6IRIgkMQ7/n42xRpiF7lfJ
	rp7Ca7uA5wb0/qU2FNagtMuMZfXzX/9knhgrLRpJ1gDMCeVf/RcgJmro8EYIgCzs
	lRoPV7RRCxzkjPzfu+D1fW90Graj+bPwnFGDpwZ+ROTovYx46xif5OrE5uYaPg6P
	7UUS5oJuwtHcEldBXTGdzDmfT2u/xr/UhSoHzBkyXYkjh5m7E7cySWmq8OCc3/6q
	sbi77w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv0cu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:21:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13be531b2so65956835ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 23:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769584898; x=1770189698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gP9XExijN/w7adWro8gAP8Dbsmo9LkOzd/iaz/cVEW4=;
        b=E+oVC5XNzV6yqS7pjYsedLOBc72c4CdE8DRKWDay34Hzryl3be49OfAsbEFmXphZHp
         /5Hk66Vr5IdkN9fF1ubheJdPY6yg1hlj+9xXqZCdEarlu5LA3gzY5pP0jX7dnFCtpti3
         DkbBfRqeKIDLZQVzfjVaGfFihem3Rer5D4REFp+F9vK46Ov8ivkAqHleCWiEcKBHNHv5
         ILpdm++Q5ZGQer0Nxe1Sz2xS7/FaXjlQnrZRbu9Nv4asXaYJXLd4vGU/B7O0yS32qz9W
         BXEBJ/hvZQothEk8iZVKSa9xVPwqEQNsb08iZ4SLKR9rCsLTvCdDnroio6bFEgz4W7Lm
         8Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769584898; x=1770189698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP9XExijN/w7adWro8gAP8Dbsmo9LkOzd/iaz/cVEW4=;
        b=CvOxAbwiu3A4el5KWhGseJExpc6AW8dRzGfYedLnSR0x8MHAVQNB9B4/M9RKoOduMq
         6jT9Z44AG3Vm0lzVoDdx2YumFZ1rl0K5BXLYEtPMxCtSK1lzzOGFjXuuN3y6z/4v+ULn
         DjlmzIQUZ9G9X4MrLYuNuT4MgmQd39TMHlrrP/DXtHln5YUZXm1B+jtKQnbKWKaf9FQN
         X7MHU+XqfnKQOOrMVb8ko4NPoNHQUH9gmDgV8DvfXvFlk0kzVhl/pEMu1XqJ990X6u67
         tMMQb0ySFyZN/FVeIa4eAFuyKUnm+Mbp/zXKlbpI6iBcPF8EhM21xYBMTLHkrgYZ0uws
         1+yg==
X-Forwarded-Encrypted: i=1; AJvYcCUsnMCNSnEtcs+CU4XZEMDQ1JWfMtZMt/SjaP+jTGTjhkSryX5Dbw9RCY/iZyvi5QZQ6ub4WgjzGHO/9ABs@vger.kernel.org
X-Gm-Message-State: AOJu0YwBc3DZ0Pt77KfFNCMQ2oB4S2ML98TKVX2AI/Zm5Ajp9dtPraZn
	XBZCdO4UK/GoRSKXR2Q38GRG3pzUuIMD1K1UgL+GT6pjART+CpRGiFzY4BuYBUPJ4djnRDUxtQP
	QGs7T1bmxsb5cy6aXX/nMaXiBQDWTOghcvjWHvHn9bdfLddFaWOJzwx937WHFNuX2r7EbasCDXU
	Zf
X-Gm-Gg: AZuq6aIl5ByLOwgFrdM3RmlioOZCsuUpFf4xi06HpoltXmdYIfci73Zb/t24PL7qMYp
	p7mByWyEPyNdj8dXltFJqE2aOyZVPretYtZ4aMzaCIPxu5+r3TAVikWQv/P5KpUElkU8UhCwiyw
	eBKAsdP8A0xgD7vkPLllKfYYhbz9qGFtklsYGbZQ23uvCL7xTNBARQKpqjeh//ohTp10pAsNh+V
	N9mJcufXD9+RGgJWidjyhrXULwGXbWwZvxjRP923yt+/HoQHHrQwvZEw4xVPj1SlnXTOr1vpMnE
	DE28T2g1PHoymFo4HTmOo/OC8aZR2I+CWRgEcQ6lnDYEaEhUhUW2/KCiZerNC7zrwVazrLgBS2b
	JIHc9L+Pl3s2WZKqveX5Y8smwuVOwmboFvM4UeQ==
X-Received: by 2002:a17:902:d4cf:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a87827bd1amr37619845ad.15.1769584897481;
        Tue, 27 Jan 2026 23:21:37 -0800 (PST)
X-Received: by 2002:a17:902:d4cf:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a87827bd1amr37619705ad.15.1769584896920;
        Tue, 27 Jan 2026 23:21:36 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5dd160sm13244295ad.81.2026.01.27.23.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 23:21:36 -0800 (PST)
Message-ID: <795eed3f-7796-47e1-b4de-23424ab7062b@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:51:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mOS9AosVQpVOUX7kW4i6fj1rJPfsdjUI
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979b903 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HuBNfymTJni3uwX-M4YA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA1OCBTYWx0ZWRfX8f0n8FwPZaad
 ZRTeQdgIND57upYjkK2jaHzeuispCPyEuPxSxr2+VxzWtH2xuUShqcPQ3e1+VyyHXvC++ENzMUL
 fG+vHc0jrmugx1QPI/34WPmGOKU0P4y9UBzn7yCFT7p6dKbhxKdMtIx4vxYW9LZjkg5TKexV0Iu
 ZvcTdaSGRCI6Sw/TOlw61FA0GhwfVpJaZGZX0BjUQjiWWkNYcmsYP8apTYl2QgjCQe6x29IjNt7
 y5pacOyk+wnJcOoyzAvE/zTc2YC7dQtn3XO3av9tw+PQc95+vpk/BKWzNaLSyKC0iuOYQRJAvBZ
 fqn9FM8LAX2/sfqKVc3n9VxZCBT+ykytpaz6XmMxOFKLfVsdvxAd+xPjj2Zq6dhiotrBc5KdXzl
 z85h2YnBkrhmr4IiL/0z/fv5CfKAcwqLr9vsXkCiL70wDmb1lOtUH3uzy6iH9bS05pcbhufKtuF
 a27mooY7hGMB0Omc2Ng==
X-Proofpoint-ORIG-GUID: mOS9AosVQpVOUX7kW4i6fj1rJPfsdjUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-90907-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20E519DB80
X-Rspamd-Action: no action



On 1/28/2026 12:56 AM, Jagadeesh Kona wrote:
> Add support for the video clock controller for video clients to be
> able to request for videocc clocks on X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |  10 +
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 596 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a8a86ea6bb7445e396048a5bba23fce8d719281f..b1b1ed70871c1b348985d6f5149152e57637d904 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -155,6 +155,16 @@ config CLK_X1P42100_GPUCC
>  	  Say Y if you want to support graphics controller devices and
>  	  functionality such as 3D graphics.
>  
> +config CLK_X1P42100_VIDEOCC
> +	tristate "X1P42100 Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_X1E80100_GCC
> +	help
> +	  Support for the video clock controller on Qualcomm Technologies, Inc.
> +	  X1P42100 devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode/decode.
> +
>  config CLK_QCM2290_GPUCC
>  	tristate "QCM2290 Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..b746e5046774259cebe3da8dad1f226561268a8b 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
> +obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
>  obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
>  obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
>  obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
> diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2bb40ac6fcc57e817ce8f0b6727a571c7c072ffa
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-x1p42100.c
> @@ -0,0 +1,585 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_VIDEO_CC_PLL0_OUT_MAIN,
> +	P_VIDEO_CC_PLL1_OUT_MAIN,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +/* 420.0 MHz Configuration */
> +static const struct alpha_pll_config video_cc_pll0_config = {
> +	.l = 0x15,
> +	.alpha = 0xe000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll video_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &video_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +/* 1050.0 MHz Configuration */
> +static const struct alpha_pll_config video_cc_pll1_config = {
> +	.l = 0x36,
> +	.alpha = 0xb000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll video_cc_pll1 = {
> +	.offset = 0x1000,
> +	.config = &video_cc_pll1_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map video_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct parent_map video_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &video_cc_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map video_cc_parent_map_2[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_2[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &video_cc_pll1.clkr.hw },
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
> +	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
> +	.cmd_rcgr = 0x8154,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_1,
> +	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_bse_clk_src",
> +		.parent_data = video_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
> +	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs0_clk_src = {
> +	.cmd_rcgr = 0x8000,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_1,
> +	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_clk_src",
> +		.parent_data = video_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
> +	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs1_clk_src = {
> +	.cmd_rcgr = 0x8018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_2,
> +	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs1_clk_src",
> +		.parent_data = video_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_xo_clk_src = {
> +	.cmd_rcgr = 0x810c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_0,
> +	.freq_tbl = ftbl_video_cc_xo_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_xo_clk_src",
> +		.parent_data = video_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
> +	.reg = 0x817c,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_bse_div4_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs0_bse_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
> +	.reg = 0x80ec,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs1_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs1_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
> +	.reg = 0x809c,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs1c_div2_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs1_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_bse_clk = {
> +	.halt_reg = 0x8170,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8170,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_bse_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_clk = {
> +	.halt_reg = 0x80b8,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80b8,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80b8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_shift_clk = {
> +	.halt_reg = 0x8128,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x8128,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_clk = {
> +	.halt_reg = 0x8064,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8064,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_shift_clk = {
> +	.halt_reg = 0x812c,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x812c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1_clk = {
> +	.halt_reg = 0x80e0,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80e0,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80e0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs1_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1_shift_clk = {
> +	.halt_reg = 0x8130,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x8130,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1c_clk = {
> +	.halt_reg = 0x8090,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8090,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1c_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1c_shift_clk = {
> +	.halt_reg = 0x8134,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x8134,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1c_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc video_cc_mvs0c_gdsc = {
> +	.gdscr = 0x804c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0c_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs0_gdsc = {
> +	.gdscr = 0x80a4,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &video_cc_mvs0c_gdsc.pd,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs1c_gdsc = {
> +	.gdscr = 0x8078,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "video_cc_mvs1c_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs1_gdsc = {
> +	.gdscr = 0x80cc,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "video_cc_mvs1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &video_cc_mvs1c_gdsc.pd,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct clk_regmap *video_cc_x1p42100_clocks[] = {
> +	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
> +	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
> +	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
> +	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
> +	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
> +	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
> +	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
> +	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
> +	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
> +	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
> +	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
> +	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
> +	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
> +	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
> +	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
> +	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
> +	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
> +	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *video_cc_x1p42100_gdscs[] = {
> +	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
> +	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
> +	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
> +	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
> +};
> +
> +static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
> +	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
> +	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
> +	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
> +	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
> +	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
> +	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
> +	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
> +	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
> +	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
> +};
> +
> +static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
> +	&video_cc_pll0,
> +	&video_cc_pll1,
> +};
> +
> +static u32 video_cc_x1p42100_critical_cbcrs[] = {
> +	0x80f4, /* VIDEO_CC_AHB_CLK */
> +	0x8150, /* VIDEO_CC_SLEEP_CLK */
> +	0x8124, /* VIDEO_CC_XO_CLK */
> +};
> +
> +static const struct regmap_config video_cc_x1p42100_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x9f54,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
> +	.alpha_plls = video_cc_x1p42100_plls,
> +	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
> +	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc video_cc_x1p42100_desc = {
> +	.config = &video_cc_x1p42100_regmap_config,
> +	.clks = video_cc_x1p42100_clocks,
> +	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
> +	.resets = video_cc_x1p42100_resets,
> +	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
> +	.gdscs = video_cc_x1p42100_gdscs,
> +	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &video_cc_x1p42100_driver_data,
> +};
> +
> +static const struct of_device_id video_cc_x1p42100_match_table[] = {
> +	{ .compatible = "qcom,x1p42100-videocc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
> +
> +static int video_cc_x1p42100_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
> +}
> +
> +static struct platform_driver video_cc_x1p42100_driver = {
> +	.probe = video_cc_x1p42100_probe,
> +	.driver = {
> +		.name = "videocc-x1p42100",
> +		.of_match_table = video_cc_x1p42100_match_table,
> +	},
> +};
> +
> +module_platform_driver(video_cc_x1p42100_driver);
> +
> +MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


