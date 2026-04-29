Return-Path: <linux-arm-msm+bounces-105161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILhFNz7P8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:28:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF57491E61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 332613008086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29869286430;
	Wed, 29 Apr 2026 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVlNCbXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNyc4prg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0583C13FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454903; cv=none; b=iGvRHfxOil2ExXl2oBexqrh1Zr99rK4AfRFPwJOs+dMBscuZLVdGnw+Qvew9Y7VYd7pmNodTGsNKMhmZO/1J4zqL0uA85OaioKBvcx+bWughJMvoZwIuq/UKlwUX6Y2VJSStFV5/iXcE7bLmKJelpt/fUz3kSV2jn7CsXsRrdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454903; c=relaxed/simple;
	bh=DlCNVDrGFzYmuWGbTzFx71K8976KsmBQQWty73JqlbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiMz+NDuvVnrAfKnXoqSWaoj5zEIApJEx+ztLT6ojiHXMqATH79YcZzXZyNTY4chtIFcJ44BZzN5k1iuMBQnabXfqLjllIyJWSlXuirXllrkay7F666K3ln/x3V/UYIlEuOjQdy8B4gejrwU4AEJe5BNBODWPVEOyemKEBUbXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVlNCbXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNyc4prg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8plT83752353
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=; b=mVlNCbXHqL1LHjl8
	7MwMLHWJdDPSE2nFrwG1mhc9yVlMyz8UJKRJwO0TeQjH610bJi5zHFTogyhy5xU/
	Uu4BxVA2w8YwYHIYFUgk5FZ/vRbEvKHrdHWpuSBpxiaSEWMT8RS9eG7K+dfEARpJ
	o5hBynVGeRDlDeGyxllAjbA78+7IuAu8pA9YVeyYpsdgfbjMB2Rhw3jgDkpDCVZh
	Oi7xG55AEvsJKBsmzQ38uH0ficGf+ljmyVhvPFD9iC/XcYXq4oUgcQMR8bqOXWpI
	GLC+/x2ay4G+4y2BiVu6v+lH1qPag82EAY0Dhla4h1EPCWwNUEW68QzVSuB4LE1n
	Nx6ahA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1gtws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:28:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60586b8e65cso672029137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454897; x=1778059697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=;
        b=DNyc4prga2wWxg4iiuJgCytyIVPA7ifyVpw1mrM2+BQGqIKvs1sAJvn1t4ap0yDOMX
         nO3GbUysckoIukkIAjsA9jhxOfV3Bddmz191nWNv8vSKPf4VFKab0JYbehBg+1rD1n4d
         O+i2dzy7mMMyl7LDvnlWxt8LFmjoWSfLFGhojOMGuNbw6KBo0Ig11hY3HRMDko1qCdRV
         qXQAYC3vf0u7BPtLI4Gg+AR2OyeluLXnc+Pd5NCZj8O7FOmvEUXUiWBJ91drIa3L3rZ+
         vG+nPLx60uUAsCne8bL1cn86slZp2vJ4PGRr5Mx3EKUBq1+p5Rsku3ZJu1b1kA1xJzrs
         gzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454897; x=1778059697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=;
        b=JdH+Gdxs+7WcoBF4rvilY2eRA+E0r7AmAcfYwT6AX34tRHRVfLXkYOMAyHYMy+ap/q
         T1YB+JkuV3e3PxRI8LrcxKGfCdDV8VUf8IYpkjxdmPNfuLcGZfCI8AOD8yRvMXvF7JRk
         WLFmLZuCJDlZirhinW9RrXmruUNIfmU6WIESTXFVpatayS1yRM5ykglGE3mFD8n4I/xW
         5btJShXn9p+v2aCOmzmi1FDguHYhuYksibKF1LjRAUPxJCQ5hnoPOxCmBLog3HLh7VUk
         4DANjWe35LmS++BWRbQvm89OpVsh/26V06laFo3LHmJrS8l2wXDLFt5TZ0HYYQT6VaPo
         T5lw==
X-Gm-Message-State: AOJu0YzqNC7l1c1PoMN3jLkh5qwFS21pItw1vB/xARkMX64qU1gnSBv9
	LNvY5Ll1fVrMJFmEqOBEcLA87zeNJHFFVg/cZVaB/WTWeoxFsqbmg3DNRrXlfqsHX4905FQDFOM
	4zjLAmZMhOnPTU95MsqdY0dPEiWk3KFfhSJWAvzH1AFHZvrf7/E7++ghMIOz2Ai0IQ++Z
