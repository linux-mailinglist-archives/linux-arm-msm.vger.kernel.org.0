Return-Path: <linux-arm-msm+bounces-102292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I5kDYoe1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:23:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D723B9D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 755B3300678E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4FC2DEA8F;
	Wed,  8 Apr 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfkGQWWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qi/QG2M5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9327FD75
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640192; cv=none; b=ui0ZUfPL73dHBvF1WJtr1NzwDqCOBA7M4CaAhiMS/1dLhPLbE5yzAAeoBVo1eKiqwgtVzQG/Q5vYbCwsKB+7/lHdvrnsSbqJYrzVNBdPAAqxd3fUaVGAAmEVQ7LzvISmvjjLmL6/x4IKeQBZVI3FPt7NmZIw6R57HBm/DfAtKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640192; c=relaxed/simple;
	bh=OciCGuYKPx0OmNLbYq5+8PSeZaGEhkU8BuyuRxsEWzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSsAQwGrxJL7gH69RuQ19CWYr80BnxKIRu232zvj6cEBXwzO01J1xTbeh/7tH36j0ocPXytu4xGSmfv2ZiexnEaivmz3zoF03EgE35a5yoP4zf6DzQbjPRLj/Ze6UoY5+esJlCM9ibje4Cfrpe2IssQTt6l8Eo1n+8lGHJ1qXJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfkGQWWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qi/QG2M5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385SVN31005858
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiZ60Bm5/wNkvNavKwZJumFtEUHbNYllnqbCkPd5EZk=; b=JfkGQWWM5tU5X0si
	qJtNVBmFm5gWTmauZcqxl4AdRTTvEkbmZ4/2uBdw5OZA84f6L9JKJF88t/lRLAnH
	z/vI8ZB6YooAS7ffr/vZWN/7a6FtCnW7HGqs6w040H/74RaEdD29JILnh0mNf9yd
	ooIcvS8/lQwI5df0g2B16Ec0tLJRuXNxicXXOcjFovgfFJ1mw0SGBOqTL+NyVDUP
	0Q9pgeNXRmB07CDXOodWqu7BMmB2cp7ZNvWJf9VWoVF2Srg3oz6c+UwOgsbpt6fo
	UFLpFmOnh8Ue6rXfGma7zmKL+gJmmaZR4XYd7oAjGm46YAhawl8GGrItAXKUiKOl
	YoCKDA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpaj6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:23:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f548d0872so20305606d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640189; x=1776244989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiZ60Bm5/wNkvNavKwZJumFtEUHbNYllnqbCkPd5EZk=;
        b=Qi/QG2M5HtblUnuvL/Y761Btrtc/BSDeMv0hLWEs4GzbnJl4C1L/T7qKCCoUZaGRew
         PS54OgdMBGPcdFkFbL2PulfzY/GbJ/Pa+t3djcn1dSTFKSV9a6CrQOihrjPvx5K3L2z5
         b5lu1DLz2mqYU5qyFVnCGBkiTa0afbzyIAMjqNhUy7ACrDE55ensSxklJF7h5VvcXNsi
         dII/fDHYQpldN4atnbrZ+Eq7Uoo2n4aCPsIFAW+3caQVrtNhwk9Lbdy8L7hqF6g96g8T
         D2pWvLwDDucwoeHW7Fh3fY3hEp6yHBs3ft3Zrjy4bVJ57fZ0NZYgPuUy7dNtn5DqriOu
         ZyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640189; x=1776244989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiZ60Bm5/wNkvNavKwZJumFtEUHbNYllnqbCkPd5EZk=;
        b=m7hIBW5+mJSiqIeGG8MuHibbAQJ5nMhOr5RsKynnwNKqRSuxZ5RyQ6/h2RHuTFh7tR
         qlPSYFNaz9NaWwwtepJJsrrcKBtmI3g9QYVpFyYpkHticKJpKGdg3nmwcs5CUBVnYjHz
         uvt368M+rv5Zu8Btbl+gUv7ydAaTixrQwHp37zQX/c3pBVSaariwfpz5riyRVixbetxj
         T/+RSgW+nqptBn0QCQWEsRkAGEF8VKTZGDT71T5a/djkr/WYcgv9A0NfLDNgpzWBcyTs
         2t+n/xNew4c+eYur2XJeyG0dzBWG3lowtKUOSZpXzcJk27/9kcJN9wsPgum8kROtzZPv
         +sWg==
