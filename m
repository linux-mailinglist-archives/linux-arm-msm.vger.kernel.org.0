Return-Path: <linux-arm-msm+bounces-104121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIVjFtPH6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC844673E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D146030488D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B133E9F9B;
	Wed, 22 Apr 2026 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xos37Opm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLJCMaKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EA73E9F63
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863071; cv=none; b=AYw977bFmeviUnI1zZ6JDlzIsqRNikQnpdHuMGfxBPPrQnCniVLrCqaqxkNjyLz/lQFnFXUEETX7gDLOoNAfpEKa5Psd78xfV8wIXavMBzNaGe0rOoepgcYgcB48adxKbNDXOuChtlaVylZdPq+97ZCRDuJ+o4zHXYEcmpc+GSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863071; c=relaxed/simple;
	bh=jA/dky2vpXumlNM7Yyrg5XJlbHU8FyCOZGZFiulOATM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sskae6lM3eIiZpZ54JXbN5Oawczpe+ZMtTDZOVpBnpuESiek8DbKWa87J8Mf2g7qHPeIjFU8Ltou/u2eZDzmrLg9sy6q5zFt18RYv68iFgiIlYk6k1bvC8zGyzIfoBt6yqXiwy/f9bDiyaqzagRc/7KuH6hZlJ4kJ/vmmtesjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xos37Opm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLJCMaKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAOYQR3083043
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a04HZhr0fPZ+oBqd4QTLHz07/4oVCHQZauM9ulH5LBY=; b=Xos37OpmqLJC6nZW
	HWsjiyfKQKV9bY5zvS05hojSh6pkPK+qQBaAvEAd0GLqwycdAsy8wezRtp1UOPtD
	yoJO5VbRdToiG95o6RPvJ1g+LwrKdc4zRY1mQxKmWCk0hBE5vya6cJnNfQi4C4rn
	Jj71Kcf7/QTJVOVXFRnKdqH9rGC6gzV78yhFdPJqbdnu1bQu3VnyV6jV2AGaIOPa
	1Kcm/ZpoM3awJKIng48iAOuoVY2thirK8INTQ+PyFqu0fFWR5hLzSCG381jYwnhB
	Wi05yt1QdCPoSPThH1CaF92w/OJ5dO+i82QSGAI/YadFqN2E0jCn1KthNyuTxEVs
	ODD1SQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmkkgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:29 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4638ca66624so1337246b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863068; x=1777467868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a04HZhr0fPZ+oBqd4QTLHz07/4oVCHQZauM9ulH5LBY=;
        b=XLJCMaKZlMh7INTF4pQ3l4s4y8rAk8vjJAFR/yIhGT6EIDlaxlxVRPaHiXtTTyMU4j
         tKp2WesF11QoyAvmHo3C/daeSmGbRXH/uHCHS67BPr2xiSvxLEQeTA2je+2SskAQ+a/T
         VusR0vTu6OJSBoaEEgaWjKw9ZI98ICsXXM7qInzGbun77pim4FBJP1AvH6U1M3HbP0A5
         BunrMNOp4LJDGp/aiOou4GXJy4ciM1vMPKbwN8O39VDIwG4uk9BuhVQ/iZzeSFUrhD/8
         p01qwqKYo6DqKPk7ojUpY3Oc/25ICW4SkaYfyJcHRZ5oxVJvLGuCaOnLOoAh41Me0+E+
         W9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863068; x=1777467868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a04HZhr0fPZ+oBqd4QTLHz07/4oVCHQZauM9ulH5LBY=;
        b=rG00LLraCwfLYyp2bV7Zi/8Pt/AEOkeCOfLDllDWV0EheGFhac+UJQHDLK4qpDbkUa
         RVYsugvhP4F4BQ6m0K/L1U426uuO/qKaoicw5irWETeNloDPhFI872kxGZqGAwm2x58B
         eqK2Hwb1Jml08YJv/Qzoio0oSF7kZEwDh7DiEq019WUF/ehtwSjNCxTBOihyD0ZHvZSO
         RLDoaFHzji7/pK4cFBJufdoUCA4ucLThddk5rWEWGzS9Kil6mspRMxZXK4th8osMlrss
         BIvx98t8Sv6hh5uw0fDjpNBHHm3lIAucfry52XlCSADVOoyNCgjqc+p10aMm5BUzJA6/
         8kBg==
