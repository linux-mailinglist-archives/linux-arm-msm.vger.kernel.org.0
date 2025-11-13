Return-Path: <linux-arm-msm+bounces-81595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 69385C57127
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8843B346ECC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F75334C17;
	Thu, 13 Nov 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX9cuSGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YM0qVUW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16212FE582
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031532; cv=none; b=qsNZcE8YIi4zEloRs1OKZufH636oBTP595UtByrSWRaah3fOfU1ssIiaqV6+nccLatXprMjGc68QSdL5H1+51BRQ7gSQ3t6Ju+RlU20U0PkPB/U2au6db3yz+AJziXB8RycNim1BtSc++7a30VpW400VcCbRRifdkClYr86fTvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031532; c=relaxed/simple;
	bh=0SfTgwIzPX/BA/JPrecUkCRKouOa5PWWI5O6ZWAA/DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcEZ+rms2tLkuRJJLnrjTGpDjo0cbXn0d/ANV/wEXHcnLgD+3OlAtn8DNV+nknRfjYD7LDyIzTZGgIM0bfzl5LQjY056sl/NoOlHbgw6ltW7ctZdWsPO4Mey6d8NDS7NJnaBQm8PVYKxeUn38mLu/iJzVfXXnJkpXu4zkzlo4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX9cuSGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YM0qVUW7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5qWEZ3768312
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=; b=OX9cuSGue2w3yOTX
	RFu0kR0LgWyxuJjvGc9Ya8ZqJu/ZqNoTzEstbau0fpspsTIz7A2U4jGS61BnCtCN
	mEYsktpis3zl9MYBs77wYRrjIyaC6W/8QJD/51E2bNPgb9Iv+K1g1izUJi8I1Lpg
	HzZQaqYNNmysuiKoJAVqbDA8E7jho/Fi4LdG4c89xIA1kf0v7crDJl6pP0iO629q
	pCVL8VYZ0TBBAGpqHTB7GkTLgRmc0Cw1zBzr09i2kVJT8wlPD8Di08D6tanVIyft
	ejsV1xCAzPbKU9jkEpynvoDWKlIQTmNxWfm7ecuemCUk1P0cYWFz2BAx8zsxDbbs
	Ce82oA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn0x1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:58:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b21f4ce5a6so18304785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763031529; x=1763636329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=;
        b=YM0qVUW7JOstpF8Kuv2+fm0Rg1K5X5g3WNov7BBdTqfaGo+S81rzzFx1iWUKMqqobN
         EEgtqeWpayXg4kI3ern4fC819b+pbJbkYpoMEs13XWLaZonjKKZxlqLkxDb02EkyxxZv
         crhwmqckv9r4f2SiVhUYcpig2fs3VqqR44sjUy2K8NQkWKe+LM8L35DwehE0Dah2FQcr
         LCpTUsz/zYk5EB+hBTMMn972NaBPyIFgOV5WOaRYQKZG1YCW353cbvq3gBXCD+9LWaZe
         1Dw5WwaiU6FPAd4SZuZberg4vWp6c2Y5aNmSb0SjVYzPYgmxolNtrpadcN+YYyoxp/UG
         7Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031529; x=1763636329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=;
        b=Wi+NDUx36brRfHTwSxQVuIfLytGj0IFBTQ0RrRuI6FETZ+PXRcDPhuQkENaneQ8Ybg
         BXEGwZPJxwuCQMCt5TatgWhq6YB/igk30rphPnapSfjDt2J9OzQhMeDFVdtU1k6TrWes
         RekV/Bf2O9Waotc5qPkecDJkzvZPyjT2xX9mcyGJAR96brFqYBamOm291I/RStk/yeXN
         VNQfPT2v1Y376xIl3XCpq6VIjEIOL2wKhSNwrF1GhFv+ZG0BOePncZxscTRqFm6Uv72n
         9QR1tXbMmKhxtWJfFqY0ctuVcKrzVXLI3UInLWEhUT25EwtyHOnR9E+aHAs9O1IiAZ7P
         B01w==
X-Gm-Message-State: AOJu0Ywza0G9ZKTE3arDTwipRCIelaf8QHyUeyI1WtnR9ltPFz2nhmcY
	obyHE+XnSrV8iR/QLqy2VwXB/TvUefIzj8xVBrfY2p6k3mFG1vU0qVQnXQBIV2UzDBMIigydmyU
	KQUTM3ApyjAwQx5mhCFeL9vJjfxfcPY8a4tcK98OOOeyrR1SHWffP0QECeD56G61yqzTy
X-Gm-Gg: ASbGncsYAfe2tyoWN6QZK0wzAV911DdGRiNFFd3W+C+h3P490JXQN98f7CW0G2POsHL
	EL+LlCcz34hUd4MivdK+HKOT+pwfxJjjU/ulCWv5eWmWtkV8HckQHByRJK2ppw6QnH5HDvJVT+y
	NGgj72VZcZHYenKEbGRpf48Ouc8GzHvheftjW5rkM1ybFqITlAuG31XBr8psYdRDYfZcHqK+mxD
	wXwsEB2JtZM8jVXxf92uAtkeuMjLIprxmD54hooS9NvwEthsR87idBTc1SJmXblsfa0jvoPKqYx
	jC4Eg2sNWK8A7QZI4RVHtpswcs9+7t369+LmSxJem2RGJ5yOqbFDor830h6k2Brukki5I4qxNKw
	wKCB8E5x0TdojdMPEwmi0Kt+kfk6IMZGmxLSFYtTuhil08tIeO4/kh0Zc
X-Received: by 2002:ac8:7f4f:0:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ede794dd10mr20846411cf.12.1763031529012;
        Thu, 13 Nov 2025 02:58:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdQDsxtlP4V4oPmd1PqozO62xfFzJpWU31Y99QHzv5aGDzw9SGa8isg87xEOWg69/ZZScEyA==
X-Received: by 2002:ac8:7f4f:0:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ede794dd10mr20846131cf.12.1763031528471;
        Thu, 13 Nov 2025 02:58:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad3edasm140259166b.17.2025.11.13.02.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 02:58:47 -0800 (PST)
Message-ID: <8ebd7250-fa3e-4705-a5e6-f01878389df5@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:58:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] drm/msm/a8xx: Add support for Adreno 840 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915b9ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1fD9zpMYXuRVFxAoecEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: D0rKec-6XkInI0eANHUgs9uHH5SoKGey
X-Proofpoint-GUID: D0rKec-6XkInI0eANHUgs9uHH5SoKGey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA4MSBTYWx0ZWRfX9psKEzX3GbHo
 F+YNRA1jzfk03j7lw8FdfP7wEKEKJEhUUUEsfiJyS+9viUK05Ovz2fS1f0guu4SzOxFs24l+paW
 MfDAfhMw3GYU9KrFDlrZt1NTfU1diBr0iF3nNrmmyyoQK10WHVyWHPdQJoY+tmiSYqF9yqHeFlQ
 mbtotqsilxfNDJzjmhDZf0cDrrgl1uMCTZNxoIMCR68ypNntLK5CHvSCfVD92zkoU3OSxmi0oaI
 EF7ZEN40pSMMX9j6GPdS2R2oP/x6rNuEmcNvSyun7JG3F0AenGrfBF7/unmPKPvpOVJX2IN7pWN
 +HzMWNKllOlmlp5M01RzTLE7ADNZ7BM95rSaCaRCB1BDqzlX8xhFH9+neNxG/EB7lXhbN7GGyCH
 R3JBfdCKLcG2STyRXoEUKqqTzRbKPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130081

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
> in addition to the SKUs supported based on the GPU FMAX.
> 
> Add the necessary register configurations to the catalog and enable
> support for it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