X-Gm-Message-State: AOJu0Ywq3jIfNERXJ18gDPLeMLRZZfEIJpTkYHeXviXS/qrVQ1h1S89p
	8VZw6xvAwwm5BozgQiudxLzQw06PqzQMdxK+pZqBzOfwtzT8bBHa3IJMlpoUtoIyzGUo+1HIsWn
	2FK97r+9SjtemDT8MgVMV1sEfA59zAkRpBLRdVDGLjufB679negprwV/XJfH/DqaiIk/S
X-Gm-Gg: AeBDietUMBAma9s3EHfy1wxAyX5iywPgxzLVFcgqdnSfNqylN+NjFJD6eSGGjzHvnK0
	laM+u06LX/C+cueyNcrhcI0ap4XHEKXRw0mWDJa9fhDUUzUIewVxlKLxzI1wcLCiXq7oqdQ2r0B
	2H3FNDZBbB2Z9MazxtONTsleMSuR9GJyYjOuV0W6dYg71V6Z6xOTYJDqzBtZBm+/n8xxgVpz8j9
	fW6LAsaZAaPH5bgoGfDXONdVnmHzuxDc2eYT2Lct+w+Oh+hQzdZwxxFVpC+/Ylijdh3OacRCAU0
	hrdyoQJSdyppmguYGy7QE/99Kcr8pPE0WthOJ0Ge2SNlmFZNMZufeyIquUGbO99jdcN0go7MqDo
	HEKU9BfXdefPfGqi6e8Yxi8t9mdxI7QrcMh1Ma3+Lm8Ujb+eiAUc1ExEUFDr2dHtC7Bm069mDeI
	XQjSQ=
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr32414251cf.7.1775640189356;
        Wed, 08 Apr 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr32413901cf.7.1775640188928;
        Wed, 08 Apr 2026 02:23:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm630996766b.47.2026.04.08.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:23:08 -0700 (PDT)
Message-ID: <0dce2f2e-2671-46f4-b78f-3a6ecb068311@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:23:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] arm64: dts: qcom: Add GPU support for Glymur
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-3-2135eb11c562@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-3-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oyG9UAW1g-c8igObPH4C9jlaV_Ev85az
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX1V1SCisaQwss
 7XNp4k2oNJkmDw8P1E6JdVzDeihelbq46GVVN54NObvUD44ZUNAVQeG1Prkjpc9+qkxOROD/CFk
 ezIybTuTov8Qe9Z87vnCiOWxx8VVmXCWDR5A5biNxCVN+KdSeRur2EyTG6adIS3XPZ4B5VCYcaN
 SIpC2EiuCcFA5DaaviMNc5aP1xIltCixtQ2FYkR+7pOY80w8OgdkFXw3C2NDcUfz/uyUn2MrPt2
 XOu+U9fA/+wQXlA+3JpfyVcsSS80Ko5i2VZ8Z7GpDiE9g1NJ9RMIHxUGjsPVji7o6SL0t1dq1ih
 tCniqhVTISm70WatezYlR9+veGoYrz4IjIAkPtmrPWcw7pNLb9mF972IDReROecFgLz8xcY96OU
 kuE36mj8M6fXF2ffvCsLq2F56R4AzdrJS6cy6q1bYy6lz9cx3Y06QBAr7sclHzBSwSxrPka1lYa
 U5Xkfa/9ul+CvrLpKCA==
X-Proofpoint-ORIG-GUID: oyG9UAW1g-c8igObPH4C9jlaV_Ev85az
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d61e7e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rDmyxzWSWjEmya7nUckA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102292-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1D723B9D26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> The Adreno X2 series GPU present in Glymur SoC belongs to the A8x
> family. It is a new HW IP with architectural improvements as well
> as different set of hw configs like GMEM, num SPs, Caches sizes etc.
> 
> Add the GPU and GMU nodes to describe this hardware.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_zap_shader: zap-shader {
> +				status = "disabled";
> +				memory-region = <&gpu_microcode_mem>;
> +			};

My understanding is that we may drop this

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

