Return-Path: <linux-arm-msm+bounces-89359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E418D2F077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC11630245E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C7335BDB5;
	Fri, 16 Jan 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVFYAr/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKFM066H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D1221D96
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556856; cv=none; b=DbEeXwXcveOjhiZAlbqcHp0uTTU/4rEXNgNE4cs3b5Yj8GAmLWKHq+t8TNaguQA2YQrDyw90jl1lHY54zJjT+Tc3pbHjVvTL/jGD5qol59UeGnFeKl6skxSHo+BYmbRGTfZgFRy6+O/llL52xyq9rVCAdnlM00CD8egjvNhtA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556856; c=relaxed/simple;
	bh=FrH51ccNgNjnJHpV2c2Dp8Yi8KNRcZjTD3zuBK4PjoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CY7GtQVixeMjI/h8l5vSsf8RhSfd4sUPS4VgLDsjow/vZq1LnPP4sKtX4ESOMJVgKAMgYi86P2iHS5s7v5v533VpzzLTzE5Fsc14qYLdZ4vMKuCmwNpBbmm091+pkL3mNm3C8KMl72TlGItElTMhNrlsnt9jYwgxbGXnUFAtuj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVFYAr/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKFM066H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G807T43074934
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kelGpve6vDB1Q7G0lH4/Aem3uOt/FIByHaY9xLBdYIQ=; b=AVFYAr/Gw5Yz3bl8
	K7C5l1gyJ4PKGi1okicuuCGpsX8ipgbTZmOYXejOWeGBj+K4vWWoHzSQSvNGrQUG
	31CZZj8+/zLia7+rVLJlwE9dR/HpPMeJwDv8K80MazFnsmmIsuX83D13r0lZyZlc
	2esbOKFfhYI/zed8AMjXCyftC0oMDdgz4xpWqI6H4xaa5ItTcAWuO3aMrBsL/1ci
	1N/6R1OTQYqo7HvwT37Rf5XIY/f2GX5T4QP59SKzkYVn02b4bX/6wJ1Gmd0MJyWD
	wgwfP3njtrpr4oZNh+ml4IP3+e/khTpRqE2FfzHYD+Y1LXfVqQw7HWASCwnFR6lj
	EkzSvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jspcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:47:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso16542535ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768556852; x=1769161652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kelGpve6vDB1Q7G0lH4/Aem3uOt/FIByHaY9xLBdYIQ=;
        b=AKFM066H7rHRJOYY/3W8RhDEc3G6n3FsDsg902EdHiYUrFyIyY3PJtf6akIG3Gv4kX
         KDXrOuKHx2YFm3g0AllX90qwFDbF1piU5EHfn5IWNhYxlpA4NIlPs4Dt5KW/W+xUzRVt
         +milq4l3CtjRRMNYK16chgIH+60YAge5L2XfcBUF1wNy6euweBFp/4Mz9wyBBely/c5/
         0uxxzbLBV0UP/yx+zbg5Xm0fWMo5B+Hb1VX62NvhIbxDqlGyP1goxNaaKWpRW5BO166d
         Hbz813yW/E0D8E8vJtRGlLBSsx+NIU0YkBCeYOPadAg6Drr3w8UOX8udBaTGT7XGWoTV
         9wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556852; x=1769161652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kelGpve6vDB1Q7G0lH4/Aem3uOt/FIByHaY9xLBdYIQ=;
        b=qPU1WUiMmOWLpXTRRi9oCsIVw6b0kwgjkUSuUMHQxbY5327oqqYmR/oIx3TsRPclfN
         bnPx/QbtyWcbe1xv/JMFwuhQsc6hAoxEQTGGZgWtq6h/MCCEHSrZ70kzd7SUj0u56H/w
         gdBWUDnGpkFxLM/Zq4jl8toPhUlS5RS0SewqYBjlp9EPO/a6cQ2mjPxJ3ml7GABgJBtO
         hZ9bQ7oZp7WaOHHnAPUu578M7ikcQO1YBbyDCFO9J4e912awRjcJ0Sg6mm5l3wV5vfK3
         1sfRkJNbsMKTI7RBb8+DUMi/RdfRXXoTwpzjcftpkWw5AZTXiEAaR8JJouLgSOF6Mzxu
         C8Yg==
