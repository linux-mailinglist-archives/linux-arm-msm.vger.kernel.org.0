Return-Path: <linux-arm-msm+bounces-88054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C42D03D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE54C3275758
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABBE3A7DEC;
	Thu,  8 Jan 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiFxQghD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HA5u+DVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673703806A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865438; cv=none; b=rGSIA9gYX6RqfOo0+IXwgqRunwlJ/r/WL29mmkh/96lYMA307b6xorN1JSUY1wywZuSn6CHeJaEztim/8ePGyPhRUpI/sYL+Iy87NGz9Co6nErLIS4rnLiMVSelePL6KgN9x0/IhYa0aOYavCvJAjFSqjzksdtwtnv28iqjrKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865438; c=relaxed/simple;
	bh=xb2t9fuqAN32eAfCtivOT4VGyRoKb0T7I3TThBH2kjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Is4j/2ZeGmmz0ZkoIYzPoXYpo665wKhrLTK3Qi+F1gOHXrkKm64+8TSnYmqXQglESRgXev2GxRbdZJCvBaFd0aqoan9z0dvLErEj5xFWSGimeVFDrvAoJkb0R8+VFbpeYf7IMsAqLtOf+/uAWFKE1biMf1jq6eC4bAzMBs/ekHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiFxQghD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HA5u+DVR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VOLG1837907
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1S/SJSualiLHoog7gYmMZjK2UQzHLZG/FAAg4TnXAIY=; b=EiFxQghDNnuz631c
	mncQ5/2qHOjjbLpYSVKwRShGtdjjej3zFDHKb0psMjfD7LS3TnzCZhjqiSw8GLbV
	58C1+DHOR/31RXnhFK6nq97RzZQStfz6UY/VtWaudI85xXZSb3B5h/IsEnM2zIeN
	a/81dNXZHMP4T+10iTuXVMbf5XeGTF88cec4IqpaYcX7wnv1nYAwnXILCClGEjE2
	6r+SrhuRsd5kLUfY3BEcxOOSnia7HOh9z9wdPe7RVQT64slDwUGJ112Tt61z7EP9
	b0d3Xup9qTiHWFWtCA5oOoWy6sUSRSg15cXoZ0U4kutUc3a3DkWW1HpzPQxu/OOv
	Xaowqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920dex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:43:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so8979101cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767865424; x=1768470224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1S/SJSualiLHoog7gYmMZjK2UQzHLZG/FAAg4TnXAIY=;
        b=HA5u+DVRZW6V+qCMOScu2s2qTMvhhmLyJI0kDTH2n/0VYXhCSuNFGTAYBJ2of8O03p
         O4s2PRkvz/WO6ceiw+UPXM3sCNOyewwVKvr0D4VA8nE8HxP5mBZg90IBhOdOHRqO4qS8
         HMT5i5geX67u4LslrnAaGeXz0BcdUELiDa8Z0ruCrUgAyWtGj2lSIRqUd418PaL5zska
         PY1DabZRZf+D1uwMZQhN/ldgWJdxyR31S0vkuYlzZCvuULTovBQTYESN0/GQRz5r4f6X
         mjWEgUuIU6dOGDW4/jxlvYxOunXuga63bNkQcmsmaK9B9kSzOqiNnJ7ANF3quBnWr1/G
         SDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865424; x=1768470224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S/SJSualiLHoog7gYmMZjK2UQzHLZG/FAAg4TnXAIY=;
        b=LrRKeCxl1Pn8+O0y4XGYycYnVAUXNmWo/WWo0BowGeJsPRYv14f3HMo/BKC3J13FCd
         HWuufQnR2IEV8BsV6ESJmdLwmBUbvLjiIKisEhCEUp0c+2NXdJvsgZQ/wNkF73qXrpqP
         Ud29p4V4th4yZqybJ0JFI/EPzgrp4QaIImjCmr6MMHu052c5K6U060Onzf1eDgq0gfyk
         7YCLTAQqzUC0KG8HgByA7p5dHSXCGdPaf5KICUgQdGEqa0DMt50Ad84iFYG9+lzkU+Vf
         NRHX0Bl1Tn7MTZPiktb+ZqjA0gu7foHaedMDNQIsuudZu+U682KmDFlR3PiGK2YD6k6n
         8SrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTmUp2pg+xZUl9SEznW1EgnpdHICkg8+zcCGOmNxEfBQdkcfxL60jvSQE06oolLD9CGdEvQLrac5x3NgWz@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmcYMprRMEjil8TpDtJ8ivU388AB7RBxNGF2bjwVh/e706BFX
	sbWYyLAlrYURzqDm8C8sPcgAvz+U9g0K94I/3Q+yR4LbITx+a7vKnMj2/EngBeXY/TB5ovut1NG
	WMdldaPn88Y66HbO35iGbSNLCVZ6nbon9nYDY//KWquLk3axHnOx0J531pZAeWcfZl8ZC
