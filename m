Return-Path: <linux-arm-msm+bounces-87103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F4CEBE7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3ED3303641D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4F5321F5F;
	Wed, 31 Dec 2025 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYYetMHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrKX4M3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35B72634
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182888; cv=none; b=kLBCUuavS6I0J/u4D3pb3md+lXOLtu71Q+fLmroaXycGaPwJ1kBzljf3yAnFyp/ojMlUKfSCs+GEdWCTZUVlkrdVDhNF6x4ph4qvNO/hIL9mgsa6izWy4L6CASRiFQ5Mw2t99jAJx9ozisk4V+3uj5Z3tHZ+UL6qMRgoXytCtR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182888; c=relaxed/simple;
	bh=UmgVRndD2m6Wy75Clz1eg4Rh120+PEWhxXfNEPFzvJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WyVMgrD7XvXfEkxdUCFRJY5ljtbeRvQo67mS23IShWMVtHn8UBvXm0a8aRh9fSAfWJCr85Go5o/o7sAxezBmCkpVSpFbgYKqQY4kMWnYjPRsZWBeljv5T1Giew0Y4HSdgyPdX/vvdffqHXQyT8rOsrxV3oFkBhIU9KCssfqcMLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYYetMHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrKX4M3N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAik5t3368254
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=; b=JYYetMHsA9nLPALh
	XQ8f+wUf9nxQMuIwnd38JtG7hDZLzN4o4+TD/ckycxr+7gQaMLh50EIYQKZ6oATk
	qcll+ywSq6o0u/AHb9VB99ttFSGI3DUhoa8R31nuG4UeSmyecQ4+sHfamSDb2oh7
	LIjvbTcCuZTBVs6wArIevnxz2V03nrzDOuG8pddkbTUTiq7OfvnjZ6EAroF9TAMw
	XdYPvKFGP7jWjy8WS7i8AGO9p1sHEpzj14B6PcjsKtB0hXURCwzqKuXTcoJAOXXm
	psWe8wkK+kOx394c7HiWsu5MF1nkkvBcWBg1ArsyrKiYAAibjHW0/kZdckgMsM/Q
	TWuPbQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb03sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:08:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34b9ab702so28120581cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182884; x=1767787684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=;
        b=ZrKX4M3NP/+XZkHQ43VEno7s4099ReUYleOwtEVL4R0+sZVH+JSt1Igb13nbsvYtsV
         y00VuPZNa7rJOgPMTQl1jq6LA44aXkh2VQ/AS2cwHCaBgVdgzyoEe5/EZYtb+CbIpHOm
         aPIzcfBY9xCTQwcSIgCHAs6iDw+0m8xqzNDzd8v5XYmxknWyww6MvzPiSU0lC3e9DpDe
         fK5lhHA7z5KmDeLCQ2ff31vfrpUqI4YBBghiy4tQ92azyjLx2C1XGdzXGhuQ97wRhwzK
         AC+SfXbjn3dNsJoJmkSLlOuUAKuaBGZNwqfr6rd/E8zz6/gurORPDL8SZuUR8g09JYll
         QBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182884; x=1767787684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=;
        b=D3WZQQfEAHIngjEinlE4faWV01hFYNbgft3oGbJxF+OeudDEtjcdQXbcPnUaQyMz+n
         FM3lM58EF4UBd/OoAu//sRcR/VWEaojHKs8teZ/BtiFRSoMlNf1mkk2SIf2vnocJN2du
         5i3tXeaHur6HbQ5SG5Bm4SQs/YI/vIbz7m/ehUw1LPw07AjypZlD+7moZowc+ce6q+HX
         xrPzFHcMVL3W6UniWh6Hf1tICDetC+QdYqOnfTm33agCIRZM7sv1U4i9AKgfeL03APhA
         gr5z+BGU5ciPYiSr4wY2DN5EvVuewzVtm9un7UYtiioaIBeoA8W9PSVYZfq9LL+BJn7c
         X2Qw==
