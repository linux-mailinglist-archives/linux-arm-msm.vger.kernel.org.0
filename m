Return-Path: <linux-arm-msm+bounces-86195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A9CD5783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82A3D300F940
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58149312820;
	Mon, 22 Dec 2025 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEpA52Ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDiIuvIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CA305E2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398232; cv=none; b=jjotIlbcPWjnZ5bOZHEEkfz8QfxZbpN3zJuasmor5ulgUkKTZr44Kv5FejCUtD6D11Y5NNTbW9pGYvu9562PshesGZ5G5vHnWiMYt8+i1T3AzpBH7Ej2i5s+PFxmP3QpiAttVQPxUTTqf5xr1+ivyX4p0t7MShfyTqoow/2Vnng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398232; c=relaxed/simple;
	bh=8N8IhOlkR6SaGn8pM1RZD5eFFxTxauBnScjxroX5Yyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7RC5DELT16blGk35GYOrIQGVStBjJy+BMTr0KcRVbiNbbkHv/E9sX4wjVLiV/w+SrDhjomQfJ8AjmM8tJfL1/K5b+evKLlWHxiswbRPTtX2vrEvzOHdnlc1jvS7FDfZcuQqnvNzwQ/ryxkgTM2c3cri8/IfuPlEZdrazB9k9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEpA52Ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDiIuvIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM80HYZ3585754
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zq50Sq0ciKk8DmE/W8JVLSXSe6FrFYQ0P4yxO//qdV8=; b=VEpA52Ej2hRgcVWg
	nO0R1gXMXeQVsk+9T2CjM5rQ2OQi4wWVMrNb8aShbTT2vVAqJY929KDwt9VN12uO
	dRcklMUGYbVPAHXvleeYix/bFCw7jfmG6YiXgCOk6V7siQdn9wlidtEy36QIMyO8
	9fgVWhojV2SMnuvhxSe62STUur3NvlVJNeeO4No4s/oRqvHo0dCLmka/uwWsDBee
	Kd94OpEUiW7dFrb7s2WV/sIDSQ9L8qA0PLN+yk8rqVbllWk+iHeEDz4ansvE2RoN
	h5TgGydSvlJjx/PBapGpIuO9odNDRVrXRRHfrXm5MkRNiBmXyDoYFF9RXADw8LJz
	wnzI9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjwua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:10:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso11552091cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398229; x=1767003029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zq50Sq0ciKk8DmE/W8JVLSXSe6FrFYQ0P4yxO//qdV8=;
        b=HDiIuvIh/7qSvAe9b6pXW28yAPV4iFszIXiSQMED7l6pa3NJ3zFEO/BGmfUC5lV34N
         DjUoqvVP9T3yIfVzyt9jNVLiTGj1iFcQE5rZKWqCgM9+6qP5YRgVFQg/bKv2T5iqFCDl
         CM1eHTStNyUjYkODkEujTTG/Wts1TIS+vSbHquKEi0u7l60ute3Dl4f1nkUJg1ZZl2Mt
         lYhgEmv3p0CzFIcnu8j+6K2k1yGTyjEZSzJnK8fLW3KMxTyrQFtFoGdLEL/me+GmQ1K5
         EaO0VghuMafFQy9Az/ztoT2sOLv/YEAuJgaSD9lPuDgKtGhAYDtIBl4liblqINW1lCXI
         zDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398229; x=1767003029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq50Sq0ciKk8DmE/W8JVLSXSe6FrFYQ0P4yxO//qdV8=;
        b=sKWHKexsy+RhneiQya9cQ1Z7FKt1ywFWTlQVrT2wRKrpNIOULAislURbmqZVHJa8gy
         sAZbmBd7YkcVMmQ15KoMrrqVO7bs2MG65mdFbpaLaxJUS0EkQwAvD4XgMsl2NVA0TkCK
         pvX0C9IQH4535shimcvTM9VzrloBQbf/UTr8fGHGE3zmHE4D2azrmS3Dk4Vdzp3EX80M
         k2iMDJcy8W/Hqv/QhSRwIPe207p3U5wsodPusiZk9Eck0je92IF/ENfJUUVUwUdRSbQV
         3nSU4FZRDxbZr1ms3D8X/ou5s8LPF7HeS7oFAzt+xeO0RYLhGmTzWr6LAU1hOWEJ7HWZ
         AwfQ==
