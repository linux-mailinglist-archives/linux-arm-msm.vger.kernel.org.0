Return-Path: <linux-arm-msm+bounces-75040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDBFB9E44A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB19716B8E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F552EA15F;
	Thu, 25 Sep 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3fPcCME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211222E8E0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791932; cv=none; b=pd0FNbMT8gWMuBA6P6B+VzNBkuiZq9y24frN34a6/OHzY//EewJvCiR0Ov3QgpVC6HXwf/7qPR+LlWHdgk/bYpBsBAZUfYhRVVwi0z4izF6i/dIg3Wi9/b5BZmH+EkN4bipyg2ZiWhjhOjZXgQiueOC1FV2O1cTCwYDTgJY5BNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791932; c=relaxed/simple;
	bh=aBzVgiUoATjDskwmV+O0A19hA27wGt/bIlMwuurcLQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9shWZh8LC36qWpVLXFXZ0+kAIRzcf+yY6sMlmChei0885mvI/JtRc9J76Vo8b9iiAnzpZFV2e2fy4qWjux0URzctjWpv9DZ1yFuDgbfXbxb4GqZFHNNDyh6bmxykOVHwoD0xkBVr8n9mL1zfvDXMBsg1b+7Py9Bf2UycWcUtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3fPcCME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P02k76018785
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea+frmUPjgVv+Mq8YyoARL2w4ombZur44q+lIGeQf9A=; b=T3fPcCMEvUb2K267
	hcXjAwxtuGRjOQXEtY7F18Opc1UfFKz3aC+Fd52JdfA0fgp5BH4/B6yKoBzfEybg
	h0EXKNlVe2fecrLcuiC8MBfTilQaTAUN3G64nwhCIq18TX32wn/7w/ZnFg8X3Shz
	wSXgbchIicsYgIKDPYnKbBmqIvOAK6wMYI/jCue88QPixWauH5BR14VbRMMq0Xmi
	eldLpRKbmTOjLuYMxK8MmasER+CICnb3/+gENHqVppB9hOft83l9PV0AiY3XeJ4j
	NRsD6MoxSn0PAG+n7XfbiNVzcUMYQJCb+MqyAwKDI0rH3fPWiwXb5vYZ5jT6jHJd
	uVVEug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbgca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:18:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8572f379832so25399885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791928; x=1759396728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea+frmUPjgVv+Mq8YyoARL2w4ombZur44q+lIGeQf9A=;
        b=w1vtOzk/S3AjQRxVkwLAAqxDnohEgHrl+SEo5GLPJ1irfdbFukFlrExmgqjvtwr/Yr
         tcfvJajCKWHE8+YzuAXo9naITh8kH1ULhCiDPbQRFZul2z2IhMjdROt5clvRkBE19/JL
         u4u0ke5fCDU+6fkGMJXshCyrFPrLecQQ3beSQYaejqrG+xG0MLCdlFCFKpauDh8Q35if
         l8v6vrh9kbGR7l0pwaFUATHrIKd+vcqx/eHHuCpIu/5X5wer2lWejFwpwtOFK+06J/b9
         jVoEDCBQYbQGI3he+14uRfT/0g+z7cyarkq8eVANG482BsJE+daplmriV5TmSqUcmUp1
         LUOg==
X-Gm-Message-State: AOJu0YyruZW/ByuqHHzioyfoHCrSSlt0c67Yhwn8CEClvFkfcZOM8sAm
	FscfVDGZ04LAYSTFKCvQr1+F2aKaoimsXsNLuogg9QRkvaMiDa/9bKqnhC85jYpsAmipyQUA1tt
	R+Y/O0lFiM0wzbDVxe58SsFT39m4J8oaS1dpXp355mJiMKkpd6DR1f55CGCNL1Zc4ciYS
X-Gm-Gg: ASbGncsChmQhu1S3Au2QgnQuu1meE6qOmGt8aENhycs64nHIi4OcAJyLa0mYDfByT31
	WeJ8KKKmdzPvhzlMeqo1mp+EomYYwbUK5g9f45+j1KXgsMteSTmgTxYatzX9ajcNyyxwzibcvAz
	XUe1DxzZA+gmtt6TbOTE+JJ3G2DNFFnu/fSDkJZF/kmmLqaFDccqqhoAKDL98vntMJh8YwDzD9I
	Moy8cuc6MvjM7Dx69T2hRcsgNDyaUxHKBhVNXPKJlhdDDOviRLmKsBlnQgEHK1ay7xZiB5bL0OD
	S98vOWNySBhrO5YSvZUTketKrUfMleW1GxZVG+YmFIoQhUfl6fpjxfKkA+qaYgDpgkeEFZEm0/C
	LIwI72F2vMJbvsHnQ1UjPyQ==
