Return-Path: <linux-arm-msm+bounces-103714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKBnNjLw5WnCpQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:21:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC3428C94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A98B1301287B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A17F38F645;
	Mon, 20 Apr 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQIzNxog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnMXHX6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615FD38D688
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676890; cv=none; b=K02dlZlZOVhAoUdsXIg0a3yY7CxPG24MCNg2oX6vd/BcY4gLrKevVLUbuv0km0Y1s87BXQPfWzEhJ5N2OG538EPZvhmFjBsCWxHiMucrDLpm++T8ERJIS69Z5BJc0IuhgzsspaW24TCeNu27vVOHdEqkIM4JxwgHVcLFxV+U4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676890; c=relaxed/simple;
	bh=fFkqXe0fXUxiRzVl60VHLVC3FqHlD9EMGxP5bZKaNW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcwXAWVKQtIR/lIoR0usgZ2pUExrB0pJ+W7kMvnC0HNuX5iaffvfgfMcqA0UA7lQDj4Ys2VxBtlqfEhZGsocMnvxYg5Bz/1CEjMigBwrdVFjjo257DwcBDsehdfrswzj0GbNHDXO9vdbdqOfNjBbp7iq/RkZJXvgRVvdOQTux2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQIzNxog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnMXHX6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9JMpe785873
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7Fv9i51vjat96fgAqnutQphDizXtxDgsL90vRu2EmE=; b=aQIzNxogUV0yuW2o
	wvnNM0F6aWkDYnpKhYFWYlZGzCotaOLJTYTTEd3HFLYChTOsSr6fxsQqS4kF8xp4
	gMzj0JaueCTwk7TaG1qhnxdxW+wXzH38BB968g7ESp9qEG6iG6vlqilx0pVUXzQ8
	xUj7akofbdFbiig2+bVZMkPt6RYtALsRICMIUcGPy1rH17XfXSvt/6S74j0hxhtd
	Ot5YIsGEte27tQmnJkAXvepn6ir56uJdLcrRo/iGUEl20/W7mT70oWuympUWslpA
	A06/1IeZftmj4hVoQITE9fdL29pD2lFvLiA5y1IFsW2tWxTGdhGotK7eL0cnV0jA
	tAPxuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhg088-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d63aeaaedaso70636685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776676887; x=1777281687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7Fv9i51vjat96fgAqnutQphDizXtxDgsL90vRu2EmE=;
        b=AnMXHX6XbL6Lr0yqFipqcM93JNHZ1sjKRXCb4tpoRdK9id9zj4VzpsxMD4/jWvzp1J
         63uXPE3519VQG3/HBrbF4ZIweLMhzOgHr+aFxICa5CgVrbZQ2W00FSDV4pFmOcuHqBwQ
         IaFI1QirNvktF1vfBmDl/bTmB4ZoC58+2rPOBpn+zmXOaEjahk4DKHUapL5NWNkVqAjI
         qL2SjdUY/1IQryEV5u/62nEr+BjBwOwBmvGC6Etfnop4o5EPa8CIGpGreMEOo1BRavJW
         k83WStmG0zrqXYVkuKImcFS0YPsQWqzirGqwdxZN9J9tNDtFez94/uACfbshA63GBuPh
         z3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776676887; x=1777281687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7Fv9i51vjat96fgAqnutQphDizXtxDgsL90vRu2EmE=;
        b=ea/ggm9UXu03fXqqOv0m2g5nHCrhBZEYpTpcURh2ZlKcRD46Bz9DtL6KUQ5yCwqnRI
         DA7QJmP0GkQ3iV6SxqSlzNVr4RBEUNEgfrGz/WuszZWfgc0EZwGAvbgsR7XsD0TOwdgm
         YvraWOy1rNdr7oc+LS86p1fD4nw+iEKMiP3ouG7bPTdz97bug6/Lg9xaRcNDlKW4UEI/
         6FrxKfasO3nIkByzrgPPtaNb318n9hhTe6hVOSCufEONVOrVd6khOjLg8T9SJnFtW04S
         dWTInTALUhUJHQ8E1/HNfutWsNmW+48LQnRUwmGeqs602jzr93DV/CBEg5ThJv3d9BKf
         k0+A==
