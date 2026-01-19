Return-Path: <linux-arm-msm+bounces-89595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C6D3A3F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D104304B3C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BD83358B5;
	Mon, 19 Jan 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4EBeaFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iavW73n4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27C33C52C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816611; cv=none; b=s2J/RA1w7dAC6uROjUsb30DwnPgU6lHSzJaWOC0Ejtm27w/N1bYvRUxf0COmPYNhIST8Zn+dwgCQ8RHWZMqwkvj5xYUcXh8ribeCrIO0oEzS7ogoXtiWiAxQpedj90gkr6syYWxIdPbDgai8zpzIReHvAPVVAK9LILJ9l8N4DoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816611; c=relaxed/simple;
	bh=8M8IYLOOV5q5UfT91FPl48yL5agzLgGzIcW+WX8GgoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/GXVSr1ZT0rENOMuUewsbi1LLc/ujmm6ABqEZJyY/QkMjK3JyvNl2z06NFda8DFnK55Fi0Qj9bO1DjoX5iQSTaqgwgqtPnMoxD4NF/ZOn/8ihGdaim12hiLVtC1kzs6c4YPHqLEbkhLgoAkfk9StIl91janbeuMZc2AjyqvYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4EBeaFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iavW73n4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90wNa1044159
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=; b=l4EBeaFlup0HfBh9
	aSoOiJ4C3/kuxhOtr45EEaeI83OptusrtXNq43ue2AlRmPhZhk3sHsWoqu98bFKh
	jrCCj7RzrvU2/aGGoVjQrOM42ruaAwYSFZDtfh7cPwRMgHrw9qILsIugG4WqmCcR
	aDwYmwPTNg9ffZJKS9NKxGazpNwABRy8qiATcPyFSMsoMqt6xn0dPMjul9I7rKIf
	zSwLMjLxvBFxiHjI2ZIWx3lJE/5fxoP3gzwdsHgWmiqWqog8nXox+zV++xzf1Myd
	xD0vyEi8uJ+gi6hGpi4PmJ2JTt6HRmJPIIX0e51+kzU0IPMv4QEdI8jrly35giO0
	c/cCrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehn0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:56:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a182d4e1so104334185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816608; x=1769421408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=;
        b=iavW73n4TKMsv/25riN2VUI4fd4sWGzagEWnQaFfnnsQYze59eBkF61Nqg/0iSzZps
         kmE4NADqVYhcUvxJjNEFQcqh1Bdhx/XT9YsaBx0PkxNe2o0C/TAVg7SKJR27c35pxl3G
         9WNk/vEuaHKJ/LvCrvncOVVhEAU8HKnhRvoBLD3Uh0+8/iyJ5f3TWyCk+Tc5tobYHIVY
         HuE1GTlL8d1NxbIrUbkeNGbyivs/G4aUm/c1QG7vMHh9qkDdFNArOKRvi8PXB2NwsP2w
         l5aPLeYtNAsrGndoNOhgycvY5VWR+1HrXlMP9U4/lXytfGwknciX3PLmspfBnx4KX1Tr
         wgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816608; x=1769421408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=;
        b=CuwFmk6ZGhbuwXInaE8P++vfi404k4y9+gaR68tRm38JMULVOI2lNhL6yC1YGEC0H5
         5AydoeEUeAdGUsG2mHwWIvrsa+Sjs6HLu/JVxXS2Kp2q9xzN2slN/C4580KgzLxhzupw
         VpPkZHbplpr2bYqptLmmo8wFAPE0xSJI5mKcjfsMoj02nc1qj4CGg2GzeEKaM1oHB2uv
         SUa/edRr/m7yx6ScxbHZ3R+E5TZ3EE+nbn9g6p8XQwhN9jqqW1DfZl8j2XyHfMLP2cFD
         lizrEmtpD6jGX7K51qm57+On/9b/zblNZ/aJqRSqcZKPwz1wNp3mM84c0ZyZcknX4V+O
         x4Eg==