X-Received: by 2002:a05:620a:2948:b0:7e3:297d:ec32 with SMTP id af79cd13be357-85ae6b98c31mr219202285a.10.1758791928062;
        Thu, 25 Sep 2025 02:18:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ZYl0aa3NdV1AUBuLFOtIFJqHnpIWD3oOeW+CrL7tUMx6aQqFaHJq4P9k7znBgc2to9oBTg==
X-Received: by 2002:a05:620a:2948:b0:7e3:297d:ec32 with SMTP id af79cd13be357-85ae6b98c31mr219200385a.10.1758791927534;
        Thu, 25 Sep 2025 02:18:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm128782566b.86.2025.09.25.02.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:18:47 -0700 (PDT)
Message-ID: <3355306e-4059-4af5-8865-3b5335356382@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:18:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-7-e323c0b3c0cd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-7-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ybAu5iC9Z3_6OwcpUCBOD9yrSk976Zpm
X-Proofpoint-ORIG-GUID: ybAu5iC9Z3_6OwcpUCBOD9yrSk976Zpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXyBhHPt2ipzYA
 toDcfajpGODA7NPnbFcw3SPY7pp/zIPw+z5r1m0ajn+r8ESt1Ez8QCWBTYUMoxAxKloSloynJp2
 Y6D3nWSiagxv5hs8nGnlNzJ6XPVVCJlL7uXpyq+PsHIMxPt+9/P4wFUNg3lXN5n4xjCZra0Q+5o
 6ooUoMAoSejYeUNgw7iXBfFEFCuJQ7A9fy45S2e+jUWplzRgrLtWncn2Ivbh0nN4q4dCH1lbI+H
 ur9gnYcluqJw3vZeUMGggJmoRPvtJZ3xGAtqHdd27lUofDrKlwlT5mKG95L1hyf0MDBr0+QIicH
 J4AkBtw6qM3sc+gbUjxB7GuRJMoyMLcZ9Le3a0O4JwJ76AO38MFywjH+i2eF8Ovhcs9l6nbNFt3
 lWWqZG7y
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d508f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Z7GqTKoUbcai2g_QebIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 1:14 AM, Vikash Garodia wrote:
> Add power sequence for vpu4 by reusing from previous generation wherever
> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
> earlier generation wherever feasible, like clock calculation in this
> case.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

[...]

> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +#include "iris_instance.h"
> +#include "iris_vpu_common.h"
> +#include "iris_vpu_register_defines.h"
> +
> +#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
> +#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
> +#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
> +#define DISABLE_VIDEO_APV_BIT			BIT(27)
> +#define DISABLE_VIDEO_VPP1_BIT			BIT(28)
> +#define DISABLE_VIDEO_VPP0_BIT			BIT(29)
> +#define CORE_CLK_HALT				BIT(0)
> +#define APV_CLK_HALT				BIT(1)
> +#define CORE_PWR_ON				BIT(1)
> +
> +static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode)
> +{
> +	u32 value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);

I think this could use some explanations.

I'll go ahead and assume that the eFuse tells us that parts of the
IP are disables (hopefully not all three at once.. we shouldn't
advertise the v4l2 device then, probably)

You read back the fuse register a lot, even though I presume it's not
supposed to change at runtime. How about we add:

bool vpp0_fused_off
bool vpp1_fused_off
bool apv_fused_off

instead?

[...]

> +	if (!(value & DISABLE_VIDEO_VPP0_BIT)) {
> +		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
> +						[IRIS_VPP0_HW_POWER_DOMAIN]);

Maybe the iris_en/disable_foo functions could get a wrapper like:

int iris_enable_power_domains_if(core, pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
				 !foo->vpp0_fused_off)

I'm not super sure about it, but that's something to consider

[...]

> +	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN, value,
> +			   value & 0x7103, 2000, 20000);

That's a nice magic number.. but what does it mean?

[...]

> +	writel(0x070103, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> +	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> +			   value, value == 0x070103, 200, 2000);

That's a slightly different magic number, but it's oddly similar to
the one above

Konrad

