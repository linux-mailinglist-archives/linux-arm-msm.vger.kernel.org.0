Return-Path: <linux-arm-msm+bounces-82227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF8C68909
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A55934449C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52332FB966;
	Tue, 18 Nov 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nokr6R/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fouuPRZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76847284889
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458397; cv=none; b=dPE2/W8IgOkXeBDEOuQnO1zih+9EmX6QmTqGGReU4vgkTxsWnecqnPmSDDrHkxYWJDLikRIQ11xCewrAYh2kc3gDrn/JYwEC3XT04q5ZBnuQ0X0nJYGAgpcQ1qVbQ1MyBAK4PCxEXHMWlnps1S0OWe7nNxWjFErdk2FoPVkJtwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458397; c=relaxed/simple;
	bh=UQIqnD2S8qhSUUosHxjP9X1H/0/spwyja+9fJXAYG+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YchQHkT6TYFIYYUUTku7zGW+EzmD8xdkV8rNFPZbZBry4cf4/TEfPcumSuwhAdo7SIQlHJiCDWquaFFZWeqnC2lE4m2fps2V7sGLIZy+HlDcCkiXP8Ob5Aw5nAfy+cjPMevKcMeJHpZCYOMvKHPaXKrwhp/zaTHS/9dTakQC2b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nokr6R/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fouuPRZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5qEAB3916356
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qv39UFkyCOPqRFmKEk2XhdOqhtGR/Rmbfy+cLgF1iSY=; b=nokr6R/90UqZsMaB
	pFxHHJuJ1VJ9ZmvB4zybOaAhFuFIkr42UtLT5uwMrhxOm7ktSCSmmWZIKhI9GoWX
	uBz+/OPWXNl83QNYwDKaMb46+D9Ud7sr8dB96HgRk8ia4T2GwZ3ChEy0wQKKRAD9
	BbpjOP9HBDpKocsRDdxxaA95l04BrqvZGlvE9qr0ZjOB3eXnKaisU+muuwnZAYOZ
	96ARzqHcWnkW90iuhZalL6E8u/JNtvkiNQkh/tqnNQ/ComTnROgGyONvsWPtXib0
	3DCejT7bxw5swR3pkm7/uv+DdPLgvv7P5HeYQlJMe1rr0B5mfbTYBG4eUkFZ9rfj
	MM+sQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fxbhm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:33:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fd6ec16aso31871385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458395; x=1764063195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qv39UFkyCOPqRFmKEk2XhdOqhtGR/Rmbfy+cLgF1iSY=;
        b=fouuPRZCboesz1RQCSdh7kIC6S90YBi44cct8uFC9iuM0K5Mbn/TNX3U/DOFPYD2tS
         Zr5h4ICsODMxJiMbsXK+VDrXVcGcm0LwNXSatQB9lRhnJ5TouJf4agrdnAf+WJbw8VEl
         5iD5rUT8kojv2ihXvmumdBtfVXjPW5+nMOKCRvZ7o4WO0VRyWcs5VXyHT87IceM0bDZ9
         OZF7nsm8VI/ISvN1HcDuuQKjxyK9SFWP8IRTN9IVhsuP2LKwOa/F7W/X1kSYqh8lM2FU
         rlIBWw1oFQ16HNfpq5fL8/JfY3Wdw4yUkDrZjFqZDtc6u65g8MoRrj1xhxoDVmWcIce+
         ZeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458395; x=1764063195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qv39UFkyCOPqRFmKEk2XhdOqhtGR/Rmbfy+cLgF1iSY=;
        b=rdP+/v5fZsnxtdfQ6VLSU7CmUKh5B9+kYUbvAG4Q0ymri4VBEzAYs8uGBkpzJJejWh
         6/TK6kWn/+f3gg2Sdhyb2WH00DXCB504LuRKd8GlUiseNEuAwIJlt5CkehWltqFP5MMN
         0qmLcZ2bMpYyGwKRdzd1u2XCQXhidPAgcjCf/gE0BtNwvPPZL3q9q3RMcjx2U3dnmuUM
         R/vgdSvkw3L0MgXZC3Y8B4XOcO7LR/RS4sEND6DnDPtwjNwcvoSD0/9XEL3itFlF99M2
         VkLXDxLuQt+nNe0dUJt8Iz7auy2HVVXEL8etNqj5ER3IkjIKr0wx4x0k+NWTjNXpVY08
         hKcA==
