Return-Path: <linux-arm-msm+bounces-84329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0173CA2F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CABF30095FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C43321A3;
	Thu,  4 Dec 2025 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABD5Mk1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnDreiof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC88DDAB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840012; cv=none; b=nd7FUMxGG2tI1V/xIjlXZk4Ps/bFAMqwQnMSwlKeF3Z4EsZv8ml5SaOBMsiqXh51bHl887rdAm+aJ+ezG4OxL0u/v1eNsWIxVo4YsNJk1Si+m8Fji61/lTNV98ZK6LZffbmGOdhdMDu897e6Q0XR8ghU1FKY3SHj0YNiNeIC0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840012; c=relaxed/simple;
	bh=Zk5osWqvoFEmEyyG1snUAhf/8mW6N6FmdWfkVe1OgFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDvpsWBZHYBcnsvB8iuGRtiUahLpF56Phq6U88OZBVLhz4Kgp3taZTG6D1FFskDhbAY4y4py5VIJuXBG1vmDoPkQTS904CQwtsKh3BK84mISLQjSdv/SjENKailj1UVt3UEXZ1t4cF3AnXs4GHm6cUMAiLqZeC3I0UNbgFTgvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABD5Mk1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnDreiof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468cQa551467
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dDMcp9jTriiKmoYI5JhT11TrypRhl9msLsKtlntbgY=; b=ABD5Mk1sHo4bPPqK
	Qt6vH3y2aYheQnWqo7buCT948R9f1aFOI1PWwZYSvOO99tt7C3vxcp3IyUxyBJya
	7TPDQTXAp5FUutjY+FdcNXpXapk+hezSZsua/oEng4HtQtuD5fYgbhz6DPLwcW2E
	Z0nC49p0wnVCVZbIVS2oeKzG17TrIt3gBJAWvIagtpE4VOgO5d7ZWt+ksP1OIrHh
	N3mniVYoZ6zJMFxsarNSmIABMgcG0cQ00WodvaXts3tbv0xx9iHfcD4GZ+iorBeS
	0Hj5aJlgLvCS+8UQd04J43KjGLmsFY7woxqPLgU/bO3x+YiRysn6KFvpkesvNUQD
	NvBhFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdberh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:20:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so1141351cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840008; x=1765444808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4dDMcp9jTriiKmoYI5JhT11TrypRhl9msLsKtlntbgY=;
        b=HnDreiofn/ZGAiARygBBCN5LBwbhYlX9BURPtlK5VnmiTMMy2Ro4/yJqhJlwWkff58
         lDMaQvr4I4nRhawWyVfWJm42OmDBAJY+xJMI/v7CY6M2BXRX53DYBRSeNoG9NN5KMl09
         aJyRy7VjZBUyr5c8BPBB17G/Zcu17L60wL6qTp3yNltDDvmMoxKkdV07H4MiZF0iqgzi
         rgp/p55E0DM/i5dLEFNwUAvqY59nwW9IMNlfkXN9FatOSngVhRtHbUuUcvWFPUa7s6PB
         gZW3Exjxm6v5lEtRPNIVJdGPVEvRy3RYwQKuzPaJW7/UJhQuFmHhbsO6TQyWnqgeEJKO
         2tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840008; x=1765444808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dDMcp9jTriiKmoYI5JhT11TrypRhl9msLsKtlntbgY=;
        b=eum1p4OBM39sIpJldNZ/XkQfrnFhoFtI8SZXXW5DpB+7dDfF3vS22+H05dsG/l6wK2
         S4+/AzSo4mzZV3FVU1I4frwaAhDbkI+qOdvndKm+eB2qdtwCO2zRqqe+ELl+YMssKbD7
         yAfLxh9uGVGwMU00wJMaZOdTGHKyKS+FLA1jxIwhKUzUcV0Vn6D5Kh2mxRb3kipg80U2
         DHntRp9fs50Y4IrySriGgoDSF1JHMKevJZVyJTnxM4HRQdkeMQzaTBiz1WBMc1VU6v/5
         KZoRj7LcGBQW4DR4SmQJCkhwKhJjD1+T797iooLNqAnr+IDs49CFnxofHiGtS5Y0Lu92
         eJ9w==
