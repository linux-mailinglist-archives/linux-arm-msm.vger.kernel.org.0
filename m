Return-Path: <linux-arm-msm+bounces-89572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 496CDD3A096
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435B7303D8B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3B22DEA95;
	Mon, 19 Jan 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFZqcpE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEmC+GKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF352261B6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808841; cv=none; b=hcHDrdOKWVuOuMYoSNuOEBu7moZMnaHhH1QateXCU8Jap/wq2XovQwys8bBdP9KbdXOYLGZ1dU2rS+XSrxa2MlySnlrhbOrboyX5CCbPVkDysFdHsXA1LTYowoq0EjdkD2yfdQ5zoG6WO1rYnYcagVRhtJz7L3p8E1Pqy+rj0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808841; c=relaxed/simple;
	bh=Tgf0VcYCUtXe89uTM2OBa7p9iDOCoptnLiS/HmHmi3w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p1RAfyZI+7frnVMKSTNysbuxgYqDs9r7Wk3e3N59N8WlH/JnoxcDb3hCFb5JTDWScmB+ivkV1a35Lef249VllM/Ww/QeGyctNg8AiAPuzPfcS7P0OTrC0pF7r3V69K+T8iL2mfTkmikySqiSuIm0WkbRAN5wtWHJGrtM4GzWgNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFZqcpE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEmC+GKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1dDXQ4133738
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=; b=MFZqcpE+zDEkEljI
	eS3BEc+8YC8hC5WU6VnV2ZzFhUuBJIXceZxk4u1aUyaGZV7MVHM3TI/qgvDE3TVx
	d2VLbsmSY36B1G9MQMuHKAjTNgB1uIwlTu9k3oL+AXpELUMyDvEI8sGuMU9dgtSS
	b8jpEFgeQjIoorAOs8PyPxVgfkqWdnRhxUY25I/B8jK5yc8hCEJqgu3xqH6OHT3t
	X5fo/GvUdPtKdt1AtEuCHVWpb+s1JjXXVoHrqjPf6RUP8ahBjE/3D7PiO2Ufh/Ff
	TPkzm0JN7KKXihH0z/MRxItTixDSc1SrU9N7lzb3zX80yIN9yB/haU+8o5ha1foE
	DsoV1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yrv7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:47:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5539b9adc3so2429829a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 23:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768808837; x=1769413637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=;
        b=eEmC+GKDuMAowLjdRh4EGFhYBFtQ1GPPIWNZDpFRqUkmWROR+iNgXRaoZ7e9y1Q1N3
         zRUMmIp76i/ZTY9iuwGCVVFxCmRoN0su1iZ3Suqo1JvJ74K7baLsoilDyAyeUwmkW8ce
         QDZ6cNfmzi0Yus1lFSaZMusRwOqdfoeYnpWqqpfq4PF3qtH3yOzIAk+g0uYury7Is9C/
         iQhhX8Q+QCEhw8Oa+c48RfRzbso8GTFj4CFbD8T5feZMC/DBBpP+L5wyu4rW1krBWoQX
         1fvhxCABdyXFbkARaPUKTAKf8Nt5BEPq0LfRPiN6jdeHedt73HE13O6a8qTXwITqIxB5
         9kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808837; x=1769413637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=;
        b=InkqQnw+R7DGPrx6GT3t/NNldMgHfTkYCp5uuYf05KhLSnjYxU59lNip4wGJP9SbUU
         GfwJhcAwAHyjfNRf1X7ZUMIGl42VGPzGpMlKAFJxrBe+m3lBgFAE98DpAREqS6kCe5FV
         YCFWKDNXPlPGCccJaZaAw3A6X2ACQ4rw7ngsDrdnJZDy2FFb05NkUygkzh5fz64IzMUP
         EMSrWRnGw/NSZaKZCYRrd5MmnOxOddXg0GyswBZQ01bago1YuaCpZvuPBfbJQVnbLO9T
         jw6j9TUqWQAIyFcRC4L+08S5zjkMGpMlE1O9/KsfrsO8rz6VJE7utnBMP6keqCTTxfaQ
         2OWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOClQNbaYedKXvVq+gaiaSog7z1my2b1A0cbn1CC/NV4etfIE5ANxLhp0Edrb39JNuvk7Crq1VZ7FTHDrN@vger.kernel.org
X-Gm-Message-State: AOJu0YylWbuujM8ssgN5sHrm/t7VCKk669z4B4MBfz4HiNSPD959HKfS
	S86KNOSGOtYYH3B/1kdPQgBdvQvfzPfRrvpHXmTruldOccX5WPpaSL+izeYHRy50zxL/EzBd6o1
	Oi45nPxbGZ1vroblxbPy+RrU3pEKri7pO6rS1Y4cMu1uklUDoL3oSZGmIEXlw4+kxMGJW
