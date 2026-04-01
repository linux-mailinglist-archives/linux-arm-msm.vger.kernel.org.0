Return-Path: <linux-arm-msm+bounces-101289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HGQNtrvzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:13:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FCB3784A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D0A630055E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072043DE44A;
	Wed,  1 Apr 2026 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDexLiIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bU1H5ecK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782AE3793DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037777; cv=none; b=eRWV5WOC0eiNu408tq3X2tLJ3JkS6r/L3sKbjVHmnLAO2Sker5m00PSZAdA0fsbhBfS8m5eO0kfdviKBdw3wyVwZWf8FU6yFt31rDj5yV9OCr+5qyLoHp6rFyd0cEm7uvEgtN5+H7T/yiYydGWAstvKcmY28ImHX26blEco8Et0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037777; c=relaxed/simple;
	bh=a12Rcd9bB5uPDc0EJ5hYGJjTz2sCsfAxYkLl4XcsBOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0s5QyMlQLsLO/A50MzncQZOnedBC3s1wzmwuZ2wJcnMf5+cTAxT1XdHTyYYHL9BAhevYcR4uT3a9mT45SBXBXOAjhUy2SjECwSJE1f6aAm2cn6LJWMzb+yzShjQrI7CMO+XSGmBnvtI2ArxaoowMOeLkjmD8eXe5Ihdi9tf4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDexLiIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bU1H5ecK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317MrGJ1577571
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS40vc51JlECGN/gZPmIK/gLtGZq9a75bp6sZnyVgUk=; b=cDexLiIeLbjHatZ+
	bkAYrPQJmCLck7Kwj5I54BHOw5AplIwWGckzdKJM2drGcLU7SaqHAW7llq8vaHWK
	4T4KcZeaNlsHHolv7hfsXBzC61fvEaMV9kng1mfbJeaijsp+fUrmSzrCHKeBIihI
	Zq58a4WoRPdi7XjU6cvWDn/kefFaqqmoEs0jJhkmRyIGMNhmSo5eXjK/jtn1OqY6
	Vn8j4Z6CbF/0aNHPTolXUzsFVvb8JTKE8pMphhuGZ120EQvDR6cBfTA+r8Iboc4R
	KfHLOFrB12TgnFb58K2fWAeIZ0CSgrnKAiq0prfeowRII2yMCJWVsLEagbbbO3Rn
	5PVI5A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kufja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:02:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60531938f46so252809137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775037775; x=1775642575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eS40vc51JlECGN/gZPmIK/gLtGZq9a75bp6sZnyVgUk=;
        b=bU1H5ecKM8CeN/j1/WQCq7SU1nC3VtJqruscDjKnGhr5yO6X0YsXeKG80eIW8U0fGD
         mYFM3lEVmACtrqffyHu1OSiYVtGbHKRrYq2rcPVUdq9cefot6wSULam58jxjfhegNKLk
         0/k4axQ/0LATznoe9cI1dXfhhRH1Fbaq3X/j1ZFiSZFbp1cUeyOroIMjt8aTPJC0Pzli
         cWKb4bGGzp5u1MneSi/bvtbQgYlA07r3kFAp99E5bWC9KxZKW1uL1a/3ja+IxA8O0tcK
         ukj5tLhDu51p6AnZH81xjovhNFFwPkTveHwUCfdUKxERN2Cl3aW60FOPeFv+zeHYBSS8
         SAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037775; x=1775642575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS40vc51JlECGN/gZPmIK/gLtGZq9a75bp6sZnyVgUk=;
        b=F0UKOI1WcuUf8xYq43sjSTglH13MrVyJBC6llqhTjGy+pwWrjbCKzhhbERJJ/zAGgH
         yrH6LBfqzJUket8Mf7uY+mos755eUlFWSpp53Dtyth1FixXY4lbFWQjigoqglloXKQBb
         GbKbcc5eZTr0VunDRulUdM2hZoPqHLD42alJvxdGXnAPH1Lr9DLxJd3qNMu7gVlYvSXq
         gITatYXcGAxARIZ1sOG67jcg7+/udNvsUgPr8j0fEQzSvqIflNnCuqkgw4O6HfSOu3Hq
         +oMU3Xvz6LPBdQf2pBp6Fe1rUs0Xni5EA0ysQLgy/O8hC27LQakJ1G1Z8H+ftQz62gD4
         8shQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+vabUMx/ygp38oVe3VNJlBk6PYuSVuNK9T9Fzkah6/jSNSjKUs/14IbYmfhxeGs8aaQFxWsKxquVlWQqG@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyHwfqzo2pKp89eI5aU83gLNft7jNWFdmvDmSUR05ovVcesH9
	1zVJrhWZiF9xyijFlpHigQPFBYQiN44SCb+RxnmrGNLFjimsulSXhiJLhAvh5muNsCceApdJo3c
	AZyyJHq9zX3QWPXq73miWQlN/vxISqQhMYJ6M5GO1icnd5qyucnA6ZR4BTljrWGfDWI8R
