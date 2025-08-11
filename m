Return-Path: <linux-arm-msm+bounces-68268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D3B201FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395B4189BAEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAF12DC331;
	Mon, 11 Aug 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lveOeLxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D852DBF73
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754901614; cv=none; b=uWFOYdF4UvlgnGlAdJdBHJGzCqg8k1uwWmS2ozYTTnuEBGuv1c2ue6ALH1MpRfT7FSP+F3CD8yvlzJ1B0pPGDuQH6Yasd/zLfvSZKd1SSc34fw7HoIhrHrNDpSHD3NkZzCOGL8Zfmyh7E0+blveB90penUKjUv/7HXMOBNSKuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754901614; c=relaxed/simple;
	bh=zt4usI7wOdzWsTqZ1WBM0aj2WHMVpGhK1jXWfwzFFsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOPC3FeftsusMGz6qQxLFj7WmRj9CK5Yx7K9eIwgAMX2nKwYY8JP+hS5GEc/3MYX2D5R582BOkByRaiCAHUP9QB2yuWx2HeNN+or7/pWcaMcxSs+pZB9FzXM8BE3eSbAHAl1IA/XwjhMJA4Ji0oLuEwWSwmJAsEahF/XTRL61sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lveOeLxK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AM0Iwr022273
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIVwbR0aICOANyl1yo8eAsvQlfDzlKmgpVcSOQw7yWM=; b=lveOeLxKtakVxdYs
	GCrb1kM0qWyKHP5iNjb0zYzTTxQXSY1VLb9Zgs5jTPuyOL4v9Dcztp/+Jv7s7jFU
	g3kI2N2g51T9T8pKF6M9rTINjOEMB3fs8aAXIk4246i3Gih5N9qADlY8fj8/Df8+
	5RW6NTZ2Azruze/31Jc74AWC2CDxO8kH4HLFjQBAIBuWywXHQjqPaZ/TJVExIZP6
	LYU+8Jxh5nfYCjArpn7pkst16jpZZz437zEV4cSBQgxXfJRIkEcLBVUtKA7koyT7
	aoH1f4TbyeIA/St3ET7NvcqUFk5GaB3FmKT8FX9Z0gDmfzvXJ2FSnc0VDChAopWQ
	HzByaw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6um33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:40:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707641946ecso10509426d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 01:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901611; x=1755506411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIVwbR0aICOANyl1yo8eAsvQlfDzlKmgpVcSOQw7yWM=;
        b=BfsuHYWuQfHVKOHf1AEUOheOp8ff4G2ExPG7RF1t2yWQ3NTtJxgvWojrC/UtU3jqpc
         buUTmAEAukaI/TkWNOhhJ+bqfs195swRzYMibE9KD+ofSKWqHhMK2Yq0Mh2XvKtV5CcR
         7lAJHHVmrtaQ0lBau1P7RepW+Jf0fxLEKsPZh/AjqKiq74y/I5adbZ4/ue6zwv0Zg/br
         Nr5AsU+LwQ7ZbV45qfGlewW9ouVqoR9Spi1u3qC5VIFVKOxb5L7D/r3fTvJmP6OpLA7o
         313RNGJaNAIvTYHYST/2ntKwz4QedJrF3axl900Z2R+1c4clMXdQmAL/W/HqN3soBLR9
         n4ww==
X-Gm-Message-State: AOJu0YxK6XlDZ1V+Gpq4M9L5TQoDQqlKJDq3W2ThGiFA4efkxQP6kcAI
	mdroOE415wF893d/9UGjHveHQ9fQKs8b/qy+egyOkeGWD73fTKLwGEEACR4V//vRl9rZSw7yZj2
	yKaEVKhV1yuS/wRHigvqOlEH0g+81tw1ggWliI8fPpW0k9PE7fPULWEP1BGlYWOX+D5uZ
X-Gm-Gg: ASbGnctQ6lFjUKsJcd4eie8OAYMAaNmL7mUwTOpCXf8UrwGoDxkBYr6WOXAF//U/A1T
	dMElZ7LprK2UevIfrDHKMM2EKl2zwwvL8KJ4JOwCYSLhD6qtt8gRi9Gx5v69+VHoYoBSVs5puUY
	nW+C+n8+K5VMX/lyS4ZSe8fTr+vzV/IIaNiR4vyqh43ZnKCMWjzogAg9lYGJ+qkPsQCOU44X9nn
	LzYV5vutRkm3mI8ZVp9SOClLxIT1vwkrLbzXtLDAwlO9VeyIWwBlGG2Y9Yxs/ITdqW+NydTdkdr
	iOAl52QxDPGJy4AxLr6xdVXTEQXDAVuOfnldRV4DVLH6L7vhsdSojLwUypfnfN2zSXi4fT2QUJ7
	P68jNu5mspSvDUPdVSQ==