X-Gm-Message-State: AOJu0Yz0RIPh4Y5kjjNigz/EHU5lOkSeCGk/OqrCCnt+KI5UiCGaO4pe
	r0b5sVhnJVI05gu6HvC5snjWqi8iwavT/wxRICd7to69NS470+FFvZaIHdmzki0e8h9B81TXFEy
	FL5g7inJ1BhyiNHwxWdF+HUI/EA5zoquxQy2h1hEAaQf7QZ+AhUFkL1C/PSG1pMdhMO4e
X-Gm-Gg: AY/fxX6Zo2EnUaXccyY1hIU/IzJ9yXPOEWJUFGL5+jPQKD0YyQNb8nPjA++Jk4hJElu
	t5UYw9H6o25kGxTKtEG9QReXEoHUuYP1kPO5LMwJqdhL/inCpYAfvpXxjGRhI+qIitzX56ND5MR
	aTlFjFMH1ReUzeRpilIwOsdesZIK9MozewiGH+BYelNzT3twrk1oZUJoyd83bS3ZNyMvJJR6ePD
	uZhlX5l6dqmxKRLh69yRmUVuJ/MES0619A5IPdW63frwbOoBOm81UexAPtitCPAQfCCP0qCZV5I
	jgJgIcrdKdSgQW0K1HmOTXhrv1R94wiDwiaZQS8dG2WjvGPi10BMiH0yJyzwj5z8pG2IslHwpHv
	Xj3XPwKxBlLRvY6VVWNzfB0B9V5zZXorZezhH978TW1nvGGe4jhAzSg/ToGxdSZ+BXA==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr410146731cf.8.1767182884069;
        Wed, 31 Dec 2025 04:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiPNC0oH8EFPcBv3otDppGjXcWFCcR/VT+vF4VQNNWa4RvyRS8nRSCSTA96lyQ4NSKnYSHFw==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr410146421cf.8.1767182883666;
        Wed, 31 Dec 2025 04:08:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm37604637a12.27.2025.12.31.04.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:08:03 -0800 (PST)
Message-ID: <83bae671-3174-48e3-b9f8-412d21f8f18c@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:07:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-7-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-7-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ft5TPXQQqrh_WYvsDWGjIhec8lWAJ05P
X-Proofpoint-ORIG-GUID: Ft5TPXQQqrh_WYvsDWGjIhec8lWAJ05P
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=69551224 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wl_8aIJEU-qjyxFuvXQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNiBTYWx0ZWRfXx/eiXD5Yqa1P
 rEq/LmGuCNCVB7Pm/BU0I6GVmMEM8chiBpw39dZbQO4IsJIvLYH9KRR+kU9yW4qWi7IukWqCXWD
 v4Gd4nJ8aI9HGd1JvDClIDESMA6B1XyBC6XY4fiJbSVr6goD9//kEsi6hBj67C3X0WqKrJraass
 AJhQmEfAhdGY/a4MMorO/34LDUfLIhCDoe2JgtVBDAHwhFA/Eu/DxvKYv69EN1cDb2TLgnSi79U
 v19jVTz4oiSo186v1SA7zrQfHsBheh2H1mfLZMsiYcDXy0DpS0cDNQqoEG9Le1TJn4AY8CSAMpr
 cMgOXlfI0ThLygTWEqy6Y1JTbY8KD0rOOfstxoJbglOj5ABAoGeVp7NN3MEoquub5Lt4gOl6MvE
 v8cu7DejDgbc1GSqulCMMvfr8doIQ/Iph5R0hQ9Uvl0M7Qo/zI4DTq7dMNyuGVFXl8xzW9Lxx1D
 R6+rCag3AVCtgur9bfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310106

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> On SDM845 SPI uses hardware-provided chip select, while specifying
> cs-gpio makes the driver request GPIO pin, which on DB845c conflicts
> with the normal host controllers pinctrl entry.
> 
> Drop the cs-gpios property to restore SPI functionality.
> 
> Fixes: cb29e7106d4e ("arm64: dts: qcom: db845c: Add support for MCP2517FD")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

