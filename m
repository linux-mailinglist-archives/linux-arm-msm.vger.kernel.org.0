Return-Path: <linux-arm-msm+bounces-87840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B850CFD35B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8B16307A932
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E9302CD5;
	Wed,  7 Jan 2026 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jqp/MPgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdIVEJjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B830596F
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781622; cv=none; b=Dajo01fsxpgnZ66lasuIZBWliRXf4pdQKgeAjhl3b4zJ8qVqqj602rsodTtXG1JEaGJ5d+0Sz8Mwk5uHwI3EjzmHluVdDbbnw6PEqLURqUj2bBEBlu7nCZyzFisYKH/luJdsO6a8hLxNz3Wg8rgbMkEtXqwyVsMNx0je/l2pVe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781622; c=relaxed/simple;
	bh=nAlxEPy66jHLATL/E6dGzMkhG4O9SvR9Kl5Cyg1cIKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CM5tu2w240e8ociF+5oHvf3kmWXOndnC0NVvbCzBi/urAh3xlQz4aA93u5dSgXzSO+hJmqQUM02BIp7n5XH/5l/mHgqpsteCjKIhTW5Tm7Rw+yIWP4FIZoQGpGYqY+GWUFmCcrBo1y3TA/oYGRXM+fugZQ3ETAaXFd7ylIhcWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jqp/MPgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdIVEJjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tNca2379144
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LjmVkkOZpX5LADayFjABETmQUSoP86sdabSMHPA01s=; b=Jqp/MPgQxhquJqwv
	PCCIfF4tbrmhb4vWQwPoQKC5HS/CqMpJ1WIj9Rt+2yqGmoAt/4s1Naw+1AtlxRub
	fgOeb6P92AJSmt1DLA24iJOiO7D/vHsqg1nA4n9nmb2Ap9aGiOmXzGqqHjkAqqd4
	ivKMkA6P/IYg9Q/F1jwXKSyXoAquxZmXd5tjL5yHERcJ+EbNLgvEadrbAU/wap2o
	OToj4D7K+h6o9I4UPLIcq4DRGGGbC8i6vYsNlicSUx07n0krTcfDr3Og1+oFmSKQ
	RnLjlGfZa+ET+Ufec8GY0kTZWdNxv7YtgO6W4/i9TLHzCdEXUwRbS0IpvnBAgSVm
	/7uZ8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rp98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:27:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso2155665a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781620; x=1768386420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LjmVkkOZpX5LADayFjABETmQUSoP86sdabSMHPA01s=;
        b=HdIVEJjUgkUb9DSwy1xQgolw8756IUoOIOwZ1mN6or6Rci93KrqdYhBIGnh2rT2QLz
         jiCUVYa5uzMyHJnf65ZKoOdPuYZI/KQIT1oQoZ3Z7hwjWE7MNd/WFMJFx+pMXbXOuj2I
         tIIHV5B/y3Fayz3kASyHekvzSUZyk/bD6k7DOInL9PBlO6xUa4qAdvrVt3N6MIpr2Gee
         Ah5uNItFEGU2pLlY4eMIUkr0huLpVq6TAWSiXPgcTVtiha2mVjQbdfSz4NLU2wVILg3V
         DWcPRu5aAm/sALvdqPKfokq16bYLoDjxtMzmmTLUdqgd+Q71frBnmFLloG9OtWSuM0yO
         0pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781620; x=1768386420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LjmVkkOZpX5LADayFjABETmQUSoP86sdabSMHPA01s=;
        b=WVWuVrcdMbNqDlPnYZcixR1uZJEOYKxbHt3HRaBzJuTwbtlZ5CKaULvPOc9RMSVI7g
         RdvaE7npmvPX2exLAtU/ZBIOLuDY0WCFPuB92ADzjH/kyayFC32/2qDlEnTLAq0Hqi0o
         HSqzIcOKWL/mw6JDty7Rj8idZFORl7hn9/Fx3FmggEgoGuuRA4EIYk8YZfkVYzt1Zyhe
         7rf9GLkifI8ciPs4DFcl9AyjmU85D9aAGw4hg3whL5SEigdt+LoPb7kxtSlq2v75IUp1
         iA8yXy4UYkrpHaaiDzcLmUjcG1xyo0Exur+N5ykT5W3SeBAoYDZAAAVNPOpOQreXHXM3
         3GdQ==
X-Gm-Message-State: AOJu0YzPZu5jAU3Bw/uPvPlJSIWnQ8ZVmam8XFX0ZBP3HUJLjfGdw3Wo
	GCKHrYdzYXKyDPpJqLgxygn+DRcoJnEul6MArCVNxZ+nPU8xOPHcYDJUk2Qu4evv8RSoXToSQc8
	xmdqs6VpxxLLznBg55wgbPMVQjrpHiRoJVaM7+Vd5lmqqJZsSgu0q15+tJ52J6vyPTaZb
