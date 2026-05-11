Return-Path: <linux-arm-msm+bounces-106898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GeCOxW6AWocjAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:14:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF450C8ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0716E3083A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1353366553;
	Mon, 11 May 2026 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9MyGdCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="da3+72vf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F31365A0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497766; cv=none; b=Abw9yZvG4OoawMG2oaqrKgOio2ihM036cBTLNgua/znWi08C4WgaazJ/iV1po9+O9Ukz//7ylCNw3tyQCyUAVjIbrNBbkDGOmMGu9JSgkdlZspxxCj5R5JLWnOOkG1KxPNaudDxf20AjvlIoQS6EHgmzCOtQaJ1UMXXTFKPHX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497766; c=relaxed/simple;
	bh=gOv4VS9EHIe5Sct/b+gWWTKyyPS+y/BthjK69RALP7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz9oFfR7jYYcWAt5kxwTI7wIoIA3zaf9HNlGe6YYeQ1tu/bt0F0PgqH8BE8etzMkNrjJVslzclAR9yd/xYrT0aKOKY8bRz8uc5l8LTjqkIs+9YWBgG++W1tOdvuAFatbuFcDfSIv4m027VvwSCq65emBbsPpMRqihBAy0BkP3Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9MyGdCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=da3+72vf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B98Bm0017877
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRZj92zBfiyurJF9ODq+hm/ajRFs+7hJHoO01ZvOsXo=; b=N9MyGdCGrrGAkv6n
	DEd5SfJY6wQ15YPRRyG6oBN43VHYzet71ts9n8JbYetOS+OQmDMroGArPtWGXbDK
	mOi6YCHirjhIyyjP1jsE6QPCY6k6m5wtX9ETUTTas4vtZpqGtE48t5jkG44nff6y
	Ptc482kB5XR+H2D+LgFbsDiXmZAXUG5uxPAiBSoWh+R3z2vQrRszN6e7irBFpDbv
	GjEFBqSoTO59ZeS2e34Q004k2XsaAU5+3tZ44Ucr9ZYty9a4R2J2rWDoL2RxaZlm
	l8pEQLbFPOMHMFnQXUHz2BhlNdEkpQ8OatVdBan7/d7MDjoZJHKzwFHjevE+t0wd
	N0EzvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfse4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:09:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fad7b0ae2so8858231cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497763; x=1779102563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRZj92zBfiyurJF9ODq+hm/ajRFs+7hJHoO01ZvOsXo=;
        b=da3+72vfYPGVci3lPucIaV2i4Krs6T/MF/Gyjgjsh8/2roo6jQ+kKAS5u9X1s8XVaW
         7miCka2cjpKnYuqhAeeX74PmqLo4760vCiwi2gytggpAskiCJHLa6tdUaJn6SCuJNFij
         a+gnXxxGzrJh4O9GJjD28aYisoB+R6awtw4FAobs7iOqUeHTJ3s1VgkHG9IdlF7lezd7
         PkBkPC8QLUn3Jil5+N7Lp/lfybScRDok1x6c3eHYKQgsi+jWMgBYFJJOA8CJUJsvMQ+0
         7cJK3Hj3GJbFCNpYFG6Jjzo6BrX/4en29AlCiL1xH207zq3lnudVfKQBJxfYWbdzm9fg
         O8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497763; x=1779102563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRZj92zBfiyurJF9ODq+hm/ajRFs+7hJHoO01ZvOsXo=;
        b=YmDFV/APh72FBcPTI5W6mudd4tj86epWPrCqvOnTFwMOWsUo7CjXVmcn0LB2wX3mDL
         PuqyU8aZLbTogEIT07agxXvlynzGTvmXZ8PrZTF8bPQ09o/C+dMswc4J8lhkzpRy2Kth
         WuLkJyau+JsVcDPi61zA8P/HiHH82Gji3D1iXbhugEsKPVDuBuBH39RDM8JCJI+KW3FP
         jurrxchnv0SvoYkim9llgY2yV8Jimr7bl94lyDM5HwDYhcy1jMVqBrDzJrjhJMBkuvjb
         COWt5SSMY6W6wVF4uV4FzckJZI2azrDfQzV5zqJmzPVh2CojM+DffHahew55br5nPDnc
         2EYA==
X-Gm-Message-State: AOJu0YwW6/cf0/THbHfc1CANlNLGZCzDp0uwmWvoEGy2PhE3DcvZvitb
	sNk+3B1lqFeZjD5x/7YDoBDegX7cXY8VM8L+Cw9AQmQbomq3d5Vkod/b9n4HejrZLJZRFc4aApF
	tCgmlKC1sfUvOtpgHIHjLgO8K4MjX89N4FVLuy2vguThSDOv4o0e2LuP0WF0iUG2B8dtE2K5R9/
	Ct
X-Gm-Gg: Acq92OF3abaO18kGdTyNsD5Qd3DZHPOugb7TTEeovdIIK9Nh5aTFdJxBXexdcubiJW+
	v6kFZAEY8Jl+VpSKRTO9itB1rIoZUn+9FtCm8m98RTPtbAmy2g8UChXVIaIAwhJbTwcDO8IA9AR
	3glKq5vYdGlgi1PWUyzrAEXdtCRlWMVTWEKBKS1XpVeN19lbi1Oe9vc63G3NBmZF2ibrWonJuim
	dYTpVAjrUWcuvylPkH+npBSZs77/8SGihYYZ4fatRy2RUzdRAUUkuB9jJ7TLHeIzQb3NEG1ssze
	CQG4i01ql87l38DJeKSVMggMAUU5pK+ELa2UbHR0AjTNZ8mCmpafY0W+e2pZK651mkGw8kz7GjT
	YUkAByGvzf0H5w01W+9WZEJ1TRu9212Ol08JM7i/eZpf5praXxQ6vSaWhgiNlAnocC4eKQ6l7kY
	vCdNB0zDxsA7U0Sg==
X-Received: by 2002:a05:622a:903:b0:50d:a92e:fead with SMTP id d75a77b69052e-51464ab1f81mr224515511cf.3.1778497763336;
        Mon, 11 May 2026 04:09:23 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:50d:a92e:fead with SMTP id d75a77b69052e-51464ab1f81mr224515081cf.3.1778497762875;
        Mon, 11 May 2026 04:09:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0a6fb24sm3574996a12.0.2026.05.11.04.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:09:22 -0700 (PDT)
Message-ID: <096361a6-0a23-49e4-aa01-9ec92d845e54@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
 <20260508113503.3550647-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508113503.3550647-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01b8e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=weikHDwYOGaAN1ZrU1wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7o5PFVVKTFUvRaU2AflL6qDXxHOtvoJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMyBTYWx0ZWRfX+XdXRwSRPy97
 WGcGbFJn/EtoJGQFzG0k4sugpvU07eblo9NaSqmHhNtGJE3SQ/+FcKci/+niRK9NZ1k+SLrBdlQ
 7zYcR9O9u3VdyM/+06HDIDDqDqW3DKyURiGtvke6LHoR7u0xF+70I4t600yxQWyWyVFn7XR1wQI
 8jbXoxqLwlS5mg87x+uR9rCcXfTz3gPF9UzIkN/MvaewwXhZj1jMxF5uP6TqSXUjAqHQ5MiYy0K
 dSuEUgQHB+tsJ+C2ZKvOOlGGnVjoJNOjvv8OxEBUhDL47HGsdnuPihO2H4qgwuEnlMkbhDsdqsg
 4eFTCKLf21nHkNSa3mJizlsiKPIAb/Ig3BOOWs1UZIO9k3MyRn/k1WQMoi1M+PpMw3e5Qtqt1Am
 QaGWZu8upsC572qWMRaaXX1b/z7pGPnYhCN5q1NAMFn0+1TOryUvPI2Tx++PwN4fCO4v0pT35nG
 FYT4JrMXQ9irT+GB62Q==
X-Proofpoint-ORIG-GUID: 7o5PFVVKTFUvRaU2AflL6qDXxHOtvoJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110123
X-Rspamd-Queue-Id: 55DF450C8ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106898-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:35 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.
> 
> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.
> 
> This ensures clocks are enabled only when the WSA macro is active,
> improves power efficiency on LPASS platforms supporting LPI/island
> modes, and aligns the driver with common ASoC runtime PM patterns used
> across Qualcomm LPASS codec drivers.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);

Please use devm_pm_runtime_enable(), this will let you drop cleanup
calls to pm_runtime_disable() in this functgion and in .remove()

>  
> -	ret = clk_prepare_enable(wsa->npl);
> -	if (ret)
> -		goto err_npl;
>  
> -	ret = clk_prepare_enable(wsa->fsgen);
> -	if (ret)
> -		goto err_fsgen;
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		goto err_rpm_disable;
> +	}

no need for curly braces for a one-line conditional

Konrad

