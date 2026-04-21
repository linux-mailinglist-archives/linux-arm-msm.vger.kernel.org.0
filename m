Return-Path: <linux-arm-msm+bounces-103922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAVgOJFS52mn6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA1439964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4556300BCBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB9A3BADA0;
	Tue, 21 Apr 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqHqTrWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhmTbr8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB103A168C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767485; cv=none; b=NRDbJC/zVSVxaVL1uQZzT1gCGz++yTGhKaCrTxbpazN4d1xwIDFIX821oBGR82l9WZymWAITlFamOJJVrsGOClqjh/dYcPp8EhrWWb7wx2imIIT0NEJfD7ZGTZ747YgshXaQC5GLeHU+W+MCOKJRdqNAR76NjI/ZQI1xucW2aYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767485; c=relaxed/simple;
	bh=h7FbgsyFeuqdNLe8FGL7E+x79waUgwC1lXW1C3xiiWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uusUCNAN9o19fAIBKKXB+iPkJJa0raoIcpKH6zBgPUGhrNvvZMGgqRzN4q42R63vmEHDnnXYpirFG0Iq3zpnlpw8dGfT1QZucZjWc4ig9jp8RNl4y56LRv0ONwdud4UpbesmOGbrNgvmUrmYlZrpV7ZyCn8KvW1Bjtcf2IkMOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqHqTrWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhmTbr8f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LAJWhu1511201
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6oOnRd5Wst6V9D8C7RlXM0unucM/oN5j1OUZN66Qw0=; b=VqHqTrWC1ewhUt96
	ZPVmxbCIDLsX/ou30G+8y1c1PGMrVnnZ8PlsBXgVE9yiRTtLQ2rRzXb59E7viMpg
	C/Mwu2JgoHNvgzvZODs5lMt23eGGtUbOjesOALS4rL5aEFqMqSzLiiwax/WglIsu
	4JEmtZhlxlEOTS5QpBQdHi8J2KCphiXwbKvSYwR9nmKvTrMUNbzoR1jHqH9hnPUY
	tdrnZXrzaLr04ItZEy4fUodNQu4odYBT5jSoJ1obGsR38tqkkBDQ+7SR4qalK7oJ
	dBxzh7FcY0PX/dfSOLMR+EHH1CW5EspYW3fLFhh/o+gorOTn/2YlhxxEydmTapAv
	KsxHpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak1auq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:31:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso6732056d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776767475; x=1777372275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6oOnRd5Wst6V9D8C7RlXM0unucM/oN5j1OUZN66Qw0=;
        b=LhmTbr8fljCZbkCjOm5Yw6XlA54bHUTtz0S5ATsJYzSNSgBYHPcGwUQ+3+0FHt6NqD
         k590uK+BlDMfrjt+ho+bA8YZ+k0ugI7XOhroG2BWQAh2J6z6k4ibhr0RSS8qXOuIUwVU
         Z+rtmHxuHudcvbqhVoeFXc4toQVmkqc2fkbAvaKGFo8Vg23m3d8UQ0LifC3Y9f35lu6N
         /5l80LpDs96AzvZ5oJNrwAQoXR0wmiokruGr/nDP7Mq27TdBiLA9PSbbupUAqHTYxypL
         YBc3UuNEkLqb0XyygYomtY4S/hHSa1Wv60mXwJDS0GFpTct4knMBSKpqIjfPEvkE/ywe
         V+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767475; x=1777372275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6oOnRd5Wst6V9D8C7RlXM0unucM/oN5j1OUZN66Qw0=;
        b=DACCz8OMjIAum4m3K5oFi6yiyZLUB/LUnsTYm1u30kBByWMz4nXed2cLbPEmxTZh+P
         8+Rxri7b96G55TkO5oIQiF32jB8m1c+ir1rHAmQkQxaE9cesO1FUsTwwKTf0TZWXIU0h
         MLsOnCRI+mCbxBHNmN2JVVP0bNEq+EMwJGSJW6PHo3cUD59j/98aM17xCL11PAGdDXdS
         ZRHW1jq8hpYLz2/vDzx8Tvktyddwhgnnmr3JTNhOAEd4HPyhQBgdd38MWBL3LxofZlxW
         M3qa4qLhjVBawovzzkCb8vqiJAbx+4q3UMtf54N7yck9AiTx85Kfp4WWCeYLPT5sCqSy
         8BBg==