X-Gm-Gg: AeBDiesWBraDuDHz2RPTrpZjF7DoubO9p8ZTY9gUmamDwJFQmY2XT0S7cj1tf7Sq53S
	02KwTw8ohRONpE9a1gCLVc7CmfFnsgngJb7nD8OqOFyIe5CuNB4308e0/y8gem0/+D7Zcq+BmBT
	8aQoZfTPJfS3lt7SF++T0IerihWxuU+BYj9Fixn47lO98h/7iiIHiEQJX+h9xX9FSwQBQwA2d72
	Ho+1SZZJCZJMrJACGV20fcgoPIvfPQqhMPrOxgMWWkkf8q51J4CKWgLg7y9PX+btWLgxU0yovNn
	NtbWcxJwyRsE4V0TAO0yErOWO6CKJiKl7+Lagf2x6YmdIO5Ud99Mk/Zut1Y1VW1EBRtZj3Ixg1c
	8kRC3d5c22nieiR/GYFoFAJZIiF/ZcQRw6RyHDgPFMviCc+Af4zslWRfVc14kl7ewNKCd9ui/AM
	VT29ATmfMAUFD2uQ==
X-Received: by 2002:a05:6102:240e:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-627d2c7c122mr1110778137.1.1777454897330;
        Wed, 29 Apr 2026 02:28:17 -0700 (PDT)
X-Received: by 2002:a05:6102:240e:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-627d2c7c122mr1110774137.1.1777454896850;
        Wed, 29 Apr 2026 02:28:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb981f3ab60sm64675966b.26.2026.04.29.02.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:28:16 -0700 (PDT)
Message-ID: <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1cf31 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hhlnhGVR2evONxH1gqEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MyBTYWx0ZWRfX2DXx9VTX8WIT
 /Hav56zX8wltIF+UGj4YjPutT4EiUPEf1SpsUW8hWNLx70hNrUVFP3jdT0N99yFfWytbmECD1rB
 RK8XD3BHO9h/Qfw6hK8p1Yec2Rw566IUGmsurMNXitCMZX99UxaiV1zzt0TGk5tzb9m2KBUjSF0
 EeWPgDLz4ZghHTjsEHN1U54r4htHmlvKaVWDq+z/oz/v1XOTJAX/gq20Mobt7iGr6MjGz2QqXWC
 XBfdpUXwKLF+d780uAJ7GGZuBGheT5a0v/9X4fR2GwG5xfQJ6+r7BUg1dv9AMULs291rgblhGgA
 6OcKSBPn3dlt7LJ4eOC4P1j9hNfnO2zsC4Pn4xgnCHncjf4eNKN/9VXJZci3r7x9wAEavlMIHKi
 47u3yc5mNpgGbpYFGC9t7W4SLOvwAcg1brBivXN8jObKsONZ3nZXcCPjg7pVqum0JtVm+Nk4AWe
 TXz0+wVq98HtQAAYM3g==
X-Proofpoint-GUID: ryMytzwBKug60lcpFjWaIVM01vxTvZmK
X-Proofpoint-ORIG-GUID: ryMytzwBKug60lcpFjWaIVM01vxTvZmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290093
X-Rspamd-Queue-Id: CAF57491E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105161-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
> Switch from a simple menu to menuconfig, so all Qualcomm SoC drivers
> will be under one selectable option, allowing to disable them all which
> should make kernel configuration easier when preparing a non-Qualcomm
> kernel.
> 
> This has few benefits (functional impact of this commit):
> 
> 1. Allow compile testing of QCOM_OCMEM, which previously required
>    ARCH_QCOM.
> 
> 2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
>    which should not be available to other kernel builds:
>    QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +# Options selected by other drivers from different subsystems must be outside
> +# of the menuconfig if-block:
> +
> +config QCOM_INLINE_CRYPTO_ENGINE
> +	tristate
> +	select QCOM_SCM
> +
> +config QCOM_MDT_LOADER
> +	tristate
> +	select QCOM_SCM
> +
> +config QCOM_PDR_HELPERS
> +	tristate
> +	select QCOM_QMI_HELPERS
> +	select QCOM_PDR_MSG
> +	depends on NET
> +
> +config QCOM_QMI_HELPERS
> +	tristate
> +	depends on NET

also:

QCOM_KRYO_L2_ACCESSORS -> drivers/perf/Kconfig
QCOM_SPM -> drivers/cpuidle/Kconfig.arm

Konrad