X-Received: by 2002:a05:6214:2b0b:b0:707:1b36:28b0 with SMTP id 6a1803df08f44-709b07d721fmr45628266d6.5.1754901610723;
        Mon, 11 Aug 2025 01:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmqi4GHf2A7H36MKIKZoZhHH6tD7LdfZ+CPYZTKbI125W7w1bLdBwTOiUmiKDMJ/XmSBxNuw==
X-Received: by 2002:a05:6214:2b0b:b0:707:1b36:28b0 with SMTP id 6a1803df08f44-709b07d721fmr45628116d6.5.1754901610242;
        Mon, 11 Aug 2025 01:40:10 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f15a66sm18447502a12.16.2025.08.11.01.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 01:40:09 -0700 (PDT)
Message-ID: <d9357f4a-6f26-4570-bcb5-62fe39c78a70@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 10:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
 <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX3so/KU5GbtNL
 VY10z1o8c/t5I66dYIn9GpQ111ZzvEtPgshwWFxtQ7v3PhGu0an9DVWRcAMrbejwyDzk/XMCbsa
 AlCLqQ5M8wV0X+imnIOIwRxISiI+KLfvaIsgH4/gHbKQ7k+X4IqUXSBZgaYaI8nWjESG7dFWBOR
 4WfwLknmjC2y43re1y46SGLUq9ICsqErK8ksy63goCUFKj7Mew37APfahJEyt6yqNqHBnIW1hJK
 A99t1q0o6JSCOsOwyPT+/smGaA/RMx1Zn/EHUsmMmY+A2f10BiNV7P6QW+XFr9Y1JjFvxnyGTHD
 oAJpBmdjKYLLspC7Nj60luF/P/petp03w3iPim30TJ2/8cK/vJsct9fwkbBNlIsd9K/yebA6MBf
 HsY8A6zq
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899ac6b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qoSIoJJoY18thYJL65kA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QIuhxEOJLvLcPkRYDnBwbtB93CY47Go6
X-Proofpoint-ORIG-GUID: QIuhxEOJLvLcPkRYDnBwbtB93CY47Go6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On 8/8/25 7:22 PM, Akhil P Oommen wrote:
> On 8/7/2025 7:21 PM, Konrad Dybcio wrote:
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> Since the PDC resides out of the GPU subsystem and cannot be reset in
>>> case it enters bad state, utmost care must be taken to trigger the PDC
>>> wake/sleep routines in the correct order.
>>>
>>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
>>> Additionally, GMU firmware should initialize a few registers before the
>>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>>> GMU firmware has not initialized. Track these dependencies using a new
>>> status variable and trigger PDC sleep/wake sequences appropriately.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> FWIW some time ago I made this patch, which tackles a similar issue,
>> perhaps it's a good idea to merge both:
>>
>> From 7d6441fc6ec5ee7fe723e1ad86d11fdd17bee922 Mon Sep 17 00:00:00 2001
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Date: Thu, 20 Feb 2025 10:28:51 +0100
>> Subject: [PATCH] drm/msm/adreno: Delay the Adreno RPMh startup to HFI init
>>
>> There's no use in trying to power up the GX logic before we're almost
>> ready to fire up the GPU. In fact, with A8xx the PDC and RSC uCode are
>> loaded by the GMU firmware, so we *must* wait for the GMU to fully
>> initialize before trying to do so.
>>
> 
> iirc, this wake up sequence should be done before fw start. That aligns
> with downstream sequence order too.

FWIW techpack/graphics adreno_gen7_gmu.c @ gfx-kernel.lnx.15.0.r3-rel
adb0a9da173e ("kgsl: rgmu: corrected pm suspend flag check on resume")

// load gmu fw, enable clocks, irq, set up chipid etc.
[...]

// unmask CM3_SYSRESET
ret = gen7_gmu_device_start(adreno_dev);
if (ret)
        goto err;

if (!test_bit(GMU_PRIV_PDC_RSC_LOADED, &gmu->flags)) {
	// set PDC_GPU_ENABLE_PDC & seq_start_addr
        ret = gen7_load_pdc_ucode(adreno_dev);
        if (ret)
                goto err;

	// disable hwcg, sleep/wake handshake setup, pdc ucode
        gen7_load_rsc_ucode(adreno_dev);
        set_bit(GMU_PRIV_PDC_RSC_LOADED, &gmu->flags);
}

// set HFI_CTRL_INIT
ret = gen7_gmu_hfi_start(adreno_dev);
if (ret)
        goto err;

// continue booting the gpus, send out feature messages

on a830, the patch is observably necessary (gmu doesn't start otherwise)

Konrad

