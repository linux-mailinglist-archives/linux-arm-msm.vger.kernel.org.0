Return-Path: <linux-arm-msm+bounces-78386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84ABFD906
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBA9F3B47EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793527AC4D;
	Wed, 22 Oct 2025 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxIdmDez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B635B138
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152986; cv=none; b=BMfhCFv9WU97/ok+c17zsiKX/YB3q97l/kW5cdrtx1/oWSVQnwpAyrDlb6ZfwveP1mwcM2EZG/Xh7/1b0pzCJzxA9SsywpDICSMMxcc1ag54ZZaoRKCYVEZIO0HdXMRL6oFZOxN4UBcEcudZKJ+OBpmU/p/hnRbwSjgzUdxdTN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152986; c=relaxed/simple;
	bh=DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8tszOnQXSjpViJGxAFmmNH8j/pEBQabl0nC8+SmdXQIW1Sn8c07NzAjJOOCUh6x5sfHKIb4ZUU95s3F+EcUCRSw1FMLpzOU3pzfrNTosVc/OdUhgkKKUNDeaQdFjzghn8cMXDIBmeTuIxc6BsIxQ2peX+ZLOqnKaEoOkP+l96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxIdmDez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9rwMv002287
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=; b=kxIdmDezDNa5INVo
	j+mZbb5VZCN0UKvJBgcY+goSYKjAAz5lh9593YTsgwAGhsjfkEwbTuvL2UmOGhSv
	8myPuqr4Aqk8ITDAXJc7A/EX8gKAnHEZ8TSEF53kZlSagfdpx6Wf51PktRdNuVtn
	/57EN/ydY4tNsHu5ajMNzayLnLOuYXQ1Y8d8xU9uqDzpGOtmz+Pv4CWll27J5Eg8
	7w+AWPKYLjZg81bLJrrVtPaZszcxg9NPFFb2R2XuwN1IDZZSypycypOwh7+iC8Wo
	VfMSt82Bb1AcuuUjg6JzBlq+v9VEsoHFnz0t1y4Op0P7Hx5G6Wcg/xBozhuUrdhb
	eVSBBw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wb3tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:09:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8aab76050so5024771cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761152983; x=1761757783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=;
        b=LB7Eq6U/hUnD6OtBBWAKZR6XJMVHkCSA8/kwzqi85w//v8/VlcwEawgC8TLeptew2t
         pgNvcThvcxyFJgkx3NLQRYarII5mxl8ZfUhAa2F9mkxHTFvilnRF1MjVJs6i/Pc2hmHS
         PvpBI7o/R+J75kBbWTaPcaOcn1HaHDT1f4DMJrBm0wizJP5XV5ENd4f+iiiiqGtvYl9K
         ftp/1Uobftu/tUcr+kM46zXIsP8IvEr3juz/r/isK5kZrb7VUYYAVF22Z3gigBQTDqWF
         aBRGf1GgcLI4kMYUpGs3JABSGa5hIDVKPG9ZNGiwNDTd4LgmWY0IZgoooG707sClgYlR
         YLfw==
X-Gm-Message-State: AOJu0Yw6hQeYTR95cWLMTecGip6fSUuQ8JeOoUXMysOeqseWok49Eieg
	1dLczZ0Ptzh5zdp4m+g2TRxVAC7aB2SL2Q/7L/LbhD61DhGYvCl8/Rw3cVA9qMCndyO1S7Ro0Rj
	ideZPJ++5Z4EWhk8jZbqaeHvGy1Jeim9wXeuJWUP+ryw2auO4GriiZfWM3jpboaAoTnIF
X-Gm-Gg: ASbGncvR3k3B3AgKlVMqtKKHK2nHQFjWTIknuzBgd1KBvcC3BUB1m61ATrU/CBsiK5b
	szacn/VP9nlVcqGU2mCAotFZhLw9FYSTH6d/pUAe/dm0iPe28ErZ3cvdGFN8sV4X24l23A4f1Y+
	Hw4ZQ8G2EJOK4zxm2jErakjuFzxkAsSZ7dYNycxffGfxC8uBBWx1wGfp1y0jbd+pSXnOsZ9ysqI
	XH63dVioAjOyYrutczmsH6pMjzB9L490oDVqzJ+dUYpYT1piVNII9FxfSyGIsufGbCKXp37KU0g
	ujQ9nggvhBrxr7Xe54vzyrbOusFbMb/TYpfF5XKwIM3K00NIGltxttGBWnfVKLHvqYB/t8Q7xve
	c9aRY8dltwldDExnxfwSe4jUjX5PIUEWIf79TzaDYOLHVKFTtQ4GhsdnX
X-Received: by 2002:ac8:7f41:0:b0:4dd:2916:7983 with SMTP id d75a77b69052e-4ea116a0a71mr62626581cf.2.1761152982615;
        Wed, 22 Oct 2025 10:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1zbTlPXlUpM5403uofnWKWimc8ISr4xjVjYpjAA4lEcZwdbtZU9LT3YujrWiqGqdomX+4jQ==
X-Received: by 2002:ac8:7f41:0:b0:4dd:2916:7983 with SMTP id d75a77b69052e-4ea116a0a71mr62626281cf.2.1761152982190;
        Wed, 22 Oct 2025 10:09:42 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm1372236966b.16.2025.10.22.10.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:09:41 -0700 (PDT)
Message-ID: <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2ZmWXu-ZikUWJRMQN2xbpV21rdiHLdrs
X-Proofpoint-GUID: 2ZmWXu-ZikUWJRMQN2xbpV21rdiHLdrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX067F5prsbx2l
 ICGKas7znSN8tj3Lypjm/LmB0iPbMg+0VaUSuMFuWZcGGnpBZ/qMKPsJVnlnfR9GZtnx6ps1WkH
 Bm1aYMX2V9mTQWVF1pVM75e5Mkmkuq3yTkDmMYeuJo1bp4EOt8Sj6OK0x/Jh/+6zUTLIzpLKYSv
 MvWSPS4N/ZzZm4LHAQnxSGCosZQUZshV79dZDnCSEcYpuAYlKgHOJuOeMyYaRTn/x4UPja8nY78
 VoXTorNNEe2Gc4+QeWvSJjoTZf3I2uXsrhy5SmgwjRG3qqo2ufjC3QympA587Gv+TtA5Ok+tKGG
 QpG7i3NQCxb5mNqxPtbqFrfhEkeLhNaEh2UqIaKZ8K4xZEOZo3wU3/qVrIhAvUc5QZUKw/88lxt
 /YHo9Se/o4VoiOscf8yfi815+mSLKA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f90fd8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PIh8tp-2QVCGfq0cSFkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/22/25 2:44 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu

Does this *actually* cause any harm, by the way?

For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
to a pair of GCC clocks and GCC refers to VDD_CX

and I see these prints, yet:

/sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
/sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0

/sys/kernel/debug/pm_genpd/cx/current_state:on
/sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes

I'm not super sure where that sync_state comes from either (maybe
dev_set_drv_sync_state in pmdomain/core?)

Konrad

