Return-Path: <linux-arm-msm+bounces-82306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD75C698C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4050A34B47D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F862DE70C;
	Tue, 18 Nov 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIKNgNeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIgeEdrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B62EA147
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471302; cv=none; b=kFYYJlkeV7rk7mgsP0mgF1/bI7ggz71DNdkFrdHl9jb6jYo4jo8R3xVE2TuEP0UgaxYoUZBK+KTHKi8wEAZM0FhmEPaIz7LBKRHKcevFghX6eBqLsNOHN3Cpsp/hmaekbUFItUdowd4xs/+tvTdM7ggWy3O60pnAa5P1EDRa6dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471302; c=relaxed/simple;
	bh=yk/uD48fD9QSf0Lw4IV6FJPv3ma0pqKXpe4LLe+mTC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCToSnknXSde16Uz+7NegFvw01dvJW51Qb2JbZCepUUeMD/JcO65b5Twd1RtFaFYtCp4xbJznbTogxH3K4KjmUQwIdifmTkQa7nd2eb7EVA0rICvOfGd5v6KIAdGmIvpsEPAR18+Q4kvofBhm5ZJeqp6i/UuBUH9nmEzNRpNqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIKNgNeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIgeEdrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAcA1x375643
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cAkkko524XBA8vmRtigx+r0VJhPkOMYddNvO7s5UTg=; b=GIKNgNeNLd10xo+z
	cSaHKeINY/XkCySdyuzkuR8GqwQz4RkxuIYP+a+rFTXCDeJifSWnS1MMoLKKwHpd
	dIHynOf70X4UTLSfEpo1gGShTak8W+94KTitxAJGBHujmmwUX4/zurOBJ6ZkFs8v
	s5khu3BkNhJhFsSi19AZLkYUib/DZZmg5B7waCM0lwoJxR0MsMvYZwMb076ge6Ph
	93Aoa5DEy+timoTb7ZLJ3Tj0TqKuEYDMaw8SBK0Yg33W57bIutijEbqdgWprMnp8
	In+sPvI9gsBkX2dBgZ3zHWpxoyVTudQFFVhuChKZ4a3lLxJV5cgQu5aycPkr2Whr
	EhQvww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nk6kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:08:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee24e1559aso4280791cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763471299; x=1764076099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cAkkko524XBA8vmRtigx+r0VJhPkOMYddNvO7s5UTg=;
        b=jIgeEdrQuxL0j3qR4D3HGXR3BO6YA+j/8C3sXXkr8q+4mF6o1SJeGqxuxZMphfv98Y
         8xFpZPARXhaDuqhd97AA5MEkXAMZIrGM7HCW+g/5W/+AVs9iL1KN9WTQNrLDUv3Sxh+B
         7x3JwiR8tc41aAcMTH5cL0ppMBhX6FO1ns22jMFAkU6RIEOdsRZJ3wrHD0p+zhDrclZX
         i1jRiUvb5cfsnrK90z6f11PapYC8tH0djnLTfGo712gD4KnntNoeTgDY2S8Tkd8xL3ay
         IozWjiuu2ZiSvoWyUd5bJaUyOWO5ov/agCFbFCNx9EEg3UwC8jCvlrwelW4CLh4Dvemn
         WZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763471299; x=1764076099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cAkkko524XBA8vmRtigx+r0VJhPkOMYddNvO7s5UTg=;
        b=NJLKa56QkgOsovEixWOxSfM7rbls01YY9JeU2X4hP8A6IThy2EotbjTVpWpFD2ITH0
         EJde2gg7Q838DHN2i4Nlt4sMG8uL6jsE3GAkRiMy6vYSrtQIRzEyI1NQdL/v50iZyGed
         lKxl63N4wR5DDdWI6uEVt8Q8bsWsY/9/KJmpMfO3O3GHYV8qPXFAPCudaTI/fCulNBJc
         2LwMoJrCr6lgZmK1VI3dCwzudZJ/leNaLvztWlfwgprr4Ngfs4Crwx5jgYpRCoVYDX/3
         vjGcp4RPNG/UjZLZsqriCVZY436wmqYbsViPulnqZLDaXoSbgrXiW4RwMuJXYs02Rzai
         6Vag==
X-Forwarded-Encrypted: i=1; AJvYcCU9kXl5B8NDflQliDOskl4/idoFEGNDYGcATivQkpVrlh9irK+EMk4fMVwxoM2lbAS3Llxl4eSeZdbo6HYz@vger.kernel.org
X-Gm-Message-State: AOJu0YwWj2setze7qZ23WrjYNIrM6MLclLKpeDAvwsYavZrbGKX9/3vA
	tPfAQHCLbtc88JyHhQSVKuBwKunIMlboWPCHtGPuJ/hS52iynULT8rUIJNFN3jOa7d9UgmaW4nK
	J4LvjZQm+y/gHMUYukHahVOXz5v+SU1WankR890D6CtlL8+Iadol4Pr04xDWW4VPPrctl
X-Gm-Gg: ASbGncvVPaKy8d911XCMvpFz1Y4Sx4cQI8jGLb4LV8GrdznN9viJ5hkT01Ci6ZQWKXn
	gEgpP2GmH8BqkjP1wpXj4jTEY9W7aXybKy8PaDLcWxX+cobSNAe9+Blx91bm4mJiIQ3FoiPmvrg
	bXeAS62L0WHMUDEEVzVdChwAbIep5LF/ch+GEfA7MpETFjTzygClO6v3CRwEkgt7neXanNNUlFO
	ilmsjAFjRPLJ/VWTU3MchDfRDSCTDP3zjjR4FV+DezkQedZ9iaBUQ7siSawbMrTVnXD/G+WbWlf
	okMHWBDErUsKPgyIqtgojOvmV1jL6vV9wWtWPaRYR+c9gX68CX4U4thh2bJALd4mv/VEDs1rNFk
	JtB08o4wkljw5cyWv0b4GIP8k/zq27usWLQUEDJyD7j89vvD5QqjmBI5IkAqHe0nKd/A=