X-Gm-Message-State: AOJu0YwxZyzXuorsny/wxsbsVLKE32+zTnDoJjCOtfUS6/NOnVF8VzC6
	nOBbZUkkiQ2gjIRv6n7fQSVEa6Y4dDEHHfBHQ+73K9eOdpOrt5Y7nVuvDDHy1qMW0T4lhggaUOB
	7/RqIzyLOgn/TmO5jzfCxPvVhjuIaYxXvS3NZzLU3Ec2lasnJpdehuhgJUHDyfIQJwed4
X-Gm-Gg: ASbGncvEeqolxSwWFqxP2FRRNkaaq1yeHeRS7qPS2YHXTZAXV10zCB7no+jl0gFQZK+
	/c/oJztsUmtlddxbjnccAjLaW1NoVBCyFx3N0HNIMmrB1wEi0kK9tVJ1WsGxTrbIVNiGhE9vnD0
	O92Z/6miTqPxOKule5abYIxH3jEDXpxYJrIKk2spNNxUGre0rAW1iZ1OzJpLcGETF2LteIVtC+q
	yNV7GZWqzx9Lvpp1mIsjuGjNphNJqZWdo5/LcLBaK4r14D4k4Iv0zo0Wx5QtlBNjAugFjMB95lf
	nj/EVu9sQNcJMS9syyk16XVwYu4MaRaRwVZsLin/y9sc/9ID+jekWDCyVUTHT1Il5mbXpoC9MF9
	LXIsyULRH4LHnolcMACgw4HeITRTrQje0yUWmEDYmMqcG0DU8CXJJSTDpSyOnCA7Gc8A=
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr20177181cf.9.1763458394931;
        Tue, 18 Nov 2025 01:33:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXbp71/wGMsCkl9kj8qW53hh43sPKd45qH7WsYKgUAc35qCTahzIoz0OdHPPgWiMTOyBDTSA==
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr20177051cf.9.1763458394574;
        Tue, 18 Nov 2025 01:33:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm12473980a12.14.2025.11.18.01.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:33:13 -0800 (PST)
Message-ID: <6b757b7a-3f36-43c8-be25-8e7f114634cd@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:33:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from
 cpp_gdsc
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak
 <junak.pub@gmail.com>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
 <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-1-db33adcff28a@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-1-db33adcff28a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fDdlUMGzm-axipkCRclBBEWJq_iCophB
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691c3d5b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=bwGweEJhbDxPikGuqYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: fDdlUMGzm-axipkCRclBBEWJq_iCophB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NSBTYWx0ZWRfX6B5w/jKYoLU6
 QfmeAPqSqG5/X3MO3kLUTgjQdZ4LNylvDr1G+nYtooPWlSt4oMCnke0fusA7xUj7Jt1wIagHu71
 upaG2ikChf7fZgql2rRYXq8LcK855B+lemlt9FNP9CISki4B2WUAsnzAZRTalxwAXsPrj932o9H
 H73+tVU9h84YzVeBa069dSD5YnO0eO1ei4JUsZU3YvNh11fGWvD/SQDLUpZG4SyIaTfIXZxk0x9
 dEsWpSDP+AQm/jEqarl/rOxw7AqtCvhhWCwdyrX9/V++ADJ/7TF+FvMjahmx4KqgDITsbMG3jex
 hZXdEQlFb0LABpzLIiYl61/AkMaivgiiioLp01ESAQTmEQp3OyNkR69MYlY8OiHG/9A6z2/4F8R
 H5WaChDuFvkmNNlzYhCmM9gAGdN3lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180075

On 11/17/25 6:58 PM, Barnabás Czémán wrote:
> cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