X-Gm-Gg: AY/fxX4wDADMidcBBjol76+86sY95T9eS6H+kq7NEjj+PlCDXJS3RZirtjdwERaof0T
	n+ulP5pEPWB9VZ32bgDAQpcW34+Q/NOce8VtMmdIFUm0Rdz1hazmrmRjtsbV7CEyzJwYhUtbhWo
	VDdmxTh4aNEmyr62kJfTfCNJL84jd40VDgshBfVOCkONE5MDoxjDAFdcC5x9wP9WhOG41EHUwQb
	3CYNFKlM9oD2IgT/ZlFrKm1Z/ry4lq2bhuo6ze9xJ2u9ckQj0lw+2HivQGhDVbnRjkQeP7nnLL3
	28NLFNDqpJdKp0I1AR/jouaVvUiAphknU7TS4fFfbpG2PieIuqEz5ZJwN4eOIPxxBU6xn1pX6yi
	/N4w6qjKE4e+qIbKWk+YnhRrXdW5uWWu/6tE00NDx
X-Received: by 2002:a17:90b:510b:b0:340:be44:dd11 with SMTP id 98e67ed59e1d1-34f68c27d70mr1945011a91.27.1767781619654;
        Wed, 07 Jan 2026 02:26:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4UB/GM7QQS/K25Cja3XQ1+qCMI+Yzn+arvKbMps4Bhq/+f6bhyoSx4Y2XmBVqknRMcB9O5g==
X-Received: by 2002:a17:90b:510b:b0:340:be44:dd11 with SMTP id 98e67ed59e1d1-34f68c27d70mr1944994a91.27.1767781619198;
        Wed, 07 Jan 2026 02:26:59 -0800 (PST)
Received: from [10.217.222.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78f71sm4624658a91.1.2026.01.07.02.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:26:58 -0800 (PST)
Message-ID: <f1f23093-fc26-40a8-99dd-c159d53cb85f@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:56:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
 <55eb7543-7b88-42e2-bb11-7c54c4e59801@oss.qualcomm.com>
 <dc500814-3b1d-4cf9-8f73-6fd71ddac28f@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <dc500814-3b1d-4cf9-8f73-6fd71ddac28f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e34f4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9IewMXa7Ph_V3uKePnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfX5F5whcTpvm+9
 ZZDXkA4lDb76155wKE+VRDiM0tH6uU49e9ID4WtIWgi4FQkkEG6597VhEQ33+kvOYzJiMM/soVi
 tN50mbrLWsPCdBtViq4QWVVBRW1Izoly1o56y/eL38a00XczjU3WSlHZk9CMdZbdMVOrTyFhd0w
 d+gUC0imiOfftkmXboJaavoF7nXQb3vX5T1vItMMBAw6GO7aCKB4xxXc+yoOJ2Cda/ezPbx8XzR
 9dpCWcKUh0ARYQxVzYlDYyw2XWzqWZ5RuoDMCPon3N9ZmvFHvXIuPP7WRJvvmN1Fc0oYC/Murr+
 yLYKMbYXKaZuR8DwQyUhaaCrUiFKA33deElo1wMARQaj4E5kyvJbFWqboDX48GKf3vfGrVu/swh
 VgMD/vrqHpPKjr9HaN6d4rbd7egbq/tWhd5ROJnQ2EqTMYXDVvc70e18igP0WaUqdPvtVQ38Qfw
 ZuLBD0cYjp5xaBq6b+g==
X-Proofpoint-GUID: Kp1ziZgmBEVYCcpsnbFPpYx-7INIAjmP
X-Proofpoint-ORIG-GUID: Kp1ziZgmBEVYCcpsnbFPpYx-7INIAjmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070085


On 11/12/2025 4:39 PM, Konrad Dybcio wrote:
> On 11/12/25 10:28 AM, Konrad Dybcio wrote:
>> On 11/12/25 8:42 AM, Khalid Faisal Ansari wrote:
>>> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
>>> required SPI and TPM nodes.
>>>
>>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>>> ---
>>> Testing:
>>> - TPM detected via tpm_tis_spi
>>> - Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)
>>>
>>> Depends on:
>>> - <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
>>>    Link: https://lore.kernel.org/linux-arm-msm/20251106102448.3585332-1-xueyao.an@oss.qualcomm.com/
>>> ---
>>> Changes in v3:
>>> - Squashed patches touching the same file into one.
>> Doesn't seem to be the case
> The author was referring to a faulty previous revision, not my
> suggestion of coupling this with the dependency
>
> for this change:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

Hi Kernel Reviewers,

just wanted to follow up regarding current patch. It was reviewed but 
hasn’t been applied yet. Please let me know if there’s anything pending 
on my side or any additional changes required.