X-Gm-Message-State: AOJu0Yy1rcUXKi2qrsktju2/+x14kjKAjARDyVGYVZAD7zIe1NQ4N1XI
	SPbM8H3A2P1fV0Gn2K+BMhDaQllltzdboX6wNMIUMlb6GdZWcrImL39EF89j4sYLCxRx+2mnm7h
	WpdRQYMETvvjRvrUQuY96C8INd+O1W+c7wGiu769vLfPk9riIu0zAlmbqdtx3z8JiVRhd
X-Gm-Gg: ASbGnctC0rOmLiv3/HghRK4PzWiQjUmZQAvzJrxviBwY+BNoP90IsTkWbGt7bRJueES
	PlnAZ4D45A+HECEtEDC4M3i1rs/fxYpr8BFdPUkreb1bN1jc6/zaU3KGGbaQ2x+hS8EhF7TJEL4
	XskGC2j7TRRnVPlAK0LOP4Om6JW7AWNizdkUTQynbilKqxY6JP56wquf6nuq9tI+mY6EV0BYGEG
	e5o81AScdUs+ez9Pn/um4RSyT5pmUDNGQI/vLjVrEZIbL+5+SCK1vvPmEtuwvhynq2z+mr7DYYv
	pQnRSvglJJo11wcaaiwReWSt9ficf2J7feE5yj2UhNacRFe9uRyxQizLt53IAXbqFBTjyZUH22N
	9M01k95Vl4pMjT0LTpt3wY80frWOxXCrVes3kjFtjuMvxCIfXy4UvTZ6dgnxSOzZA1A==
X-Received: by 2002:a05:622a:16:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f01b3b2039mr46919831cf.9.1764840008424;
        Thu, 04 Dec 2025 01:20:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsC8OWZKr9kIU4m+W/sK4smtxu/ww3/Ut0qMeine6g967BrxeoddR3qHiF5r0V8ehcYnU7cQ==
X-Received: by 2002:a05:622a:16:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f01b3b2039mr46919711cf.9.1764840008047;
        Thu, 04 Dec 2025 01:20:08 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445936dsm84503366b.9.2025.12.04.01.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:20:07 -0800 (PST)
Message-ID: <dc5a2759-8894-4758-b925-330b8b718dd4@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:20:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
 <20251204083225.1190017-3-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204083225.1190017-3-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -q60b6JYp1q0IRwJu1eIDrsB6YE4OoNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NSBTYWx0ZWRfXxDvsmlvICrmY
 tUnobQQef35d59T+GK1wJDXUk0dp1c1VlAq+65R7EjkCwWm+3fqCOwyDzviyP9BrmOzVX+5B+f4
 MsYtF4mL+S1S4xGX678WsnEPBUCbv3zakTmhxI4G1R8l2X+SEVqbijPYK5/sb9Ujpmd5KOJrQkP
 jbaeLQkAh9WbTe7m+OK7BQWYnnLGHhaREK97Adkyg4td6j8eIBaosINVNtsDPyvMhxxhffQNwcS
 2sdi7YMpiiLWgIYGEWcP1c+FNxYLZ5VtNf5yrhsY8NBPZzWLxk+3qy0Sc5U46OPBzuhpxU4y5hN
 lLSFziVFAS30HLuIh2Z34C0KOv4RYfNVqE28WUPqfBF91AV+Y9txaotO10/ZF2kWn9HQ3kBHzip
 Jk/bbt12DOU33j2POZ/wMnTvlL0fcQ==
X-Proofpoint-ORIG-GUID: -q60b6JYp1q0IRwJu1eIDrsB6YE4OoNB
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69315249 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pQJSoI8K10o3MdFmILcA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040075

On 12/4/25 9:32 AM, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