X-Gm-Message-State: AOJu0Yz+f1YMRRHOwnAf2G4/Cwx4MepsFo3BQTS7KWQ257C+6YLkSclu
	iokeYWiy4iAIqrKC4X0/5E9ddFTgdjXiIFknARP4vbh4aTF9haA6yRiJy/L99HSBdnRQTmZ+Aeh
	xICqLjRsHyBR8+LF7MQP/vF1GwyefBsAozZ1Fq2K/yK5efKzzJmj/+KjvN+JysZssxecu
X-Gm-Gg: AY/fxX5zXGy/g/n6xErhHqJS9im5Paov/TOcqa4nXWqXA8yerYWU7RDUTOSXOG5xNOf
	NRVemygfBmpSsLXZjwYGXF/sF4QkarEpSZHwBSuoqCAZt+MUAtmxutyccGjyI5gw7/UvXmoDHLM
	xHy6XrGmow9bPgxtSL7F/ThXwfL6t7OzHysc3rFaGAbMaFLQNEr+8FzpIJa4am8GL0+w3Lm1T1/
	UhJVmf0BDSGdScOGchx2EnNSbQkspFcrA56H89y9U0uwZzN01e5DcmvDEhBwIa8F6/7DAxwDkyp
	de7WEbKe7ANLmvjXMhD0vVZQCvC6aE49HoPN+96rqZ1rq5wDhVuh69GNxgpZH4b9P77owAZo8dj
	GUcA1hZp/TZxNj+mSMwe2EiNyLYD/WXyLbt/l86Plmw==
X-Received: by 2002:a17:902:f650:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a700978f8bmr64216905ad.5.1768556852622;
        Fri, 16 Jan 2026 01:47:32 -0800 (PST)
X-Received: by 2002:a17:902:f650:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a700978f8bmr64216715ad.5.1768556852164;
        Fri, 16 Jan 2026 01:47:32 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd582sm16631335ad.52.2026.01.16.01.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:47:31 -0800 (PST)
Message-ID: <de160d43-91a0-a527-f0fa-a3ba6d7121f5@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:17:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] media: iris: Move vpu35 specific api to common to
 use for vpu4
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-5-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-5-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=696a0935 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hqVnMPCZWYgSQcfks7QA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TUHoSJtfYFSlNlI8EClS_SoKzlux6QzR
X-Proofpoint-GUID: TUHoSJtfYFSlNlI8EClS_SoKzlux6QzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MiBTYWx0ZWRfX7lIrVNvebiWu
 pgiHlfBvQWP7emDJsC/zA46OUhbIT2jh/aFnAUKgsStaVQS6vvO0lCbev6Ahoov5OpJn8Bv21Hv
 tDgTvfh52gBHRrfG9Z97VbrN+uyDsF1j08ddNM4qdjkRn4sG3B6Tj9qJWF4CCNuorul5RmCUtlM
 tFtgMahPcT32TQNWGEo2QdJIARxt8xw9wNFthpgaYg8kCXxM8VXYzxVJ3EP5JEogp3m0FwEsURY
 sOIzN29Qdw1tuow0CPHJif75Xd6fEjiFi4wVWCQghnzFIDgKCzDBp56/j+++ODiKnD71y4zu1xS
 1f6xB0Eh1XaWidlJ0G9Zu89G0Leq9yBIvDvkcfUK1eNQ52aFyjsa5k+F9x1rE34xm+wL90OJHEE
 hJcAfeTgMEsLhmoLJNeClrgTS+WMQ5f+YR7+/PTKIBQ0hRmkHWBdMK+v9FEJmyKitSdpxql9G3j
 f7eOLzSKrKwIjJwZivw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160072



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> Some of the sequence and calculations for vpu4 is identical to vpu35,
> namely power sequence for vpu controller and the clock frequency
> calculation. Move those to common file that can be shared for both vpu35
> and vpu4. This patch prepares for power sequence for vpu4 which is added
> in subsequent patch.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 157 +--------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 141 ++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
>  3 files changed, 151 insertions(+), 151 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