X-Received: by 2002:a05:622a:1353:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee313e7788mr24334691cf.1.1763471299004;
        Tue, 18 Nov 2025 05:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdqUqOyJ0Aro8rRS139qTe9lsMxr8JcnQEiHJrvX0pgs6TEAhrO6KwjIEuC52rzeMJnwkG0g==
X-Received: by 2002:a05:622a:1353:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee313e7788mr24334251cf.1.1763471298462;
        Tue, 18 Nov 2025 05:08:18 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8a7bsm1320492666b.54.2025.11.18.05.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:08:17 -0800 (PST)
Message-ID: <306f6354-1502-4b9f-9a28-dcb7a882b367@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:08:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Udit Tiwari <quic_utiwari@quicinc.com>, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com,
        kernel test robot <lkp@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20251117062737.3946074-1-quic_utiwari@quicinc.com>
 <121a5d34-e94f-4c29-9d58-4b730757760a@oss.qualcomm.com>
 <283e7a7d-c69b-4931-8e54-d473f0209abe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <283e7a7d-c69b-4931-8e54-d473f0209abe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwNSBTYWx0ZWRfX2xs32xfRO4M0
 jgUi+DHeUHgVMMiSM1jhF+QZf1NN1lCN+Mzuk3H4aPE/gLTxQSewu3sOJGDpZC+nW1Cpp/3wKlZ
 JuaCSQzLO4x3RJuBBFEY7QkD1o8fauuOkcfWqJE1IZhDIQMgu+0YzHxuZ2T/1ccZrjzE+dqhtKk
 3Y4eBqEDErYB/Jz9bPsjv/6s/9B/FV2tuok3MWzXhyDBxwxzBfJlv2D7Er0fk0nILNSOjr4Gz2v
 BNupGZ1eQGjP2Zo2k/Gr4UfWxZUlKWygIkRrJ7T14xSRcJ+/1sXjqTb6C2N4p3HRljvrqGZ7dju
 LFZhmRgEvmvFPYl+kR5c/QT1pYGiqKikpbm/W6RDVleBdJ4etmwwxF3oXkVf6SrbD1F635QRBZM
 sRhExp9olEvkRKW6YmUMabmzCK8vpg==
X-Proofpoint-GUID: jLvfMDfJxg7MR3mzp9dqHFcqAEpNuUlo
X-Proofpoint-ORIG-GUID: jLvfMDfJxg7MR3mzp9dqHFcqAEpNuUlo
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c6fc3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=pBN3b43mpwga8PqSKsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180105

On 11/18/25 7:46 AM, Udit Tiwari wrote:
> Hi Konrad,
> 
> Thanks for the review, please find my response inline.
> 
> On 11/17/2025 5:55 PM, Konrad Dybcio wrote:
>> On 11/17/25 7:27 AM, quic_utiwari@quicinc.com wrote:
>>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>>
>>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>>> runtime power management (PM) and interconnect bandwidth control.
>>> As a result, the hardware remains fully powered and clocks stay
>>> enabled even when the device is idle. Additionally, static
>>> interconnect bandwidth votes are held indefinitely, preventing the
>>> system from reclaiming unused bandwidth.

[...]

>>> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202511160711.Q6ytYvlG-lkp@intel.com/
>>> ---
>>> Changes in v4:
>>> - Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
>>> - Add Reported-by and Closes tags for kernel test robot warning.
>>
>> The tags are now saying
>>
>> "The kernel test robot reported that the QCE driver does not have PM
>> operations and this patch fixes that."
>>
>> Which doesn't have a reflection in reality.
>>
>> [...]
>>
> I may be misunderstanding this comment but the bot flagged W=1 unused-function warnings under !CONFIG_PM. In v4 I added __maybe_unused and Reported-by/Closes for that exact warning; I didn’t mean to imply the driver lacks PM ops.

The case where the tags would apply would be:

A patch is submitted
The patch gets reviewed and applied to the tree
Kernel testing robot reports an issue
You send a fix-up patch (incl. robot's tags)

[...]

>>> +    ret = pm_clk_add(dev, "bus");
>>> +    if (ret)
>>> +        return ret;
>>
>> Not all SoC have a pair of clocks. This is going to break those who don't
>>
>> Konrad
> On the concern that not all SoCs have "core/iface/bus" clocks and that this could break those platforms: i believe the PM clock helpers are tolerant of missing clock entries. If a clock is not described in DT, pm_clk_add will not cause the probe to fail, also on such platforms, runtime/system PM will simply not toggle that clock.
> 
> I’ve tested this on sc7280 where the QCE node has no clock entries, and the driver probes and operates correctly; runtime PM and interconnect behavior are as expected.
> 
> If you’d like this handled in a specific way, please let me know—I’m happy to implement that approach.

No, you're right. I took a look at the pm_clk_add() call chain and noticed
that clk_get() (notably not _optional) is in there, but apparently its
retval is never propagated if things fail

(+RJW/Geert is that intended behavior?)

Konrad