X-Gm-Message-State: AOJu0YwIHv8hbwUOz9X2Y6tZiD7FupA2gCR1ti6/6Ad5K1h1JIwSoYfA
	KJOadHZLIvFBTJ9WUQz3bJIhI/NDmNyOzELUijubaW9bW/+zibWENs+A/fEEdTLrI6W9pOwu2Ta
	AYzEBaVTbMSt6lGXHTM/tQgoGlX3q/PWM9HC2Qke4VMB8+RTTFUIhieBOHH3sFMUHI5ba
X-Gm-Gg: AY/fxX5J32y7/tuKOv3iqkekeNM4UVB9T20/3FeZxFzXZlkA81rOCS6mV2tz/StrAD4
	ag/5NLDXWWF51BZwKBMFCaDiH+2ijjNBlrL/ftcEGiEb0eeDCarhMwNwa1AJnPGd++vBigVQiST
	zO8jpdKLYYsrpbfziVM6tOynm9KgdkhPlnMKCUXTG32G79tCmx9b0Cs1lquyhCVTdnUFp30Pr7P
	LeUEfqpKuWjS6JZE163w+S31HKj9FkCA7NM6qaE99YsSHZIQ6zzB2gA8hzSRs+/lcLn4D4GshDw
	pM/vAIpABRRTABFkPx6OkspW1udN3SYFl3mZWPlvVblegJIkgyNKYnOso+7CzXr/hcc9jo5TT6V
	Z02W1Dj/2Ir12BgAM+0haZKcUSW/kGtlrwhPfuM5c1+bMLaB+GM3G67WNevJ2dqo3ejE=
X-Received: by 2002:a05:620a:472c:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c6a66f26a9mr1202367085a.2.1768816608449;
        Mon, 19 Jan 2026 01:56:48 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c6a66f26a9mr1202364585a.2.1768816607918;
        Mon, 19 Jan 2026 01:56:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca4casm1040662466b.34.2026.01.19.01.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:56:47 -0800 (PST)
Message-ID: <faa3cb6a-8cc4-42f2-a883-23f7d9b0816c@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:56:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4MSBTYWx0ZWRfX0s9qoWxFse4S
 1SPoDHB91kx1jpaKOttfbHwZDA05PD1P0ueiheh4cHWqIKcbkNARnoeIYC4QOy3qGZ0owtAnp7l
 F1tkLNGAv/JeukepgpJu5sHEaW24BwSBEyKYiN8Htf1pk8VI+UDQZlDDkLksr3aap/7j6uUKOL3
 vtQC6dYrz+QcTiJOunwFmsYipPUP1qPqrIKkeENNKg0tX4eE7U1AsOYXuf7jiaQLQ2yI6LXjYY1
 XlEnR9L05l/VeexAeOFgkTtVTz3SPlvzVLkMBmBdlJFyjkqSRrjF3aP2+uPVDiRhA25rXh0ptWT
 4OFTlpKu29aPkkQqTprgH6QWsIaO9ieUYHPzldoe5iFHw/T4KlraJCwTnXxv0Gf+rATK4ET0s82
 RBUDbUuJrYepR4aS+G0biAm+qDQMGL76JtG5Lzbz6b8ghW3yZ1DGVvLS/MT7Vn+TAfuspcRlFIx
 fz1x1f+Zf6Uuy61NaGQ==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696dffe1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aLeZyDyw9DXj8ur7rQ8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: d8RIj7SdSmu5kEUMxjLgRuLxvu1Qvn2j
X-Proofpoint-GUID: d8RIj7SdSmu5kEUMxjLgRuLxvu1Qvn2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190081

On 1/19/26 9:14 AM, Dmitry Baryshkov wrote:
> As in the previous generations, on UBWC 5.x and 6.x devices the Highest
> Bank Bit value should be programmed into the hardware with the offset of
> -13.  Correct the value written into the register to prevent
> unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