X-Gm-Gg: ATEYQzzpm41s27zcCtbwpE8uuzbeVdX9zQrr6nC/XUsE/Dybsc34bk9RCV0dR7/yjS+
	PaVOiThGhifxQq/T2+S2HN3dQvjW8Ut790PDNIkNLTdg9bDPt7PcHraMEQfuU4+8TZ6Dhsi63KE
	KrC7UuvJ0/pNp0Y8GxW+v2IFgcAeolTQLEVwFFv/TBT1ww/VjBfa/wX7dY9eNAvFa/lsLfWk3w0
	c3TY2+T8uJfNBf2aw2S5CDdSA+EmaTGgxVOXXV7pIWPVgc/gFvwowcZKx8Lev2MnT7JqZhjKN+G
	stbQiFW1Xr+BphAgdynfCwWEuXWyjRFukMYLMI7f8dQhWWbrLdKtUeNIk3RajhjuHln18m8x60p
	ALsFas42+Ffh/qYHL7kVni2U4YkEfXvrwlp81C4bJOI+1Y+S57C2mkEdjwGEpZYC+ee8XJ1lqpI
	ffSbA=
X-Received: by 2002:a05:6102:30aa:b0:5ff:2425:a0e7 with SMTP id ada2fe7eead31-60568225cdamr336236137.6.1775037774747;
        Wed, 01 Apr 2026 03:02:54 -0700 (PDT)
X-Received: by 2002:a05:6102:30aa:b0:5ff:2425:a0e7 with SMTP id ada2fe7eead31-60568225cdamr336207137.6.1775037773868;
        Wed, 01 Apr 2026 03:02:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff49sm3976479a12.6.2026.04.01.03.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:02:52 -0700 (PDT)
Message-ID: <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-5-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-5-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cced4f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=N7jHRINKHDCQWMt9xiQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MSBTYWx0ZWRfX7U6crOajdT+s
 aRMMDT+bPQpSf+9kgthCO9Rm1FcEA80h9QptWdnwyst6fYokWlLPWkSXFK9pw9pgApJPWqg5Duo
 vJxeJYyj8omSb6//YJxsw5+69xy2Hy/QOgmOYFtuH3GZwoi2EhsKKntEe55/VwSjvFNl1wU7g/i
 1eIDhTS+yL7UvfVK4PFey6s4UAsFEPP613YjQF/+57kiR7YLZ6+ETZimeLB66HU1h9Cf0WR1Mkl
 zQnOgsCVDAB/4Je3x+9THba/U6xHvlpp257MwX4f43YxBCc6/FGmv/C4IhVNtUsoT/AwJFMRzHs
 UhI8/b7hCwbnxgAUGOoml555w8Y1jC9YZqB0cd+oRu4brqL+wfwD7dfsam5hOB5ZFSEe4tOZMnY
 lptlFYPDDCPwlX1QK1eaEWJb+WtXC8n775NQTCVQq4rX/yX3Snp7AUN3PEKBkjN2FFzPnzTFPcx
 NfNrRW7+AzVetam+G7A==
X-Proofpoint-GUID: fvkPu5zS5vSFL71HQ83_aotpwoJgdZex
X-Proofpoint-ORIG-GUID: fvkPu5zS5vSFL71HQ83_aotpwoJgdZex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101289-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1FCB3784A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 271 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>  2 files changed, 276 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 550ff3a9b82e..0d7d9c86205e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1799,6 +1799,240 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>  };
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>  
> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
> +	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> +	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00f80800, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000023, BIT(PIPE_BV) }, /* Avoid partial waves at VFD */
> +	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> +	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> +	/*
> +	 * BIT(22): Disable PS out of order retire
> +	 * BIT(23): Enable half wave mode and MM instruction src&dst is half precision
> +	 */
> +	{ REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> +	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> +	/* BIT(26): Disable final clamp for bicubic filtering */
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> +	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
> +	{ },

I may be on an older tag or something, but:

$ diff /tmp/downstream.txt /tmp/upstream.txt
24a25
> { GEN7_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
27,28c28,29
< { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
< { GEN8_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
---
> { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> { GEN8_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
31,32c32
< /* Disable write slow pointer in data phase queue */
< { GEN8_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
---
> { GEN8_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },


> +};
> +
> +static const u32 a810_protect_regs[] = {

$ diff /tmp/downstream.txt /tmp/upstream.txt

< A6XX_PROTECT_NORDWR(0x0ae00, 0x0),
< A6XX_PROTECT_NORDWR(0x0ae02, 0x4),
---
> A6XX_PROTECT_NORDWR(0x0ae00, 0x6),

-> the difference is that

SP_DBG_ECO_CNTL and SP_ADDR_MODE_CNTL are not protected

that might have been a part of the ^ difference

Also it may be that the better name for this table is a830_protect_regs[]


The other tables, I'm lost. Akhil, please take a look.


Konrad