X-Gm-Message-State: AOJu0Yz2yoggf0BgG9yTVD/rC4d0yIDUx5RfE4tlCB7e4dSt5ZbBYFMJ
	VFGynXgaECp0iQvSPpeV8dsLZAP23P/MrKQ+LqSC6zw8E4K20P0jQx0O2GYoABG/unYjzxoHinn
	Lw63HYrVDr3nyPq3aecEwhH4LkDBe6eZG6jRzlkwks/4Pc1Nydk6ufQt3mRmFbB9URhIn
X-Gm-Gg: AY/fxX5rM6Zj69VEyUaS/7iU29vgmJo5mOTHlGVMPrJVQy/3ZSsNs2ZtNxTlO2Ekai+
	y80HJqLGN2x3wWEUbUo493c0N/a8l+4TeAhBTneLnQ0ivJ0Iub/lMhQyXIEERd14vwr7O6rgEoz
	Oxl27MXg9NdsP4JF1lyY1u0204a3rDJ7DNYYpgaxAxjqr22PEjMxboDwzcWBF9m+Ok39VnuM0sp
	zchibdg0bodiFfKsPQkwNOvWRaibaC3rYNA8/Tksmh+msTaBZtRxzsvqxDfTLwE8ZhhmjXpIK+2
	R864Pm0Th0+MOHBAxO9eTRsmDxQAo/+i2BZhkU/HLuBQZ+Bldmu7O4St2cfv3RUry04O+VrWfew
	EPAhe569FcPNGvl/kU5GaEu0PFXEaVUyyihNrap9oNkXtd0JRpqo7lBBgBm++O5dncA==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr125305441cf.1.1766398229057;
        Mon, 22 Dec 2025 02:10:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuV8jrI6GwsxsvZRsBtWpY3d8jh1cRr25s2rnJOJtrkSWKjv4VtiCCKcwVaPh2BOuCy3uBVQ==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr125305071cf.1.1766398228599;
        Mon, 22 Dec 2025 02:10:28 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1047311466b.15.2025.12.22.02.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:10:28 -0800 (PST)
Message-ID: <068f0183-2f21-41cd-83be-81bd712ab5d6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:10:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 squelch detect param update
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69491916 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oUfybq1hb7wxsWnyzuYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5Pkwf1H-RM0mayBKxwf4a1DjhYqQU-YU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MiBTYWx0ZWRfX8kVmkWi8NqUG
 6xIb9dTw5ticlakzXE9Qp4tqxxRoOA//J6RZsKkLWVqhpBJrEuBB5J3/wPPt9O2IwuCP7iYrX8z
 1lPQSSQPhIEp5IynVcdayWDQXQjcS6yJo3Q01L6Lh63jhNXcSTYr1IGCeaZCw/XolUsyBchXZ82
 gRm3z3+ffKCaJjnEcRluqLFPsJejPSgi1P3zSdHPzD11teD56sZnm1xgmWajfTvVJA8omGrZUUn
 jGKHph+zKuS0u0FhNhIIgOZ7wKwDYGlTGvnjm3GhtesIFLK6Qx4jeHDWnjTDPeWHWrZbTO9280l
 Zn0dwtnB/Pe/qtO1xCuoISepPjgTkHtZR43EtttVOYSN1gbjTJdIcQ0EWQRZM11cj7MLRus2cZW
 hATyk4Qu6YgOwpHrQjS1AtqGcb26GahDFZR9OiqSZVDHdvitFwUzgTNYRr1kd4ZZO7Dl86P9SpP
 QTPoVi+PVRHeFoDGBPg==
X-Proofpoint-GUID: 5Pkwf1H-RM0mayBKxwf4a1DjhYqQU-YU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220092

On 12/19/25 6:31 PM, Krishna Kurapati wrote:
> Add support for overriding Squelch Detect parameter.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