X-Forwarded-Encrypted: i=1; AFNElJ8BV/hWfq98AJWzEcPEa1NW+r92qRZL//eDKfcAl22fCZ9aM8+xDdmQ1RkmsY0MEBPXWlJkHgMuLvTNSeBE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5cgkXHos8BpsS/075p/R0Azx1Xaa7EhQurWfe/+6MtPCCZoNl
	KNgaLGOJmVXdgInaWg/WeMeC42Kuajh/lnOiza1n7XH/HvQ9V+jeSdxdkf8+tnj91u0h1IUttqG
	u8D5486lICueohH3LBzQm3KyRsxcQLgh3Ct8HJ7rexOy2qssSKHccuRm32dhOYTBcyovd
X-Gm-Gg: AeBDiesOdEtpLMGuosAIIahgTLUBrbSRIuFEs6pAsdu8Dx38hXzYgtiSox1a6XNLI3H
	HBqpQOxzcsRUO7LHgGNH0QHqb/+0RZ/gE/AUocCAHmJ0awRtSbaGnTRx9EmVaLiZ9+BkyMB21Lg
	LAXm6qkuzDgCOBMXjlQ5of9Ox24cmxFxXY5p8PSjoW1dqYHi7BosBbUqmMmr9F9uODCLXHWf6dp
	y4q/TLIyrIguIVzYHzqFa0XBLNLgVqz3GjbaSWBP9Q2jNzilzxknhheZucQbQCpELXIg9/9RER0
	/vqpA/EjgyDSMqcmmms8TWC2ySHrlt9vnsUACHvcCGQqPWZQgYmktqkVIdkoVz9U4UFPK8jQjkV
	iAqITEKX2BkTY+HyS05ueny6o0F2jGFtQaok3It1jTOvKukPazKbpBVJbQ9sH7eqoYBf85jGsfk
	1DrwWtURlq/vwo+A==
X-Received: by 2002:a05:622a:4607:b0:50e:5ca9:d264 with SMTP id d75a77b69052e-50e5ca9d76bmr25335001cf.0.1776676887559;
        Mon, 20 Apr 2026 02:21:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4607:b0:50e:5ca9:d264 with SMTP id d75a77b69052e-50e5ca9d76bmr25334821cf.0.1776676887108;
        Mon, 20 Apr 2026 02:21:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba44e5749d9sm329205966b.0.2026.04.20.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:21:26 -0700 (PDT)
Message-ID: <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:21:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator support
 for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DNKfG2w9ag7u1sOADv3-ZJUjjk0LEMO1
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e5f018 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=igqXcL88txhuDdJxovwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: DNKfG2w9ag7u1sOADv3-ZJUjjk0LEMO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4OSBTYWx0ZWRfX0TugATbYwqpS
 H9Tmyy2E3tyxM0+iLJ8aMSlCK0zLYhXZfsLYPyVkQf8TN+k8hgG5yeqdt1fT5rxIOaiqvmx+s8Y
 /vVnTQtEixY/GpwM/b0QM68gkOFYYfpKjC7g1uFm5HURsPYSL4f7BoyiotsB2WXTgKDIEX0kQxO
 UtP0feQm+si6W6rqTXMZ1ARD2rb86GX9QPjyGFGDB5KaSHsPVI5rQPswFHtbNUjOTrGJgA6b3xT
 PqatL64tqWxQuW8DC4/rPlET8Q0XleAwygzhHgn6DhdWplWUl2CNyTjMiK0WUstVZyzDTg+BMAv
 Y62T+BfqrSA7fZ4pToUTXtFq5n3ezfZWVya5jNj+1CgRmlssktdLSRq4Jbibq4o/oapDE+MQ1bR
 hEy4R509kPd3zjktp1427YuaYQWlW9FlsxDA2OnqHtC2K8b1qPIc6tQPtB+apVTwu390Q6LMdas
 Ws9dJecB/mQp47CbxeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103714-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75FC3428C94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 9:26 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add support for PMAU0102 PMIC voltage regulators which are present on
> Nord boards.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 6e4cb2871fca..9545300d7b03 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
>  	{}
>  };
>  
> +static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
> +	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
> +	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
> +	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
> +	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
> +	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
> +	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
> +	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),

Any reason for the NULL supplies?

Konrad