X-Gm-Gg: AY/fxX4cb4SZCwaxiPhA5h48rCzo92Or7fnaGk0GzUbYPyT05Uxu/C3IFsL1u4PhZJJ
	PgksCLChrD0UEg9cwfuHr/9KIDGzieAkkg7vRcfVtO7+0JpbCfXLnmPTHE9hKUU5XYsQn19X6AY
	dcoIFyrtk2TS7BfRWDI3d7aorJQg0+owCq7QNBsc5DVyQM8M/eH4ckcrU/v7wFVsQ6Bit1SAaba
	R7F0H32wPeSxo6HPWlg/KMoao/W9PJlaut4RCXvv/Zf+6Xc8AjUIAtXIU52vmHepY2SoIj8129j
	TOmqkXYxXYQVNA5ZEJ3DP+RPNj+H39YX/QRo+YVohpOkFsnCGMMSIv0YWm7SFnudk1foHscH5zq
	IIziCbW7r7iv9cBiAaWaRpDJUqjeQgm/UrH8GikoSdA6pMArKQZD4UR2pDvBR7aaKOKg=
X-Received: by 2002:a05:622a:1391:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ffb48348afmr59372311cf.3.1767865424265;
        Thu, 08 Jan 2026 01:43:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0KmtDjEhwCNfMambL7JRj0tCsjfjIbX0aoZ/QvSSwV8dIawI6CqtwPZ0+wspQDlKN5Z2YAg==
X-Received: by 2002:a05:622a:1391:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ffb48348afmr59372061cf.3.1767865423758;
        Thu, 08 Jan 2026 01:43:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm774258666b.49.2026.01.08.01.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:43:42 -0800 (PST)
Message-ID: <9a07d235-d1be-447b-ae89-75aa418cb69c@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:43:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju <quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
References: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com>
 <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
 <42797330-868a-bfcd-e0bb-b5f0dd3eeb16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42797330-868a-bfcd-e0bb-b5f0dd3eeb16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f7c51 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=woFbFkuD7df9m7ThD7QA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yiC-vwW3TGw8ccC3CnghpGHbwFSwPFfS
X-Proofpoint-GUID: yiC-vwW3TGw8ccC3CnghpGHbwFSwPFfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2NCBTYWx0ZWRfX17gcBQHb+8xC
 6YHEaW/wrbAicFz2demyvXHhDo57SJbCltYbK2IFX4XoAU5bY2tWFPuXe9J0vWarpPRbLQbYYoH
 3fPf1QvDeSfiAMMGfhAhGT2ZIq//S2i4JzTp5RRovAWt7X+4Rw82auS16e+NCljU27PxZfP97Lu
 Z9ovjMjTqQtx8bHzEq3z07OOxLggCoY/OL1GMsmLFZotzdBtsLmzo1BEkPhYkeVZDDZfJMnzjjE
 /PFVT0fFraNstq6pD//fOmOzZ12kynku0wm2tU371kQ3dBzvC5PTqzaj1cAi8FCa/BXNEQRyzJP
 iefVdMuuYJrAm1mvi4sW/F4qL2Ush+zyJh66xfoKuQfmwY317PSBdccCw4Hpytoknm4+5Rp9AAS
 T3mTP9fLXm8AOADPIimYRDBfDKnWgKvCKBI6NLUG0RY1a/83L7bqQ0tBIxR03vs1751emitWWBk
 vJefesqMR6DMUQ+Pcvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080064

On 1/6/26 7:49 AM, Neeraj Soni wrote:
> Hi,
> 
> Aplogies for replying so late to the queries.
> 
> On 7/18/2025 5:35 PM, Konrad Dybcio wrote:
>> On 7/18/25 1:02 PM, Debraj Mukhopadhyay wrote:
>>> Crypto reprogram all keys is called for each MMC runtime
>>> suspend/resume in current upstream design. If this is implemented
>>> as a non-interruptible call to TEE for security, the cpu core is
>>> blocked for execution while this call executes although the crypto
>>> engine already has the keys. For example, glitches in audio/video
>>> streaming applications have been observed due to this. Add the flag
>>> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
>>> keys to crypto engine for socs which dont require this feature.
>>>
>>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>>
>>> ---

[...]

>>> @@ -459,6 +459,11 @@ struct mmc_host {
>>>  #define MMC_CAP2_CRYPTO		0
>>>  #endif
>>>  #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
>>> +#ifdef CONFIG_MMC_CRYPTO
>>> +#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host handles inline crypto key reprogramming */
>>> +#else
>>> +#define MMC_CAP2_CRYPTO_NO_REPROG	0
>>> +#endif
>> This (and the crypto ifdef for MMC_CAP2_CRYPTO) looks like unnecessary
>> churn - crypto functions should never be called if the config is disabled
>> in the first place
> Do you suggest to remove #ifdef? I am not sure why #ifdef is used with MMC_CAP2_CRYPTO
> (may be to reuse the bits if config is not defined) but for MMC_CAP2_CRYPTO_NO_REPROG we
> followed the approach used for MMC_CAP2_CRYPTO.

We got plenty of bits, let's not waste the time of a programmer trying
to figure out whether his particular combination of configs is going to
collide with the reuse, I'd argue the ifdef is unnecessary

Konrad