X-Forwarded-Encrypted: i=1; AFNElJ9MqW62O8EsNea1sON9F7peOaENPZ9j8pPMbsNQ2LqdSVvmkGuMdcOHQFyPRGiKE55MmrhamyuOnB9ToRU0@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsL+13nJLKQROhyOvx3VnvI+XFmciPtpWTDuBAKcTOkX49NIN
	E7zzZO34IKGJQRG9J10vF7Te3Xw/69o2LURAMi6coS2fmggPtjlzm9V56tOVauMNXAkrt6ybT+1
	BhRG8vZQb+fv8uvwfBhkyqtk8Bv/lO3a+n1hSy8uFzZxu5F8qW5DM+yv6sD56OBxmxw4k
X-Gm-Gg: AeBDiet3bq9+BqVXao2DN50se9Rqc0nnZMRRe8rABhopKF5V6RncUVNsaUpdENzqt93
	XpfnuHyRVCM+GrStpkR1jbJQPWjzg3iqrtRNjLt8Y0yYLesLGXXtaNfZdL8Q7luAWnMixNu51g7
	5ZOdwmpKLIw7NH7mCu5i1BZrK2MW1duCINDDXeZyaVcaonySHvfh7GQpKyofUu+NCts3R9aY329
	eCI6eEtYYVaBVqjjE1ZeGLe0MjZkRrRlITJOZV6UisY+YWI8h90BH2KWXxQMfX/e1TxbjI3bPPc
	qjYOJbABUey9zKaHS5b3O67KzIlDAGsCYjEcEMB5TebJAn4EE2Qdm/oWjVdcb7as7jbI3otSe+T
	qcIeNcm3LhMrYXx9Gr5D3tnuBjAk2Lp9htTWDTuVvOB3IxaiA8kjiov5QK4+O4MJkNhouTeoXBN
	Vf+gQfP4VjTc91rg==
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr190384016d6.6.1776767474629;
        Tue, 21 Apr 2026 03:31:14 -0700 (PDT)
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr190383756d6.6.1776767474161;
        Tue, 21 Apr 2026 03:31:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdd2b8sm436152166b.25.2026.04.21.03.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:31:13 -0700 (PDT)
Message-ID: <ac62c20b-09ba-4d56-9167-b06d8c0bce0a@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:31:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add fan
 controller and thermal cooling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260421101954.411698-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421101954.411698-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e751f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nXfpn2_iCm603CShNoEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: yqS19x1bzxfnzc42eK9QfOnpuczd--RO
X-Proofpoint-ORIG-GUID: yqS19x1bzxfnzc42eK9QfOnpuczd--RO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMyBTYWx0ZWRfX8oiHIM/1zWTJ
 tjR+yWNLYeNL9Pr8c9RpOKnh1b8EN1WqREMXp8/+GAvhWmKnVC49+8Z2rSFP8Lb/YxrMdfh74+n
 axIuzOB7TUJUAwUbsThLNNHIG3iTXWHmyHikMcHWFZn6vFXesSTlMI8+rhnF1HZKyHoeM3QO2/R
 BL/STIKo8xh5LUCcFu5sqrsWJjpg1g+oQzrV1Kti2R+R0b+jePzR3d0TI7HneFTgyVWhHs6dBDF
 IdfxpAaBaAnfec/UYXUrfgwXktCglbzWmetF+10a7Hu9OnE4RQ7Zx8Uwey8n7aUpWHwuFtW+peh
 yzUiKdaxYsSgkNiG0LzMLu8FS7t+9vj8n01gm6jJ2xUwEJ8KwMwSp2Wbv86hxXnFnWcC5+iQ28e
 76NaTFpLcbwMNKOovJsdFOmQetVHOLM0ofedT+bN1FMTMnwAWYMn5nnlOSz+SJVpDCnRgJTZdig
 yAfg9X/yNE9/B30zc5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103922-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBCA1439964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 12:19 PM, Loic Poulain wrote:
> Enable the CCI1 bus and add support for the Microchip EMC2305 fan
> controller on the Monaco Arduino Monza board. The controller is
> virtually implemented by the onboard MCU.
> 
> Add a new active trip point to the cpuss0 thermal zone and
> associate it with onboard fan cooling. The CPU subsystem sensor is
> used as the thermal reference until support for a more appropriate
> onboard/skin sensor becomes available (via spmi-adc5-gen3).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..2d790f726d56 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  #include "monaco.dtsi"
> @@ -155,6 +156,26 @@ vreg_nvme: regulator-3p3-m2 {
>  	};
>  };
>  
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {

Fun, surely there were no other I2C hosts left! :D

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