X-Forwarded-Encrypted: i=1; AFNElJ/v0MJeeQvGHdKp7ePxppM2QfBugc6I6h66xuWVMsbCFMzI4QCKLwplKo/X9ifHyxxqj4hXNI2x82/Vj8gG@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZggxUOg407iqRycmrYUNKcjEAB+99pUhlTEi64OUpfq9enj1
	aG/qcpBKQYqCQ1uor0xI92Z3gSAmNEk/t3wQQ5xOOCuCCGzcWpMnrXd3AJGB4W2yVhHdYOhavoN
	jV9HdxuuARUxZ+VAgm3xwPElW37QY3mlTra584yeEO+E9tSqdeVLAlSLZ/XpRKb/jFJpg
X-Gm-Gg: AeBDieueVo22ThHi6iwmUp8a1NBLI1t8BT9mxp5n9jsj55cbildmGcaDN/b5cuYgXgP
	mqSkEwth9zq/v/w3TlytPRj4KrNbVoTeAd5Y8TSvAlkoOycEnQ7lVprqmtOynCA9xq3B0MXxZvb
	Wz6WaqaSDa6JqJjUxISu3EMZiR3Fo/uXZScFPvm4j1cVSQZjHRTwtvEX0lRAmd1a72DnXIhNX8/
	0NpUyjlbMZuJpD25CUiYzDtN/PnCR2yLIO9KyYLYJk8eousLEjxSE7IaFPW7A3zUKg1NwWYTAWr
	Z/kWvFG2/e0481AY/X97mSDCT65fCb9h+sakPj/5jmbz38Yo2NKsBZnwMtF8zLtbmuJX7W639Tp
	r0f/lOu3p19IwP7pqKMjzkHP/7eiQAdoOwKRP8TU7S/JxyOhYkaaDm2rgUnpykgOxGa1y6HHMZt
	7OYRBCiqrphhYdg+7zL2b1T+GQ
X-Received: by 2002:a05:6808:181d:b0:467:ed9:ffbf with SMTP id 5614622812f47-4799c9a66acmr7362097b6e.3.1776863067905;
        Wed, 22 Apr 2026 06:04:27 -0700 (PDT)
X-Received: by 2002:a05:6808:181d:b0:467:ed9:ffbf with SMTP id 5614622812f47-4799c9a66acmr7362035b6e.3.1776863067208;
        Wed, 22 Apr 2026 06:04:27 -0700 (PDT)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512115d6sm551798466b.7.2026.04.22.06.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:04:25 -0700 (PDT)
Message-ID: <eccce3f2-01a8-4454-87d2-3a599a15b34f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
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
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YgGus4ZWvKdkBdafCBvbPhxgXOXCB7AX
X-Proofpoint-ORIG-GUID: YgGus4ZWvKdkBdafCBvbPhxgXOXCB7AX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNSBTYWx0ZWRfX3L7oDIT8pC3d
 h0iKzODDEdQzC++m93NVNkLFlEEFAVNniJ90fHxv7OPpZDHRC3yzIgy+r2j6zRL716jTOlG3sCj
 FZcvTs5ZyI5HP8PUkZzdjUvFNlk6PWhb4DIc1PoxFB9/JI3iO8Hnk5nVe7Wmr61mQLPwpJIHjk1
 epqyiLiS09bO9xvUcm8YPbozmS4ykFnh2VEFrkv1lM0ft0/fLmn9VK/2wTLC9lT0EfxHAkZWr0f
 Xmlt474D4ZRO0BjTr7mlbX7ZsVR7r0HvtGNu5hbKB+TsYfPY60eyqZX6fH0++yOFO9QbcCUBCzC
 3LwgE8vdioD7JkbV4q//3ABIkG5RqabFWg7LPZXN4PYEjLo/ut5ysC0OFKAWUlCfHCDS+yCHZsw
 XfvXjj5lyKh13jtYDBVtoej8nqG0w1U4FC9c9fCT4DedKwrJeFT51eDYbPL93c2Jn5V3RM+BCYB
 gklipGbjjKmomRvF+NQ==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8c75d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=B4I3uEKCwWxQvTZmuDoA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104121-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03FC844673E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 16-Apr-26 13:05, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 296 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>  2 files changed, 301 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 550ff3a9b82e..1190804632d6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1799,6 +1799,259 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>  };
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>  
> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {

To align with the latest kgsl which includes all the latest
recommendations, remove:

{ REG_A8XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },

{ REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
{ REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },

{ REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },

{ REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },

and add:

(below RB_CCU_CNTL)
{ REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },

(swap in place)
{ REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
{ REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },

(below UCHE_CCHE_CACHE_WAYS)
{ REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },

(below RB_GC_GMEM_PROTECT)
{ REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },

(The order doesn't actually matter but it'll be easier to diff)

Konrad