X-Gm-Gg: AY/fxX6jzsrrXJyBSnk/iaaVak2h1l1cepV1FLNlSx7JIHnD1eCNiaQ6NTULAYRG5R4
	N7oKr9RBSHuO/OnIvez1m7BhDVU2tYt9+UthfPQ+zaI3L27vXhztN3szwacYFbbgEwFuFkp0lic
	Oml2zTS1tKV7s7LJrcMHSYAB1rU5PYpi4jEjGmgWMlUxzde/ingscxNUt6BlUjZr4QIW+EEoCXF
	BvU6bUZ7iVLlYD1bZIrTU6emHsarRvhwy8wv0CLYVpd5y2LCHLPBrh4bFw4pcIsjz9jKSquYOVi
	aVoxW2cWWdGMT9r6XoH9rF8uxMh4EEhH9Rsy4L65Dzf+8mbpE6P6vYKxOa99lzewSRTYzVgVIAI
	g3XPUhv0DstVCDDgjEB+MJ17bG4zMOWj39irBk2oUgA1ODpCA+80m35t17azq3hjMnuKCjHKhw4
	KaSA==
X-Received: by 2002:a05:6300:6199:b0:364:14f4:5205 with SMTP id adf61e73a8af0-38e00bc01aemr10040421637.1.1768808836735;
        Sun, 18 Jan 2026 23:47:16 -0800 (PST)
X-Received: by 2002:a05:6300:6199:b0:364:14f4:5205 with SMTP id adf61e73a8af0-38e00bc01aemr10040382637.1.1768808836236;
        Sun, 18 Jan 2026 23:47:16 -0800 (PST)
Received: from [10.249.8.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf2330d4sm8657224a12.5.2026.01.18.23.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 23:47:15 -0800 (PST)
Message-ID: <08675c7f-3875-4335-8dab-eb0044d42b38@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:47:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696de185 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RKnW3nVSh4YJs2QzWIQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MyBTYWx0ZWRfXyugYxhq9x6Dw
 qc32SvezKDgdbYjp3FNujR3ii9XbCvxxTa8lCwf1ixS+PwGvnfWF0aiyT9dCbZscDei7+uacK0a
 QaRPMy9UPfre+Lr0GPpnFyJLxxSPCiMm7ew2+dTdbispccg7QdceE6C4lTfbAoZhF2VzX+A47ls
 gB/le/CFghtduZfBgIQRaEeN8lfBcn4dnarhaU//3ykilztRyex48M19b+H3Xo4Pjf2VxqkSK3N
 iGbDHipiZbvJpBKbjKZPYW4qTIaKNl9iTYH2+cfiws0DsWGraS7Yl+QS8zBLb7mE2BnA5Dd8lXF
 3ebCbWScey1bfPtvKTuY4S/HDVvEJnVdfrvmSf+RW4fnAH8EVXhhmowNsJrAXcQZ8nt9ZXoDtRD
 a51op/Xhwt3MLXBa7aMSyrHsvAx8oZDUQ9KSVn1YSFmK+adR8UQ0QU2CFzcoPryQkHbdo5OacTu
 k2M/p/mnPyoHpc1OPpw==
X-Proofpoint-ORIG-GUID: HYhrVrncsVfYXDNF6I1sauvjD0GesrXD
X-Proofpoint-GUID: HYhrVrncsVfYXDNF6I1sauvjD0GesrXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190063



On 2026/1/16 15:27, Dmitry Baryshkov wrote:
> Having UBWC configuration in the driver is error prone. For example, the
> driver specifies fixed values for HBB, while the actual value might
> depend on the DDR type. Stop defining UBWC data in the iris driver and
> use the global UBWC configuration registry.
> 
> Merge strategy: either merge SoC bits directly through the media tree
> (with Bjorn's ack) or merge to the media tree through the immutable tag.
> The drm patches will follow depending on the way the SoC patches are
> merged.
> 
> Note: the patches are compile-tested only because of the lack of the
> Gen2 hardware at hand.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v3:
> - Dropped applied and unrelated patches (they will be posted separately)
> - Include printk.h, decoupling the series from fix picked up by Bjorn
> - Introduced additional helpers to retrieve the data.
> - Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com
> 
> Changes in v2:
> - Extended the commit message and added a comment for the min_acc length
>    helper (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (9):
>        soc: qcom: ubwc: add helper to get min_acc length
>        soc: qcom: ubwc: add helpers to get programmable values
>        media: iris: retrieve UBWC platform configuration
>        media: iris: don't specify min_acc_length in the source code
>        media: iris: don't specify highest_bank_bit in the source code
>        media: iris: don't specify ubwc_swizzle in the source code
>        media: iris: don't specify bank_spreading in the source code
>        media: iris: don't specify max_channels in the source code
>        media: iris: drop remnants of UBWC configuration
> 
>   drivers/media/platform/qcom/iris/Kconfig           |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
>   .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
>   include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
>   7 files changed, 46 insertions(+), 32 deletions(-)
> ---
> base-commit: b775e489bec70895b7ef6b66927886bbac79598f
> change-id: 20260110-iris-ubwc-06f64cbb31ae
> 
> Best regards,

Tested the v2 patch series on Lemans and Monaco.
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao


